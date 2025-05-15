import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_colors.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';

class GameBoard extends StatelessWidget {
  final List<Widget> cells;
  const GameBoard({super.key, required this.cells});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.gridSize,
        width: AppSizes.gridSize,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            int row = index ~/ 3;
            int col = index % 3;

            return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: row > 0
                      ? BorderSide(color: AppColors.borderColor, width: 1)
                      : BorderSide.none,
                  left: col > 0
                      ? BorderSide(color: AppColors.borderColor, width: 1)
                      : BorderSide.none,
                ),
              ),
              alignment: Alignment.center,
              child: cells[index],
            );
          },
        ));
  }
}
