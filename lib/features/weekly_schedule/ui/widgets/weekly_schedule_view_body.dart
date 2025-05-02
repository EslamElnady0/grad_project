import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/dispaly_list.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/schedula_header.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/weekly_schedule_filter.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../cubit/weekly_scheduke_cubit.dart';
import 'scheduled_card.dart';
class WeeklyScheduleViewBody extends StatefulWidget {
  const WeeklyScheduleViewBody({super.key, required this.tableResponseList});
  final List<TableResponse> tableResponseList;

  @override
  State<WeeklyScheduleViewBody> createState() => _WeeklyScheduleViewBodyState();
}

class _WeeklyScheduleViewBodyState extends State<WeeklyScheduleViewBody> {
  late TableResponse selectedTable;

  @override
  void initState() {
    super.initState();
    selectedTable = widget.tableResponseList.first;
  }

  @override
  Widget build(BuildContext context) {
    List<String> departments =
        widget.tableResponseList.map((e) => e.department).toSet().toList();
    List<String> days = selectedTable.sessions.values
        .expand((e) => e)
        .map((e) => e.day.trim().toLowerCase())
        .toSet()
        .toList();


    return BlocProvider(
      create: (context) => WeeklyScheduleCubit(days),
      child: BlocBuilder<WeeklyScheduleCubit, Set<String>>(
        builder: (context, selectedDays) {
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
                child: Padding(
                  padding: EdgeInsets.only(
                    left: isArabicLocale(context) ? 50 : 8,
                    right: isArabicLocale(context) ? 8 : 50,
                    top: 8,
                    bottom: 8,
                  ),
                  child: DisplayList(
                    listValue: departments,
                    onSelected: (index) {
                      selectedTable = widget.tableResponseList.firstWhere(
                        (element) =>
                            element.department == departments[index],
                        orElse: () => widget.tableResponseList.first,
                      );

                      setState(() {
                        selectedTable = selectedTable;
                      });

                      final newDays = selectedTable.sessions.values
                          .expand((e) => e)
                          .map((e) => e.day.trim().toLowerCase())
                          .toSet()
                          .toList();

                      context
                          .read<WeeklyScheduleCubit>()
                          .updateDays(newDays);
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: WeeklyScheduleTableSection(
                  selectedTable: selectedTable,
                  selectedDays: selectedDays,
                
                  onToggleSelection: (day) => context
                      .read<WeeklyScheduleCubit>()
                      .toggleSelection(day, S.of(context).all_days),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



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
      ],
    );
  }
}
