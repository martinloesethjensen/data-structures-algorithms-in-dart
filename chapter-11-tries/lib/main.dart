import 'package:chapter_11_tries/string_trie.dart';

void main() {
  final trie = StringTrie();
  trie.insert("cute");
  if (trie.contains("cute")) {
    print("cute is in the trie");
  }
}
