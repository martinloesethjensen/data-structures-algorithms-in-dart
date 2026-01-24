enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  Heap({this.elements = const [], this.priority = Priority.max});

  final List<E> elements;
  final Priority priority;

  bool get isEmpty => elements.isEmpty;

  int get size => elements.length;

  E? get peek => elements.firstOrNull;

  int _leftChildIndex(int parentIndex) => 2 * parentIndex + 1;

  int _rightChildIndex(int parentIndex) => 2 * parentIndex + 2;

  int _parentIndex(int childIndex) => (childIndex - 1) ~/ 2;

  bool _firstHasHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  int _higherPriority(int indexA, int indexB) {
    if (indexA >= elements.length) return indexB;
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHasHigherPriority(valueA, valueB);
    return (isFirst) ? indexA : indexB;
  }
}
