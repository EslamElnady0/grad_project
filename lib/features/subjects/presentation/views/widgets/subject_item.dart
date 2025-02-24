import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/subjects/presentation/views/widgets/complete_icon.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/custom_text_and_icon_button.dart';
import '../../../../../generated/l10n.dart';
class CourseItem extends StatelessWidget {
  final Map<String, String> item;

  const CourseItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: SvgPicture.asset(
                      item["fileType"] == "pdf"
                          ? Assets.imagesSvgsPdfIcon
                          : Assets.imagesSvgsVideoIcon,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["fileType"] ?? "Unknown Type",
                        style: AppTextStyles.font8DarkBlueSemiBold,
                      ),
                      Text(
                        item["fileName"] ?? "No Title",
                        style: AppTextStyles.font13DarkBlueBold,
                      ),
                    ],
                  ),
                  Spacer(),
                  CompleteIcon(isComplete: item["status"] == "complete"),
                ],
              ),
            ),
          ),
          hGap(3),
          Column(
            children: [
              CustomTextAndIconButton(
                width: 65.w,
                text: S.of(context).open,
                style: AppTextStyles.font8WhiteSemiBold,
                onTap: () {},
                icon: SvgPicture.asset(Assets.imagesSvgsOpenIcon),
                primaryButton: false,
              ),
              vGap(3),
              CustomTextAndIconButton(
                width: 65.w,
                text: S.of(context).download,
                style: AppTextStyles.font8WhiteSemiBold,
                onTap: () {},
                icon: SvgPicture.asset(Assets.imagesSvgsDewenloadIcon),
                primaryButton: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
