import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/ui/core/constants/app_assets.dart';

class OIcon extends StatelessWidget {
  const OIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.oIcon,
      colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary, BlendMode.srcIn),
    );
  }
}
