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

  void remove(String text) {
    var current = root;
    for (var codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) return;
      current = child;
    }
    if (!current.isTerminating) return;
    current.isTerminating = false;
    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent?.children[current.key!] = null;
      current = current.parent!;
    }
  }

  List<String> matchPrefix(String prefix) {
    var current = root;
    for (var codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) return [];
      current = child;
    }
    return _moreMatches(prefix, current);
  }

  List<String> _moreMatches(String prefix, TrieNode<int> node) {
    // 1
    List<String> results = [];
    if (node.isTerminating) {
      results.add(prefix);
    }

    // 2
    for (final child in node.children.values) {
      final codeUnit = child!.key!;
      results.addAll(
        _moreMatches('$prefix${String.fromCharCode(codeUnit)}', child),
      );
    }
    return results;
  }
}
