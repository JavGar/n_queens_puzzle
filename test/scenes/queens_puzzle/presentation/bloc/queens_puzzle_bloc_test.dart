import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/models/board_solution_model.dart';
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
    final BoardSolutionModel tBoardSolutionModel = BoardSolutionModel(sb4, "dummy time");

    void setUpMockGetBoardSolutions() =>
        when(mockGetBoardSolutions(any)).thenAnswer((_) async => tBoardSolutionModel);

    test('Should get calculated solutions', () async {
      // arrange
      setUpMockGetBoardSolutions();
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
            LoadedQueensPuzzleState(tBoardSolutionModel),
          ]));
    });

    blocTest(
      'Should emit [InitialQueensPuzzleState, LoadingQueensPuzzleState, ErrorQueensPuzzleState] when board hasn\'t solutions (Using bloc_test)',
      build: () {
        when(mockGetBoardSolutions(any)).thenAnswer((_) async => BoardSolutionModel(List(), "dummy time"));
        return bloc;
      },
      act: (bloc) => bloc.add(CalculateSolutions(tN)),
      expect: [
        InitialQueensPuzzleState(),
        LoadingQueensPuzzleState(),
        isA<ErrorQueensPuzzleState>(),
      ],
    );
  });
}
