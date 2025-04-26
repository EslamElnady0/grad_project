import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/auth/ui/views/widgets/confirm_account_view_body.dart';

class ConfirmAccountView extends StatelessWidget {
  const ConfirmAccountView({super.key});
static const routeName = '/confirm-account';
  @override
  Widget build(BuildContext context) {

    return const CustomScaffold(
      body: ConfirmAccountViewBody(),
    );
  }
}
