import collections
import os
import sys
import yaml
import networkx

VERBOSE = False
ALL_FEATURES = set([
    'regions',
    'weights',
    'node-attributes',
    'edge-attributes',
    'node-weights',
    'multilayer'])


def generate(fname):
    """Load yaml file, return networkx graph"""
    net = yaml.safe_load(fname)
    #print(net)
    #print(yaml.dump(net))

    if net.get('meta', {}).get('graph-class') == 'MultiGraph':
        G = networkx.MultiGraph()
    else:
        G = networkx.Graph()

    # Check for unknown feature metadata
    features = set(net.get('meta', {}).get('features', []))
    unknown_features = features - ALL_FEATURES
    if unknown_features:
        print("meta.features has unknown values: %s"%unknown_features)
        exit(1)

    # Load nodes
    node_degrees = { }
    for i, node in enumerate(net['nodes']):
        label = node['label']
        attrs = dict(node.get('labels', {}))
        if 'deg' in node:
            node_degrees[label] = node['deg']
        G.add_node(label, id=i, **node.get('labels', {}))

    # Load edges from 'adjacency' attribute.  Adjacency has source
    # node, and all destination nodes.  Each edge is listed twice
    # (once each way), and we check that this is true to ensure
    # intregeity.
    if 'adjacency' in net:
        edges = collections.defaultdict(int)
        edges_weights = collections.defaultdict(list)
        for j, edge in enumerate(net['adjacency']):
            a = edge['src']

            # weights or other data:
            for b in edge['dst']:
                if isinstance(b, list):
                    a_label = a['label']
                    b_label = b[0]['label']
                    weight = b[1]
                    if len(b) > 2:
                        attrs = dict(b[2])   # making a copy of dict
                    else:
                        attrs = { }
                    if weight is not None:
                        attrs['weight'] = weight
                    if G.has_edge(a_label, b_label):
                        assert G[a_label][b_label]['weight'] == weight, \
                          "(%s-%s) has inconsistent weight"%(a_label, b_label)
                        assert G[a_label][b_label] == attrs, \
                          "(%s-%s) has inconsistent attributes"%(a_label, b_label)
                    G.add_edge(a_label, b_label, **attrs)
                    edges[frozenset((a_label, b_label))] += 1
                    edges_weights[frozenset((a_label, b_label))].append(weight)
                else:
                    G.add_edge(a['label'], b['label'])
                    edges[frozenset((a['label'], b['label']))] += 1

        # Check the graph
        # Each edge is bi-directional
        for k, v in edges.items():
            if v != 2:
                print("WARN: %s is not bidirectional (n=%s)"%(k, v))
            #assert v == 2, "%s is not bidirectional"%(k, )

        # Each edge has same weight both ways
        for k, v in edges_weights.items():
            #print(k, v)
            if len(v) == 2 and v[0] != v[1]:
                print("WARN: %s does not have the same weights both ways"%(k, ))

    # Load edges from 'edges' attribute: edge list, each edge is there
    # only once.
    # format:  [*a, *b, weight, {attr:value, ...} ]
    elif 'edges' in net:
        for a, b, *rest in net['edges']:
            if VERBOSE:
                print(a, b)
            weight = None
            labels = { }
            if len(rest) >= 1:
                weight = rest[0]
            if len(rest) >= 2:
                labels = rest[1]
            a_label = a['label']
            b_label = b['label']
            if not isinstance(G, networkx.MultiGraph):
                assert not G.has_edge(a_label, b_label), \
                  "Graph already has edge (%s, %s)"%(a_label, b_label)
            attrs = dict(labels)
            if weight is not None:
                attrs['weight'] = weight
            G.add_edge(a_label, b_label, **attrs)

        # Check degrees
        for node, expected_degree in node_degrees.items():
            assert G.degree(node) == expected_degree, "Node %s has wrong degree"%(node,)

    # Check for no self-loops
    selfloops = list(networkx.nodes_with_selfloops(G))
    assert len(selfloops) == 0, "Self loops in %s"%list(selfloops)

    return G

def main(argv):
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--metadata', action='store_true',
                        help="Output metadata in html form")
    parser.add_argument('--stats', action='store_true',
                        help="Print stats")
    parser.add_argument('--print', dest="print_", action='store_true',
                        help="Print the network to console")
    parser.add_argument('--verbose', '-v', action='store_true',
                        help="Verbose mode")
    parser.add_argument('--output', '-o', default='.',
                        help="Output directory")
    parser.add_argument('graph')
    args = parser.parse_args(argv[1:])

    if args.verbose:
        global VERBOSE
        VERBOSE = True

    G = generate(open(args.graph))

    if args.metadata:
        data = yaml.safe_load(open(args.graph))
        if 'meta' not in data:
            exit(0)
        for key, value in sorted(data['meta'].items()):
            if value is None:
                continue
            if isinstance(value, str) and value.startswith('http'):
                print('<a href="%s">%s</a>'%(value, key))
            else:
                print('%s=%s'%(key, value))
        exit(0)

    if args.print_:
        print('\n'.join(networkx.generate_gml(G)))

    if args.stats:
        print("nodes=%s"%len(G.nodes()))
        print("edges=%s"%len(G.edges()))
        print("avg degree=%.2f"%(len(G.edges())*2/len(G.nodes())))
        print("density=%.3g"%(networkx.density(G)))
        print("transitivity=%.3g"%(networkx.transitivity(networkx.Graph(G))))
        print("avg shortest path length=%.3g"%(networkx.average_shortest_path_length(networkx.Graph(G))))
        print("avg shortest path length (weighted)=%.3g"%(networkx.average_shortest_path_length(networkx.Graph(G), weight='weight')))
        print("diameter=%.3g"%(networkx.diameter(networkx.Graph(G))))
        # This roundabout path is needed to compute diameter with weights
        shortestpaths = networkx.shortest_path_length(G, weight='weight')
        diameter = max(max(x[1].values()) for x in shortestpaths)
        print("diameter (weighted)=%.3g"%(diameter, ))
        node_keys = set().union(*[list(x.keys()) for x in dict(G.nodes(data=True)).values()])
        print("node keys: %s"%(node_keys - set(['id']),))
        edge_keys = set().union(*[list(x[2].keys()) for x in G.edges(data=True)])
        print("edge keys: %s"%(edge_keys,))
        exit(0)

    #from ipdb import set_trace ; set_trace()

    # Write graphs out to various formats
    def generate_edgelist_ids(G):
        """Generate an edgelist with IDs instead of labels"""
        labels_to_ids = networkx.get_node_attributes(G, 'id')
        G2 = networkx.relabel_nodes(G, labels_to_ids, copy=True)
        yield from networkx.generate_edgelist(G2, data=False)

    for ext, func in [
            ('gexf', networkx.generate_gexf),
            ('gml', networkx.generate_gml),
            ('graphml', networkx.generate_graphml),
            ('edg', generate_edgelist_ids),
        ]:
        output = os.path.splitext(args.graph)[0] + '.' + ext
        open(os.path.join(args.output, output), 'w').write('\n'.join(func(G)))


if __name__ == '__main__':
    main(sys.argv)
