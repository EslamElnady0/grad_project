import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/generated/l10n.dart';

void showStatusBottomSheet(SessionResponse lecture, BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             S.of(context).Changethestatusofthelecture,
              style: AppTextStyles.font16BlackBold,
            ),
            SizedBox(height: 20.h),
            Text(
              '${S.of(context).course}:   ${lecture.course}',
              style: AppTextStyles.font14BlackMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              '${S.of(context).time}:   ${lecture.from} - ${lecture.to}',
              style: AppTextStyles.font14BlackMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              '${S.of(context).status}    ${lecture.status}',
              style: AppTextStyles.font14BlackMedium,
            ),
            SizedBox(height: 8.h),
            Text(
              '${S.of(context).hall}:   ${lecture.hall.building} (${lecture.hall.hallName}) (${lecture.hall.hallCode})',
              style: AppTextStyles.font14BlackMedium,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Add edit functionality here
                      editSession(lecture, context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColordark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Edit',
                      style: AppTextStyles.font14WhiteSemiBold,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Add delete functionality here
                      deleteSession(lecture, context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Delete',
                      style: AppTextStyles.font14WhiteSemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void editSession(SessionResponse lecture, BuildContext context) {
    // TODO: Implement edit session functionality
    // This could navigate to an edit form or show an edit dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edit session functionality will be implemented here'),
      ),
    );
  }

  void deleteSession(SessionResponse lecture, BuildContext context) {
    // TODO: Implement delete session functionality
    // This should show a confirmation dialog and then delete the session
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Session'),
        content: Text('Are you sure you want to delete ${lecture.course} session?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement actual delete logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Delete functionality will be implemented here'),
                ),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }