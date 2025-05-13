import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart' ;
import 'package:grad_project/core/theme/app_text_styles.dart' ;
import 'package:grad_project/core/widgets/add_attachments_button.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/emoji_picker_icon_button.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/mention_icon_button.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:intl/intl.dart';


class ChatViewFooter extends StatefulWidget {
  const ChatViewFooter({
    super.key,
    required this.onSend,
    required this.onTextChanged,
    this.onAttach,
    this.initialText = '',
  });

  final void Function(String message) onSend;
  final void Function(String text) onTextChanged;
  final VoidCallback? onAttach;
  final String initialText;

  @override
  State<ChatViewFooter> createState() => _ChatViewFooterState();
}

class _ChatViewFooterState extends State<ChatViewFooter> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff112316).withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 16,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onAttach,
            child: const ChatAddAttachmentsButton(),
          ),
          hGap(8),
          Expanded(
            child: TextFormField(
              controller: _controller,
              style: AppTextStyles.font12grayMedium.copyWith(color: AppColors.black),
              cursorColor: AppColors.black,
              maxLines: 5,
              minLines: 1,
              textAlign: Intl.getCurrentLocale() == 'ar' ? TextAlign.right : TextAlign.left,
              onChanged: widget.onTextChanged,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                isDense: true,
                hintText: S.of(context).startWriting,
                hintStyle: AppTextStyles.font12grayMedium,
                border: Constants.inputBorder,
                enabledBorder: Constants.inputBorder,
                focusedBorder: Constants.inputBorder,
                prefixIcon: const EmojiPickerIconButton(),
                suffixIcon: const MentionIconButton(),
              ),
            ),
          ),
          hGap(8),
          GestureDetector(
            onTap: () {
              if (_controller.text.trim().isNotEmpty) {
                widget.onSend(_controller.text.trim());
                _controller.clear();
              }
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.primaryColordark,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                Assets.imagesSvgsSendIcon,
                height: 20.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
