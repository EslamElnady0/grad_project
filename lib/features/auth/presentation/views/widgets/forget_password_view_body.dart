import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_logo.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:grad_project/core/widgets/custom_text_form_field.dart';
import 'package:grad_project/features/auth/presentation/views/confirm_account_view.dart';
import 'package:grad_project/generated/l10n.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            vGap(30),
            CustomLogo(
              height: 90.h,
            ),
            vGap(10),
            Text(
             S.of(context).success_message,
              textAlign: TextAlign.center,
              style: AppTextStyles.font24BlackBold,
            ),
            vGap(10),
            Text(
              S.of(context).forgot_password_message,
              textAlign: TextAlign.center,
              style: AppTextStyles.font12GrayMedium,
            ),
            vGap(16),
            Image.asset(Assets.imagesForgetpassword1),
            SizedBox(
                height: 280.h,
                child: Image.asset(Assets.imagesForgetpassword2)),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText:S.of(context).email,
              textInputType: TextInputType.emailAddress,
            ),
            vGap(20),
         CustomTextButton(text: S.of(context).confirm, onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    GoRouter.of(context).push(ConfirmAccountView.routeName);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },) , vGap(40),
          ],
        ),
      ),
    ));
  }
}
