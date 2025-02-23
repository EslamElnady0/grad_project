import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/weekly_schedule/ui/views/widgets/schedula_header.dart';
import 'package:grad_project/features/weekly_schedule/ui/views/widgets/weekly_schedule_filter.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/ui/widgets/title_text_widget.dart';
import '../../cubit/weekly_scheduke_cubit.dart';
import 'scheduled_card.dart';


class WeeklyScheduleViewBody extends StatelessWidget {
  const WeeklyScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> days = scheduleData.keys.where((day) => scheduleData[day]!.isNotEmpty).toList();
    return BlocProvider(
      create: (context) => WeeklyScheduleCubit(days),
      child: BlocBuilder<WeeklyScheduleCubit, Set<String>>(
        builder: (context, selectedDays) {
          final filteredDays = scheduleData.keys.where((day) => selectedDays.contains(day)).toList();
          
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      CustomAppBar(title: S.of(context).weekly_schedule),
                      vGap(8),
                      TitleTextWidget(text: S.of(context).schedule_welcome_message),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WeeklyScheduleFilter(
                    days: days,
                    selectedDays: selectedDays,
                    toggleSelection: (day) => context.read<WeeklyScheduleCubit>().toggleSelection(day, S.of(context).all_days),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ScheduleHeader(),
                        vGap(10),
                        SizedBox(
                          width: 950.w,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: filteredDays.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              String day = filteredDays[index];
                              List<Map<String, String>> dayData = scheduleData[day]!;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ScheduleCard(
                                  day: day,
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
              ),
            ],
          );
        },
      ),
    );
  }
}