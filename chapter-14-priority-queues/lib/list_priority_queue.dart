import 'package:common/common.dart';

enum Priority { max, min }

class ListPriorityQueue<E extends Comparable<dynamic>> implements Queue<E> {
  ListPriorityQueue({List<E>? elements, this.priority = Priority.max})
    : _elements = elements ?? [] {
    _elements.sort(_compareByPriority);
  }

  final List<E> _elements;
  final Priority priority;

  int _compareByPriority(E a, E b) => switch (priority) {
    Priority.max => a.compareTo(b),
    Priority.min => b.compareTo(a),
  };

  @override
  E? dequeue() => _elements.removeLast();

  @override
  bool enqueue(E element) {
    for (var i = 0; i < _elements.length; i++) {
      if (_compareByPriority(element, _elements[i]) < 0) {
        _elements.insert(i, element);
        return true;
      }
    }
    _elements.add(element);
    return true;
  }

  @override
  bool get isEmpty => _elements.isEmpty;

  @override
  E? get peek => _elements.lastOrNull;

  @override
  String toString() => _elements.toString();
}
