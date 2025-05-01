import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/core/widgets/publish_row.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_cubit.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_degree_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_upload_dialog.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/date_and_time_section.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/title_and_desc_text_fields.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/uploaded_assignment_show.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class CreateAssignmentViewBody extends StatelessWidget {
  const CreateAssignmentViewBody({super.key, required this.courseId});

  final int courseId;
  @override
  Widget build(BuildContext context) {
    final createAssignmentCubit = context.read<CreateAssignmentCubit>();

    createAssignmentCubit.courseId = courseId;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInnerScreensAppBar(
                title: S.of(context).create_new_assignment),
            TitleTextWidget(
                text: S.of(context).create_assignment_welcome_message),
            vGap(8),
            TitleAndDescTextFields(
              title: S.of(context).assignment_title,
              titleHintText: S.of(context).assignment_title_hint_text,
              desc: S.of(context).assignment_description,
              descHintText: S.of(context).assignment_description_hint_text,
              formKey: createAssignmentCubit.formKey,
              titleController: createAssignmentCubit.titleController,
              descController: createAssignmentCubit.descController,
            ),
            vGap(12),
            const Row(
              children: [
                AssignmentDegreeWidget(),
              ],
            ),
            vGap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).final_date,
                  style: AppTextStyles.font14BlackBold
                      .copyWith(color: AppColors.darkerBlue),
                ),
                vGap(12),
                Text(S.of(context).choose_assignment_deadline,
                    style: AppTextStyles.font12GrayMedium),
              ],
            ),
            vGap(8),
            const DateAndTimeSection(),
            vGap(20),
            CustomTextAndIconButton(
              text: S.of(context).add_file,
              style: AppTextStyles.font14WhiteMedium,
              width: double.infinity,
              onTap: () {
                showAssignmentUploadDialog(context);
              },
              icon: const SizedBox(),
              primaryButton: true,
            ),
            const UploadedAssignmentShow(),
            vGap(20),
            PublishRow(
              onTap: () async {
                if (createAssignmentCubit.formKey.currentState!.validate()) {
                  await createAssignmentCubit.createAssignment();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showAssignmentUploadDialog(BuildContext context) async {
  final cubit = context.read<CreateAssignmentCubit>();
  final savedTitle = cubit.titleController.text;
  final savedDesc = cubit.descController.text;
  final assignmentFile = await showDialog<PlatformFile?>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        child: AssignmentUploadDialog(),
      );
    },
  );
  cubit.titleController.text = savedTitle;
  cubit.descController.text = savedDesc;
  if (assignmentFile != null) {
    context.read<CreateAssignmentCubit>().setUploadedAssignment(assignmentFile);
    context.read<AssignmentUploadCubit>().setAssignment(assignmentFile);
  }
}
