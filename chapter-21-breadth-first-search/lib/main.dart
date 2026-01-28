import 'package:chapter_21_breadth_first_search/breadth_first_search.dart';
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
  graph.addEdge(c, f, weight: 1);
  graph.addEdge(c, g, weight: 1);
  graph.addEdge(e, h, weight: 1);
  graph.addEdge(e, f, weight: 1);
  graph.addEdge(f, g, weight: 1);

  final vertices = graph.breadthFirstSearch(a);
  vertices.forEach(print);

  challenge1();
  challenge3();
}

void challenge1() {
  print('--- Challenge 1 ---');

  final graph = AdjacencyList<String>();
  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');
  final i = graph.createVertex('I');
  final j = graph.createVertex('J');
  graph.addEdge(b, a);
  graph.addEdge(a, c);
  graph.addEdge(a, d);
  graph.addEdge(d, i);
  graph.addEdge(c, i);
  graph.addEdge(i, j);
  graph.addEdge(i, f);
  graph.addEdge(i, g);
  graph.addEdge(f, g);
  graph.addEdge(f, e);
  graph.addEdge(e, h);

  final vertices = graph.breadthFirstSearch(a);
  vertices.forEach(print);

  print('--- Challenge 2 ---');
  final verticesAgain = graph.bfs(a);
  verticesAgain.forEach(print);
}

void challenge3() {
  print('--- Challenge 3 ---');
  final graph = AdjacencyList<String>();
  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');
  graph.addEdge(a, b);
  graph.addEdge(a, c);
  graph.addEdge(a, d);
  graph.addEdge(e, h);
  graph.addEdge(e, f);
  graph.addEdge(g, f);
  print('Graph is connected: ${graph.isConnected}'); // false
}
