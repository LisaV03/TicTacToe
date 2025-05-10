import 'package:tic_tac_toe/enum/player_type.dart';

class GameModel {
  List<int> board = List.filled(9, 0);
  String currentPlayer = 'X';
  bool gameOver = false;
  PlayerType? winner;
  List<int>? winningIndex;

  GameModel();

  GameModel clone() {
    final clone = GameModel();
    clone.board = List.generate(9, (i) => board[i]);
    clone.currentPlayer = currentPlayer;
    clone.winner = winner;
    clone.gameOver = gameOver;
    clone.winningIndex = winningIndex != null ? List.from(winningIndex!) : null;
    return clone;
  }
}
