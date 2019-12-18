import 'package:equatable/equatable.dart';

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
  final List<List> solutions;

  LoadedQueensPuzzleState(this.solutions);

  @override
  List<Object> get props => [];
}

class ErrorQueensPuzzleState extends QueensPuzzleState {
  final String message;

  ErrorQueensPuzzleState(this.message);

  @override
  List<Object> get props => [message];
}
