import 'package:chapter_6_queues/queue.dart';

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
}
