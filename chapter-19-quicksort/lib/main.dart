import 'quicksort.dart';

void main() {
  final _defaultList = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  var list = _defaultList;
  final sorted = quicksortNaive(list);
  print(sorted);

  list = _defaultList;
  quicksortLomuto(list, 0, list.length - 1);
  print(list);

  list = _defaultList;
  quicksortHoare(list, 0, list.length - 1);
  print(list);

  list = _defaultList;
  quicksortMedian(list, 0, list.length - 1);
  print(list);

  list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
  quicksortDutchFlag(list, 0, list.length - 1);
  print(list);

  list = _defaultList;
  quicksortDutchFlagIterative(list, 0, list.length - 1);
  print(list);
}
