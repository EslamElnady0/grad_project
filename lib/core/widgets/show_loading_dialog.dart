import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const Center(
            child: SizedBox(
              height: 50,
              child: AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(
                  color: AppColors.primaryColorlight,
                ),
              ),
            ),
          ));
}
