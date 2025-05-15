import 'package:tic_tac_toe/data/model/game_model.dart';

abstract class AbstractComputerPlayer {
  int calculateNextMove(GameModel gameModel);
}
