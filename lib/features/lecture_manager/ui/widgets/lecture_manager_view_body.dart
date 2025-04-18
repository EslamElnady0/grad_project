import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/lecture_manager_item.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class LectureManagerViewBody extends StatelessWidget {
  const LectureManagerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            vGap(22),
            HomeScreensHeaderRow(
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
              onSearchTap: () {},
            ),
            vGap(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TitleTextWidget(
                text: S.of(context).full_control_over_courses,
              ),
            ),
            vGap(12),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const LectureManagerItem();
              },
            )
          ],
        ),
      ),
    );
  }
}

 
