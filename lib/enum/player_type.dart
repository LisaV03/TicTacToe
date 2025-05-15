enum PlayerType {
  human,
  computer;

  String get symbol => this == PlayerType.human ? 'X' : 'O';

  static PlayerType fromSymbol(String symbol) {
    return symbol == 'X' ? PlayerType.human : PlayerType.computer;
  }

  int get value => this == PlayerType.human ? 1 : -1;

  static PlayerType fromValue(int value) {
    return value == 1 ? PlayerType.human : PlayerType.computer;
  }
}
