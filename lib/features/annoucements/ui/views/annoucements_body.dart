import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:provider/provider.dart';
import '../../../../generated/l10n.dart';
import '../widgets/admin_add_annoucement_row.dart';
import '../widgets/courses_annoucement_filter.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../widgets/annoucements_list_view.dart';

class AnnoucementsBody extends StatefulWidget {
  const AnnoucementsBody({super.key});

  @override
  State<AnnoucementsBody> createState() => _AnnoucementsBodyState();
}

class _AnnoucementsBodyState extends State<AnnoucementsBody> {
  Future<void> initApiCalls() async {
    await Future.wait([
      context.read<GetAnnouncementCubit>().getAnnouncement(),
      FlavorsFunctions.isAdmin()
          ? context.read<GetCourcesToFilterCubit>().getTeacherCourses()
          : context.read<GetCourcesToFilterCubit>().getStudentsCourses(),
    ]);
  }

  @override
  void initState() {
    initApiCalls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22.h),
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
              text: FlavorsFunctions.isStudent()
                  ? S.of(context).selectCources
                  : S.of(context).create_and_manage_news,
            ),
          ),
          vGap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const CoursesAnnoucementFilter(),
          ),
          vGap(12),
          if (FlavorsFunctions.isAdmin()) const AdminAddAnnoucementRow(),
          // 👇 This is the only scrollable part
          const Expanded(
            child: AnnoucementsListView(),
          ),
          vGap(80)
        ],
      ),
    );
  }
}
