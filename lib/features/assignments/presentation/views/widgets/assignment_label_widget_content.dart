import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentLabelWidgetContent extends StatelessWidget {
  const AssignmentLabelWidgetContent(
      {super.key, required this.title, required this.trailing});
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: Constants.secondaryGrad,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  Assets.imagesSvgsAssignmentsIcon,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            hGap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).assignment,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                Text(
                  title,
                  style: AppTextStyles.font10GraySemiBold,
                ),
              ],
            ),
          ],
        ),
        trailing
      ],
    );
  }
}
