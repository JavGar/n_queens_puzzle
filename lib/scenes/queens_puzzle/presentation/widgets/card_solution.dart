import 'package:flutter/material.dart';

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
          solutionDetail();
        },
      ),
    );
  }

  void solutionDetail() {
    print(solution);
  }
}
