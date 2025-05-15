enum HeuristicValue {
  blockOpponentWin,
  normalValue,
  infinity,
  depth;

  int get value {
    switch (this) {
      case HeuristicValue.depth:
        return 8;
      case HeuristicValue.blockOpponentWin:
        return HeuristicValue.depth.value - 1;
      case HeuristicValue.normalValue:
        return 0;
      case HeuristicValue.infinity:
        return 1000;
    }
  }
}
