import 'package:chapter_7_trees/tree.dart';

void main() {
  final tree = makeBeverageTree();
  tree.forEachDepthFirst((node) => print(node.value));
  tree.forEachLevelOrder((node) => print(node.value));

  final searchResult1 = tree.search('ginger ale');
  print(searchResult1?.value); // ginger ale
  final searchResult2 = tree.search('water');
  print(searchResult2?.value); // null

  print('\n--- Challenges ---');
  challenge1();
  // Challenge 2
  buildWidgetTree();
}

TreeNode<String> makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);
  return tree;
}

// Challenge 1
//
// Print all the values in a tree in order based on their level. Nodes in the same level
// should be printed on the same line.
void challenge1() {
  final one = TreeNode(1)
    ..add(TreeNode(1))
    ..add(TreeNode(5))
    ..add(TreeNode(0));
  final seventeen = TreeNode(17)..add(TreeNode(2));
  final twenty = TreeNode(20)
    ..add(TreeNode(5))
    ..add(TreeNode(7));
  final root = TreeNode(15)
    ..add(one)
    ..add(seventeen)
    ..add(twenty);
  root
      .getChildrenAsListInLevels(root)
      .forEach((list) => print(list.map((e) => e.value).join(' ')));
}

// Challenge 2
//
// Flutter calls the nodes in its user-facing UI tree widgets. You can make a mini-
// version of the same thing.
// Create three separate nodes with the following names and types:
// • Column: a tree node that takes multiple children.
// • Padding: a tree node that takes a single child.
// • Text: a tree leaf node.
// Use your widget nodes to build a simple widget tree.
class Widget {}

class Column extends Widget {
  Column({required this.children});

  final List<Widget> children;
}

class Padding extends Widget {
  Padding({required this.child, this.padding = 0});

  final double padding;
  final Widget child;
}

class Text extends Widget {
  Text(this.text);

  final String text;
}

Widget buildWidgetTree() {
  return Column(
    children: <Widget>[
      Text('Hello'),
      Text('World!'),
      Padding(child: Text('🌍')),
    ],
  );
}
