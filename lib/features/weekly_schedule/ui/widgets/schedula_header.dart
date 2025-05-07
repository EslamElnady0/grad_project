import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/schedula_header_item.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SchedulaHeaderItem(
          isFirst: true,
          label: S.of(context).days,
        ),
        SchedulaHeaderItem(label: S.of(context).subject_name),
        SchedulaHeaderItem(label: S.of(context).from),
        SchedulaHeaderItem(label: S.of(context).to),
        SchedulaHeaderItem(label: S.of(context).place),
        SchedulaHeaderItem(label: S.of(context).onMap),
        SchedulaHeaderItem(label: S.of(context).type),
        SchedulaHeaderItem(label: S.of(context).attendance),
        SchedulaHeaderItem(label: S.of(context).condition),
      ]),
    );
  }
}
