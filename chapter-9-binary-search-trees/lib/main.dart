import 'package:chapter_9_binary_search_trees/binary_search_tree.dart';
import 'package:common/common.dart';

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

  print('--- Challenges ---');
  challenge1();
  challenge2();
  challenge3();
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
  nine.rightChild = ten;
  return seven;
}

void challenge1() {
  // Binary node is a BST
  final tree = createBinaryTree();

  // Check if the tree is a BST
  print('Is tree a BST? ${tree.isBst}');
}

void challenge2() {
  final tree1 = buildExampleTree();
  final tree2 = buildExampleTree();

  print('Equality check: ${tree1.equals(tree2)}');
}

void challenge3() {
  final tree1 = buildExampleTree();
  final tree2 = buildExampleTree();
  tree2.remove(5);
  print('Tree contains subtree: ${tree1.containsSubtree(tree2)}');
}

extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {
  bool get isBst => _isBst(this, min: null, max: null);

  bool _isBst(BinaryNode<E>? tree, {E? min, E? max}) {
    if (tree == null) return true;

    if (min != null && tree.value.compareTo(min) < 0) {
      return false;
    } else if (max != null && tree.value.compareTo(max) >= 0) {
      return false;
    }

    return _isBst(tree.leftChild, min: min, max: tree.value) &&
        _isBst(tree.rightChild, min: tree.value, max: max);
  }
}

extension Equals<E extends Comparable<E>> on BinarySearchTree<E> {
  bool equals(BinarySearchTree<E> other) => _isEqual(this.root, other.root);

  bool _isEqual(BinaryNode<E>? first, BinaryNode<E>? second) {
    if (first == null || second == null) {
      return first == null && second == null;
    }
    return first.value == second.value &&
        _isEqual(first.leftChild, second.leftChild) &&
        _isEqual(first.rightChild, second.rightChild);
  }
}

extension Subtree<E extends Comparable<E>> on BinarySearchTree<E> {
  bool containsSubtree(BinarySearchTree<E> subtree) {
    final rootLength = root?.getHeightOfTree() ?? -1;
    final subrootLength = subtree.root?.getHeightOfTree() ?? -1;
    if (rootLength < subrootLength) return false;
    Set set = <E>{};
    root?.traverseInOrder(set.add);
    var isEqual = true;
    subtree.root?.traverseInOrder((node) {
      isEqual = isEqual && set.contains(node);
    });
    return isEqual;
  }
}
