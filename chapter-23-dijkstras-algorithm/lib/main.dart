import 'package:chapter_23_dijkstras_algorithm/dijkstra.dart';
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
  graph.addEdge(a, b, weight: 8, edgeType: EdgeType.directed);
  graph.addEdge(a, f, weight: 9, edgeType: EdgeType.directed);
  graph.addEdge(a, g, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(g, c, weight: 3, edgeType: EdgeType.directed);
  graph.addEdge(c, b, weight: 3, edgeType: EdgeType.directed);
  graph.addEdge(c, e, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(e, b, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(e, d, weight: 2, edgeType: EdgeType.directed);
  graph.addEdge(b, e, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(b, f, weight: 3, edgeType: EdgeType.directed);
  graph.addEdge(f, a, weight: 2, edgeType: EdgeType.directed);
  graph.addEdge(h, g, weight: 5, edgeType: EdgeType.directed);
  graph.addEdge(h, f, weight: 2, edgeType: EdgeType.directed);

  final dijkstra = Dijkstra(graph);
  final allPaths = dijkstra.shortestPaths(a);
  print(allPaths);
  final path = dijkstra.shortestPath(a, d);
  print(path);

  // Challenges
  //
  // --- Challenge 1 ---
  // Starting from vertex A
  // Path to B: A --1-> B
  // Path to C: A --1-> B --8-> C
  // Path to D: A --1-> B --9-> D
  // Path to E: A --1-> B --9-> D --2-> E
  //
  // --- Challenge 2 ---
  final verticesShortestPaths = dijkstra.shortestPathsLists(a);
  print(verticesShortestPaths);
}
