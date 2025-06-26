import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:translator/translator.dart';

import '../helpers/localizationa.dart';
import '../theme/app_text_styles.dart';

Future<void> showSuccessDialog(
    {required BuildContext context, required String message}) async {
  final translator = GoogleTranslator();
  String translatedMessage = "";
  if (isArabicLocale(context)) {
    final translation =
        await translator.translate(message, from: 'en', to: 'ar');
    translatedMessage = translation.text;
  }
  if (context.mounted) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        desc: translatedMessage,
        descTextStyle: AppTextStyles.font14BlackSemiBold,
        showCloseIcon: false,
        btnOkOnPress: () {
          context.pop();
        },
      ).show();
    });
  }
}
