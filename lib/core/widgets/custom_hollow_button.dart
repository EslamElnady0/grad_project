import 'package:flutter/material.dart';

class CustomHollowButton extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final VoidCallback onPressed;

  const CustomHollowButton({
    super.key,
    required this.child,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
