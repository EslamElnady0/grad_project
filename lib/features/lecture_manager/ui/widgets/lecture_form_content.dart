import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_text_form_field_and_icon.dart';
import '../../../../core/widgets/text entry footer/custom_outloned_button.dart';
import '../../../../generated/l10n.dart';

class LectureFormContent extends StatefulWidget {
  const LectureFormContent({
    super.key,
  });

  @override
  State<LectureFormContent> createState() => _LectureFormContentState();
}

class _LectureFormContentState extends State<LectureFormContent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).lectureTitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.font16DarkerBlueSemiBold,
          ),
          vGap(5),
          CustomTextFormFieldAndicon(
            hintText: S.of(context).lectureTitleHint,
            icon: Assets.imagesLecTilte,
          ),
          vGap(5),
          Text(
            S.of(context).lectureDescription,
            textAlign: TextAlign.start,
            style: AppTextStyles.font16DarkerBlueSemiBold,
          ),
          vGap(5),
          CustomTextFormFieldAndicon(
            hintText: S.of(context).lectureDescriptionHint,
            icon: Assets.imagesLecDescrebtion,
            maxLines: 5,
          ),
          vGap(12),
          CustomTextAndIconButton(
            width: double.infinity,
            style: AppTextStyles.font17WhiteSemiBold,
            text: S.of(context).uploadFile,
            onTap: () {},
            icon: SvgPicture.asset(Assets.imagesSvgsPdfIcon),
            primaryButton: false,
          ),
          vGap(12),
          CustomOutlinedButton(
            title: S.of(context).uploadMedia,
            icon: SvgPicture.asset(Assets.imagesSvgsUpload),
            onPressed: () {},
          ),
          vGap(12),
          CustomOutlinedButton(
            title: S.of(context).addLink,
            icon: SvgPicture.asset(Assets.imagesSvgsAddLink),
            onPressed: () {},
          ),
          vGap(12),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextButton(
              primary: false,
              width: 100.w,
              style: AppTextStyles.font16WhiteBold,
              text: S.of(context).publish,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


