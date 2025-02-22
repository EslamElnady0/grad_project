import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/localizationa.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ScheduleCard extends StatelessWidget {
  final String day;
  final List<Map<String, String>> dayData;
  final int currentIndex;
  final int lengthOfList;
  const ScheduleCard(
      {super.key,
      required this.day,
      required this.dayData,
      required this.currentIndex,
      required this.lengthOfList});

  @override
  Widget build(BuildContext context) {
    int numberOfRows = dayData.length;
    double rowHeight = 50.0.h;
    final double tableHeight = numberOfRows * rowHeight;

    return Container(
      decoration: BoxDecoration(
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
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
              gradient: LinearGradient(
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
            color: Colors.white,
            width: 840.w,
            child: Table(
              border: TableBorder.symmetric(
                inside: const BorderSide(
                  color: AppColors.gray,
                  width: 1,
                ),
              ),
              children: [
                ...dayData.map((lecture) {
                  return TableRow(
                    children: [
                      _buildTableCell(lecture['subject'] ?? '', rowHeight),
                      _buildTableCell(lecture['time'] ?? '', rowHeight),
                      _buildTableCell(lecture['type'] ?? '', rowHeight),
                      _buildTableCell(lecture['teacher'] ?? '', rowHeight),
                      _buildTableCell(lecture['place'] ?? '', rowHeight),
                      _buildTableCell(lecture['status'] ?? '', rowHeight),
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, double height) {
    return SizedBox(
      height: height,
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.font11BlackSemiBold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
