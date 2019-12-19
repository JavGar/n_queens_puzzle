import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/data/repositories/queens_puzzle_repository_impl.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_board_solutions.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/pages/queens_puzzle_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        builder: (context) =>
            QueensPuzzleBloc(GetBoardSolutions(QueensPuzzleRepositoryImpl())),
        child: QueensPuzzlePage(),
      ),
    );
  }
}
