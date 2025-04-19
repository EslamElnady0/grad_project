import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/qr_numbers_show.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

import '../../../home/ui/widgets/title_text_widget.dart';

class AddLectureViewBody extends StatelessWidget {
  const AddLectureViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
          CustomAppBar(title: S.of(context).add_course_content_description),
             vGap(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TitleTextWidget(
                text: S.of(context).full_control_over_courses,
              ),
            ),
          
            
          ],
        ),
      ),
    );
  }
}