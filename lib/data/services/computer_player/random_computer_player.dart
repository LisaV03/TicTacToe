import 'dart:math';

import 'package:tic_tac_toe/data/model/game_model.dart';
import 'package:tic_tac_toe/data/services/computer_player/abstract_computer_player.dart';

class RandomComputerPlayer extends AbstractComputerPlayer {
  @override
  int calculateNextMove(GameModel gameModel) {
    List<int> availableMoves = [];
    for (int i = 0; i < 9; i++) {
      if (gameModel.board[i] == 0) {
        availableMoves.add(i);
      }
    }

    final random = Random();
    return availableMoves[random.nextInt(availableMoves.length)];
  }
}
