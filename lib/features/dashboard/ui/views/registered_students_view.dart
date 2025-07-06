import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';

import '../widgets/registered_students_view_body.dart';

class RegisteredStudentsView extends StatelessWidget {
  static const String routeName = "/registered_students_view";
  const RegisteredStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final courseId = GoRouterState.of(context).extra as int;
    return CustomScaffold(
        body: BlocProvider(
      create: (context) =>
          getIt<DashboardCubit>()..getCourseStudents(courseId.toString()),
      child: const RegisteredStudentsViewBody(),
    ));
  }
}
