import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/generated/l10n.dart';

void editStatusBottomSheet(SessionResponse lecture, BuildContext context) {
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
            vGap(20),
            CustomTextButton(
              fontSize: 14,
              text: S.of(context).change,
               onTap: () {  },
                primary: true,
          
            ),
            ],
        ),
      ),
    );
  }

