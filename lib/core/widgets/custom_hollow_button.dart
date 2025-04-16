import 'package:flutter/material.dart';

class CustomHollowButton extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final VoidCallback onPressed;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;

  const CustomHollowButton({
    super.key,
    required this.child,
    required this.borderColor,
    required this.onPressed,
    this.borderWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: padding,
        side: BorderSide(color: borderColor, width: borderWidth ?? 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
