import 'binary_node.dart';

void main() {
  final tree = createBinaryTree();
  print(tree);
  print('--- Traverse in-order ---');
  tree.traverseInOrder(print);
  print('--- Traverse pre-order ---');
  tree.traversePreOrder(print);
  print('--- Traverse post-order ---');
  tree.traversePostOrder(print);
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  return seven;
}
