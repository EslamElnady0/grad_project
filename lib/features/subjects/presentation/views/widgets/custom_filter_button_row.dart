import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_toggle_title_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/materials_filter_cubit.dart';
class CustomFilterButtonsRow extends StatelessWidget {
  const CustomFilterButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsFilterCubit, Set<FilterType>>(
      builder: (context, selectedFilters) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: [
                _buildFilterButton(
                  context,
                  title: S.of(context).all,
                  filter: FilterType.all,
                  isPressed: selectedFilters.contains(FilterType.all),
                  onTap: () => context.read<MaterialsFilterCubit>().selectAll(),
                ),
                _buildFilterButton(
                  context,
                  title: S.of(context).lectures,
                  filter: FilterType.lectures,
                  isPressed: selectedFilters.contains(FilterType.lectures),
                  onTap: () =>
                      context.read<MaterialsFilterCubit>().toggleFilter(FilterType.lectures),
                ),
                _buildFilterButton(
                  context,
                  title: S.of(context).sections,
                  filter: FilterType.sections,
                  isPressed: selectedFilters.contains(FilterType.sections),
                  onTap: () =>
                      context.read<MaterialsFilterCubit>().toggleFilter(FilterType.sections),
                ),
                _buildFilterButton(
                  context,
                  title: S.of(context).quiz,
                  filter: FilterType.quiz,
                  isPressed: selectedFilters.contains(FilterType.quiz),
                  onTap: () =>
                      context.read<MaterialsFilterCubit>().toggleFilter(FilterType.quiz),
                ),
                _buildFilterButton(
                  context,
                  title: S.of(context).assignment,
                  filter: FilterType.assignment,
                  isPressed: selectedFilters.contains(FilterType.assignment),
                  onTap: () =>
                      context.read<MaterialsFilterCubit>().toggleFilter(FilterType.assignment),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterButton(BuildContext context,
      {required String title,
      required FilterType filter,
      required bool isPressed,
      required VoidCallback onTap}) {
    return CustomToggleTitleButton(
      title: title,
      isPressed: isPressed,
      onTap: onTap,
    );
  }
}
