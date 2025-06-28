import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_upload_dialog.dart';
import 'package:grad_project/features/time_schedule/data/models/activity_response_model.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_cubit.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentSolutionUploadButton extends StatelessWidget {
  final StudentAssignmentModel assignmentModel;

  const AssignmentSolutionUploadButton({
    super.key,
    required this.assignmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final assignmentFile =
            await showAssignmentSolutionUploadDialog(context);
        if (assignmentFile != null) {
          context.read<AssignmentUploadCubit>().setAssignment(assignmentFile);
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
        decoration: BoxDecoration(
          gradient: Constants.secondaryGrad,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Center(
            child: Text(S.of(context).add_to_send,
                style: AppTextStyles.font16WhiteSemiBold),
          ),
        ),
      ),
    );
  }

  Future<PlatformFile?> showAssignmentSolutionUploadDialog(
      BuildContext context) {
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
}
