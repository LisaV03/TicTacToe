import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/game_board.dart';
import 'package:tic_tac_toe/ui/core/ui/x_icon.dart';
import 'package:tic_tac_toe/ui/home/view_model/home_viewmodel.dart';
import 'package:tic_tac_toe/ui/home/widgets/title_bubble.dart';
import 'package:tic_tac_toe/ui/themes/button_themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => HomeViewModel(),
      child: HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final List<Widget> cells = [
      TitleBubble(text: AppStrings.tic),
      XIcon(),
      SizedBox.shrink(),
      XIcon(),
      TitleBubble(text: AppStrings.tac),
      SizedBox.shrink(),
      SizedBox.shrink(),
      XIcon(),
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
              child: ElevatedButton(
                onPressed: () {
                  viewModel.onPlayButtonPressed(context);
                },
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
