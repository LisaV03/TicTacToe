import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';

class TitleBubble extends StatelessWidget {
  final String text;
  const TitleBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(AppSizes.s8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: AppSizes.titleBubbleBorderWidth,
          ),
          borderRadius: BorderRadius.all(
            AppSizes.titleBubbleRadius,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
