import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';
import 'doctor_info_section.dart';

class ItemHeader extends StatelessWidget {
  const ItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DoctorInfoSection(),
        Spacer(),
        Text(
          "1/11/2024",
          style: AppTextStyles.font10GraySemiBold,
        )
      ],
    );
  }
}
