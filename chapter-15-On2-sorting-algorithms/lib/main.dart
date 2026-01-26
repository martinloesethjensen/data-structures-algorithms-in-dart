import 'package:chapter_15_on2_sorting_algorithms/bubble_sort.dart';
import 'package:chapter_15_on2_sorting_algorithms/insertion_sort.dart';
import 'package:chapter_15_on2_sorting_algorithms/selection_sort.dart';

void main() {
  var list = [9, 4, 10, 3];
  print('Original: $list');
  bubbleSort(list);
  print('Bubble sorted: $list');

  list = [9, 4, 10, 3];
  print('Original: $list');
  selectionSort(list);
  print('Selection sorted: $list');

  list = [9, 4, 10, 3];
  print('Original: $list');
  insertionSort(list);
  print('Insertion sorted: $list');
}
