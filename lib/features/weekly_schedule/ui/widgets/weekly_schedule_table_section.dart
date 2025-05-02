import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grad_project/core/helpers/spacing.dart';

import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/schedula_header.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/weekly_schedule_filter.dart';

import 'scheduled_card.dart';

class WeeklyScheduleTableSection extends StatelessWidget {
  final TableResponse selectedTable;
  final Set<String> selectedDays;

  final void Function(String day) onToggleSelection;

  const WeeklyScheduleTableSection({
    super.key,
    required this.selectedTable,
    required this.selectedDays,
    required this.onToggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    final days = selectedTable.sessions.values
        .expand((e) => e)
        .map((e) => e.day.trim().toLowerCase())
        .toSet()
        .toList();

    final filteredDays = selectedTable.sessions.keys
        .where((day) => selectedDays.contains(day.trim().toLowerCase()))
        .toList();

    final noOfItemInTable = 7;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeeklyScheduleFilter(
          days: days,
          selectedDays: selectedDays,
          toggleSelection: onToggleSelection,
        ),
        vGap(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ScheduleHeader(),
                vGap(10),
                SizedBox(
                  width: (110 + 140 * noOfItemInTable).w,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredDays.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String day = filteredDays[index];
                      List<SessionResponse> dayData =
                          selectedTable.sessions[day] ?? [];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ScheduleCard(
                          day: day,
                          noOfItemInTable: noOfItemInTable,
                          dayData: dayData,
                          currentIndex: index,
                          lengthOfList: filteredDays.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        vGap(80),
      ],
    );
  }
}
