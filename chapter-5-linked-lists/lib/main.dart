import 'package:chapter_5_linked_lists/linked_list.dart';

// Create a function that prints the nodes of a linked list in reverse order.
void challenge1(LinkedList list) {
  while (list.isNotEmpty) {
    print(list.removeLast());
  }
}

//
void challenge2() {}

void main() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3, next: Node(value: 4));
  node1.next = node2;
  node2.next = node3;
  print(node1);

  final list = LinkedList<int>();
  list.append(1);
  list.append(2);
  list.append(3);
  print(list);

  list.push(3);
  list.push(2);
  list.push(1);
  print('Before: $list');
  var middleNode = list.nodeAt(2);
  list.insertAfter(middleNode, 42);
  print('After: $list');

  print('Before: $list');
  final poppedValue = list.pop();
  print('After: $list');
  print('Popped value: $poppedValue');

  print('Before: $list');
  final removedValue = list.removeLast();
  print('After: $list');
  print('Removed value: $removedValue');

  print('Before: $list');
  final firstNode = list.nodeAt(3);
  final removedAfterValue = list.removeAfter(firstNode);
  print('After: $list');
  print('Removed after value: $removedAfterValue');

  list.forEach(print);

  print('---- challenges ----');
  final temp = list;
  challenge1(temp);
  challenge2();
}
