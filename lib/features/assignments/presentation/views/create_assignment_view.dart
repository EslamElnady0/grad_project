import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/create_assignment_bloc_consumer.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/create_assignment_view_body.dart';

class CreateAssignmentView extends StatelessWidget {
  const CreateAssignmentView({super.key});

  static const String routeName = '/Create-assignment-view';
  @override
  Widget build(BuildContext context) {
    final int courseId = GoRouterState.of(context).extra! as int;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CreateAssignmentCubit>()),
        BlocProvider(create: (context) => getIt<AssignmentUploadCubit>())
      ],
      child: CustomScaffold(
        body: CreateAssignmentBlocConsumer(
            child: CreateAssignmentViewBody(
          courseId: courseId,
        )),
      ),
    );
  }
}
