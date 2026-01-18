import 'package:common/common.dart' show QueueStack;

class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  void add(TreeNode<T> child) => children.add(child);

  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final queue = QueueStack<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    var node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    }
  }

  List<List<TreeNode<T>>> getChildrenAsListInLevels(TreeNode<T> tree) {
    final queue = QueueStack<TreeNode<T>>();
    var nodesLeftInCurrentLevel = 0;

    queue.enqueue(tree);

    final result = <List<TreeNode<T>>>[];

    while (!queue.isEmpty) {
      nodesLeftInCurrentLevel = queue.length;
      var list = <TreeNode<T>>[];
      while (nodesLeftInCurrentLevel > 0) {
        final node = queue.dequeue();
        if (node == null) break;
        list.add(node);
        for (final element in node.children) {
          queue.enqueue(element);
        }
        nodesLeftInCurrentLevel -= 1;
      }
      result.add(list);
    }
    return result;
  }

  TreeNode<T>? search(T value) {
    TreeNode<T>? result;
    forEachLevelOrder((node) {
      if (node.value == value) result = node;
    });
    return result;
  }
}
