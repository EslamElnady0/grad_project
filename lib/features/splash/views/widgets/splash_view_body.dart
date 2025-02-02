import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/home/ui/views/home_view.dart';
import '../../../../core/helpers/app_assets.dart';

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
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 80,
            child: AspectRatio(
                aspectRatio: 2800 / 1979,
                child: Image.asset(Assets.imagesLogo)),
          ),
        ),
        Text(
          "التعليم الالكتروني",
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
        GoRouter.of(context).go(HomeView.screenName);
      },
    );
  }
}
