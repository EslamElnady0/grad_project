import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/subjects/ui/widgets/complete_icon.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text_and_icon_button.dart';
import '../../../../generated/l10n.dart';
class MaterialsItem extends StatelessWidget {
  final Map<String, String> item;

  const MaterialsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white, // لون الخلفية مثل الـ Card
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
               const   SizedBox(width: 10), 
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
