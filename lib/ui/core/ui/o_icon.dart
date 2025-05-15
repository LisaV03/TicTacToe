import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/piece_icon.dart';

class OIcon extends StatelessWidget {
  const OIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return PieceIcon(
        pieceIcon: AppAssets.oIcon,
        pieceColor: Theme.of(context).colorScheme.primary,
        pieceName: AppStrings.oIcon);
  }
}
