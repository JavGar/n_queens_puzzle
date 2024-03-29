import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/models/board_solution_model.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/repositories/queens_puzzle_repository.dart';

class QueensPuzzleRepositoryImpl implements QueensPuzzleRepository {
  final Firestore _repository;
  List<List> solutions;

  QueensPuzzleRepositoryImpl(this._repository);

  @override
  Future storeBoardSolutions(BoardSolutionModel boardSolutionModel) async {
    DocumentSnapshot documentSnapshot = await _repository
        .collection('boards')
        .document("sb-" + boardSolutionModel.boardSize.toString())
        .get();
    if (documentSnapshot.data == null) {
      await _repository
          .collection("boards")
          .document("sb-" + boardSolutionModel.boardSize.toString())
          .setData(boardSolutionModel.toJson());
    }
  }

  @override
  Future<BoardSolutionModel> getStoredBoardSolutions(int N) async {
    final start = new DateTime.now();
    DocumentSnapshot documentSnapshot = await _repository
        .collection('boards')
        .document("sb-" + N.toString())
        .get();
    if (documentSnapshot.data != null) {
      var boardSolution = BoardSolutionModel.fromJson(documentSnapshot.data);
      final end = new DateTime.now();
      Duration difference = end.difference(start);
      boardSolution.getTime = difference.toString();
      return boardSolution;
    }
    return null;
  }

  @override
  Future<BoardSolutionModel> getBoardSolutions(int N) async {
    solutions = new List();
    List board = new List(N);
    final start = new DateTime.now();
    findSafeColumnByRowSolution(board, 0);
    var end = new DateTime.now();
    Duration difference = end.difference(start);
    var boardSolution = BoardSolutionModel(N, solutions, difference.toString());
    await storeBoardSolutions(boardSolution);
    end = new DateTime.now();
    difference = end.difference(start);
    boardSolution.getTime = difference.toString();
    return boardSolution;
  }

  findSafeColumnByRowSolution(List queens, int rowIndex) {
    if (rowIndex == queens.length) {
      solutions.add(List.from(queens));
    } else {
      for (int i = 0; i < queens.length; i++) {
        queens[rowIndex] = i;
        if (isSafe(queens, rowIndex)) {
          findSafeColumnByRowSolution(queens, rowIndex + 1);
        }
      }
    }
  }

  isSafe(List queens, int rowIndex) {
    for (int columnIndex = 0; columnIndex < rowIndex; columnIndex++) {
      if (queens[columnIndex] == queens[rowIndex]) {
        return false; // Same column
      }

      if ((queens[columnIndex] - queens[rowIndex]) ==
          (rowIndex - columnIndex)) {
        return false; // Same major diagonal
      }

      if ((queens[rowIndex] - queens[columnIndex]) ==
          (rowIndex - columnIndex)) {
        return false; // Same minor diagonal
      }
    }

    return true;
  }
}
