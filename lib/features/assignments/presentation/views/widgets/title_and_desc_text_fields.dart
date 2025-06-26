import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'custom_title_and_text_field.dart';

class TitleAndDescTextFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descController;
  final String title;
  final String titleHintText;
  final String desc;
  final String descHintText;
  const TitleAndDescTextFields(
      {super.key,
      required this.formKey,
      required this.titleController,
      required this.descController,
      required this.title,
      required this.titleHintText,
      required this.desc,
      required this.descHintText});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleAndTextField(
            controller: titleController,
            title: title,
            hintText: titleHintText,
          ),
          vGap(12),
          CustomTitleAndTextField(
            controller: descController,
            title: desc,
            hintText: descHintText,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
