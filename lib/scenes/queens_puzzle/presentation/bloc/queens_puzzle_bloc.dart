import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_board_solutions.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_stored_board_solutions.dart';

import 'bloc.dart';

class QueensPuzzleBloc extends Bloc<QueensPuzzleEvent, QueensPuzzleState> {
  final GetBoardSolutions getBoardSolutions;
  final GetStoredBoardSolutions getStoredBoardSolutions;

  QueensPuzzleBloc(this.getBoardSolutions, this.getStoredBoardSolutions);

  @override
  QueensPuzzleState get initialState => InitialQueensPuzzleState();

  @override
  Stream<QueensPuzzleState> mapEventToState(
    QueensPuzzleEvent event,
  ) async* {
    yield LoadingQueensPuzzleState();

    if (event is CalculateSolutions) {
      final boardSolutionModel = await getBoardSolutions(Params(event.sizeBoard));
      if (boardSolutionModel.solutions.length > 0) {
        yield LoadedQueensPuzzleState(boardSolutionModel);
      } else {
        yield ErrorQueensPuzzleState('Board size of ' +
            event.sizeBoard.toString() +
            ' hasn\'t solutions.');
      }
    } else if (event is GetSolutions) {
      final boardSolutionModel = await getStoredBoardSolutions(Params(event.sizeBoard));
      if (boardSolutionModel != null) {
        yield LoadedQueensPuzzleState(boardSolutionModel);
      } else {
        yield ErrorQueensPuzzleState('Board size of ' + event.sizeBoard.toString() + ' hasn\'t been calculated.');
      }
    } else {
      yield ErrorQueensPuzzleState('Event not supported');
    }
  }
}
