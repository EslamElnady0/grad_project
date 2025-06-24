import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/core/widgets/show_success_dialog.dart';
import 'package:grad_project/features/assignments/data/models/edit_assignment_response_model.dart';
import 'package:grad_project/features/assignments/logic/cubits/edit_assignment_cubit/edit_assignment_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/edit_assignment_cubit/edit_assignment_state.dart';


class EditAssignmentBlocConsumer extends StatelessWidget {
  final Widget child;
  const EditAssignmentBlocConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditAssignmentCubit, EditAssignmentState>(
      listenWhen: (previous, current) {
        return current is EditAssignmentLoading ||
            current is EditAssignmentSuccess ||
            current is EditAssignmentFailure;
      },
      buildWhen: (previous, current) {
        return current is EditAssignmentLoading ||
            current is EditAssignmentSuccess ||
            current is EditAssignmentFailure;
      },
      listener: (context, state) {
        state.whenOrNull(
          editAssignmentSuccess: (data) async {
            EditAssignmentResponseModel responseData =
                data as EditAssignmentResponseModel;
            showSuccessDialog(
              context: context,
              message: responseData.message,
            );
          },
          editAssignmentFailure: (error) {
            showErrorDialog(context, error);
          },
        );
      },
      builder: (context, state) {
        return CustomModalProgress(
            isLoading: state is EditAssignmentLoading ? true : false,
            child: child);
      },
    );
  }
}
