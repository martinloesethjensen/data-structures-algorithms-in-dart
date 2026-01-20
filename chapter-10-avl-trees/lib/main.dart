import 'dart:math';

import 'avl_tree.dart';

void main() {
  final tree = AvlTree<int>();
  tree.insert(15);
  tree.insert(10);
  tree.insert(16);
  tree.insert(18);
  print(tree);
  tree.remove(10);
  print(tree);

  print('--- Challenges ---');
  // How many **leaf** nodes are there in a perfectly balanced tree of height 3? What about
  // a perfectly balanced tree of height h?
  print(getLeafNodes(3));

  // How many nodes are there in a perfectly balanced tree of height 3? What about a
  // perfectly balanced tree of height h?
  print(getNodes(3));

  challenge3();
}

int getLeafNodes(int height) => pow(2, height).toInt();

int getNodes(int height) => pow(2, height + 1).toInt() - 1;

void challenge3() {
  final tree = AvlTree<int>();
  for (var i = 0; i < 15; i++) {
    tree.insert(i);
  }
  tree.root?.traverseInOrder(print);
}
