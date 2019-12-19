import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_board_solutions.dart';

import 'bloc.dart';

class QueensPuzzleBloc extends Bloc<QueensPuzzleEvent, QueensPuzzleState> {
  final GetBoardSolutions getBoardSolutions;

  QueensPuzzleBloc(this.getBoardSolutions);

  @override
  QueensPuzzleState get initialState => InitialQueensPuzzleState();

  @override
  Stream<QueensPuzzleState> mapEventToState(
    QueensPuzzleEvent event,
  ) async* {
    yield LoadingQueensPuzzleState();

    if (event is CalculateSolutions) {
      final solutions = await getBoardSolutions(Params(event.sizeBoard));
      if (solutions.length > 0) {
        yield LoadedQueensPuzzleState(solutions);
      } else {
        yield ErrorQueensPuzzleState('Board size of ' +
            event.sizeBoard.toString() +
            ' hasn\'t solutions.');
      }
    } else {
      yield ErrorQueensPuzzleState('Event not supported');
    }
  }
}
