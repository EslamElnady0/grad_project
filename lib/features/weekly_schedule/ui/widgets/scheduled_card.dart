import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/show_status_bottom_sheet.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/status_table_cell.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/localizationa.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';

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
        Skeleton.leaf(
          enabled: true,
          child: Container(
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
        ),
        Skeleton.leaf(
          enabled: true,
          child: Container(
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
                      _buildTableCell(
                          "${lecture.hall.building} (${lecture.hall.hallName})(${lecture.hall.hallCode})",
                          rowHeight),
                      _buildTableCell(S.of(context).showDirections, rowHeight,
                          isButton: true, hallResponse: lecture.hall),
                      _buildTableCell(lecture.type, rowHeight),
                      _buildTableCell(lecture.attendance, rowHeight),
                      StatusTableCell(status: lecture.status, height: rowHeight, lecture: lecture, context: context),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, double height,
      {bool isButton = false, HallResponse? hallResponse}) {
    return GestureDetector(
      onTap: () {
        if (isButton) {
          print("${hallResponse!.latitude} ${hallResponse.longitude}");
        }
      },
      child: SizedBox(
        height: height,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: isButton
                ? BoxDecoration(
                    color: AppColors.primaryColordark.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryColordark),
                  )
                : null,
            child: Text(
              text,
              style: AppTextStyles.font11BlackSemiBold.copyWith(
                color:
                    isButton ? AppColors.primaryColordark : AppColors.darkblue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

}
