import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignments_home_body.dart';

class AssignmentHomeView extends StatelessWidget {
  const AssignmentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
   final cubit = getIt<AllCoursesCubit>()..get();
    return BlocProvider.value(
      value: cubit,
      child: const AssignmentsHomeBody(),
    );
  }
}