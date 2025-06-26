import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:path/path.dart' as path;

class SelectedFilePreview extends StatelessWidget {
  final File file;
  final VoidCallback onRemove;

  const SelectedFilePreview(
      {required this.file, required this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpg', '.jpeg', '.png']
        .contains(path.extension(file.path).toLowerCase());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 80.w,
      child: Stack(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.gray),
            ),
            child: isImage
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(file, fit: BoxFit.cover),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.insert_drive_file,
                          size: 30.sp, color: AppColors.primaryColordark),
                      Text(
                        path.basename(file.path),
                        style: AppTextStyles.font10grayRegular,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: Icon(Icons.close, size: 16.sp, color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
