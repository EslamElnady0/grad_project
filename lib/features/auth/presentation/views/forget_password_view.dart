import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = '/forget-password';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: ForgetPasswordViewBody(),
    );
  }
}
