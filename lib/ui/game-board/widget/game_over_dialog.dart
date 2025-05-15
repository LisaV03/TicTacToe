import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/dialog_icon_button.dart';
import 'package:tic_tac_toe/ui/game-board/view_model/game_over_dialog_viewmodel.dart';
import 'package:tic_tac_toe/ui/game-board/view_model/game_viewmodel.dart';

class GameOverDialog extends StatelessWidget {
  final String dialogText;
  const GameOverDialog({super.key, required this.dialogText});

  @override
  Widget build(BuildContext context) {
    final gameOverViewModel = Provider.of<GameOverDialogViewModel>(context);
    final gameViewModel = Provider.of<GameViewModel>(context);

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(AppSizes.dialogRadius)),
        height: AppSizes.victoryDialogHeight,
        width: AppSizes.victoryDialogWidth,
        child: Padding(
          padding: EdgeInsets.all(AppSizes.s24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                dialogText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.s32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DialogIconButton(
                        key: Key(AppStrings.newGame),
                        onPressed: () {
                          gameViewModel.resetGame();
                          gameOverViewModel.onNewGameButtonPressed(context);
                        },
                        iconAsset: AppAssets.newGameIcon,
                        iconLabel: AppStrings.newGame),
                    DialogIconButton(
                        key: Key(AppStrings.home),
                        onPressed: () {
                          gameViewModel.resetGame();
                          gameOverViewModel.onHomeButtonPressed(context);
                        },
                        iconAsset: AppAssets.homeIcon,
                        iconLabel: AppStrings.home)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
