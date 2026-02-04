import 'package:common/common.dart';

class Pair<T> implements Comparable<Pair<T>> {
  Pair(this.distance, [this.vertex]);

  double distance;
  Vertex<T>? vertex;

  @override
  int compareTo(Pair<T> other) {
    if (distance == other.distance) return 0;
    if (distance > other.distance) return 1;
    return -1;
  }

  @override
  String toString() => '($distance, $vertex)';
}

typedef Paths<E> = Map<Vertex<E>, Pair<E>?>;

class Dijkstra<E> {
  Dijkstra(this.graph);

  final Graph<E> graph;

  Paths<E> shortestPaths(Vertex<E> source) {
    final queue = PriorityQueue<Pair<E>>(priority: Priority.min);
    final visited = <Vertex<E>>{};
    final paths = <Vertex<E>, Pair<E>?>{};
    for (final vertex in graph.vertices) {
      paths[vertex] = null;
    }
    queue.enqueue(Pair(0, source));
    paths[source] = Pair(0);
    visited.add(source);

    while (!queue.isEmpty) {
      final current = queue.dequeue()!;

      final currentVertex = current.vertex;

      final savedDistance = paths[currentVertex]!.distance;
      if (current.distance > savedDistance) continue;
      visited.add(currentVertex!);

      for (final edge in graph.edges(currentVertex)) {
        final neighbor = edge.destination;
        if (visited.contains(neighbor)) continue;
        final weight = edge.weight ?? double.infinity;
        final totalDistance = current.distance + weight;
        final knownDistance = paths[neighbor]?.distance ?? double.infinity;
        if (totalDistance < knownDistance) {
          paths[neighbor] = Pair(totalDistance, currentVertex);
          queue.enqueue(Pair(totalDistance, neighbor));
        }
      }
    }

    return paths;
  }

  List<Vertex<E>> shortestPath(
    Vertex<E> source,
    Vertex<E> destination, {
    Paths<E>? paths,
  }) {
    final allPaths = paths ?? shortestPaths(source);
    if (!allPaths.containsKey(destination)) return [];
    var current = destination;
    final path = <Vertex<E>>[current];
    while (current != source) {
      final previous = allPaths[current]?.vertex;
      if (previous == null) return [];
      path.add(previous);
      current = previous;
    }
    return path.reversed.toList();
  }

  Map<Vertex<E>, List<Vertex<E>>> shortestPathsLists(Vertex<E> source) {
    final result = <Vertex<E>, List<Vertex<E>>>{};
    final allPaths = shortestPaths(source);
    for (final vertex in graph.vertices) {
      final path = shortestPath(source, vertex, paths: allPaths);
      result[vertex] = path;
    }
    return result;
  }
}
