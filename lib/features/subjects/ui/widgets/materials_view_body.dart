import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/features/subjects/ui/widgets/custom_filter_button_row.dart';
import 'package:grad_project/features/subjects/ui/widgets/custom_week_title.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/materials_filter.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/logic/get_course_materials_cubit/get_course_materials_cubit.dart';
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
        return CustomScrollView(
          slivers: [
            _buildHeader(context),
            const SliverToBoxAdapter(
              child: CustomFilterButtonsRow(),
            ),
            _buildMaterialsList(context, selectedFilters),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }

  Widget _buildMaterialsList(
      BuildContext context, Set<FilterType> selectedFilters) {
    return BlocBuilder<GetCourseMaterialsCubit, GetCourseMaterialsState>(
      builder: (context, state) {
        return state is GetCourseMaterialsSuccess
            ? _buildSuccessState(context, selectedFilters)
            : _buildLoadingState();
      },
    );
  }

  Widget _buildSuccessState(
      BuildContext context, Set<FilterType> selectedFilters) {
    final cubit = context.read<GetCourseMaterialsCubit>();
    final weekNames = getLocalizedWeekNames(cubit.weekNumbers, context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildWeekItem(
          context: context,
          index: index,
          cubit: cubit,
          weekNames: weekNames,
          selectedFilters: selectedFilters,
        ),
        childCount: cubit.weekNumbers.length,
      ),
    );
  }

  Widget _buildWeekItem({
    required BuildContext context,
    required int index,
    required GetCourseMaterialsCubit cubit,
    required List<String> weekNames,
    required Set<FilterType> selectedFilters,
  }) {
    final weekNumber = cubit.weekNumbers[index];
    final weekMaterials = cubit.sortedMaterialsByWeek[weekNumber]!;
    final filteredWeek =
        MaterialsFilter.filterWeek(weekMaterials, selectedFilters);

    return CustomWeekTitle(
      day: weekNames[index],
      week: filteredWeek,
    );
  }

  Widget _buildLoadingState() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Skeletonizer(
          enabled: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomWeekTitle(
              day: "الاسبوع     الاول",
              week: [],
            ),
          ),
        ),
        childCount: 10,
      ),
    );
  }
}
