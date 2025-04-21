import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grad_project/features/subjects/presentation/views/widgets/materials_item.dart';
import '../../../../../core/widgets/custom_expansion_tile.dart';
import '../../manager/materials_filter_cubit.dart';

class CustomWeekTile extends StatelessWidget {
  final String day;
  final List<Map<String, String>> week;

  const CustomWeekTile({super.key, required this.day, required this.week});

  @override
  Widget build(BuildContext context) {
    final materialsFilterCubit = context.read<MaterialsFilterCubit>();
    final isExpanded = materialsFilterCubit.isTileExpanded(day);

    return CustomExpansionTile(
      day: day,
      isExpanded: isExpanded,
      onExpansionChanged: (expanded) {
        materialsFilterCubit.toggleExpandedTile(day);
      },
      children: week.map((item) => MaterialsItem(item: item)).toList(),
    );
  }
}
