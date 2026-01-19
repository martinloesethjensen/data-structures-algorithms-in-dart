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

  void remove(E value) {
    root = _removeAt(root, value);
  }

  BinaryNode<E>? _removeAt(BinaryNode<E>? node, E value) {
    if (node == null) return null;

    if (value == node.value) {
      final rightChild = node.rightChild;
      final leftChild = node.leftChild;
      // removal of leaf node
      if (leftChild == null && rightChild == null) {
        return null;
      }
      // removal of nodes with single child
      if (leftChild == null) {
        return rightChild;
      }
      if (rightChild == null) {
        return leftChild;
      }
      // swap and removal of node with both children
      node.value = rightChild.min.value;
      node.rightChild = _removeAt(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _removeAt(node.leftChild, value);
    } else {
      node.rightChild = _removeAt(node.rightChild, value);
    }
    return node;
  }

  bool contains(E element) {
    var current = root;
    while (current != null) {
      if (current.value == element) return true;
      if (element.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}
