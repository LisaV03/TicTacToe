import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_colors.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';
import 'package:tic_tac_toe/ui/themes/color_themes.dart';

final mainButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return AppColors.onPrimary;
      }
      if (states.contains(WidgetState.disabled)) {
        return AppColors.primary.withAlpha(128);
      }
      return colorTheme.primary;
    },
  ),
  textStyle:
      WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
    return TextStyle(fontSize: 28);
  }),
  foregroundColor:
      WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
    return Colors.white;
  }),
  elevation: WidgetStateProperty.resolveWith<double>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return 0;
      }
      if (states.contains(WidgetState.hovered)) {
        return 4;
      }
      return 2;
    },
  ),
  minimumSize: WidgetStateProperty.all<Size>(
      Size(AppSizes.playButtonMinWidth, AppSizes.playButtonMinHeight)),
);

final secondaryButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return AppColors.onSecondary;
      }
      if (states.contains(WidgetState.disabled)) {
        return AppColors.secondary.withAlpha(128);
      }
      return colorTheme.secondary;
    },
  ),
  textStyle:
      WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
    return TextStyle(fontSize: 28);
  }),
  foregroundColor:
      WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
    return Colors.white;
  }),
  elevation: WidgetStateProperty.resolveWith<double>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return 0;
      }
      if (states.contains(WidgetState.hovered)) {
        return 4;
      }
      return 2;
    },
  ),
  minimumSize: WidgetStateProperty.all<Size>(
      Size(AppSizes.playButtonMinWidth, AppSizes.playButtonMinHeight)),
);

final emptyFieldButtonStyle = ButtonStyle(
  backgroundColor:
      WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
    return Colors.transparent;
  }),
  minimumSize: WidgetStateProperty.all<Size>(
      Size(AppSizes.emptyFieldButtonMinSize, AppSizes.emptyFieldButtonMinSize)),
);

final dialogButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return AppColors.onPrimary;
      }
      if (states.contains(WidgetState.disabled)) {
        return AppColors.primary.withAlpha(128);
      }
      return colorTheme.primary;
    },
  ),
  elevation: WidgetStateProperty.resolveWith<double>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return 0;
      }
      if (states.contains(WidgetState.hovered)) {
        return 4;
      }
      return 2;
    },
  ),
  minimumSize: WidgetStateProperty.all<Size>(
      Size(AppSizes.dialogButtonMinSize, AppSizes.dialogButtonMinSize)),
);
