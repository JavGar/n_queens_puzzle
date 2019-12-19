import 'package:equatable/equatable.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/models/board_solution_model.dart';

abstract class QueensPuzzleState extends Equatable {
  const QueensPuzzleState();
}

class InitialQueensPuzzleState extends QueensPuzzleState {
  @override
  List<Object> get props => [];
}

class LoadingQueensPuzzleState extends QueensPuzzleState {
  @override
  List<Object> get props => [];
}

class LoadedQueensPuzzleState extends QueensPuzzleState {
  final BoardSolutionModel boardSolutionModel;

  LoadedQueensPuzzleState(this.boardSolutionModel);

  @override
  List<Object> get props => [boardSolutionModel];
}

class ErrorQueensPuzzleState extends QueensPuzzleState {
  final String message;

  ErrorQueensPuzzleState(this.message);

  @override
  List<Object> get props => [message];
}
