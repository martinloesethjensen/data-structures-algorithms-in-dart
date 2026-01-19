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

  print('\n--- Challenge 1 ---');
  // Given a binary tree, find the height of the tree. The height of the binary tree is
  // determined by the distance between the root and the furthest leaf. The height of a
  // binary tree with a single node is zero since the single node is both the root and the
  // furthest leaf.
  print(tree.getHeightOfTree());

  print('\n--- Challenge 2 ---');
  final asList = tree.serialize();
  print(asList);
  print(BinaryNode.deserialize(asList));
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final ten = BinaryNode(10);
  final nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  eight.rightChild = ten;
  return seven;
}
