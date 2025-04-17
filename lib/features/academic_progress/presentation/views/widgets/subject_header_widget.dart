import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class SubjectHeaderWidget extends StatelessWidget {
  const SubjectHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: 55,
      width: 110,
      decoration: const BoxDecoration(
          gradient: Constants.primaryGrad,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12))),
      child: Center(
        child: Text(
          "oop",
          style: AppTextStyles.font14WhiteSemiBold,
        ),
      ),
    );
  }
}
