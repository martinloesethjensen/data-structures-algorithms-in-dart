import 'package:chapter_14_priority_queues/list_priority_queue.dart';
import 'package:chapter_14_priority_queues/priority_queue.dart';

void main() {
  var priorityQueue = PriorityQueue(elements: [1, 12, 3, 4, 1, 6, 8, 7]);
  while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue());
  }

  // Challenge 1
  final people = [
    Person(name: 'Bob', age: 18, isMilitary: false),
    Person(name: 'Josh', age: 21, isMilitary: true),
    Person(name: 'Alice', age: 23, isMilitary: true),
  ];
  var peopleInQueue = PriorityQueue<Person>(elements: people);
  while (!peopleInQueue.isEmpty) {
    print(peopleInQueue.dequeue());
  }

  // Challenge 2
  final listPriorityQueue = ListPriorityQueue(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
  );
  print(listPriorityQueue);
  listPriorityQueue.enqueue(5);
  listPriorityQueue.enqueue(0);
  listPriorityQueue.enqueue(10);
  print(listPriorityQueue);
  while (!listPriorityQueue.isEmpty) {
    print(listPriorityQueue.dequeue());
  }
}

class Person implements Comparable {
  Person({required this.name, required this.age, this.isMilitary = false});
  final String name;
  final int age;
  final bool isMilitary;

  @override
  int compareTo(other) {
    if (isMilitary == other.isMilitary) {
      return age.compareTo(other.age);
    }
    return isMilitary ? 1 : -1;
  }

  @override
  String toString() =>
      'Person(name: $name, age: $age, isMilitary: $isMilitary)';
}
