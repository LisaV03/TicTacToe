import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/piece_icon.dart';

class XIcon extends StatelessWidget {
  const XIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return PieceIcon(
      pieceIcon: AppAssets.xIcon,
      pieceColor: Theme.of(context).colorScheme.secondary,
      pieceName: AppStrings.xIcon,
    );
  }
}
