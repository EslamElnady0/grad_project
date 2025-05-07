import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';

import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/dispaly_list.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/weekly_schedule_table_section.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../cubit/weekly_scheduke_cubit.dart';

class WeeklyScheduleViewBody extends StatelessWidget {
  const WeeklyScheduleViewBody({super.key, required this.tableResponseList});
  final List<TableResponse>? tableResponseList;

  @override
  Widget build(BuildContext context) {
    final initialTable = (tableResponseList?.isNotEmpty ?? false)
        ? tableResponseList!.first
        : TableResponse(
            department: 'No Data',
            departmentId: -1,
            semester: -1,
            sessions: {});
    final initialDays = initialTable.sessions.values
        .expand((e) => e)
        .map((e) => e.day.trim().toLowerCase())
        .toSet()
        .toList();

    return BlocProvider(
      create: (context) => WeeklyScheduleCubit(initialDays, initialTable),
      child: BlocBuilder<WeeklyScheduleCubit, WeeklyScheduleState>(
        builder: (context, state) {
          final cubit = context.read<WeeklyScheduleCubit>();
          final departmentTableMap = {
            for (var e in tableResponseList ?? [])
              "${e.department} (${e.semester})": e
          };

          final combinedList = departmentTableMap.keys.toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      CustomAppBar(title: S.of(context).weekly_schedule),
                      vGap(8),
                      TitleTextWidget(
                          text: S.of(context).schedule_welcome_message),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FlavorsFunctions.isAdmin()
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: isArabicLocale(context) ? 50 : 8,
                          right: isArabicLocale(context) ? 8 : 50,
                          top: 8,
                          bottom: 8,
                        ),
                        child: DisplayList(
                          listValue: combinedList,
                          onSelected: (index) {
                            final selectedKey = combinedList[index];
                            final newTable = departmentTableMap[selectedKey]!;

                            cubit.updateTable(newTable);
                          },
                        ),
                      )
                    : Container(),
              ),
              SliverToBoxAdapter(
                child: WeeklyScheduleTableSection(
                  selectedTable: state.selectedTable,
                  selectedDays: state.selectedDays,
                  onToggleSelection: (day) => cubit.toggleSelection(
                    day,
                    S.of(context).all_days,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
