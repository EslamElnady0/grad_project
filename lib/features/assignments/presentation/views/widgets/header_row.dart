import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: S.of(context).name,
          width: 200,
        ),
        hGap(10),
        CustomText(
          text: S.of(context).assignment,
          width: 80,
        ),
        hGap(15),
        CustomText(
          text: S.of(context).student_grade,
          width: 50,
        ),
        hGap(15),
        CustomText(
          text: S.of(context).the_degree,
          width: 50,
        ),
        hGap(20),
        CustomText(text: S.of(context).add_grade, width: 130),
        hGap(10),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.width});

  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: AppTextStyles.font12DarkerBlueSemiBold,
        ),
      ),
    );
  }
}
