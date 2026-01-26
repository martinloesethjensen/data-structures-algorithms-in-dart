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
}
