import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';

class XIcon extends StatelessWidget {
  const XIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.xIcon,
      colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
    );
  }
}
