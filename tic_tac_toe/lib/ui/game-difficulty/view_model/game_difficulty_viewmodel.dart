import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/data/services/computer_player/abstract_computer_player.dart';
import 'package:tic_tac_toe/data/services/computer_player/minimax_computer_player.dart';
import 'package:tic_tac_toe/data/services/computer_player/random_computer_player.dart';
import 'package:tic_tac_toe/ui/core/constants/app_routes.dart';
import 'package:tic_tac_toe/ui/game-board/view_model/game_over_dialog_viewmodel.dart';
import 'package:tic_tac_toe/ui/game-board/view_model/game_viewmodel.dart';
import 'package:tic_tac_toe/ui/game-board/widget/game_screen.dart';

class GameDifficultyViewmodel {
  void onHardButtonPressed(BuildContext context) {
    createNewGameFromPlayer(context, MinimaxComputerPlayer());
  }

  void onEasyButtonPressed(BuildContext context) {
    createNewGameFromPlayer(context, RandomComputerPlayer());
  }

  void createNewGameFromPlayer(
      BuildContext context, AbstractComputerPlayer computerPlayer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: AppRoutes.game),
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (_) => GameViewModel(computerPlayer)),
            Provider(create: (_) => GameOverDialogViewModel()),
          ],
          child: const GameScreen(),
        ),
      ),
    );
  }
}
