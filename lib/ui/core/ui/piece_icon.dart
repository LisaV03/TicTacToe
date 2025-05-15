import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';

class PieceIcon extends StatelessWidget {
  final String pieceIcon;
  final Color pieceColor;
  final String pieceName;

  const PieceIcon(
      {super.key,
      required this.pieceIcon,
      required this.pieceColor,
      required this.pieceName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.pieceSize,
      width: AppSizes.pieceSize,
      child: SvgPicture.asset(
        pieceIcon,
        semanticsLabel: pieceName,
        colorFilter: ColorFilter.mode(pieceColor, BlendMode.srcIn),
      ),
    );
  }
}
