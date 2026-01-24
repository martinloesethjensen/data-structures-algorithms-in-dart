enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  Heap({this.elements = const [], this.priority = Priority.max});

  final List<E> elements;
  final Priority priority;
}
