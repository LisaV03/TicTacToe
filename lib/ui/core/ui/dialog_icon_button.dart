import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';
import 'package:tic_tac_toe/ui/themes/button_themes.dart';

class DialogIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconAsset;
  final String iconLabel;
  const DialogIconButton(
      {super.key,
      required this.onPressed,
      required this.iconAsset,
      required this.iconLabel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: dialogButtonStyle,
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(AppSizes.s12),
        child: SvgPicture.asset(
          iconAsset,
          semanticsLabel: iconLabel,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}
