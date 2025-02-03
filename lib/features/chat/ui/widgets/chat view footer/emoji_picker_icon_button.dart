import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';

class EmojiPickerIconButton extends StatelessWidget {
  const EmojiPickerIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(11),
      decoration: BoxDecoration(
          shape: BoxShape.circle, gradient: Constants.secondaryGrad),
      child:
          SvgIconButton(iconPath: Assets.imagesSvgsEmojiIcon, onPressed: () {}),
    );
  }
}
