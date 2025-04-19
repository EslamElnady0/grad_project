import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/dashboard/ui/widgets/doctor_subjects_filter_row.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../widgets/courses_info_list_view.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          vGap(22),
          HomeScreensHeaderRow(
            onMenuTap: () {
              Scaffold.of(context).openDrawer();
            },
            onSearchTap: () {},
          ),
          vGap(14),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TitleTextWidget(text: S.of(context).materials_center),
          ),
          vGap(12),
          const DoctorSubjectsFilterRow(),
          vGap(12),
          const Expanded(child: CoursesInfoListView())
        ],
      ),
    );
  }
}
