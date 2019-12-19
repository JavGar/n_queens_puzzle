import 'package:get_it/get_it.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/data/repositories/queens_puzzle_repository_impl.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/repositories/queens_puzzle_repository.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/domain/usecases/get_board_solutions.dart';
import 'package:n_quees_puzzle/scenes/queens_puzzle/presentation/bloc/bloc.dart';

final gi = GetIt.instance;

init() {
  gi.registerFactory(() => QueensPuzzleBloc(gi()));

  gi.registerLazySingleton(() => GetBoardSolutions(gi()));

  gi.registerLazySingleton<QueensPuzzleRepository>(
      () => QueensPuzzleRepositoryImpl());
}
