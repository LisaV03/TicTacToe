import 'package:flutter/material.dart';

class PlayerExplanationText extends StatelessWidget {
  final String difficulty;
  final String difficultyExplanation;
  const PlayerExplanationText(
      {super.key,
      required this.difficulty,
      required this.difficultyExplanation});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        difficulty,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: Colors.black,
            fontWeight: FontWeight.w500),
      ),
      Text(': ', style: Theme.of(context).textTheme.bodyMedium),
      Flexible(
        child: Text(
          difficultyExplanation,
          style: Theme.of(context).textTheme.bodyMedium,
          softWrap: true,
        ),
      ),
    ]);
  }
}
