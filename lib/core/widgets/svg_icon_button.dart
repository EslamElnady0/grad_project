import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final ColorFilter? colorFilter;
  const SvgIconButton(
      {super.key,
      required this.iconPath,
      required this.onPressed,
      this.height,
      this.width,
      this.colorFilter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        iconPath,
        height: height,
        width: width,
        colorFilter: colorFilter,
      ),
    );
  }
}
