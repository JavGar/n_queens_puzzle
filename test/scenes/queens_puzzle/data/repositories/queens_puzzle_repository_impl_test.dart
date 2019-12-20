import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/data/repositories/queens_puzzle_repository_impl.dart';

class MockFirestore extends Mock implements Firestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

main() {
  QueensPuzzleRepositoryImpl repository;
  MockFirestore mockFirestore;
  MockCollectionReference mockCollectionReferenceBoards;
  MockDocumentReference mockDocumentReference;
  MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockDocumentReference = MockDocumentReference();
    mockCollectionReferenceBoards = MockCollectionReference();
    mockFirestore = MockFirestore();
    repository = QueensPuzzleRepositoryImpl(mockFirestore);
  });

  group('getSolutions', () {
    final List<int> tN = [4, 5, 6, 9];

    final Map<String, dynamic> data = {
      'boardSize': 2,
      'calculationTime': "dumy time",
      'solutions': [],
    };

    void setUpFirestore() {
      when(mockFirestore.collection(any))
          .thenReturn(mockCollectionReferenceBoards);
      when(mockCollectionReferenceBoards.document(any))
          .thenReturn(mockDocumentReference);
      when(mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data).thenReturn(data);
    }

    test(
      'Should return list of "boards" as solutions for board size 4',
      () async {
        // arrange
        setUpFirestore();
        // act
        final result1 = await repository.getBoardSolutions(tN[0]);
        // assert
        expect(result1.solutions.length, equals(2));
      },
    );

    test(
      'Should return list of "boards" as solutions for board size 5',
      () async {
        // arrange
        setUpFirestore();
        // act
        final result2 = await repository.getBoardSolutions(tN[1]);
        // assert
        expect(result2.solutions.length, equals(10));
      },
    );

    test(
      'Should return list of "boards" as solutions for board size 6',
      () async {
        // arrange
        setUpFirestore();
        // act
        final result3 = await repository.getBoardSolutions(tN[2]);
        // assert
        expect(result3.solutions.length, equals(4));
      },
    );
  });
}
