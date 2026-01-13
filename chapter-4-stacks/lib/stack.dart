class Stack<T> {
  final List<T> _elements = [];

  void push(T item) {
    _elements.add(item);
  }

  T? pop() {
    if (isEmpty) return null;
    return _elements.removeLast();
  }

  T? get peek => _elements.lastOrNull;

  int get size => _elements.length;

  bool get isEmpty => _elements.isEmpty;

  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_elements.reversed.join('\n')}'
        '\n-----------';
  }
}
