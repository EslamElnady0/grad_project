import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(message, style: AppTextStyles.font16BlackSemiBold),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:
              Text(S.of(context).ok, style: AppTextStyles.font16BlackSemiBold),
        ),
      ],
    ),
  );
}
