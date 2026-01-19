import 'package:chapter_9_binary_search_trees/binary_search_tree.dart';

void main() {
  final tree = buildExampleTree();
  print(tree);
  if (tree.contains(5)) {
    print('Contains 5');
  } else {
    print('Does not contain 5');
  }

  print('Tree before removal:');
  print(tree);
  tree.remove(3);
  print('Tree after removing root:');
  print(tree);
}

BinarySearchTree<int> buildExampleTree() {
  var tree = BinarySearchTree<int>();
  tree.insert(3);
  tree.insert(1);
  tree.insert(4);
  tree.insert(0);
  tree.insert(2);
  tree.insert(5);
  return tree;
}
