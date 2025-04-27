import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/auth/ui/views/widgets/custom_pin_code_text_field.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';

class ConfirmAccountViewBody extends StatelessWidget {
  const ConfirmAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAppBar(
                title: S.of(context).security_confirmation,
              ),
              vGap(13),
              Text(
                S.of(context).verify_account,
                style: AppTextStyles.font24BlackSemiBold,
              ),
              vGap(4),
              Image.asset(Assets.imagesProtect),
              vGap(14),
              Text(
                S.of(context).enter_code,
                style: AppTextStyles.font12BlackMedium,
              ),
              vGap(8),
              Text(
                "1234567890@zu.edu.eg",
                style: AppTextStyles.font12GrayMedium,
              ),
              vGap(24),
              const CustomPinCodeTextField(),
              vGap(12),
              Align(
                alignment: Alignment.centerRight,
                child: Align(
                  alignment: isArabicLocale(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).resend,
                        style: AppTextStyles.font16GrayBold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
