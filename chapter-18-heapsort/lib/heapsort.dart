import 'package:common/common.dart';

List<E> heapsort<E extends Comparable<dynamic>>(List<E> list) {
  final heap = Heap<E>(elements: list.toList(), priority: Priority.min);
  final sorted = <E>[];
  while (!heap.isEmpty) {
    final value = heap.remove();
    sorted.add(value!);
  }
  return sorted;
}

extension Heapsort<E extends Comparable<dynamic>> on List<E> {
  ({int left, int right}) _childIndexes(int parentIndex) {
    final base = 2 * parentIndex;
    return (left: base + 1, right: base + 2);
  }

  void _swapValues(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }

  void _siftDown({required int start, required int end}) {
    var parent = start;
    while (true) {
      final indexes = _childIndexes(parent);
      final left = indexes.left;
      final right = indexes.right;
      var chosen = parent;
      if (left < end && this[left].compareTo(this[chosen]) > 0) {
        chosen = left;
      }
      if (right < end && this[right].compareTo(this[chosen]) > 0) {
        chosen = right;
      }
      if (chosen == parent) return;
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  void heapsortInPlace() {
    if (isEmpty) return;
    final start = length ~/ 2 - 1;
    for (var i = start; i >= 0; i--) {
      _siftDown(start: i, end: length);
    }
    for (var end = length - 1; end > 0; end--) {
      _swapValues(0, end);
      _siftDown(start: 0, end: end);
    }
  }
}
