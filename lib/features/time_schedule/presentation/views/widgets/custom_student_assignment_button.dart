import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/core/widgets/show_success_dialog.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_upload_dialog.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_state.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomStudentAssignmentButton extends StatelessWidget {
  final StudentAssignmentModel assignmentModel;

  const CustomStudentAssignmentButton({
    super.key,
    required this.assignmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<UploadAssignmentSolutionCubit>()),
        BlocProvider(create: (context) => getIt<AssignmentUploadCubit>())
      ],
      child: BlocListener<UploadAssignmentSolutionCubit,
          UploadAssignmentSolutionState>(
        listener: (context, state) {
          state.mapOrNull(
            uploadAssignmentSolutionSuccess: (data) {
              showSuccessDialog(
                  context: context,
                  message: S.of(context).assignment_uploaded_successfully);
            },
            uploadAssignmentSolutionFailure: (data) {
              showErrorDialog(context, data.error);
            },
          );
        },
        child: Builder(builder: (context) {
          return GestureDetector(
            onTap: () async {
              final assignmentFile =
                  await showAssignmentSolutionUploadDialog(context);
              if (assignmentFile != null) {
                context
                    .read<AssignmentUploadCubit>()
                    .setAssignment(assignmentFile);
                context
                    .read<UploadAssignmentSolutionCubit>()
                    .setUploadedAssignmentSolution(assignmentFile);
                context
                    .read<UploadAssignmentSolutionCubit>()
                    .uploadAssignmentSolution(
                      assignmentId: assignmentModel.id,
                      file: File(assignmentFile.path!),
                    );
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                gradient: Constants.secondaryGrad,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(S.of(context).add_to_send,
                    style: AppTextStyles.font12WhiteMedium),
              ),
            ),
          );
        }),
      ),
    );
  }
}

Future<PlatformFile?> showAssignmentSolutionUploadDialog(BuildContext context) {
  return showDialog<PlatformFile?>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        child: AssignmentUploadDialog(),
      );
    },
  );
}
