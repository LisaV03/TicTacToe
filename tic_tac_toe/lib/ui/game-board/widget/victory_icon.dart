import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/core/constants/app_sizes.dart';

class VictoryIcon extends StatefulWidget {
  final Widget child;
  const VictoryIcon({super.key, required this.child});

  @override
  State<VictoryIcon> createState() => _VictoryIcon();
}

class _VictoryIcon extends State<VictoryIcon> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(count: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
              scale: AppSizes.victoryAnimationScale,
              child: Transform.rotate(
                  angle: _controller.value * pi, child: child));
        });
  }
}
