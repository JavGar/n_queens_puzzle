import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  final String index;
  final List solution;

  BoardPage(this.index, this.solution);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solution #$index"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildBoard(context),
        ),
      ),
    );
  }

  Column buildBoard(BuildContext context) {
    List<Widget> boardRows = List<Widget>();
    for (var row = 0; row < solution.length; row++) {
      List<Widget> columns = List<Widget>();
      for (var col = 0; col < solution.length; col++) {
        var color = Colors.white;

        if (((row % 2) + (col % 2)) % 2 == 0) {
          color = Color.fromRGBO(160, 82, 45, 1);
        } else {
          color = Color.fromRGBO(160, 82, 45, 0.1);
        }

        if (solution[row] == col) {
          columns.add(Expanded(
            child: Container(
              color: color,
              height: MediaQuery.of(context).size.width / solution.length,
              child: Image(
                image: AssetImage("images/queen.png"),
              ),
            ),
          ));
        } else {
          columns.add(Expanded(
            child: Container(
              color: color,
              height: MediaQuery.of(context).size.width / solution.length,
              child: Text(''),
            ),
          ));
        }
      }
      final rowBoard = Row(
        children: columns,
      );
      boardRows.add(rowBoard);
    }

    return Column(
      children: boardRows,
    );
  }
}
