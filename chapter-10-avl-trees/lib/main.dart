import 'avl_tree.dart';

void main() {
  final tree = AvlTree<int>();
  for (var i = 0; i < 15; i++) {
    tree.insert(i);
  }
  print(tree);
}
