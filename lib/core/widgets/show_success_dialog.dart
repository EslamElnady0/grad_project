import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:translator/translator.dart';

import '../helpers/localizationa.dart';

Future<void> showSuccessDialog(
    {required BuildContext context, required String message}) async {
  final translator = GoogleTranslator();

  if (isArabicLocale(context)) {
    final translation =
        await translator.translate(message, from: 'en', to: 'ar');
    message = translation.text;
  }
  if (context.mounted) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      desc: message,
      showCloseIcon: false,
      btnOkOnPress: () {
        context.pop();
      },
    ).show();
  }
}
