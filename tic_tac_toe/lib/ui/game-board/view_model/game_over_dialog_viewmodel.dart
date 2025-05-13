import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_routes.dart';

class GameOverDialogViewModel {
  void onHomeButtonPressed(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void onNewGameButtonPressed(BuildContext context) {
    Navigator.of(context)
        .popUntil((route) => route.settings.name == AppRoutes.game);
  }
}
