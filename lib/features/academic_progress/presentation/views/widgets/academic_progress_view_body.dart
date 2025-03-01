import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/custom_percent_indicator.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AcademicProgressViewBody extends StatelessWidget {
  const AcademicProgressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 22.w,
        vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).academicProgress),
            TitleTextWidget(
              text: S.of(context).academic_progress_welcome_message,
            ),
            vGap(50),
            const CustomPercentIndicator(),
          ],
        ),
      ),
    );
  }
}
