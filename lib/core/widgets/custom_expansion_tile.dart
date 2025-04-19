import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart' show AppColors;
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../../features/subjects/presentation/views/widgets/materials_item.dart';

class CustomExpansionTile extends StatelessWidget {
  final String day;
  final bool isExpanded;
  final List<dynamic> week;
  final Function(bool) onExpansionChanged;

  const CustomExpansionTile({
    super.key,
    required this.day,
    required this.isExpanded,
    required this.week,
    required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      showTrailingIcon: false,
      shape: Border.all(color: Colors.transparent),
      title: Text(
        day,
        style:
            AppTextStyles.font15BlackBold.copyWith(color: AppColors.darkblue),
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
      onExpansionChanged: onExpansionChanged,
      children: week.map((item) => MaterialsItem(item: item)).toList(),
    );
  }
}
