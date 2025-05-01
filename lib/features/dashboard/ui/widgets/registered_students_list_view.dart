import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';

import 'custom_single_student_container.dart';

class RegisteredStudentsListView extends StatelessWidget {
  const RegisteredStudentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const CustomSingleStudentContainer();
        },
        separatorBuilder: (context, index) => vGap(12),
        itemCount: 55);
  }
}
