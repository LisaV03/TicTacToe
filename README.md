# Tic Tac Toe

## Technical Test for Betclic

This is a Tic Tac Toe game that offers the possibility to play a game between two types of computer player : a random player (the easy one) and a player using a minimax strategy (the hardest one).

## Getting Started

### Clone the repository

```
git clone https://github.com/LisaV03/TicTacToe.git
```

### Install the dependencies

`flutter pub get`

### Run the app

`flutter run`

### Run tests

`flutter test`

## Explanations

This Tic Tac Toe game follows the architecture below, inspired from the Flutter Documentation :

```
lib/
├── data
│ ├── model
│ │ └── game_model.dart
│ └── services
│ ├── computer_player
│ │ ├── abstract_computer_player.dart
│ │ ├── minimax_computer_player.dart
│ │ └── random_computer_player.dart
│ └── game_service.dart
├── domain
├── enum
│ ├── heuristic_value.dart
│ └── player_type.dart
├── main.dart
└── ui
├── core
│ ├── constants
│ │ ├── app_assets.dart
│ │ ├── app_colors.dart
│ │ ├── app_routes.dart
│ │ ├── app_sizes.dart
│ │ └── app_strings.dart
│ └── ui
│ ├── dialog_icon_button.dart
│ ├── game_board.dart
│ ├── o_icon.dart
│ ├── piece_icon.dart
│ └── x_icon.dart
├── game-board
│ ├── view_model
│ │ ├── game_over_dialog_viewmodel.dart
│ │ └── game_viewmodel.dart
│ └── widget
│ ├── empty_field_button.dart
│ ├── game_over_dialog.dart
│ ├── game_screen.dart
│ └── victory_icon.dart
├── game-difficulty
│ ├── view_model
│ │ └── game_difficulty_viewmodel.dart
│ └── widget
│ ├── game_difficulty_screen.dart
│ ├── player_explanation_rectangle.dart
│ └── player_explanation_text.dart
├── home
│ ├── view_model
│ │ └── home_viewmodel.dart
│ └── widgets
│ ├── home_screen.dart
│ └── title_bubble.dart
└── themes
├── button_themes.dart
├── color_themes.dart
└── text_themes.dart

test/
├── mock
│ └── game_screen_widget_test.mocks.dart
├── unit
│ ├── game_service_test.dart
│ └── minimax_computer_player_test.dart
└── widget
├── game_screen_widget_test.dart
├── home_screen_widget_test.dart
└── navigation_after_game_over_widget_test.dart
```

### UI

All the screens, widgets and view models used to display informations and deal with the states are in the UI Repository. There are three main features/parts.

- The `HomeScreen` that's the first screen of this app. It's linked with a `HomeViewModel` that handles the behaviour of the app when the user click on the "Play" Button.
- The `GameDifficultyScreen` that enable the user to choose the difficulty wanted.This screen is also linked to a `GameDifficultyViewModel` that handles the behaviour of the buttons of the difficulty choice.
- The last screen is the `GameScreen` that displays a game and all moves of the user and the computer. It's also linked with a GameViewModel that contains the states of the game (the cells, if there is a game over, who won, who is the next player....). All the states and information exchanges are made thanks to the `Provider` library and `ChangeNotifier`, to update the screens/widget when needed.
  At the end of a game, a dialog is displayed and propose to the user to go back to the `HomeScreen` or to play a new game (with the same difficulty for its opponent).

### Service

The service repository contains all the logic.

First, there is the two players.

- The "easiest" player is a random player. It checks all the empty cells and chooses one randomly to makes its move.

- The "hardest" player is a minimax player. It calculates for each empty cells a value depending on how fast it can win if it plays here and how slow it can loose if it play here. The greater the value, the better it is for the computer to play the move associated with this value. That means that a minimax player will try to win and to block the user.

The game logic is in the `GameService` file. It handles how a turn works, it checks if anyone has won or if it's a draw game. It uses a GameModel containing the board of the current game, if there is a game over, who won, ....

All strings, assets, themes,... are in separated files to be able to change the style of the app quickly.

### Tests

#### Unit tests

There are two unit test files.

- One file tests the `GameService` file. It checks whether a turn is going according to plan and whether different types of wins, losses
  and draws are detected.

- The other file checks the minimax player if it works and really try to block the user and win when it has the opportunity.

#### Widget tests

The widget tests check if the `HomeScreen`, `GameDifficultyScreen` and `GameScreen` are displayed properly and also if the navigation between the screens works.
