import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/ui/core/constants/app_routes.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/game/view_model/game_viewmodel.dart';
import 'package:tic_tac_toe/ui/game/widget/empty_field_button.dart';
import 'package:tic_tac_toe/ui/game/widget/game_over_dialog.dart';
import 'package:tic_tac_toe/ui/game/widget/game_screen.dart';
import 'package:tic_tac_toe/ui/home/widgets/home_screen.dart';

void main() {
  group('Navigation after game over', () {
    testWidgets('Go back home after click on home button in GameOverDialog',
        (tester) async {
      await tester.pumpWidget(ChangeNotifierProvider<GameViewModel>.value(
          value: GameViewModel(),
          child: MaterialApp(
            routes: {
              '/': (context) => const HomeScreen(),
              AppRoutes.game: (context) => const GameScreen(),
            },
            initialRoute: AppRoutes.game,
          )));

      showDialog(
        context: tester.element(find.byType(GameScreen)),
        builder: (context) => const GameOverDialog(dialogText: 'Mock text'),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(Key(AppStrings.home)), findsOneWidget);
      await tester.tap(find.byKey(Key(AppStrings.home)));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets(
        'Create a new game after click on new game button in GameOverDialog',
        (tester) async {
      await tester.pumpWidget(ChangeNotifierProvider<GameViewModel>.value(
          value: GameViewModel(),
          child: MaterialApp(
            routes: {
              '/': (context) => const HomeScreen(),
              AppRoutes.game: (context) => const GameScreen(),
            },
            initialRoute: AppRoutes.game,
          )));

      showDialog(
        context: tester.element(find.byType(GameScreen)),
        builder: (context) => const GameOverDialog(dialogText: 'Mock text'),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(Key(AppStrings.home)), findsOneWidget);
      await tester.tap(find.byKey(Key(AppStrings.newGame)));
      await tester.pumpAndSettle();

      expect(find.byType(GameScreen), findsOneWidget);
      expect(find.byType(EmptyFieldButton), findsAtLeast(9));
    });
  });
}
