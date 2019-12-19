import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/models/board_solution_model.dart';

abstract class QueensPuzzleRepository {
  Future<BoardSolutionModel> getBoardSolutions(int N);
}
