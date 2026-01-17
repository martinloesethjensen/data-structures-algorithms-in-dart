import 'package:chapter_6_queues/queue.dart';
import 'package:common/common.dart' show DoublyLinkedList;

extension BoardGameManager<E> on QueueRingBuffer {
  E? nextPlayer() {
    final player = dequeue();
    if (player != null) enqueue(player);
    return player;
  }
}

void challenge3() {
  final monopolyTurn = QueueRingBuffer<String>(2);
  monopolyTurn.enqueue('Alice');
  monopolyTurn.enqueue('Bob');
  String? player;
  for (var i = 0; i <= 11; i++) {
    player = monopolyTurn.nextPlayer();
  }
  print('$player wins!');
}

enum Direction { front, back }

abstract class Deque<E> {
  bool get isEmpty;
  E? peek(Direction from);
  bool enqueue(E element, Direction to);
  E? dequeue(Direction from);
}

class DequeList<E> implements Deque<E> {
  final _list = DoublyLinkedList<E>();

  @override
  E? dequeue(Direction from) {
    return switch (from) {
      Direction.front => _list.pop(),
      Direction.back => _list.removeLast(),
    };
  }

  @override
  bool enqueue(E element, Direction to) {
    switch (to) {
      case Direction.front:
        _list.push(element);
      case Direction.back:
        _list.append(element);
    }
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? peek(Direction from) => switch (from) {
    Direction.front => _list.head?.value,
    Direction.back => _list.tail?.value,
  };

  @override
  String toString() => _list.toString();
}

void challenge4() {
  final queue = DequeList<String>();
  queue.enqueue('Ray', Direction.front);
  queue.enqueue('Brian', Direction.front);
  queue.enqueue('Eric', Direction.back);
  print(queue); // [Brian, Ray, Eric]
  queue.dequeue(Direction.front);
  print(queue); // [Ray, Eric,]
  print(queue.peek(Direction.front)); // Ray
}

void main() {
  final queue = QueueList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);
  queue.dequeue();
  print(queue);
  print(queue.peek);

  final queueLinked = QueueLinkedList<String>();
  queueLinked.enqueue('Ray');
  queueLinked.enqueue('Brian');
  queueLinked.enqueue('Eric');
  print(queueLinked); // [Ray, Brian, Eric]
  queueLinked.dequeue();
  print(queueLinked); // [Brian, Eric]
  print(queueLinked.peek); // Brian

  final queueRingBuffer = QueueRingBuffer<String>(10);
  queueRingBuffer.enqueue("Ray");
  queueRingBuffer.enqueue("Brian");
  queueRingBuffer.enqueue("Eric");
  print(queueRingBuffer); // [Ray, Brian, Eric]
  queueRingBuffer.dequeue();
  print(queueRingBuffer); // [Brian, Eric]
  print(queueRingBuffer.peek); // Brian

  final queueStack = QueueStack<String>();
  queueStack.enqueue("Ray");
  queueStack.enqueue("Brian");
  queueStack.enqueue("Eric");
  print(queueStack); // [Ray, Brian, Eric]
  queueStack.dequeue();
  print(queueStack); // [Brian, Eric]
  print(queueStack.peek); // Brian

  // Challenges
  // See challenge 1 & 2 in the README.md

  challenge3();

  challenge4();
}
