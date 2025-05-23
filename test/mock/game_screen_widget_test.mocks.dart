// Mocks generated by Mockito 5.4.6 from annotations
// in tic_tac_toe/test/widget/game_screen_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i7;

import 'package:flutter/material.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tic_tac_toe/data/model/game_model.dart' as _i2;
import 'package:tic_tac_toe/data/services/computer_player/abstract_computer_player.dart'
    as _i4;
import 'package:tic_tac_toe/data/services/game_service.dart' as _i3;
import 'package:tic_tac_toe/ui/game-board/view_model/game_viewmodel.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGameModel_0 extends _i1.SmartFake implements _i2.GameModel {
  _FakeGameModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGameService_1 extends _i1.SmartFake implements _i3.GameService {
  _FakeGameService_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAbstractComputerPlayer_2 extends _i1.SmartFake
    implements _i4.AbstractComputerPlayer {
  _FakeAbstractComputerPlayer_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GameViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameViewModel extends _i1.Mock implements _i5.GameViewModel {
  MockGameViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GameModel get gameModel => (super.noSuchMethod(
        Invocation.getter(#gameModel),
        returnValue: _FakeGameModel_0(
          this,
          Invocation.getter(#gameModel),
        ),
      ) as _i2.GameModel);

  @override
  _i3.GameService get gameService => (super.noSuchMethod(
        Invocation.getter(#gameService),
        returnValue: _FakeGameService_1(
          this,
          Invocation.getter(#gameService),
        ),
      ) as _i3.GameService);

  @override
  _i4.AbstractComputerPlayer get computerPlayer => (super.noSuchMethod(
        Invocation.getter(#computerPlayer),
        returnValue: _FakeAbstractComputerPlayer_2(
          this,
          Invocation.getter(#computerPlayer),
        ),
      ) as _i4.AbstractComputerPlayer);

  @override
  List<_i6.Widget> get cells => (super.noSuchMethod(
        Invocation.getter(#cells),
        returnValue: <_i6.Widget>[],
      ) as List<_i6.Widget>);

  @override
  bool get showVictoryDialog => (super.noSuchMethod(
        Invocation.getter(#showVictoryDialog),
        returnValue: false,
      ) as bool);

  @override
  bool get showLossDialog => (super.noSuchMethod(
        Invocation.getter(#showLossDialog),
        returnValue: false,
      ) as bool);

  @override
  set gameModel(_i2.GameModel? _gameModel) => super.noSuchMethod(
        Invocation.setter(
          #gameModel,
          _gameModel,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void onPlayerMove(int? index) => super.noSuchMethod(
        Invocation.method(
          #onPlayerMove,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void playComputerMove() => super.noSuchMethod(
        Invocation.method(
          #playComputerMove,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void playHumanMove(int? index) => super.noSuchMethod(
        Invocation.method(
          #playHumanMove,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateBoard(int? index) => super.noSuchMethod(
        Invocation.method(
          #updateBoard,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateCellFromIndex(int? index) => super.noSuchMethod(
        Invocation.method(
          #updateCellFromIndex,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateGameOver() => super.noSuchMethod(
        Invocation.method(
          #updateGameOver,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void resetGame() => super.noSuchMethod(
        Invocation.method(
          #resetGame,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
