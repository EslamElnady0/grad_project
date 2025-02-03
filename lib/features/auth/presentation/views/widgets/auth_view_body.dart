import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_logo.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password;
  late bool isTermsAccepted = false;
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
                "أهلاً وسهلاً بعودتك!\nمن فضلك سجّل دخولك للوصول إلى لوحة التحكم الخاصة بك وابقَ منتجاً.",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: AppTextStyles.font12BlackMedium,
              ),
              vGap(20),
              Divider(
                color: Colors.grey,
                thickness: 2,
                height: 20,
              ),
              vGap(20),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                hintText: 'الايميل',
                textInputType: TextInputType.emailAddress,
              ),
              vGap(10),
              CustomTextFormField(
                      onSaved: (value) {
                  password = value!;
                },
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print(email);
                      print(password);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  child: Text('تسجيل الدخول')),
            ],
          ),
        ),
      ),
    );
  }
}

