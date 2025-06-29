import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/features/assignments/data/models/assignments_solution_response_model.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_show_success_dialog.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_state.dart';

class AssignmentDetailsBlocConsumer extends StatelessWidget {
  const AssignmentDetailsBlocConsumer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadAssignmentSolutionCubit,
        UploadAssignmentSolutionState>(
      listenWhen: (previous, current) {
        return current is UploadAssignmentSolutionLoading ||
            current is UploadAssignmentSolutionSuccess ||
            current is UploadAssignmentSolutionFailure;
      },
      buildWhen: (previous, current) {
        return current is UploadAssignmentSolutionLoading ||
            current is UploadAssignmentSolutionSuccess ||
            current is UploadAssignmentSolutionFailure;
      },
      listener: (context, state) {
        state.whenOrNull(
          uploadAssignmentSolutionSuccess: (data) async {
            AssignmentsSolutionResponseModel responseData =
                data as AssignmentsSolutionResponseModel;
            customShowSuccessDialog(
              context: context,
              message: responseData.message,
            );
          },
          uploadAssignmentSolutionFailure: (error) {
            showErrorDialog(context, error);
          },
        );
      },
      builder: (context, state) {
        return CustomModalProgress(
            isLoading: state is UploadAssignmentSolutionLoading ? true : false,
            child: child);
      },
    );
  }
}
