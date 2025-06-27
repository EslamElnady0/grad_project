import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grad_project/features/subjects/ui/widgets/materials_item.dart';
import '../../../../core/data/models/get_course_materials_response_model.dart';
import '../../../../core/widgets/custom_expansion_tile.dart';
import '../manager/materials_filter_cubit.dart';

class CustomWeekTitle extends StatelessWidget {
  final String day;
  final List<CourseMaterialData> week;
  final Function(CourseMaterialData)? onDeleteMaterial;
  final int? courseId;

  const CustomWeekTitle({
    super.key, 
    required this.day, 
    required this.week,
    this.onDeleteMaterial,
    this.courseId,
  });

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
      children: week.map((item) => MaterialsItem(
        item: item,
        courseId: courseId,
        onDelete: onDeleteMaterial != null ? () => onDeleteMaterial!(item) : null,
      )).toList(),
    );
  }
}
