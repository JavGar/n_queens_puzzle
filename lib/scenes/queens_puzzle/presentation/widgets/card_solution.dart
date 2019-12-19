import 'package:flutter/material.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/pages/board_page.dart';

class CardSolution extends StatelessWidget {
  final String index;
  final List solution;

  CardSolution(this.index, this.solution);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Solution #$index'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BoardPage(index, solution),
          ));
        },
      ),
    );
  }
}
