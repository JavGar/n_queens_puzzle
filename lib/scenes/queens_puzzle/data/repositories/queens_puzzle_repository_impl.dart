import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/models/board_solution_model.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/repositories/queens_puzzle_repository.dart';

class QueensPuzzleRepositoryImpl implements QueensPuzzleRepository {
  List<List> solutions;

  @override
  Future<BoardSolutionModel> getBoardSolutions(int N) async {
    solutions = new List();
    List board = new List(N);
    final start = new DateTime.now();
    findSafeColumnByRowSolution(board, 0);
    final end = new DateTime.now();
    Duration difference = end.difference(start);
    return BoardSolutionModel(solutions, difference.toString());
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
