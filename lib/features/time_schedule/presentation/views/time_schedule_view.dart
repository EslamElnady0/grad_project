import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_cubit.dart';
import 'package:grad_project/features/time_schedule/presentation/widgets/time_schedule_view_body.dart';

class TimeScheduleView extends StatelessWidget {
  const TimeScheduleView({super.key});
  static const String routeName = '/Time-Schedule-view';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<GetStudentsQuizzesCubit>()..getStudentsQuizzes(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetStudentsAssignmentsCubit>()..getStudentsAssignments(),
        ),
        BlocProvider(
          create: (context) => getIt<ActivityFilterCubit>(),
        ),
      ],
      child: const TimeScheduleViewBody(),
    ));
  }
}
