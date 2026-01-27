import 'merge_sort.dart';

void main() {
  final list = [7, 2, 6, 3, 9];
  final sorted = mergeSort(list);
  print('Original: $list');
  print('Merge sorted: $sorted');
}
