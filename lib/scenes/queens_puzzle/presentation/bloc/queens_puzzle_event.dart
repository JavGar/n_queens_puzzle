import 'package:equatable/equatable.dart';

abstract class QueensPuzzleEvent extends Equatable {
  const QueensPuzzleEvent();
}

class CalculateSolutions extends QueensPuzzleEvent {
  final String sizeBoard;

  CalculateSolutions(this.sizeBoard);

  @override
  List<Object> get props => [sizeBoard];
}

class GetSolutions extends QueensPuzzleEvent {
  final String sizeBoard;

  GetSolutions(this.sizeBoard);

  @override
  List<Object> get props => [sizeBoard];
}
