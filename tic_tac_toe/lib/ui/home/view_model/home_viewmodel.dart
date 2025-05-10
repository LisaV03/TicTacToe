import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_routes.dart';
import 'package:tic_tac_toe/ui/game/widget/game_screen.dart';

class HomeViewModel {
  void onPlayButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: AppRoutes.game),
        builder: (context) => GameScreen(),
      ),
    );
  }
}
