import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SvgIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final ColorFilter? colorFilter;
  final bool? localized;
  const SvgIconButton(
      {super.key,
      required this.iconPath,
      required this.onPressed,
      this.height,
      this.width,
      this.localized,
      this.colorFilter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("pressed iconPath : $iconPath");
        onPressed();
      },
      child: Transform.rotate(
        angle: localized == true
            ? Intl.getCurrentLocale() == 'en'
                ? 3.14
                : 0
            : 0,
        child: SvgPicture.asset(
          iconPath,
          height: height,
          width: width,
          colorFilter: colorFilter,
        ),
      ),
    );
  }
}
