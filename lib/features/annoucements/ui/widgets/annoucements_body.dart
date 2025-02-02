import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';

import '../../../../generated/l10n.dart';
import '../../../annoucements/ui/widgets/courses_annoucement_filter.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import 'annoucements_list_view.dart';

class AnnoucementsBody extends StatelessWidget {
  const AnnoucementsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22.h, right: 16.w, left: 16.w),
      child: Column(
        children: [
          HomeScreensHeaderRow(),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TitleTextWidget(
              text: S.of(context).selectCources,
            ),
          ),
          vGap(12),
          CoursesAnnoucementFilter(),
          vGap(12),
          AnnoucementsListView(),
        ],
      ),
    );
  }
}
