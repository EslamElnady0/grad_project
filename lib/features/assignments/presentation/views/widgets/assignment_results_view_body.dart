import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_analysis_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_row.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_search_bar.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/evaluation_row.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/header_row.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentResultsViewBody extends StatelessWidget {
  const AssignmentResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).results),
            TitleTextWidget(
              text: S.of(context).assignment_correction_welcome_message,
            ),
            vGap(20),
            const EvaluationRow(),
            vGap(10),
            const AssignmentAnalysisWidget(),
            vGap(10),
            const CustomSearchBar(),
            vGap(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 525.w,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const HeaderRow();
                      } else {
                        return const AssignmentRow();
                      }
                    },
                    separatorBuilder: (context, index) {
                      return vGap(10);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
