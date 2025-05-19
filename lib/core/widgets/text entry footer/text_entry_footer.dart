import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/add_attachments_button.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/emoji_picker_icon_button.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/mention_icon_button.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:intl/intl.dart';
import '../../../features/chat/ui/cubit/file_picker_cubit.dart';
import 'chat_send_button.dart';
import 'selected_files_list.dart';

class TextEntryFooter extends StatefulWidget {
  const TextEntryFooter({
    super.key,
    required this.onSend,
    required this.onTextChanged,
    this.initialText = '',
  });

  final void Function(String message, List<File> files) onSend;
  final void Function(String text) onTextChanged;
  final String initialText;

  @override
  State<TextEntryFooter> createState() => _TextEntryFooterState();
}

class _TextEntryFooterState extends State<TextEntryFooter> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilePickerCubit, FilePickerState>(
      listener: (context, state) {
        if (state is FilePickerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final files = state.files;

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectedFilesList(files: files),
              Row(
                children: [
                  const ChatAddAttachmentsButton(),
                  hGap(8),
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      maxLines: 5,
                      minLines: 1,
                      textAlign: Intl.getCurrentLocale() == 'ar'
                          ? TextAlign.right
                          : TextAlign.left,
                      onChanged: widget.onTextChanged,
                      style: AppTextStyles.font12grayMedium
                          .copyWith(color: AppColors.black),
                      cursorColor: AppColors.black,
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
                  SendButton(
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty ||
                          files.isNotEmpty) {
                        widget.onSend(_controller.text.trim(), files);
                        _controller.clear();
                        context.read<FilePickerCubit>().clearFiles();
                      }
                    },
                  ),
                ],
              ),
              if (state is FilePickerLoading)
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const LinearProgressIndicator(
                      color: AppColors.primaryColordark),
                ),
            ],
          ),
        );
      },
    );
  }
}
