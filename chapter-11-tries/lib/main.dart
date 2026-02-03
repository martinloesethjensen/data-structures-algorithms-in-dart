import 'package:chapter_11_tries/string_trie.dart';
import 'package:chapter_11_tries/trie.dart';

void main() {
  final trie = StringTrie();
  trie.insert('cut');
  trie.insert('cute');
  if (trie.contains('cut')) {
    print('"cut" is in the trie');
  }
  if (trie.contains('cute')) {
    print('"cute" is in the trie');
  }
  print('\n--- Removing "cut" ---');
  trie.remove('cut');
  if (!trie.contains('cut') && trie.contains('cute')) {
    print('"cute" is still in the trie');
  }

  trie.insert('car');
  trie.insert('card');
  trie.insert('care');
  trie.insert('cared');
  trie.insert('cars');
  trie.insert('carbs');
  trie.insert('carapace');
  trie.insert('cargo');
  print('Collections starting with "car"');
  final prefixedWithCar = trie.matchPrefix('car');
  print(prefixedWithCar);
  print('\nCollections starting with "care"');
  final prefixedWithCare = trie.matchPrefix('care');
  print(prefixedWithCare);

  // Challenge 1
  print('\nLength of trie');
  print(trie.length);

  print('\nIs trie empty?');
  print(trie.isEmpty);

  print('\nAll strings in trie');
  print(trie.allStrings);

  challenge2();
}

void challenge2() {
  final trie = Trie<int, List<int>>();
  trie.insert('cut'.codeUnits);
  trie.insert('cute'.codeUnits);
  if (trie.contains('cut'.codeUnits)) {
    print('"cut" is in the trie');
  }
  if (trie.contains('cute'.codeUnits)) {
    print('"cute" is in the trie');
  }
  print('\n--- Removing "cut" ---');
  trie.remove('cut'.codeUnits);
  if (!trie.contains('cut'.codeUnits) && trie.contains('cute'.codeUnits)) {
    print('"cute" is still in the trie');
  }
}
