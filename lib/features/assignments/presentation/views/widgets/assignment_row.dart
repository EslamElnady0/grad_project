import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/grade_selector.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentRow extends StatelessWidget {
  const AssignmentRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "إسلام ايهاب محمد لطفي سلام ايهاب محمد لطفي سلام ايهاب محمد لطفي ",
                  style: AppTextStyles.font12DarkerBlueSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          hGap(10),
          const CustomShowButton(),
          hGap(15),
          SizedBox(
            width: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "5",
                style: AppTextStyles.font12DarkerBlueSemiBold,
              ),
            ),
          ),
          hGap(15),
          SizedBox(
            width: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "5",
                style: AppTextStyles.font12DarkerBlueSemiBold,
              ),
            ),
          ),
          hGap(20),
          const GradeSelector(),
          hGap(10),
        ],
      ),
    );
  }
}

class CustomShowButton extends StatelessWidget {
  const CustomShowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          gradient: Constants.secondaryGrad,
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox(
          width: 130,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.imagesSvgsOpenInNew,
              ),
              hGap(8),
              Text(
                S.of(context).show,
                style: AppTextStyles.font12WhiteSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
