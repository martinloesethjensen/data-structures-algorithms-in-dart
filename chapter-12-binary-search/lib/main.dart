import 'binary_search.dart';

void main() {
  final list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  final search31 = list.indexOf(31);
  final binarySearch31 = list.binarySearch(31);
  final binarySearch31FreeFunction = binarySearch(list, 31);
  print('indexOf: $search31');
  print('binarySearch: $binarySearch31');
  print('binarySearch as free function: $binarySearch31FreeFunction');

  final binarySearch31WhileLoop = binarySearchWhileLoop(list, 31);
  print('binarySearch while loop: $binarySearch31WhileLoop');

  final rangedList = [1, 2, 3, 3, 3, 4, 5, 5];
  final range = findRange(rangedList, value: 3);
  print(range);
}

int? binarySearch<E extends Comparable<dynamic>>(
  List<E> list,
  E value, [
  int? start,
  int? end,
]) {
  final startIndex = start ?? 0;
  final endIndex = end ?? list.length;
  if (startIndex >= endIndex) return null;
  final size = endIndex - startIndex;
  final middle = startIndex + size ~/ 2;
  if (list[middle] == value) {
    return middle;
  } else if (value.compareTo(list[middle]) < 0) {
    return binarySearch(list, value, startIndex, middle);
  } else {
    return binarySearch(list, value, middle + 1, endIndex);
  }
}

int? binarySearchWhileLoop<E extends Comparable<dynamic>>(
  List<E> list,
  E value,
) {
  var start = 0;
  var end = list.length;
  while (start < end) {
    final middle = start + (end - start) ~/ 2;
    if (value == list[middle]) {
      return middle;
    } else if (value.compareTo(list[middle]) < 0) {
      end = middle;
    } else {
      start = middle + 1;
    }
  }
  return null;
}

class Range {
  Range(this.start, this.end);
  final int start;
  final int end;
  @override
  String toString() => 'Range($start, $end)';
}

Range? findRange<E extends Comparable<dynamic>>(
  List<E> list, {
  required E value,
}) {
  final start = list.indexOf(value);
  if (start == -1) return null;
  final end = list.lastIndexOf(value);
  return Range(start, end);
}
