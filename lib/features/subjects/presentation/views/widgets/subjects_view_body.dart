import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/features/subjects/presentation/views/widgets/custom_subject_card.dart';
import 'package:grad_project/features/subjects/presentation/views/widgets/custom_subjects_filter.dart';
import '../../../../../core/helpers/spacing.dart';

import '../../../../../generated/l10n.dart';
import '../../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../../home/ui/widgets/title_text_widget.dart';

class SubjectsViewBody extends StatelessWidget {
  const SubjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
                  text: S.of(context).select_subjects,
                ),
              ),
              vGap(12),
            ],
          )),
          SliverToBoxAdapter(
            child: CustomSupjectsFilter(),
          ),
 SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CustomSubjectCard(),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
