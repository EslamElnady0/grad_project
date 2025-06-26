import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_form_field.dart';

class CustomTitleAndTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final bool? alignLabelWithHint;
  final int? maxLines;
  const CustomTitleAndTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.maxLines,
      this.alignLabelWithHint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.font16BlackSemiBold
              .copyWith(color: AppColors.darkerBlue),
        ),
        vGap(10),
        CustomTextFormField(
          alignLabelWithHint: alignLabelWithHint,
          hintText: hintText,
          maxLines: maxLines,
          controller: controller,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(11),
            child: SvgPicture.asset(Assets.imagesSvgsPaperIcon),
          ),
          textInputType: TextInputType.text,
        ),
      ],
    );
  }
}
