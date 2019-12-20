import 'package:equatable/equatable.dart';

class BoardSolutionModel extends Equatable {
  final int boardSize;
  final List<List> solutions;
  final String duration;

  BoardSolutionModel(this.boardSize, this.solutions, this.duration);

  @override
  List<Object> get props => [solutions, duration];

  Map<String, dynamic> toJson() {
    return {
      'boardSize': boardSize,
      'duration': duration,
      'solutions': solutions.map((solution) => {'solution': solution}).toList(),
    };
  }
}
