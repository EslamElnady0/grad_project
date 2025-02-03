import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/auth/presentation/views/widgets/custom_pin_code_text_field.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

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
              const CustomAppBar(),
              vGap(13),
              Text(
                "أكد حسابك!",
                style: AppTextStyles.font24BlackSemiBold,
                textDirection: TextDirection.rtl,
              ),
              vGap(4),
              Image.asset(Assets.imagesProtect),
              vGap(14),
              Text(
                "أدخل الكود المكون من 6 أرقام اللي اتبعت ليك.",
                style: AppTextStyles.font12BlackMedium,
                textDirection: TextDirection.rtl,
              ),
              vGap(8),
              Text(
                "1234567890@zu.edu.eg",
                style: AppTextStyles.font12GrayMedium,
              ),
              vGap(24),
              CustomPinCodeTextField(),
              vGap(12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("إعادة الإرسال؟",
                      style: AppTextStyles.font16GrayBold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


