import 'package:n_quees_puzzle/core/usecases/usecases.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/models/board_solution_model.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/repositories/queens_puzzle_repository.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_board_solutions.dart';

class GetStoredBoardSolutions extends UseCase<BoardSolutionModel, Params> {
  final QueensPuzzleRepository repository;

  GetStoredBoardSolutions(this.repository);

  @override
  Future<BoardSolutionModel> call(Params params) async {
    return await repository.getStoredBoardSolutions(params.number);
  }
}
