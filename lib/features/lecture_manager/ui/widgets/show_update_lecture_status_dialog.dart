import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_transparent_button.dart';
import '../../../../generated/l10n.dart';

void showUpdateLectureStatusDialog(BuildContext context) {
  // Track selected status and initialize it to 'on_time'
  String? selectedStatus = 'on_time'; // Default to 'on_time'

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            title: Text(
              S.of(context).update_lecture_status_title,
              style: AppTextStyles.font16DarkerBlueBold,
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).update_lecture_status_description,
                  style: AppTextStyles.font12DarkBlueMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // On Time option with checkbox
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedStatus = 'on_time';
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: selectedStatus == 'on_time',
                        onChanged: (bool? value) {
                          setState(() {
                            selectedStatus = value! ? 'on_time' : null;
                          });
                        },
                        activeColor: AppColors.primaryColorlight,
                        checkColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Text(
                        S.of(context).on_time,
                        style: AppTextStyles.font12DarkBlueSemiBold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Postponed option with checkbox
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedStatus = 'postponed';
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: selectedStatus == 'postponed',
                        onChanged: (bool? value) {
                          setState(() {
                            selectedStatus = value! ? 'postponed' : null;
                          });
                        },
                        activeColor: AppColors.primaryColorlight,
                        checkColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Text(
                        S.of(context).postponed,
                        style: AppTextStyles.font12DarkBlueSemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextButton(
                      text: S.of(context).confirm,
                      fontSize: 16,
                      onTap: () {
                        if (selectedStatus != null) {
                          // Handle confirmation with selectedStatus
                          Navigator.of(context).pop(selectedStatus);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTransparentButton(
                      onPressed: () => Navigator.of(context).pop(),
                      title: S.of(context).cancel,
                    ),
                  ),
                ],
              ),
            ],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          );
        },
      );
    },
  ).then((selectedStatus) {
    if (selectedStatus != null) {
      // Handle the selected status
      print('Selected status: $selectedStatus');
    }
  });
}
