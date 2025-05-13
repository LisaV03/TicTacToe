import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/themes/button_themes.dart';

class EmptyFieldButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EmptyFieldButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: emptyFieldButtonStyle,
      child: SizedBox.shrink(),
    );
  }
}
