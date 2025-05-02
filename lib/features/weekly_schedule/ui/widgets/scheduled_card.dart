import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';

import '../../../../core/helpers/localizationa.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ScheduleCard extends StatelessWidget {
  final String day;
  final List<SessionResponse> dayData;
  final int currentIndex;
  final int noOfItemInTable;
  final int lengthOfList;
  const ScheduleCard(
      {super.key,
      required this.day,
      required this.dayData,
      required this.currentIndex,
      required this.lengthOfList,
      required this.noOfItemInTable});

  @override
  Widget build(BuildContext context) {
    int numberOfRows = dayData.length;
    double rowHeight = 50.0.h;
    final double tableHeight = numberOfRows * rowHeight;

    return Row(
      children: [
        Container(
          width: 110.w,
          height: tableHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: currentIndex == 0 && isArabicLocale(context)
                  ? Radius.circular(16.r)
                  : Radius.zero,
              bottomRight:
                  currentIndex == lengthOfList - 1 && isArabicLocale(context)
                      ? Radius.circular(16.r)
                      : Radius.zero,
              topLeft: currentIndex == 0 && !isArabicLocale(context)
                  ? Radius.circular(16.r)
                  : Radius.zero,
              bottomLeft:
                  currentIndex == lengthOfList - 1 && !isArabicLocale(context)
                      ? Radius.circular(16.r)
                      : Radius.zero,
            ),
            gradient: const LinearGradient(
              colors: [
                AppColors.primaryColorlight,
                AppColors.primaryColordark
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(day, style: AppTextStyles.font14WhiteSemiBold),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: currentIndex == 0 && isArabicLocale(context)
                  ? Radius.circular(16.r)
                  : Radius.zero,
              bottomLeft:
                  currentIndex == lengthOfList - 1 && isArabicLocale(context)
                      ? Radius.circular(16.r)
                      : Radius.zero,
              topRight: currentIndex == 0 && !isArabicLocale(context)
                  ? Radius.circular(16.r)
                  : Radius.zero,
              bottomRight:
                  currentIndex == lengthOfList - 1 && !isArabicLocale(context)
                      ? Radius.circular(16.r)
                      : Radius.zero,
            ),
          ),
          width: (noOfItemInTable * 140).w,
          child: Table(
            border: const TableBorder.symmetric(
              inside: BorderSide(
                color: AppColors.gray,
                width: 1,
              ),
            ),
            children: [
              ...dayData.map((lecture) {
                return TableRow(
                  children: [
                    _buildTableCell(lecture.course, rowHeight),
                    _buildTableCell(lecture.from, rowHeight),
                    _buildTableCell(lecture.to, rowHeight),
                    _buildTableCell(lecture.hall.hallName, rowHeight),
                    _buildTableCell(lecture.type, rowHeight),
                    _buildTableCell(lecture.attendance, rowHeight),
                    _buildTableCell(lecture.status, rowHeight),
                  ],
                );
              })
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, double height) {
    return SizedBox(
      height: height,
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.font11BlackSemiBold.copyWith(
            color: AppColors.darkblue
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
