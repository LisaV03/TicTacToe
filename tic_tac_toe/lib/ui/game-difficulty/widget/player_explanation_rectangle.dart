import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/game-difficulty/widget/player_explanation_text.dart';

class PlayerExplanationRectangle extends StatelessWidget {
  const PlayerExplanationRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(75),
          borderRadius: BorderRadius.all(AppSizes.dialogRadius)),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayerExplanationText(
                difficulty: AppStrings.easy,
                difficultyExplanation: AppStrings.easyExplanation),
            PlayerExplanationText(
                difficulty: AppStrings.hard,
                difficultyExplanation: AppStrings.hardExplanation)
          ],
        ),
      ),
    );
  }
}
