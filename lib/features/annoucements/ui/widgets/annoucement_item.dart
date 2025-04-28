import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/logic/delete_annoucement_cubit/delete_annoucement_cubit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/item_header.dart';
import 'annoucement_pop_up_menu.dart';

class AnnoucementItem extends StatelessWidget {
  final Announcement announcementModel;
  const AnnoucementItem({super.key, required this.announcementModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsetsDirectional.only(start: 16.w, top: 12.h, bottom: 12.h),
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
          Row(
            children: [
              Expanded(
                child: ItemHeader(
                  date: announcementModel.date,
                  from: announcementModel.from,
                  name: announcementModel.user.name,
                  specialization: announcementModel.course.name,
                ),
              ),
              BlocProvider(
                create: (context) => getIt<DeleteAnnoucementCubit>(),
                child: AnnoucementPopUpMenu(
                  announcement: announcementModel,
                ),
              ),
            ],
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
              hGap(16)
            ],
          )
        ],
      ),
    );
  }
}

class AnnouncemectSkeletonItem extends StatelessWidget {
  const AnnouncemectSkeletonItem({super.key});

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
            color: const Color(0xff112316).withOpacity(0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header part (date, name, specialization)
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.grey[300],
              ),
              hGap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 12.h,
                      color: Colors.grey[300],
                    ),
                    vGap(6),
                    Container(
                      width: 60.w,
                      height: 10.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 50.w,
                height: 10.h,
                color: Colors.grey[300],
              ),
            ],
          ),
          vGap(16),
          // Title
          Container(
            width: double.infinity,
            height: 14.h,
            color: Colors.grey[300],
          ),
          vGap(20),
          // Body
          Container(
            width: double.infinity,
            height: 50.h,
            color: Colors.grey[300],
          ),
          vGap(20),
          // Footer (name + views)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 120.w,
                height: 12.h,
                color: Colors.grey[300],
              ),
              const Spacer(),
              Container(
                width: 20.w,
                height: 10.h,
                color: Colors.grey[300],
              ),
              hGap(6),
              Icon(
                Icons.visibility,
                size: 17.r,
                color: Colors.grey[300],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
