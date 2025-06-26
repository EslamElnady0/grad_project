import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/widgets/custom_app_bar.dart';
import 'package:grad_project/features/subjects/ui/widgets/qr_numbers_show.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';

class QrAttendanceViewBody extends StatelessWidget {
  const QrAttendanceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomAppBar(title: S.of(context).qr_attendance),
            vGap(20),
            Row(
              children: [
                QrNumebrsShow(
                  title: "${S.of(context).students_count}259",
                ),
                const Spacer(),
                const QrNumebrsShow(
                  title: "09:59",
                )
              ],
            ),
            vGap(80),
            Image.asset(Assets.imagesQrCode)
          ],
        ),
      ),
    );
  }
}
