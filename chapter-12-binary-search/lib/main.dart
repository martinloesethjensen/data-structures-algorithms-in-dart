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
  if (list.isEmpty) return null;
  final start = _startIndex(list, value);
  final end = _endIndex(list, value);
  if (start == null || end == null) return null;
  return Range(start, end);
}

int? _startIndex<E extends Comparable<dynamic>>(List<E> list, E value) {
  if (list[0] == value) return 0;
  var start = 1;
  var end = list.length;
  while (start < end) {
    var middle = start + (end - start) ~/ 2;
    if (list[middle] == value && list[middle - 1] != value) {
      return middle;
    } else if (list[middle].compareTo(value) < 0) {
      start = middle + 1;
    } else {
      end = middle;
    }
  }
  return null;
}

int? _endIndex<E extends Comparable<dynamic>>(List<E> list, E value) {
  if (list[list.length - 1] == value) return list.length;
  var start = 0;
  var end = list.length - 1;
  while (start < end) {
    var middle = start + (end - start) ~/ 2;
    if (list[middle] == value && list[middle + 1] != value) {
      return middle + 1;
    } else if (list[middle].compareTo(value) > 0) {
      end = middle;
    } else {
      start = middle + 1;
    }
  }
  return null;
}
