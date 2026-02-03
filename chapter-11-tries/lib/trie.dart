import 'package:chapter_11_tries/trie_node.dart';

class Trie<E, T extends Iterable<E>> {
  TrieNode<E> root = TrieNode();

  void insert(T collection) {
    var current = root;
    for (E element in collection) {
      final child = current.children[element] ??= TrieNode<E>(
        key: element,
        parent: current,
      );
      current = child;
    }
    current.isTerminating = true;
  }

  bool contains(T collection) {
    var current = root;
    for (E element in collection) {
      final child = current.children[element];
      if (child == null) return false;
      current = child;
    }
    return current.isTerminating;
  }

  T? remove(T collection) {
    var current = root;
    for (E element in collection) {
      final child = current.children[element];
      if (child == null) return null;
      current = child;
    }
    if (!current.isTerminating) return null;
    current.isTerminating = false;
    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent?.children[current.key!] = null;
      current = current.parent!;
    }
    return collection;
  }
}
