typedef ActionCallback<T> = void Function(T value);

class BinaryNode<T> {
  BinaryNode(this.value);
  final T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

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

  int getHeightOfTree([int value = -1]) {
    final left = leftChild?.getHeightOfTree(value += 1) ?? value;
    final right = rightChild?.getHeightOfTree(value += 1) ?? value;
    return (left >= right) ? left : right;
  }

  void traversePostOrder(ActionCallback<T> action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
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
