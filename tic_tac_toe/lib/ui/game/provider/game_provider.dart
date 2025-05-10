import 'package:provider/provider.dart';
import 'package:tic_tac_toe/ui/game/view_model/game_viewmodel.dart';

final gameProvider = ChangeNotifierProvider<GameViewModel>(
  create: (_) => GameViewModel(),
);
