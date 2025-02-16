import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';

import '../../../../generated/l10n.dart';
import '../widgets/courses_annoucement_filter.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../widgets/annoucements_list_view.dart';

class AnnoucementsBody extends StatelessWidget {
  const AnnoucementsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 22.h,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: HomeScreensHeaderRow(
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
              onSearchTap: () {},
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: TitleTextWidget(
              text: S.of(context).selectCources,
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const CoursesAnnoucementFilter(),
          ),
          vGap(12),
          const Expanded(child: AnnoucementsListView()),
        ],
      ),
    );
  }
}
