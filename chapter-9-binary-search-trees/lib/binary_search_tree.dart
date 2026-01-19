import 'package:common/common.dart' show BinaryNode;

class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  void insert(E value) {
    root = _insertAt(root, value);
  }

  BinaryNode<E> _insertAt(BinaryNode<E>? node, E value) {
    if (node == null) return BinaryNode(value);
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    return node;
  }

  bool contains(E element) {
    if (root == null) return false;
    var found = false;
    root?.traverseInOrder((value) {
      if (value == element) found = true;
    });
    return found;
  }

  @override
  String toString() => root.toString();
}
