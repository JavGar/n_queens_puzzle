import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/repositories/queens_puzzle_repository.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_board_solutions.dart';

class MockQueensPuzzleRepository extends Mock
    implements QueensPuzzleRepository {}

main() {
  GetBoardSolutions usecase;
  MockQueensPuzzleRepository mockQueensPuzzleRepository;

  setUp(() {
    mockQueensPuzzleRepository = MockQueensPuzzleRepository();
    usecase = GetBoardSolutions(mockQueensPuzzleRepository);
  });

  final int tN = 4;
  final List s1 = [1, 3, 0, 2];
  final List s2 = [2, 0, 3, 1];
  final List<List> sb4 = [s1, s2];

  test('Should get list of solutions from the repository', () async {
    // arrange
    when(mockQueensPuzzleRepository.getBoardSolutions(any))
        .thenAnswer((_) async => sb4);
    // act
    final result = await usecase(Params(tN));
    // assert
    expect(result, sb4);
    verify(mockQueensPuzzleRepository.getBoardSolutions(tN));
    verifyNoMoreInteractions(mockQueensPuzzleRepository);
  });
}
