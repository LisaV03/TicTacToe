import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/home/widgets/home_screen.dart';
import 'package:tic_tac_toe/ui/themes/color_themes.dart';
import 'package:tic_tac_toe/ui/themes/text_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.ticTacToe,
      theme: ThemeData(
        textTheme: textTheme,
        colorScheme: colorTheme,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
