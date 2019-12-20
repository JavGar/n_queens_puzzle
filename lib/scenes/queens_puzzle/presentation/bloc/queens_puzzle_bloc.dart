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
      try {
        int sizeBoard = int.parse(event.sizeBoard);

        if (sizeBoard < 1) {
          yield ErrorQueensPuzzleState('Size not supported');
        } else {
          final boardSolutionModel = await getBoardSolutions(Params(sizeBoard));
          if (boardSolutionModel.solutions.length > 0) {
            yield LoadedQueensPuzzleState(boardSolutionModel);
          } else {
            yield ErrorQueensPuzzleState('Board size of ' +
                sizeBoard.toString() +
                ' hasn\'t solutions.');
          }
        }
      } catch (e) {
        yield ErrorQueensPuzzleState(
            'Value \'' + event.sizeBoard + '\' is not numeric');
      }
    } else if (event is GetSolutions) {
      try {
        int sizeBoard = int.parse(event.sizeBoard);

        if (sizeBoard < 1) {
          yield ErrorQueensPuzzleState('Size not supported');
        } else {
          final boardSolutionModel =
              await getStoredBoardSolutions(Params(sizeBoard));
          if (boardSolutionModel != null) {
            yield LoadedQueensPuzzleState(boardSolutionModel);
          } else {
            yield ErrorQueensPuzzleState('Board size of ' +
                sizeBoard.toString() +
                ' hasn\'t been calculated.');
          }
        }
      } catch (e) {
        yield ErrorQueensPuzzleState(
            'Value \'' + event.sizeBoard + '\' is not numeric');
      }
    } else {
      yield ErrorQueensPuzzleState('Event not supported');
    }
  }
}
