import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/game_board.dart';
import 'package:tic_tac_toe/ui/game/view_model/game_viewmodel.dart';
import 'package:tic_tac_toe/ui/game/widget/game_over_dialog.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context);
    if (viewModel.gameModel.gameOver) {
      final currentContext = context;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!currentContext.mounted) return;

        String dialogText;
        if (viewModel.showVictoryDialog) {
          dialogText = AppStrings.victoryText;
        } else if (viewModel.showLossDialog) {
          dialogText = AppStrings.lossText;
        } else {
          dialogText = AppStrings.drawText;
        }

        Future.delayed(const Duration(milliseconds: 500), () {
          if (!currentContext.mounted) return;

          showDialog(
            context: currentContext,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return GameOverDialog(dialogText: dialogText);
            },
          );
        });
      });
    }
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GameBoard(
              cells: viewModel.cells,
            ),
          ],
        ),
      ),
    );
  }
}
