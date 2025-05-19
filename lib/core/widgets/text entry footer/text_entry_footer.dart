import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/add_attachments_button.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/emoji_picker_icon_button.dart';
import 'package:grad_project/core/widgets/text%20entry%20footer/mention_icon_button.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import '../../../features/chat/ui/cubit/file_picker_cubit.dart';

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

  Widget _buildSelectedFiles(List<File> files) {
    if (files.isEmpty) return const SizedBox.shrink();

    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 10.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          final isImage = ['.jpg', '.jpeg', '.png']
              .contains(path.extension(file.path).toLowerCase());

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: 80.w,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.gray, width: 1),
                      ),
                      child: isImage
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.file(
                                file,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.insert_drive_file,
                                    size: 30.sp,
                                    color: AppColors.primaryColordark),
                                Text(
                                  path.basename(file.path),
                                  style: AppTextStyles.font10grayRegular,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () =>
                        context.read<FilePickerCubit>().removeFile(index),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close,
                          size: 16.sp, color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilePickerCubit, FilePickerState>(
      buildWhen: (previous, current) => current != previous,
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        if (state is FilePickerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
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
              _buildSelectedFiles(state.files),
              Row(
                children: [
                  const ChatAddAttachmentsButton(),
                  hGap(8),
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      style: AppTextStyles.font12grayMedium
                          .copyWith(color: AppColors.black),
                      cursorColor: AppColors.black,
                      maxLines: 5,
                      minLines: 1,
                      textAlign: Intl.getCurrentLocale() == 'ar'
                          ? TextAlign.right
                          : TextAlign.left,
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
                      if (_controller.text.trim().isNotEmpty ||
                          state.files.isNotEmpty) {
                        widget.onSend(_controller.text.trim(), state.files);
                        _controller.clear();
                        context.read<FilePickerCubit>().clearFiles();
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
