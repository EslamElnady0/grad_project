import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/auth/presentation/views/auth_view.dart';
import '../../../../core/widgets/custom_logo.dart';
import '../../../../generated/l10n.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLogo(
          height: 173.h,
        ),
        Text(
         S.of(context).app_title,
          style: AppTextStyles.font24BlackSemiBold,
        )
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(
      Duration(milliseconds: 3000),
      () {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).go(AuthView.routeName);
      },
    );
  }
}
