import 'package:equatable/equatable.dart';

class BoardSolutionModel extends Equatable {
  final int boardSize;
  final List<List> solutions;
  final String calculationTime;
  String getTime;

  BoardSolutionModel(this.boardSize, this.solutions, this.calculationTime);

  @override
  List<Object> get props => [boardSize, solutions, calculationTime, getTime];

  Map<String, dynamic> toJson() {
    return {
      'boardSize': boardSize,
      'calculationTime': calculationTime,
      'solutions': solutions.map((solution) => {'solution': solution}).toList(),
    };
  }

  static BoardSolutionModel fromJson(Map<String, dynamic> data) {
    List<List> solutions = List();
    for (dynamic d in data['solutions']) {
      solutions.add(d['solution']);
    }
    BoardSolutionModel boardSolutionModel = new BoardSolutionModel(
      data['boardSize'],
      solutions,
      data['calculationTime'],
    );
    return boardSolutionModel;
  }
}
