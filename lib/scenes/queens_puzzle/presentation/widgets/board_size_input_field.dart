import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/bloc.dart';

class BoardSizeInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitBoardSize(context, value),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter the board size",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  void submitBoardSize(BuildContext context, String boardSize) {
    final queensPuzzleBloc = BlocProvider.of<QueensPuzzleBloc>(context);
    queensPuzzleBloc.add(CalculateSolutions(int.parse(boardSize)));
  }
}
