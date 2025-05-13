import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.label, required this.content});

  final String label;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 100,
          decoration: const BoxDecoration(
            color: AppColors.darkblue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              label,
              style: AppTextStyles.font12WhiteSemiBold,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
                gradient: Constants.secondaryGrad,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: Center(
              child: Text(
                content,
                style: AppTextStyles.font12WhiteSemiBold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
