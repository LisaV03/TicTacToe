import 'package:flutter/material.dart';
import 'package:tic_tac_toe/data/model/game_model.dart';
import 'package:tic_tac_toe/data/services/computer_player/abstract_computer_player.dart';
import 'package:tic_tac_toe/data/services/game_service.dart';
import 'package:tic_tac_toe/enum/player_type.dart';
import 'package:tic_tac_toe/ui/core/ui/o_icon.dart';
import 'package:tic_tac_toe/ui/core/ui/x_icon.dart';
import 'package:tic_tac_toe/ui/game-board/widget/empty_field_button.dart';
import 'package:tic_tac_toe/ui/game-board/widget/victory_icon.dart';

class GameViewModel extends ChangeNotifier {
  final AbstractComputerPlayer computerPlayer;
  GameModel gameModel = GameModel();
  final GameService gameService = GameService();

  late List<Widget> _cells;
  List<Widget> get cells => _cells;
  bool _showVictoryDialog = false;
  bool get showVictoryDialog => _showVictoryDialog;
  bool _showLossDialog = false;
  bool get showLossDialog => _showLossDialog;


  GameViewModel(this.computerPlayer) {
    _cells = List<Widget>.generate(
      9,
      (int index) => EmptyFieldButton(
        onPressed: () => onPlayerMove(index),
      ),
    );
  }

  void onPlayerMove(int index) async {
    if (gameModel.currentPlayer != PlayerType.human.symbol) return;
    playHumanMove(index);

    if (gameModel.gameOver) return;
    await Future.delayed(const Duration(milliseconds: 500));
    playComputerMove();
  }

  void playComputerMove() {
    int computerMove = computerPlayer.calculateNextMove(gameModel);
    gameModel = gameService.handleNewTurn(gameModel, computerMove);
    updateBoard(computerMove);
  }

  void playHumanMove(int index) {
    gameModel = gameService.handleNewTurn(gameModel, index);
    updateBoard(index);
  }

  void updateBoard(int index) async {
    updateCellFromIndex(index);
    if (gameModel.gameOver) {
      updateGameOver();
    }
  }

  void updateCellFromIndex(int index) async {
    String symbol = PlayerType.fromValue(gameModel.board[index]).symbol;
    cells[index] = symbol == 'X' ? XIcon() : OIcon();
    notifyListeners();
  }

  void updateGameOver() async {
    // No draw game
    if (gameModel.gameOver &&
        gameModel.winner != null &&
        gameModel.winningIndex != null) {
      final icon = gameModel.board[gameModel.winningIndex!.first] == 1
          ? XIcon()
          : OIcon();

      for (int i = 0; i < gameModel.winningIndex!.length; ++i) {
        cells[gameModel.winningIndex![i]] = VictoryIcon(child: icon);
      }

      if (gameModel.winner == PlayerType.human) {
        _showVictoryDialog = true;
      }
      if (gameModel.winner == PlayerType.computer) {
        _showLossDialog = true;
      }
    }
    notifyListeners();
  }

  void resetGame() {
    _showVictoryDialog = false;
    _showLossDialog = false;
    gameModel = gameService.resetGame();
    _cells = List<Widget>.generate(
      9,
      (int index) => EmptyFieldButton(
        onPressed: () => onPlayerMove(index),
      ),
    );
    notifyListeners();
  }
}
