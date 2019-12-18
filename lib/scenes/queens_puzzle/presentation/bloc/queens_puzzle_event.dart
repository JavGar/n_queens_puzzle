import 'package:equatable/equatable.dart';

abstract class QueensPuzzleEvent extends Equatable {
  const QueensPuzzleEvent();
}

class CalculateSolutions extends QueensPuzzleEvent {
  final int sizeBoard;

  CalculateSolutions(this.sizeBoard);

  @override
  List<Object> get props => [sizeBoard];
}
