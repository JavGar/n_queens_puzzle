import 'package:flutter_test/flutter_test.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/data/repositories/queens_puzzle_repository_impl.dart';

main() {
  QueensPuzzleRepositoryImpl repository;

  setUp(() {
    repository = QueensPuzzleRepositoryImpl();
  });
  
  group('getSolutions', (){
    final List<int> tN = [4,5,6];

    test('Should return list of "boards" as solutions for board size 4', () async {
      // act
      final result1 = await repository.getBoardSolutions(tN[0]);
      // assert
      expect(result1.length, equals(2));
    });

    test('Should return list of "boards" as solutions for board size 5', () async {
      // act
      final result2 = await repository.getBoardSolutions(tN[1]);
      // assert
      expect(result2.length, equals(10));
    });

    test('Should return list of "boards" as solutions for board size 6', () async {
      // act
      final result3 = await repository.getBoardSolutions(tN[2]);
      // assert
      expect(result3.length, equals(4));
    });
  });
}
