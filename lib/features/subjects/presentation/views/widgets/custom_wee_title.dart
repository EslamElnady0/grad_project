import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/subjects/presentation/views/widgets/materials_item.dart';
import '../../manager/materials_filter_cubit.dart';
class CustomWeekTile extends StatelessWidget {
  final String day;
  final List<Map<String, String>> week;

  const CustomWeekTile({super.key, required this.day, required this.week});

  @override
  Widget build(BuildContext context) {
    final materialsFilterCubit = context.read<MaterialsFilterCubit>();
    final isExpanded = materialsFilterCubit.isTileExpanded(day);

    return ExpansionTile(
      showTrailingIcon: false,
      shape: Border.all(color: Colors.transparent),
      title: Text(
        day,
        style: AppTextStyles.font15BlackBold.copyWith(color: AppColors.darkblue),
      ),
      leading: AnimatedRotation(
        turns: isExpanded ? -0.25 : 0,
        duration: const Duration(milliseconds: 200),
        child: const Icon(
          Icons.chevron_right,
          color: AppColors.darkblue,
          size: 30,
        ),
      ),
      onExpansionChanged: (expanded) {
        if (expanded) {
          materialsFilterCubit.toggleExpandedTile(day);
        } else {
          materialsFilterCubit.toggleExpandedTile(day);
        }
      },
      children: week.map((item) => MaterialsItem(item: item)).toList(),
    );
  }
}
