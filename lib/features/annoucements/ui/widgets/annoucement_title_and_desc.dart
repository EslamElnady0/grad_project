import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import 'custom_title_and_text_field.dart';

class AnnoucementTitleAndDesc extends StatelessWidget {
  const AnnoucementTitleAndDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleAndTextField(
          title: S.of(context).news_title,
          hintText: S.of(context).news_title_description,
        ),
        vGap(12),
        CustomTitleAndTextField(
          title: S.of(context).news_content,
          hintText: S.of(context).news_content_description,
          alignLabelWithHint: true,
          maxLines: 5,
        ),
      ],
    );
  }
}
