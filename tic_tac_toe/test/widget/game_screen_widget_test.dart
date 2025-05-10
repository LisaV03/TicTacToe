import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/data/model/game_model.dart';
import 'package:tic_tac_toe/enum/player_type.dart';
import 'package:tic_tac_toe/ui/core/constants/app_strings.dart';
import 'package:tic_tac_toe/ui/core/ui/o_icon.dart';
import 'package:tic_tac_toe/ui/core/ui/x_icon.dart';
import 'package:tic_tac_toe/ui/game/view_model/game_viewmodel.dart';
import 'package:tic_tac_toe/ui/game/widget/empty_field_button.dart';
import 'package:tic_tac_toe/ui/game/widget/game_over_dialog.dart';
import 'package:tic_tac_toe/ui/game/widget/game_screen.dart';
import '../mock/game_screen_widget_test.mocks.dart';

@GenerateMocks([GameViewModel])
void main() {
  group('GameScreen Tests', () {
    testWidgets('GameScreen shows victory dialog', (tester) async {
      final mockViewModel = MockGameViewModel();

      final gameModel = GameModel()
        ..gameOver = true
        ..winner = PlayerType.human
        ..winningIndex = [0, 1, 2];

      when(mockViewModel.gameModel).thenReturn(gameModel);
      when(mockViewModel.cells).thenReturn([
        XIcon(),
        XIcon(),
        XIcon(),
        OIcon(),
        OIcon(),
        EmptyFieldButton(onPressed: () {}),
        EmptyFieldButton(onPressed: () {}),
        EmptyFieldButton(onPressed: () {}),
        EmptyFieldButton(onPressed: () {})
      ]);
      when(mockViewModel.showVictoryDialog).thenReturn(true);
      when(mockViewModel.showLossDialog).thenReturn(false);

      await tester.pumpWidget(
        ChangeNotifierProvider<GameViewModel>.value(
          value: mockViewModel,
          child: const MaterialApp(home: GameScreen()),
        ),
      );

      await tester.pump();
      // The dialog isn't displayed just after a gameOver
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(GameOverDialog), findsOneWidget);
      expect(find.text(AppStrings.victoryText), findsOneWidget);
    });

    testWidgets('GameScreen shows loss dialog', (tester) async {
      final mockViewModel = MockGameViewModel();

      final gameModel = GameModel()
        ..gameOver = true
        ..winner = PlayerType.computer
        ..winningIndex = [0, 1, 2];

      when(mockViewModel.gameModel).thenReturn(gameModel);
      when(mockViewModel.cells).thenReturn([
        OIcon(),
        OIcon(),
        OIcon(),
        XIcon(),
        XIcon(),
        EmptyFieldButton(onPressed: () {}),
        XIcon(),
        EmptyFieldButton(onPressed: () {}),
        EmptyFieldButton(onPressed: () {})
      ]);
      when(mockViewModel.showVictoryDialog).thenReturn(false);
      when(mockViewModel.showLossDialog).thenReturn(true);

      await tester.pumpWidget(
        ChangeNotifierProvider<GameViewModel>.value(
          value: mockViewModel,
          child: const MaterialApp(home: GameScreen()),
        ),
      );

      await tester.pump();
      // The dialog isn't displayed just after a gameOver
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(GameOverDialog), findsOneWidget);
      expect(find.text(AppStrings.lossText), findsOneWidget);
    });

    testWidgets('GameScreen shows draw dialog', (tester) async {
      final mockViewModel = MockGameViewModel();

      final gameModel = GameModel()..gameOver = true;

      when(mockViewModel.gameModel).thenReturn(gameModel);
      when(mockViewModel.cells).thenReturn([
        OIcon(),
        XIcon(),
        OIcon(),
        XIcon(),
        OIcon(),
        XIcon(),
        XIcon(),
        OIcon(),
        XIcon()
      ]);
      when(mockViewModel.showVictoryDialog).thenReturn(false);
      when(mockViewModel.showLossDialog).thenReturn(false);

      await tester.pumpWidget(
        ChangeNotifierProvider<GameViewModel>.value(
          value: mockViewModel,
          child: const MaterialApp(home: GameScreen()),
        ),
      );

      await tester.pump();
      // The dialog isn't displayed just after a gameOver
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(GameOverDialog), findsOneWidget);
      expect(find.text(AppStrings.drawText), findsOneWidget);
    });
  });
}
