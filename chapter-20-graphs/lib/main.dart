import 'package:chapter_20_graphs/graph.dart';

void main() {
  printGraph(AdjacencyList<String>());
  printGraph(AdjacencyMatrix<String>());
  challenge1();
}

void printGraph(Graph graph) {
  final singapore = graph.createVertex('Singapore');
  final tokyo = graph.createVertex('Tokyo');
  final hongKong = graph.createVertex('Hong Kong');
  final detroit = graph.createVertex('Detroit');
  final sanFrancisco = graph.createVertex('San Francisco');
  final washingtonDC = graph.createVertex('Washington DC');
  final austinTexas = graph.createVertex('Austin Texas');
  final seattle = graph.createVertex('Seattle');
  graph.addEdge(singapore, hongKong, weight: 300);
  graph.addEdge(singapore, tokyo, weight: 500);
  graph.addEdge(hongKong, tokyo, weight: 250);
  graph.addEdge(tokyo, detroit, weight: 450);
  graph.addEdge(tokyo, washingtonDC, weight: 300);
  graph.addEdge(hongKong, sanFrancisco, weight: 600);
  graph.addEdge(detroit, austinTexas, weight: 50);
  graph.addEdge(austinTexas, washingtonDC, weight: 292);
  graph.addEdge(sanFrancisco, washingtonDC, weight: 337);
  graph.addEdge(washingtonDC, seattle, weight: 277);
  graph.addEdge(sanFrancisco, seattle, weight: 218);
  graph.addEdge(austinTexas, sanFrancisco, weight: 297);
  print(graph);

  final cost = graph.weight(singapore, tokyo)?.toInt();
  print('It costs \$$cost to fly from Singapore to Tokyo.\n');

  print('San Francisco Outgoing Flights: ');
  print('-------------------------------- ');
  for (final edge in graph.edges(sanFrancisco)) {
    print('${edge.source} to ${edge.destination}');
  }
}

void challenge1() {
  final graph = AdjacencyList<String>();
  final megan = graph.createVertex('Megan');
  final sandra = graph.createVertex('Sandra');
  final pablo = graph.createVertex('Pablo');
  final edith = graph.createVertex('Edith');
  final ray = graph.createVertex('Ray');
  final luke = graph.createVertex('Luke');
  final vicky = graph.createVertex('Vicki');
  final manda = graph.createVertex('Manda');
  graph.addEdge(megan, sandra);
  graph.addEdge(megan, pablo);
  graph.addEdge(megan, edith);
  graph.addEdge(pablo, ray);
  graph.addEdge(pablo, luke);
  graph.addEdge(edith, manda);
  graph.addEdge(edith, vicky);
  graph.addEdge(manda, pablo);
  graph.addEdge(manda, megan);
  print(graph);

  final p = graph.edges(pablo);
  final m = graph.edges(megan);
  final common = innerJoin(p, m);
  common.forEach((e) => print(e.destination));
}

List<Edge<String>> innerJoin(
  List<Edge<String>> listA,
  List<Edge<String>> listB,
) {
  final setB = listB.map((e) => e.destination).toSet();
  return listA.where((edge) => setB.contains(edge.destination)).toList();
}
