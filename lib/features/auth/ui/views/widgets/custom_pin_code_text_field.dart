import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/theme/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 40,
        fieldWidth: 40,
        activeFillColor: AppColors.white,
        inactiveFillColor: AppColors.lightGrayText,
        selectedFillColor: AppColors.white,
        activeColor: AppColors.black,
        inactiveColor: AppColors.gray,
        selectedColor: AppColors.black,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onChanged: (value) {},
      appContext: context,
    );
  }
}
