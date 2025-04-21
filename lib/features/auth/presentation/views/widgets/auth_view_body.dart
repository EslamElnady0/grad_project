import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:grad_project/features/auth/presentation/views/forget_password_view.dart';
import 'package:grad_project/features/home/ui/views/home_view.dart';
import '../../../../../core/helpers/localizationa.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_logo.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              vGap(8),
              Text(
                S.of(context).welcome_message,
                textAlign: TextAlign.center,
                style: AppTextStyles.font12BlackMedium,
              ),
              vGap(20),
              const Divider(
                color: AppColors.gray,
                thickness: 2,
                height: 20,
              ),
              vGap(20),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: S.of(context).email,
                textInputType: TextInputType.emailAddress,
              ),
              vGap(10),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: S.of(context).password,
                textInputType: TextInputType.visiblePassword,
              ),
              vGap(10),
              Align(
                alignment: isArabicLocale(context)
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go(ForgetPasswordView.routeName);
                  },
                  child: Text(
                    S.of(context).forgot_password,
                    style: AppTextStyles.font12BlackSemiBold,
                  ),
                ),
              ),
              vGap(20),
              CustomTextButton(
                primary: true,
                  text: S.of(context).login,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      GoRouter.of(context).go(HomeView.routeName);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
              vGap(20),
            ],
          ),
        ),
      ),
    );
  }
}
