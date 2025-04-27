

import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:translator/translator.dart';

class CustomTranslatedText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomTranslatedText({
    super.key,
    required this.text,
    this.style,
  });

  Future<String> _getText(BuildContext context) async {
    if (isArabicLocale(context)) {
      final translator = GoogleTranslator();
      final result = await translator.translate(text, from: 'en', to: 'ar');
      return result.text;
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getText(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(); // أو loader
        }
        return Text(
          snapshot.data!,
          style: style,
        );
      },
    );
  }
}
