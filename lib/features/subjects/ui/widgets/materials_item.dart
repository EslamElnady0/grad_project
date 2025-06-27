import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/helpers/file_utils.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/subjects/ui/functions/materials_item.dart';
import '../../../../core/flavors/flavors_functions.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text_and_icon_button.dart';
import '../../../../generated/l10n.dart';

class MaterialsItem extends StatelessWidget {
  final CourseMaterialData item;
  final VoidCallback? onDelete;
  final int? courseId;

  const MaterialsItem({
    super.key, 
    required this.item, 
    this.onDelete,
    this.courseId,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomIconButton(
                    icon: Icon(
                      getFileIcon(
                        getFileType(item.file),
                      ),
                      size: 20.sp,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? "",
                          style: AppTextStyles.font13DarkBlueBold,
                          maxLines: 2, 
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          item.createdAt ?? "",
                          style: AppTextStyles.font8DarkBlueSemiBold,
                        ),
                      ],
                    ),
                  ),
                  // Admin more options icon
                  if (FlavorsFunctions.isAdmin())
                    IconButton(
                      onPressed: () => showAdminOptionsBottomSheet(
                        context, 
                        item, 
                        courseId: courseId,
                        onDeleteConfirmed: onDelete,
                      ),
                      icon: const Icon(Icons.more_vert),
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            ),
          ),
          hGap(5),
          SizedBox(
            width: 65.w,
            child: Column(
              children: [
                CustomTextAndIconButton(
                  width: 70.w,
                  text: S.of(context).open,
                  style: AppTextStyles.font8WhiteSemiBold,
                  onTap: () => openFile(context, item),
                  icon: SvgPicture.asset(Assets.imagesSvgsOpenIcon),
                  primaryButton: false,
                ),
                vGap(8),
                CustomTextAndIconButton(
                  width: 70.w,
                  text: S.of(context).download,
                  style: AppTextStyles.font8WhiteSemiBold,
                  onTap: () => downloadFile(context, item),
                  icon: SvgPicture.asset(Assets.imagesSvgsDewenloadIcon),
                  primaryButton: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}