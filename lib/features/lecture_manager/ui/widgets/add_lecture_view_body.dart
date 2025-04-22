import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/lecture_form_content.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_expansion_tile.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/week_cubit.dart';

class AddLectureViewBody extends StatelessWidget {
  const AddLectureViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: S.of(context).addStudyContent),
          vGap(8),
          TitleTextWidget(text: S.of(context).addStudyContentSubtitle),
          vGap(16),
          BlocBuilder<WeekCubit, WeekState>(
            builder: (context, state) {
              return Column(
                children: List.generate(14, (index) {
                  final weekKey = "week${index + 1}";
                  final isExpanded = state.expandedMap[weekKey] ?? false;
                  final title = isArabicLocale(context)
                      ? state.weakAr[weekKey]!
                      : state.weakEn[weekKey]!;

                  return CustomExpansionTile(
                    day: title,
                    isExpanded: isExpanded,
                    onExpansionChanged: (expanded) {
                      context.read<WeekCubit>().toggleWeek(weekKey, expanded);
                    },
                    children: const [
                      LectureFormContent(),
                    ],
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
