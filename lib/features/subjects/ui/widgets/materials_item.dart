import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/helpers/file_utils.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text_and_icon_button.dart';
import '../../../../generated/l10n.dart';
class MaterialsItem extends StatelessWidget {
  final CourseMaterialData item;

  const MaterialsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Add this
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Add this
                children: [
                  CustomIconButton(
                    icon: Icon(
                      getFileIcon(
                        getFileType(item.file),
                      ),
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded( // Wrap Column with Expanded
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
                ],
              ),
            ),
          ),
          hGap(5),
          SizedBox( // Wrap Column with SizedBox to give it a fixed width
            width: 65.w,
            child: Column(
              children: [
                CustomTextAndIconButton(
                  width: 70.w,
                  text: S.of(context).open,
                  style: AppTextStyles.font8WhiteSemiBold,
                  onTap: () {},
                  icon: SvgPicture.asset(Assets.imagesSvgsOpenIcon),
                  primaryButton: false,
                ),
                vGap(8),
                CustomTextAndIconButton(
                  width:70.w,
                  text: S.of(context).download,
                  style: AppTextStyles.font8WhiteSemiBold,
                  onTap: () {},
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