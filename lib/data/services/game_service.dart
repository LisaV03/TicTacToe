import 'package:tic_tac_toe/data/model/game_model.dart';
import 'package:tic_tac_toe/enum/player_type.dart';

class GameService {
  GameModel handleNewTurn(GameModel gameModel, int index) {
    GameModel updatedGame = gameModel.clone();
    if (updatedGame.gameOver) return updatedGame;
    updatedGame = makeMove(updatedGame, index);
    return checkGameOver(updatedGame);
  }

  GameModel makeMove(GameModel gameModel, int index) {
    GameModel updatedGame = gameModel.clone();
    int moveValue = PlayerType.fromSymbol(updatedGame.currentPlayer).value;
    updatedGame.board[index] = moveValue;
    updatedGame.currentPlayer = PlayerType.fromValue(-moveValue).symbol;
    return updatedGame;
  }

  GameModel checkVictory(GameModel gameModel) {
    GameModel updatedGame = gameModel.clone();
    for (int i = 0; i < 3; ++i) {
      int columnTotal = updatedGame.board[i] +
          updatedGame.board[i + 3] +
          updatedGame.board[i + 6];
      if (columnTotal.abs() == 3) {
        updatedGame.gameOver = true;
        updatedGame.winner = PlayerType.fromValue(updatedGame.board[i]);
        updatedGame.winningIndex = [i, i + 3, i + 6];
      }
      int lineTotal = updatedGame.board[3 * i] +
          updatedGame.board[3 * i + 1] +
          updatedGame.board[3 * i + 2];
      if (lineTotal.abs() == 3) {
        updatedGame.gameOver = true;
        updatedGame.winner = PlayerType.fromValue(updatedGame.board[3 * i]);
        updatedGame.winningIndex = [3 * i, 3 * i + 1, 3 * i + 2];
      }
      int topLeftBottomRightDiagonalTotal =
          updatedGame.board[0] + updatedGame.board[4] + updatedGame.board[8];
      if (topLeftBottomRightDiagonalTotal.abs() == 3) {
        updatedGame.gameOver = true;
        updatedGame.winner = PlayerType.fromValue(updatedGame.board[0]);
        updatedGame.winningIndex = [0, 4, 8];
      }
      int topRightBottomLeftDiagonalTotal =
          updatedGame.board[2] + updatedGame.board[4] + updatedGame.board[6];
      if (topRightBottomLeftDiagonalTotal.abs() == 3) {
        updatedGame.gameOver = true;
        updatedGame.winner = PlayerType.fromValue(updatedGame.board[2]);
        updatedGame.winningIndex = [2, 4, 6];
      }
    }
    return updatedGame;
  }

  GameModel checkGameOver(GameModel gameModel) {
    GameModel updatedGame = gameModel.clone();

    updatedGame = checkVictory(updatedGame);
    if (updatedGame.gameOver) return updatedGame;
    int gameFilling = 0;
    for (int i = 0; i < 9; ++i) {
      gameFilling += updatedGame.board[i].abs();
    }
    if (gameFilling == 9) {
      updatedGame.gameOver = true;
    }
    return updatedGame;
  }

  GameModel resetGame() {
    return GameModel();
  }
}
