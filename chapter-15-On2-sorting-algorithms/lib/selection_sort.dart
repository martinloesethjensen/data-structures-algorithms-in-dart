import 'package:chapter_15_on2_sorting_algorithms/swap.dart';

void selectionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (var start = 0; start < list.length - 1; start++) {
    var lowest = start;
    for (var next = start + 1; next < list.length; next++) {
      if (list[next].compareTo(list[lowest]) < 0) {
        lowest = next;
      }
    }
    if (lowest != start) list.swap(lowest, start);
  }
}
