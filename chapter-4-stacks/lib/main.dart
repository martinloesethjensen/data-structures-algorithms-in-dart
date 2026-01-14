import 'package:chapter_4_stacks/stack.dart';

// Create a function that prints the contents of a list in reverse order.
void challenge1<T>(List<T> list) {
  final stack = Stack.of(list);
  while (stack.isNotEmpty) {
    print(stack.pop());
  }
}

void checkInputIsBalanced(String input) {
  final stack = Stack();
  for (final char in input.split('')) {
    if (char == '(') {
      stack.push(char);
    } else if (char == ')') {
      stack.pop();
    }
  }

  if (stack.isEmpty) {
    print('Input is balanced');
  } else {
    print('Input is unbalanced');
  }
}

// Check for balanced parentheses. Given a string, check if there are ( and ) characters,
// and return true if the parentheses in the string are balanced. For example:
// 1. h((e))llo(world)() // balanced parentheses
// 2. (hello world // unbalanced parentheses
void challenge2() {
  checkInputIsBalanced('h((e))llo(world)()');
  checkInputIsBalanced('(hello world');
}

void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print(stack);
  final element = stack.pop();
  print('Popped: $element');

  challenge1('drawer'.split(''));
  challenge2();
}
