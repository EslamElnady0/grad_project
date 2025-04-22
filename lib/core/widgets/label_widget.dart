import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget(
      {super.key,
      required this.label,
      this.gradient,
      this.color,
      required this.textStyle, required this.width});

  final String label;
  final LinearGradient? gradient;
  final Color? color;
  final TextStyle textStyle;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          label,
          style: textStyle,
        ),
      ),
    );
  }
}
