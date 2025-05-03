import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/game_board.dart';
import 'package:tic_tac_toe/ui/core/ui/x_icon.dart';
import 'package:tic_tac_toe/ui/home/widgets/title_bubble.dart';
import 'package:tic_tac_toe/ui/themes/button_themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget xSizedIcon = SizedBox(
        height: AppSizes.pieceSize, width: AppSizes.pieceSize, child: XIcon());

    final List<Widget> cells = [
      TitleBubble(text: AppStrings.tic),
      xSizedIcon,
      SizedBox.shrink(),
      xSizedIcon,
      TitleBubble(text: AppStrings.tac),
      SizedBox.shrink(),
      SizedBox.shrink(),
      xSizedIcon,
      TitleBubble(text: AppStrings.toe),
    ];

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
              cells: cells,
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.s80),
              child: FilledButton(
                onPressed: () => {print("Button play pressed")},
                style: mainButtonStyle,
                child: Text(AppStrings.play),
              ),
            )
          ],
        ),
      ),
    );
  }
}
