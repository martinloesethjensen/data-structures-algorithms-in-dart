import 'package:chapter_11_tries/trie_node.dart';

class StringTrie {
  TrieNode<int> root = TrieNode();

  void insert(String text) {
    var current = root;
    for (var codeUnit in text.codeUnits) {
      final child = current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = child;
    }
    current.isTerminating = true;
  }

  bool contains(String text) {
    var current = root;
    for (var codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) return false;
      current = child;
    }
    return current.isTerminating;
  }
}
