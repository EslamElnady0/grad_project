import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_colors.dart';

class CustomMapActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String tooltip;
  const CustomMapActionButton(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: child,
        color: AppColors.darkblue,
        tooltip: tooltip,
      ),
    );
  }
}
