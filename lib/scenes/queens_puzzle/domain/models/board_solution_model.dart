import 'package:equatable/equatable.dart';

class BoardSolutionModel extends Equatable {
  final List<List> solutions;
  final String duration;

  BoardSolutionModel(this.solutions, this.duration);

  @override
  List<Object> get props => [solutions, duration];
}
