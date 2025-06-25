import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/edit_assignment_cubit/edit_assignment_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/edit_assignment_bloc_consumer.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/edit_assignment_view_body.dart';

class EditAssignmentView extends StatelessWidget {
  const EditAssignmentView({super.key});
  static const String routeName = '/Edit-assignment-view';

  @override
  Widget build(BuildContext context) {
    final AssignmentModel assignmentModel =
        GoRouterState.of(context).extra! as AssignmentModel;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<EditAssignmentCubit>()),
        BlocProvider(create: (context) => getIt<AssignmentUploadCubit>())
      ],
      child: CustomScaffold(
        body: EditAssignmentBlocConsumer(
            child: EditAssignmentViewBody(
          courseId: assignmentModel.course.id,
          assignment: assignmentModel,
        )),
      ),
    );
  }
}
