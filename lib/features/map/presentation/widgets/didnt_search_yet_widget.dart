import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class DidntSearchYetWidget extends StatelessWidget {
  const DidntSearchYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).didntSreachYet,
          style: AppTextStyles.font15BlackSemiBold,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        vGap(22),
        Image.asset(
          Assets.imagesMapTrail,
          height: 156.h,
        ),
        vGap(22),
        Text(
          S.of(context).writeYourPlace,
          style: AppTextStyles.font15BlackSemiBold,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        vGap(16),
      ],
    );
  }
}
