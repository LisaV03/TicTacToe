enum HeuristicValue {
  winWhileBlockingOpponentWin,
  blockOpponentWin,
  normalValue,
  infinity;

  int get value {
    switch (this) {
      case HeuristicValue.winWhileBlockingOpponentWin:
        return 100;
      case HeuristicValue.blockOpponentWin:
        return 10;
      case HeuristicValue.normalValue:
        return 0;
      case HeuristicValue.infinity:
        return 1000;
    }
  }
}
