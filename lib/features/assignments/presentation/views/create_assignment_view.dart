import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/create_assignment_view_body.dart';

class CreateAssignmentView extends StatelessWidget {
  const CreateAssignmentView({super.key});

    static const String routeName = '/Create-assignment-view';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: CreateAssignmentViewBody(),
    );
  }
}
