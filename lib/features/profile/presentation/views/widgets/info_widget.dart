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
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: Constants.secondaryGrad,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: const BoxDecoration(
              color: AppColors.darkblue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: AppTextStyles.font12WhiteSemiBold,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
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
      ),
    );
  }
}
