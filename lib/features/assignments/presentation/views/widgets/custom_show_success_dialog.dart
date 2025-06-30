import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:translator/translator.dart';

Future<void> customShowSuccessDialog(
    {required BuildContext context, required String message}) async {
  final translator = GoogleTranslator();
  String translatedMessage = "";
  if (isArabicLocale(context)) {
    final translation =
        await translator.translate(message, from: 'en', to: 'ar');
    translatedMessage = translation.text;
  }
  if (context.mounted) {
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
    ;
  }
}
