import 'package:chapter_22_depth_first_search/depth_first_search.dart';
import 'package:common/common.dart';

void main() {
  final graph = AdjacencyList<String>();
  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');
  graph.addEdge(a, b, weight: 1);
  graph.addEdge(a, c, weight: 1);
  graph.addEdge(a, d, weight: 1);
  graph.addEdge(b, e, weight: 1);
  graph.addEdge(c, g, weight: 1);
  graph.addEdge(e, f, weight: 1);
  graph.addEdge(e, h, weight: 1);
  graph.addEdge(f, g, weight: 1);
  graph.addEdge(f, c, weight: 1);
  final vertices = graph.depthFirstSearch(a);
  vertices.forEach(print);

  cyclicExample();

  // Challenge 1
  //
  // For each of the following two examples, which traversal, depth-first or breadth-first,
  // is better for discovering if a path exists between the two nodes? Explain why.
  //
  // A - B - C - D - F - H
  // |
  // G
  //
  // * Path from A to F:
  // For this path a DFS would be best at discorvering the path.
  // It is simply because A first goes down the B edges and will continue.
  // Thereby eliminating the step to check for A's other neighbor.
  //
  // * Path from A to G:
  // This is best for BFS because that search checks for all of A's neighbors.
  // It will find the path to G in the second step where DFS would traverse more vertercies before reaching G.

  // Challenge 2
  // Recursive DFS
  print('🔁');
  final verticesRec = graph.dfs(a);
  verticesRec.forEach(print);
}

void cyclicExample() {
  final graph = AdjacencyList<String>();
  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  graph.addEdge(a, b, edgeType: EdgeType.directed);
  graph.addEdge(a, c, edgeType: EdgeType.directed);
  graph.addEdge(c, a, edgeType: EdgeType.directed);
  graph.addEdge(b, c, edgeType: EdgeType.directed);
  graph.addEdge(c, d, edgeType: EdgeType.directed);
  print(graph);
  print(graph.hasCycle(a));
}
