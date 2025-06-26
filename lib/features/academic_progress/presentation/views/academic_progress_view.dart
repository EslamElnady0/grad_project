import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/academic_progress/presentation/views/widgets/academic_progress_view_body.dart';

class AcademicProgressView extends StatelessWidget {
  const AcademicProgressView({super.key});

  static const String routeName = '/academic-progress-view';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: AcademicProgressViewBody(),
    );
  }
}
