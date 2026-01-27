import 'package:chapter_17_radix_sort/radix_sort.dart';

void main() {
  var list = [88, 410, 1772, 20];
  print("Original list: $list");
  list.radixSort();
  print("Radix sorted: $list");
  print(13.digits()); // 2
  print(999.digits()); // 3
  print(1345.digits()); // 4
  print(13456.digits()); // 5
  print(1345.digitAt(0)); // 1
  print(1345.digitAt(1)); // 3
  print(1345.digitAt(2)); // 4
  print(1345.digitAt(3)); // 5
  print(1345.digitAt(4)); // null
  print(1345.digitAt(5)); // null

  list = [46, 500, 459, 1345, 13, 999];
  print(list.maxDigits()); // 4, because 1345, has four digits

  list = [46, 500, 459, 1345, 13, 999];
  list.lexicographicalSort();
  print(list);

  // Challenge 2
  final words = ['done', 'ad', 'eel', 'zoo', 'adept', 'do'];
  print(uniqueCharacters(words)); // 9
}

int uniqueCharacters(List<String> words) {
  final uniqueChars = <int>{};
  for (var word in words) {
    for (var codeUnit in word.codeUnits) {
      uniqueChars.add(codeUnit);
    }
  }
  return uniqueChars.length;
}
