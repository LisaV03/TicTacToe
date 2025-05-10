import 'dart:math';

import 'package:tic_tac_toe/data/services/computer_player/abstract_computer_player.dart';

class RandomComputerPlayer extends AbstractComputerPlayer {
  @override
  calculateNextMove(List board) {
    List<int> availableMoves = [];
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        availableMoves.add(i);
      }
    }

    final random = Random();
    return availableMoves[random.nextInt(availableMoves.length)];
  }
}
