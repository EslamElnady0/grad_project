import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/features/dashboard/ui/cubit/get_dashboard_courses_cubit.dart';
import 'package:grad_project/features/dashboard/ui/widgets/doctor_subjects_filter_row.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../widgets/courses_info_list_view.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    context.read<AllCoursesCubit>().get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDashboardCoursesCubit(),
      child: Column(
        children: [
          vGap(22),
          symmetricPaddingWidget(
            child: HomeScreensHeaderRow(
              onMenuTap: () {
                Scaffold.of(context).openDrawer();
              },
              onSearchTap: () {},
            ),
          ),
          vGap(14),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: symmetricPaddingWidget(
                child: TitleTextWidget(text: S.of(context).materials_center)),
          ),
          vGap(12),
          symmetricPaddingWidget(child: const DoctorSubjectsFilterRow()),
          vGap(12),
          const Expanded(child: CoursesInfoListView()),
          vGap(80),
        ],
      ),
    );
  }
}
