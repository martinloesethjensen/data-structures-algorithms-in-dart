import 'package:chapter_13_heaps/heap.dart';

void main() {
  final heap = Heap<int>();
  heap.insert(10);
  heap.insert(8);
  heap.insert(6);
  heap.insert(5);
  heap.insert(4);
  heap.insert(3);
  heap.insert(2);
  heap.insert(1);
  print(heap);
  heap.insert(7);
  print(heap);

  final root = heap.remove();
  print(root);
  print(heap);

  final index = 1;
  heap.removeAt(index);
  print(heap);

  final indexOf = heap.indexOf(3);
  print(indexOf);

  var maxHeap = Heap<int>(elements: [1, 12, 3, 4, 1, 6, 8, 7]);
  print(maxHeap);
  while (!maxHeap.isEmpty) {
    print(maxHeap.remove());
  }

  var minHeap = Heap<int>(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
    priority: Priority.min,
  );
  print(minHeap);
  while (!minHeap.isEmpty) {
    print(minHeap.remove());
  }

  print('--- Challenges ---');
  challenge1();
  challenge3();
  challenge4();
}

void challenge1() {
  final integers = [3, 10, 18, 5, 21, 100];
  print(findNthSmallest(3, integers));
}

int findNthSmallest(int n, List<int> list) {
  if (n > list.length) return -1;
  final heap = Heap<int>(elements: list, priority: Priority.min);
  return heap.elements[n];
}

void challenge3() {
  final heap1 = Heap(elements: [1, 4, 6, 8, 3], priority: Priority.min);
  final heap2 = Heap(elements: [11, 14, 60, 18, 2]);
  final combined = combine(heap1, heap2);
  print(combined);
}

Heap combine(Heap left, Heap right, [Priority? priority]) {
  return Heap(
    elements: List.of([...left.elements, ...right.elements]),
    priority: priority ?? left.priority,
  );
}

void challenge4() {
  final list = [1, 3, 6, 8, 11];
  print(list.isMinHeap);
}

extension ListExt<E extends Comparable<dynamic>> on List<E> {
  bool get isMinHeap {
    if (isEmpty) return true;
    final start = length ~/ 2 - 1;
    for (var i = start; i >= 0; i--) {
      final left = 2 * i + 1;
      final right = 2 * i + 2;
      if (this[left].compareTo(this[i]) < 0) {
        return false;
      }
      if (right < length && this[right].compareTo(this[i]) < 0) {
        return false;
      }
    }
    return true;
  }
}
