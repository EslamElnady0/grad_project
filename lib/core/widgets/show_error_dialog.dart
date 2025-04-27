
import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:translator/translator.dart';


import '../networking/api_error_model.dart';

Future<void> showErrorDialog(BuildContext context, ApiErrorModel apiErrorModel) async {
  final translator = GoogleTranslator();
  String message = apiErrorModel.getAllMessages();

  if (isArabicLocale(context)) {
    final translation = await translator.translate(message, from: 'en', to: 'ar');
    message = translation.text;
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        message,
        style: AppTextStyles.font16BlackSemiBold,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            S.of(context).ok,
            style: AppTextStyles.font16BlackSemiBold,
          ),
        ),
      ],
    ),
  );
}
