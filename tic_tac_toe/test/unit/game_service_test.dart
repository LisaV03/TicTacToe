import 'package:test/test.dart';
import 'package:tic_tac_toe/data/model/game_model.dart';
import 'package:tic_tac_toe/data/services/game_service.dart';
import 'package:tic_tac_toe/enum/player_type.dart';

void main() {
  late GameService gameService;
  late GameModel initialGame;

  setUp(() {
    gameService = GameService();
    initialGame = GameModel();
  });
  group('Test Game Service, makeMove', () {
    test('Initial state should be empty', () {
      expect(initialGame.board, List.filled(9, 0));
      expect(initialGame.currentPlayer, 'X');
      expect(initialGame.gameOver, false);
      expect(initialGame.winner, null);
      expect(initialGame.winningIndex, null);
    });

    test('Make a move', () {
      int index = 4;

      GameModel updatedGame = gameService.makeMove(initialGame, index);
      expect(updatedGame.board, [0, 0, 0, 0, 1, 0, 0, 0, 0]);
      expect(updatedGame.currentPlayer, 'O');
      expect(updatedGame.gameOver, false);
      expect(updatedGame.winner, null);
      expect(updatedGame.winningIndex, null);
    });

    test('checkVictory line', () {
      initialGame.board = [1, 1, 1, 0, 0, 1, 0, 0, 0];
      GameModel updatedGame = gameService.checkVictory(initialGame);

      expect(updatedGame.gameOver, true);
      expect(updatedGame.winner, PlayerType.human);
      expect(updatedGame.winningIndex, [0, 1, 2]);
    });

    test('checkVictory column', () {
      initialGame.board = [0, 0, -1, 0, 0, -1, 0, 0, -1];
      GameModel updatedGame = gameService.checkVictory(initialGame);

      expect(updatedGame.gameOver, true);
      expect(updatedGame.winner, PlayerType.computer);
      expect(updatedGame.winningIndex, [2, 5, 8]);
    });
    test('checkVictory diagonal', () {
      initialGame.board = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      GameModel updatedGame = gameService.checkVictory(initialGame);

      expect(updatedGame.gameOver, true);
      expect(updatedGame.winner, PlayerType.human);
      expect(updatedGame.winningIndex, [0, 4, 8]);
    });

    test('checkGameOver victory', () {
      initialGame.board = [1, 0, 0, 0, 1, 0, 0, 0, 1];
      GameModel updatedGame = gameService.checkGameOver(initialGame);

      expect(updatedGame.gameOver, true);
    });

    test('checkGameOver draw', () {
      initialGame.board = [-1, 1, -1, 1, -1, 1, 1, -1, 1];
      GameModel updatedGame = gameService.checkGameOver(initialGame);

      expect(updatedGame.gameOver, true);
    });
    test('handleNewTurn Normal turn', () {
      int index = 8;
      initialGame.currentPlayer = 'O';
      initialGame.board = [0, 1, 0, -1, 0, 1, 0, 0, 0];
      GameModel updatedGame = gameService.handleNewTurn(initialGame, index);

      expect(updatedGame.board, [0, 1, 0, -1, 0, 1, 0, 0, -1]);
      expect(updatedGame.currentPlayer, 'X');
      expect(updatedGame.gameOver, false);
      expect(updatedGame.winner, null);
      expect(updatedGame.winningIndex, null);
    });

    test('handleNewTurn winning turn', () {
      int index = 8;
      initialGame.currentPlayer = 'X';
      initialGame.board = [-1, 0, 1, -1, 1, 1, 1, -1, 0];
      GameModel updatedGame = gameService.handleNewTurn(initialGame, index);

      expect(updatedGame.board, [-1, 0, 1, -1, 1, 1, 1, -1, 1]);
      expect(updatedGame.currentPlayer, 'O');
      expect(updatedGame.gameOver, true);
      expect(updatedGame.winner, PlayerType.human);
      expect(updatedGame.winningIndex, [2, 4, 6]);
    });
  });
}
