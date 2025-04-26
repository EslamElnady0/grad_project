import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const String routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: AuthViewBody(),
    );
  }
}
