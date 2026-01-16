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
}
