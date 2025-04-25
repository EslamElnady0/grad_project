import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/item_header.dart';

class AnnoucementItem extends StatelessWidget {
  final Announcement announcementModel;
  const AnnoucementItem({super.key, required this.announcementModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5.r,
              spreadRadius: 3,
              color: const Color(0xff112316).withOpacity(0.15)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemHeader(
            date: announcementModel.date,
            from: announcementModel.from,
            name: announcementModel.user.name,
            specialization: announcementModel.course.name,
          ),
          vGap(12),
          Text(
            announcementModel.title,
            style: AppTextStyles.font10greenMedium
                .copyWith(color: AppColors.black),
          ),
          vGap(20),
          Text(
            announcementModel.body,
            style: AppTextStyles.font10greenMedium
                .copyWith(color: AppColors.black),
          ),
          vGap(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "مع تمنياتي بالتوفيق للجميع،\n${announcementModel.user.name} ",
                style: AppTextStyles.font10greenMedium
                    .copyWith(color: AppColors.black),
              ),
              const Spacer(),
              Text(
                "126",
                style: AppTextStyles.font9GraySemiBold,
              ),
              hGap(3),
              Icon(
                Icons.visibility,
                size: 17.r,
                color: AppColors.gray,
              ),
            ],
          )
        ],
      ),
    );
  }
}
