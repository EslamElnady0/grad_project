import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/subjects/ui/widgets/custom_filter_button_row.dart';
import 'package:grad_project/features/subjects/ui/widgets/custom_wee_title.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../manager/materials_filter_cubit.dart';
class MaterialsViewBody extends StatelessWidget {
  const MaterialsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsFilterCubit, Set<FilterType>>(
      builder: (context, selectedFilters) {
        List<String> daysList = materialData.keys
            .where((day) => materialData[day]!.isNotEmpty)
            .toList();

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    CustomAppBar(title: S.of(context).material),
                    vGap(8),
                    TitleTextWidget(text: S.of(context).material_description),
                  ],
                ),
              ),
            ),
          const  SliverToBoxAdapter(
              child:  CustomFilterButtonsRow(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final filteredWeek = _filterWeek(
                      materialData[daysList[index]]!, selectedFilters);

                  return CustomWeekTile(day: daysList[index], week: filteredWeek);
                },
                childCount: daysList.length,
              ),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, String>> _filterWeek(
      List<Map<String, String>> week, Set<FilterType> filters) {
    if (filters.contains(FilterType.all)) {
      return week;
    }

    return week.where((item) {
      final fileName = item['fileName']?.toLowerCase() ?? '';
      return ((filters.contains(FilterType.lectures) &&
              fileName.contains('lecture')) ||
          (filters.contains(FilterType.sections) &&
              fileName.contains('section')) ||
          (filters.contains(FilterType.quiz) && fileName.contains('quiz')) ||
          (filters.contains(FilterType.assignment) &&
              fileName.contains('assignment')));
    }).toList();
  }
}

