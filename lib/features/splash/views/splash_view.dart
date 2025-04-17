import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/splash/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
static const String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SplashViewBody(),
    );
  }
}