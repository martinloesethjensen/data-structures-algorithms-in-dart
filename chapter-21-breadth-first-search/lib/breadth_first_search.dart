import 'package:common/common.dart';

extension BreadthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> breadthFirstSearch(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    queue.enqueue(source);
    enqueued.add(source);

    while (true) {
      final vertex = queue.dequeue();
      if (vertex == null) break;
      visited.add(vertex);
      final neighborEdges = edges(vertex);
      for (final edge in neighborEdges) {
        final dest = edge.destination;
        if (!enqueued.contains(dest)) {
          queue.enqueue(dest);
          enqueued.add(dest);
        }
      }
    }

    return visited;
  }
}

extension RecursiveBfs<E> on Graph<E> {
  void _bfs(
    QueueStack<Vertex<E>> queue,
    Set<Vertex<E>> enqueued,
    List<Vertex<E>> visited,
  ) {
    final vertex = queue.dequeue();
    if (vertex == null) return;
    visited.add(vertex);
    final neighborEdges = edges(vertex);
    for (final edge in neighborEdges) {
      final dest = edge.destination;
      if (!enqueued.contains(dest)) {
        queue.enqueue(dest);
        enqueued.add(dest);
      }
    }
    _bfs(queue, enqueued, visited);
  }

  List<Vertex<E>> bfs(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    queue.enqueue(source);
    enqueued.add(source);

    _bfs(queue, enqueued, visited);
    return visited;
  }
}

extension Connected<E> on Graph<E> {
  bool get isConnected {
    final firstVertex = vertices.firstOrNull;
    if (firstVertex == null) return false;
    final visited = breadthFirstSearch(firstVertex);
    return visited.length == vertices.length;
  }
}
