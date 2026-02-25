import 'package:chapter_18_heapsort/heapsort.dart';

void main() {
  final sorted = heapsort([6, 12, 2, 26, 8, 18, 21, 9, 5]);
  print(sorted);

  final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
  print(list);
  list.heapsortInPlace();
  print(list);
}
