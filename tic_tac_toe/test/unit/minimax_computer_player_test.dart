import 'package:test/test.dart';
import 'package:tic_tac_toe/data/model/game_model.dart';
import 'package:tic_tac_toe/data/services/computer_player/minimax_computer_player.dart';

void main() {
  late GameModel gameModel;
  late MinimaxComputerPlayer computerPlayer;

  setUp(() {
    gameModel = GameModel();
    computerPlayer = MinimaxComputerPlayer();
  });
  group('Test Minimax Computer Player', () {
    // X | X |      // Shoul play at index 2
    //   |   |
    //   |   | O
    test('Should block a potential victory of the opponent', () {
      gameModel.board = [1, 1, 0, 0, 0, 0, 0, 0, -1];
      int move = computerPlayer.calculateNextMove(gameModel);
      expect(move, 2);
    });

    // X | X |      // Shoul play at index 6
    // O | X | X
    //   | O | O
    test('Should choose to win instead of blocking', () {
      gameModel.board = [1, 1, 0, -1, 1, 1, 0, -1, -1];
      int move = computerPlayer.calculateNextMove(gameModel);
      expect(move, 6);
    });

    // X |   | X     // Shoul play at index 6
    // O | X | X
    //   | O | O
    test('Should choose to block and win instead of just blocking', () {
      gameModel.board = [1, 1, 0, -1, 1, 1, 0, -1, -1];
      int move = computerPlayer.calculateNextMove(gameModel);
      expect(move, 6);
    });
  });
}
