import 'package:common/common.dart';

extension DepthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> depthFirstSearch(Vertex<E> source) {
    final stack = Stack<Vertex<E>>();
    final pushed = <Vertex<E>>{};
    final visited = <Vertex<E>>[];

    void add(Vertex<E> source) {
      stack.push(source);
      pushed.add(source);
      visited.add(source);
    }

    add(source);

    outerLoop:
    while (stack.isNotEmpty) {
      final vertex = stack.peek!; // not empty at this point
      final neighbors = edges(vertex);
      for (final edge in neighbors) {
        final dest = edge.destination;
        if (!pushed.contains(dest)) {
          add(dest);
          continue outerLoop;
        }
      }
      stack.pop();
    }
    return visited;
  }
}

extension CyclicGraph<E> on Graph<E> {
  bool hasCycle(Vertex<E> source) {
    Set<Vertex<E>> pushed = {};
    return _hasCycle(source, pushed);
  }

  bool _hasCycle(Vertex<E> source, Set<Vertex<E>> pushed) {
    pushed.add(source);
    final neighbors = edges(source);
    for (final edge in neighbors) {
      if (!pushed.contains(edge.destination)) {
        if (_hasCycle(edge.destination, pushed)) {
          return true;
        }
      } else {
        return true;
      }
    }
    pushed.remove(source);
    return false;
  }
}
