import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_red_grad_container.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../../../core/theme/app_text_styles.dart';

class FinishQuizRow extends StatelessWidget {
  const FinishQuizRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.darkblue,
                borderRadius: BorderRadius.circular(10)),
            child: SvgIconButton(
                iconPath: Assets.imagesSvgsEyeCrossedIcon, onPressed: () {})),
        hGap(70),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: CustomRedGradContainer(
              alignment: Alignment.center,
              raduis: 10,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                S.of(context).submitAndFinish,
                style: AppTextStyles.font13WhiteBold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
