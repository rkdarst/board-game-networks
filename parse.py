import collections
import os
import sys
import yaml
import networkx

def generate(fname):
    net = yaml.safe_load(fname)
    #print(net)
    #print(yaml.dump(net))

    G = networkx.Graph()

    for i, node in enumerate(net['nodes']):
        G.add_node(node['label'], id=i, **node['labels'])

    edges = collections.defaultdict(int)
    for j, edge in enumerate(net['adjacency']):
        a = edge['src']
        for b in edge['dst']:
            G.add_edge(a['label'], b['label'])
            edges[frozenset((a['label'], b['label']))] += 1

    # Check the graph

    # Each edge is bi-directional
    for k, v in edges.items():
        assert v == 2, "%s is not bidirectional"%(k, )

    # no self-loops

    return G

def main(argv):
    input_ = argv[1]
    G = generate(open(input_))
    print("\n".join(networkx.generate_gml(G)))

    #from ipdb import set_trace ; set_trace()

    def generate_edgelist_ids(G):
        labels_to_ids = networkx.get_node_attributes(G, 'id')
        G2 = networkx.relabel_nodes(G, labels_to_ids, copy=True)

        yield from networkx.generate_edgelist(G2, data=False)

    for ext, func in [
            ('gml', networkx.generate_gml),
            ('graphml', networkx.generate_graphml),
            ('edg', generate_edgelist_ids),
        ]:
        output = os.path.splitext(input_)[0] + '.' + ext
        open(output, 'w').write('\n'.join(func(G)))


if __name__ == '__main__':
    main(sys.argv)
