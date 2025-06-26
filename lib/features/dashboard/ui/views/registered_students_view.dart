import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import '../widgets/registered_students_view_body.dart';

class RegisteredStudentsView extends StatelessWidget {
  static const String routeName = "/registered_students_view";
  const RegisteredStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: RegisteredStudentsViewBody());
  }
}
