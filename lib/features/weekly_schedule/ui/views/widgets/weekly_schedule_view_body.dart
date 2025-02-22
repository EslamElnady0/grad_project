import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/weekly_schedule/ui/views/widgets/schedula_header.dart';
import '../../../../../core/helpers/constants.dart';
import 'scheduled_card.dart';

class WeeklyScheduleViewBody extends StatelessWidget {
  const WeeklyScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:         SingleChildScrollView(
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
                    itemCount: scheduleData.keys.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String day = scheduleData.keys.elementAt(index);
                      List<Map<String, String>> dayData = scheduleData[day]!;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ScheduleCard(day: day, dayData: dayData,
                          currentIndex: index,
                          lengthOfList: scheduleData.keys.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        )
      ],
    );
  }
}

