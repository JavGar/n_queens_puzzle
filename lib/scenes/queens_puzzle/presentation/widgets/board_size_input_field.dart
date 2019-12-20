import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/bloc.dart';

class BoardSizeInputField extends StatefulWidget {
  @override
  _BoardSizeInputField createState() => _BoardSizeInputField();
}

class _BoardSizeInputField extends State<BoardSizeInputField> {
  String inputString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onSubmitted: (value) => submitBoardSize(),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                inputString = value;
              },
              decoration: InputDecoration(
                hintText: "Enter the board size",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          SizedBox(width: 4.0),
          RaisedButton(
            child: Text('Search'),
            color: Theme
                .of(context)
                .accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: searchSolution,
          )
        ],
      ),
    );
  }

  void submitBoardSize() {
    BlocProvider.of<QueensPuzzleBloc>(context).add(
        CalculateSolutions(int.parse(inputString)));
  }

  void searchSolution() {
    BlocProvider.of<QueensPuzzleBloc>(context).add(
        GetSolutions(int.parse(inputString)));
  }
}
