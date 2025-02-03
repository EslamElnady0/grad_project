import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/mention_icon_button.dart';
import 'package:intl/intl.dart';
import '../../theme/app_colors.dart';
import '../../../generated/l10n.dart';
import 'emoji_picker_icon_button.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.font12grayMedium.copyWith(color: AppColors.black),
      cursorColor: AppColors.black,
      maxLines: 5,
      minLines: 1,
      textAlign:
          Intl.getCurrentLocale() == 'ar' ? TextAlign.right : TextAlign.left,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          isDense: true,
          hintText: S.of(context).startWriting,
          hintStyle: AppTextStyles.font12grayMedium,
          border: Constants.inputBorder,
          enabledBorder: Constants.inputBorder,
          focusedBorder: Constants.inputBorder,
          prefixIcon: EmojiPickerIconButton(),
          suffixIcon: MentionIconButton()),
    );
  }
}
