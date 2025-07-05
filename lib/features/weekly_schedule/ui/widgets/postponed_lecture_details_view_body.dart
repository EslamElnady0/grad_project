import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_app_bar.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/ui/screens/postponed_lecture_details_view.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/postponed_detail_card.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/postponed_detail_row.dart';
import 'package:grad_project/generated/l10n.dart';

class PostponedLectureDetailsViewBody extends StatelessWidget {
  const PostponedLectureDetailsViewBody({
    super.key,
    required this.lecture,
    required this.postponedData,
  });

  final SessionResponse lecture;
  final Map<String, dynamic> postponedData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       CustomAppBar(title: S.of(context).postponed_lecture_details),
          vGap(20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              S.of(context).postponed_lecture_info,
              style: AppTextStyles.font14BlackMedium,
              textAlign: TextAlign.center,
            ),
          ),
          
          vGap(20),
          
          // Lecture Details Card
          PostponedDetailCard(context: context, title: S.of(context).lecture_details, children: [
              PostponedDetailRow(context: context, label: S.of(context).course, value: lecture.course),
              PostponedDetailRow(context: context, label: S.of(context).type, value: lecture.type),
              PostponedDetailRow(context: context, label: S.of(context).attendance_type, value: lecture.attendance),
            ]),
          
          vGap(16),
          
          // Original Schedule Card
          PostponedDetailCard(context: context, title: S.of(context).time, children: [
              PostponedDetailRow(context: context, label: S.of(context).original_date, value: postponedData['date'] ?? S.of(context).unknown),
              PostponedDetailRow(context: context, label: S.of(context).original_day, value: postponedData['day'] ?? S.of(context).unknown),
              PostponedDetailRow(context: context, label: S.of(context).original_time_from, value: postponedData['from'] ?? S.of(context).unknown),
              PostponedDetailRow(context: context, label: S.of(context).original_time_to, value: postponedData['to'] ?? S.of(context).unknown),
            ]),
          
          vGap(16),
          
          // Hall Details Card
          PostponedDetailCard(context: context, title: S.of(context).hall_details, children: [
              PostponedDetailRow(context: context, label: S.of(context).hall, value: "${lecture.hall.building} (${lecture.hall.hallName})"),
              PostponedDetailRow(context: context, label: S.of(context).code, value: lecture.hall.hallCode),
            ]),
          
         
          vGap(30),
        ],
      ),
    );
  }
}
