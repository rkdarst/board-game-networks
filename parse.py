import collections
import os
import sys
import yaml
import networkx

def generate(fname):
    net = yaml.safe_load(fname)
    #print(net)
    #print(yaml.dump(net))

    if net.get('meta', {}).get('graph-class') == 'MultiGraph':
        G = networkx.MultiGraph()
    else:
        G = networkx.Graph()

    for i, node in enumerate(net['nodes']):
        G.add_node(node['label'], id=i, **node['labels'])

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
                G.add_edge(a_label, b_label, weight=weight)
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

    # no self-loops
    assert len(list(G.nodes_with_selfloops())) == 0, "Self loops in %s"%list(G.nodes_with_selfloops())

    return G

def main(argv):
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--stats', action='store_true')
    parser.add_argument('graph')
    args = parser.parse_args(argv[1:])

    G = generate(open(args.graph))
    #print("\n".join(networkx.generate_gml(G)))

    if args.stats:
        print("nodes=%s"%len(G.nodes()))
        print("edges=%s"%len(G.edges()))
        print("avg degree=%.2f"%(len(G.edges())*2/len(G.nodes())))
        print("density=%.3g"%(networkx.density(G)))
        print("transitivity=%.3g"%(networkx.transitivity(networkx.Graph(G))))
        node_keys = set().union(*[list(x.keys()) for x in dict(G.nodes(data=True)).values()])
        print("node keys: %s"%(node_keys,))
        edge_keys = set().union(*[list(x[2].keys()) for x in G.edges(data=True)])
        print("edge keys: %s"%(edge_keys,))
        exit(0)

    #from ipdb import set_trace ; set_trace()

    def generate_edgelist_ids(G):
        """Generate an edgelist with IDs instead of labels"""
        labels_to_ids = networkx.get_node_attributes(G, 'id')
        G2 = networkx.relabel_nodes(G, labels_to_ids, copy=True)
        yield from networkx.generate_edgelist(G2, data=False)

    for ext, func in [
            ('gml', networkx.generate_gml),
            ('graphml', networkx.generate_graphml),
            ('edg', generate_edgelist_ids),
        ]:
        output = os.path.splitext(args.graph)[0] + '.' + ext
        open(output, 'w').write('\n'.join(func(G)))


if __name__ == '__main__':
    main(sys.argv)
