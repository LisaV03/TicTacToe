import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/game_board.dart';
import 'package:tic_tac_toe/ui/game/view_model/game_viewmodel.dart';
import 'package:tic_tac_toe/ui/game/widget/empty_field_button.dart';
import 'package:tic_tac_toe/ui/home/widgets/title_bubble.dart';

void main() {
  group('Home Screen Tests', () {
    testWidgets('Check Home Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<GameViewModel>(
                create: (_) => GameViewModel(),
              ),
            ],
            child: const MyApp(),
          ),
        ),
      );

      expect(find.byType(GameBoard), findsOneWidget);
      expect(find.byType(TitleBubble), findsExactly(3));

      expect(find.text(AppStrings.tic), findsOneWidget);
      expect(find.text(AppStrings.tac), findsOneWidget);
      expect(find.text(AppStrings.toe), findsOneWidget);

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(AppStrings.play), findsOneWidget);
    });

    testWidgets('Navigate from Home Screen to Game Screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<GameViewModel>(
                create: (_) => GameViewModel(),
              ),
            ],
            child: const MyApp(),
          ),
        ),
      );
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(AppStrings.play), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();

      expect(find.byType(GameBoard), findsOneWidget);
      expect(find.byType(EmptyFieldButton), findsExactly(9));
    });
  });
}
