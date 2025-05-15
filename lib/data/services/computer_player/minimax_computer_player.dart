import 'dart:math';

import 'package:tic_tac_toe/data/model/game_model.dart';
import 'package:tic_tac_toe/data/services/computer_player/abstract_computer_player.dart';
import 'package:tic_tac_toe/data/services/game_service.dart';
import 'package:tic_tac_toe/enum/heuristic_value.dart';
import 'package:tic_tac_toe/enum/player_type.dart';

class MinimaxComputerPlayer extends AbstractComputerPlayer {
  @override
  int calculateNextMove(GameModel gameModel) {
    int depth = HeuristicValue.depth.value;
    GameService gameService = GameService();
    GameModel newGameModel = gameModel.clone();
    List<int> availableMoves = getAllAvailableMoves(newGameModel.board);
    Map<int, int> availableMovesValues = {};
    // Calculate all heuristic values for all available moves
    for (int i in availableMoves) {
      newGameModel.board[i] = PlayerType.computer.value;
      availableMovesValues[i] = max(
          opponentCanWinIfPlayAtIndexValue(newGameModel, gameService, i),
          minimax(newGameModel, i, depth, false, gameService));
      newGameModel.board[i] = 0;
    }
    // Return the index of the best move
    int bestMove = getKeyOfMaxValue(availableMovesValues);
    return bestMove;
  }

  List<int> getAllAvailableMoves(List board) {
    List<int> availableMoves = [];
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        availableMoves.add(i);
      }
    }
    return availableMoves;
  }

//Return a random move among the best moves
  int getKeyOfMaxValue(Map<int, int> map) {
    int maxValue = 0;
    for (int value in map.values) {
      if (value > maxValue) {
        maxValue = value;
      }
    }
    List<int> availableMoves = [];
    for (int i in map.keys) {
      if (map[i] == maxValue) {
        availableMoves.add(i);
      }
    }
    final random = Random();
    return availableMoves[random.nextInt(availableMoves.length)];
  }

// Return the heuristic value of a move that prevent the human to win
  int opponentCanWinIfPlayAtIndexValue(
      GameModel gameModel, GameService gameService, int index) {
    GameModel newGameModel = gameModel.clone();
    newGameModel.board[index] = PlayerType.human.value;
    bool humanWin =
        gameService.checkGameOver(newGameModel).winner == PlayerType.human;
    newGameModel.board[index] = 0;
    return humanWin
        ? HeuristicValue.blockOpponentWin.value
        : HeuristicValue.normalValue.value;
  }

  int minimax(GameModel gameModel, int index, int depth, bool isMaximizing,
      GameService gameService) {
    GameModel updatedGameModel = gameService.checkGameOver(gameModel);
    if (updatedGameModel.gameOver &&
        updatedGameModel.winner == PlayerType.computer) {
      return HeuristicValue.normalValue.value + depth;
    }
    if (updatedGameModel.gameOver &&
        updatedGameModel.winner == PlayerType.human) {
      return depth - HeuristicValue.normalValue.value;
    }
    if (updatedGameModel.gameOver || depth == 0) {
      return 0;
    }
    if (isMaximizing) {
      int value = -HeuristicValue.infinity.value;
      for (int i in getAllAvailableMoves(gameModel.board)) {
        gameModel.board[i] = PlayerType.computer.value;
        value =
            max(value, minimax(gameModel, i, depth - 1, false, gameService));
        gameModel.board[i] = 0;
      }
      return value;
    } else {
      int value = HeuristicValue.infinity.value;
      for (int i in getAllAvailableMoves(gameModel.board)) {
        gameModel.board[i] = PlayerType.human.value;
        value = min(value, minimax(gameModel, i, depth - 1, true, gameService));
        gameModel.board[i] = 0;
      }
      return value;
    }
  }
}
