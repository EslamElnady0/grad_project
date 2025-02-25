import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_toggle_title_button.dart';
import '../../../../../generated/l10n.dart';

class WeeklyScheduleFilter extends StatelessWidget {
  final List<String> days;
  final Set<String> selectedDays;
  final Function(String) toggleSelection;

  const WeeklyScheduleFilter({
    super.key,
    required this.days,
    required this.selectedDays,
    required this.toggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    List<String> filterDays = [...days];
    filterDays.insert(0, S.of(context).all_days); // Add "All Days" at index 0

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          filterDays.length,
          (index) => Row(
            children: [
              CustomToggleTitleButton(
                title: filterDays[index],
                isPressed: selectedDays.contains(filterDays[index]),
                onTap: () => toggleSelection(filterDays[index]),
              ),
              const SizedBox(width: 12), // Space between items
            ],
          ),
        ),
      ),
    );
  }
}
