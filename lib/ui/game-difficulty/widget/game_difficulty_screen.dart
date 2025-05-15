import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/game-difficulty/view_model/game_difficulty_viewmodel.dart';
import 'package:tic_tac_toe/ui/game-difficulty/widget/player_explanation_rectangle.dart';
import 'package:tic_tac_toe/ui/themes/button_themes.dart';

class GameDifficultyScreen extends StatelessWidget {
  const GameDifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => GameDifficultyViewmodel(),
      child: GameDifficultyScreenContent(),
    );
  }
}

class GameDifficultyScreenContent extends StatelessWidget {
  const GameDifficultyScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameDifficultyViewmodel>(context);

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
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.s32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(AppStrings.difficultyChoice,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge)),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.s80),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.onEasyButtonPressed(context);
                      },
                      style: mainButtonStyle,
                      child: Text(AppStrings.easy),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.s80),
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.onHardButtonPressed(context);
                      },
                      style: secondaryButtonStyle,
                      child: Text(AppStrings.hard),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(AppSizes.s16),
                  child: PlayerExplanationRectangle()),
            ],
          ),
        ),
      ),
    );
  }
}
