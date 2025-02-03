import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/app_assets.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key, required this.height,
  });
 final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        child: AspectRatio(
            aspectRatio: 2800 / 1979,
            child: Image.asset(Assets.imagesSplash)),
      ),
    );
  }
}
