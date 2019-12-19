import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/widgets/board_size_input_field.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/widgets/card_solution.dart';

class QueensPuzzlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Queens Puzzle Solutions"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.topCenter,
        child: BlocListener<QueensPuzzleBloc, QueensPuzzleState>(
          listener: (context, state) {
            if (state is ErrorQueensPuzzleState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
          },
          child: BlocBuilder<QueensPuzzleBloc, QueensPuzzleState>(
            builder: (context, state) {
              if (state is InitialQueensPuzzleState) {
                return buildInitialInput();
              } else if (state is LoadingQueensPuzzleState) {
                print("is loading");
                return buildLoading();
              } else if (state is LoadedQueensPuzzleState) {
                return buildSolutionList(context, state.solutions);
              } else if (state is ErrorQueensPuzzleState) {
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: BoardSizeInputField(),
    );
  }

  Widget buildLoading() {
    print("building loadin");
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildSolutionList(BuildContext context, List<List> solutions) {
    return Column(
      children: <Widget>[
        BoardSizeInputField(),
        SizedBox(height: 16.0),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, position) {
              final solution = solutions[position];
              final index = (position + 1).toString();
              return CardSolution(index, solution);
            },
            itemCount: solutions.length,
          ),
        )
      ],
    );
  }

  Column buildBoard(BuildContext context, List firstSolution) {
    List<Widget> boardRows = List<Widget>();
    for (var row = 0; row < firstSolution.length; row++) {
      List<Widget> columns = List<Widget>();
      for (var col = 0; col < firstSolution.length; col++) {
        var color = Colors.white;

        if (((row % 2) + (col % 2)) % 2 == 0) {
          color = Color.fromRGBO(160, 82, 45, 1);
        } else {
          color = Color.fromRGBO(160, 82, 45, 0.1);
        }

        if (firstSolution[row] == col) {
          color = Colors.black;
        }

        columns.add(Expanded(
          child: Container(
            color: color,
            height: MediaQuery.of(context).size.width / firstSolution.length,
            child: Text(''),
          ),
        ));
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
