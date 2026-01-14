import 'package:chapter_5_linked_lists/linked_list.dart';

void printRecursively<T>(Node<T>? node) {
  if (node == null) return;

  if (node.next == null) return;

  printRecursively(node.next);

  print(node.value);
}

// Create a function that prints the nodes of a linked list in reverse order.
void challenge1(LinkedList list) {
  printRecursively(list.head);
}

Node<E>? middleNode<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;
  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }
  return slow;
}

// Create a function that finds the middle node of a linked list
void challenge2(LinkedList list) {
  print(middleNode(list)?.value);
}

class ReversedLinkedList<E> extends LinkedList<E> {
  void reverse() {
    tail = head;
    var previous = head;
    var current = head?.next;
    previous?.next = null;

    while (current != null) {
      final next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    head = previous;
  }
}

// Create a function that reverses a linked list. You do this by manipulating the nodes
// so that they’re linked in the other direction.
void challenge3(LinkedList list) {
  final reversedLinked = ReversedLinkedList();
  list.forEach(reversedLinked.push);
  reversedLinked.reverse();
  print(reversedLinked);
}

//
void challenge4() {}

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
  print('CHALLENGE 1');
  challenge1(list);
  print('CHALLENGE 2');
  challenge2(list);
  print('CHALLENGE 3');
  challenge3(list);
  print('CHALLENGE 4');
  challenge4();
}
