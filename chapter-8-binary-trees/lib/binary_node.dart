import 'package:common/common.dart';

typedef ActionCallback<T> = void Function(T value);

class BinaryNode<T> {
  BinaryNode(this.value);

  final T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  static BinaryNode<T>? deserialize<T>(List<T?> list) {
    if (list.isEmpty) return null;
    final value = list.removeAt(0);
    if (value == null) return null;
    final node = BinaryNode<T>(value);
    node.leftChild = deserialize(list);
    node.rightChild = deserialize(list);
    return node;
  }

  void traverseInOrder(ActionCallback<T> action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  void traversePreOrder(ActionCallback<T> action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  void nullableTraversalPreOrder(ActionCallback<T?> action) {
    action(value);
    if (leftChild == null) {
      action(null);
    } else {
      leftChild?.nullableTraversalPreOrder(action);
    }
    if (rightChild == null) {
      action(null);
    } else {
      rightChild?.nullableTraversalPreOrder(action);
    }
  }

  void traversePostOrder(ActionCallback<T> action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  int getHeightOfTree() {
    final left = leftChild?.getHeightOfTree() ?? -1;
    final right = rightChild?.getHeightOfTree() ?? -1;
    return 1 + ((left >= right) ? left : right);
  }

  List<T?> serialize() {
    final list = <T?>[];
    nullableTraversalPreOrder(list.add);
    return list;
  }

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(node.rightChild, '$top ', '$top┌──', '$top│ ');
    final b = '$root${node.value}\n';
    final c = _diagram(node.leftChild, '$bottom│ ', '$bottom└──', '$bottom ');
    return '$a$b$c';
  }
}
