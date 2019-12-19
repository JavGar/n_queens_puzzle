import 'package:equatable/equatable.dart';
import 'package:n_quees_puzzle/core/usecases/usecases.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/repositories/queens_puzzle_repository.dart';

class GetBoardSolutions extends UseCase<List<List>, Params> {
  final QueensPuzzleRepository repository;

  GetBoardSolutions(this.repository);

  @override
  Future<List<List>> call(Params params) async {
    return await repository.getBoardSolutions(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params(this.number);

  @override
  List<Object> get props => [number];
}
