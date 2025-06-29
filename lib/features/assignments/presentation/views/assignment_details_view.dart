import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignment_asnwer_status/get_assignment_answer_status_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/Assignment_details_bloc_consumer.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_details_view_body.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_cubit.dart';

class AssignmentDetailsView extends StatelessWidget {
  const AssignmentDetailsView({super.key});

  static const routeName = '/assignment-details';

  @override
  Widget build(BuildContext context) {
    final dynamic assignmentModel = GoRouterState.of(context).extra;
    return FlavorsFunctions.isAdmin()
        ? CustomScaffold(
            body: AssignmentDetailsViewBody(
              assignmentModel: assignmentModel,
            ),
          )
        : CustomScaffold(
            body: MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (context) =>
                          getIt<UploadAssignmentSolutionCubit>()),
                  BlocProvider(
                      create: (context) => getIt<AssignmentUploadCubit>()),
                  BlocProvider(
                      create: (context) =>
                          getIt<GetAssignmentAnswerStatusCubit>()
                            ..getAssignmentDetails(assignmentModel.id)),
                ],
                child: AssignmentDetailsBlocConsumer(
                  child: AssignmentDetailsViewBody(
                      assignmentModel: assignmentModel),
                )),
          );
  }
}
