import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/subjects/presentation/views/widgets/course_item.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/ui/widgets/title_text_widget.dart';
class MaterialsViewBody extends StatefulWidget {
  const MaterialsViewBody({super.key});

  @override
  State<MaterialsViewBody> createState() => _MaterialsViewBodyState();
}

class _MaterialsViewBodyState extends State<MaterialsViewBody> {
  final Set<String> expandedTiles = {};

  @override
  Widget build(BuildContext context) {
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => buildWeekTile(daysList[index], materialData[daysList[index]]!),
            childCount: daysList.length,
          ),
        ),
      ],
    );
  }

  Widget buildWeekTile(String day, List<Map<String, String>> week) {
    bool isExpanded = expandedTiles.contains(day);

    return ExpansionTile(
      showTrailingIcon: false,
      shape: Border.all(color: Colors.transparent),
      title: Text(
        day,
        style: AppTextStyles.font15BlackBold.copyWith(color: AppColors.darkblue),
      ),
      leading: AnimatedRotation(
        turns: isExpanded ? -0.25 : 0,
        duration: Duration(milliseconds: 200),
        child: Icon(
          Icons.chevron_right,
          color: AppColors.darkblue,
          size: 30,
        ),
      ),
      onExpansionChanged: (expanded) {
        setState(() {
          expanded ? expandedTiles.add(day) : expandedTiles.remove(day);
        });
      },
      children: week.map((item) => CourseItem(item: item)).toList(),
    );
  }
}