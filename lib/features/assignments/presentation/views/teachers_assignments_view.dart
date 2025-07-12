import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_request_query_params_model.dart';
import 'package:grad_project/features/assignments/logic/cubits/delete_assignment_cubit/delete_assignment_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/Teachers_assignments_view_body.dart';


class TeachersAssignmentsView extends StatelessWidget {
  const TeachersAssignmentsView({super.key});

  static const String routeName = '/scheduled-assignments-view';
  @override
  Widget build(BuildContext context) {
    final GetAssignmentsRequestQueryParamsModel queryParamsModel =
        GoRouterState.of(context).extra as GetAssignmentsRequestQueryParamsModel;
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetAssignmentsCubit>()
              ..getAssignments(
                courseId: queryParamsModel.courseId,
                assignmentStatus: queryParamsModel.assignmentStatus,
                fromDate: queryParamsModel.fromDate,
              ),
          ),
          BlocProvider(
            create: (context) => getIt<DeleteAssignmentCubit>(),
          ),],
        child: TeachersAssignmentsViewBody(
          queryParamsModel: queryParamsModel,
        ),
      ),
    );
  }
}
