import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_board_solutions.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/queens_puzzle_bloc.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/queens_puzzle_event.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/queens_puzzle_state.dart';

class MockGetBoardSolutions extends Mock implements GetBoardSolutions {}

main() {
  QueensPuzzleBloc bloc;
  MockGetBoardSolutions mockGetBoardSolutions;

  setUp(() {
    mockGetBoardSolutions = MockGetBoardSolutions();
    bloc = QueensPuzzleBloc(mockGetBoardSolutions);
  });

  test('Should be InitialQueensPuzzleState', () {
    expect(bloc.initialState, InitialQueensPuzzleState());
  });

  group('Calulate all board solutions', () {
    final int tN = 4;
    final List s1 = [1, 3, 0, 2];
    final List s2 = [2, 0, 3, 1];
    final List<List> sb4 = [s1, s2];

    void setUpMockGetBoardSolutions() =>
        when(mockGetBoardSolutions(any)).thenAnswer((_) async => sb4);

    test('Should get calculated solutions', () async {
      // arrange
      when(mockGetBoardSolutions(any)).thenAnswer((_) async => sb4);
      // act
      bloc.add(CalculateSolutions(tN));
      await untilCalled(mockGetBoardSolutions(any));
      // assert
      verify(mockGetBoardSolutions(Params(tN)));
    });

    test(
        'Should emit [LoadingQueensPuzzleState, LoadedQueensPuzzleState] when solutions are gotteng succesfully',
        () {
      // arrange
      setUpMockGetBoardSolutions();
      // act
      bloc.add(CalculateSolutions(tN));
      // assert
      expectLater(
          bloc,
          emitsInOrder([
            InitialQueensPuzzleState(),
            LoadingQueensPuzzleState(),
            LoadedQueensPuzzleState(sb4),
          ]));
    });

    test('Should emit [] when board hasn\'t solutions', () {
      // arrange
      when(mockGetBoardSolutions(any)).thenAnswer((_) async => List());
      // act
      bloc.add(CalculateSolutions(tN));
      // assert
      expectLater(
          bloc,
          emitsInOrder([
            InitialQueensPuzzleState(),
            LoadingQueensPuzzleState(),
            ErrorQueensPuzzleState(
                'Board size of ' + tN.toString() + ' hasn\'t solutions.'),
          ]));
    });
  });
}
