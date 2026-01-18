// Moved here from /chapter-6-queues

import 'doubly_linked_list.dart';
import 'ring_buffer.dart';

abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.firstOrNull;

  @override
  String toString() => _list.toString();
}

class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  E? dequeue() => _list.pop();

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;

  @override
  String toString() => _list.toString();
}

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) return false;
    _ringBuffer.write(element);
    return true;
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

class QueueStack<E> implements Queue<E> {
  final _leftStack = [];
  final _rightStack = [];

  @override
  E? dequeue() {
    if (_leftStack.isEmpty && _rightStack.isNotEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;
    return _leftStack.removeLast();
  }

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  int get length => _leftStack.length + _rightStack.length;

  @override
  E? get peek =>
      _leftStack.isNotEmpty ? _leftStack.lastOrNull : _rightStack.firstOrNull;

  @override
  String toString() {
    final combined = [..._leftStack.reversed, ..._rightStack].join(', ');
    return '[$combined]';
  }
}
