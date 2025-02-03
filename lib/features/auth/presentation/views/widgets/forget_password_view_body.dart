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
              "كله هيرجع لمكانه!",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.font24BlackBold,
            ),
            vGap(10),
            Text(
              "🔑 مهمل بس ولا يهمك! اكتب إيميلك علشان نرجعلك حسابك وكلمة السر تاني!",
              textDirection: TextDirection.rtl,
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
              hintText: 'الايميل',
              textInputType: TextInputType.emailAddress,
            ),
            vGap(20),
         CustomTextButton(text: "تأكيد", onTap: () {
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
