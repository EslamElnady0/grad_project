import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/features/subjects/logic/add_materials/add_materials_cubit.dart';
import 'package:grad_project/features/subjects/ui/widgets/lecture_form_content.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class AddLectureViewBody extends StatelessWidget {
  const AddLectureViewBody({
    super.key, 
    required this.id,
    this.isEdit = false,
    this.materialModel,
  });
  final int id;
  final bool isEdit;
  final CourseMaterialData? materialModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMaterialsCubit, AddMaterialsState>(
      listener: (context, state) {
        state.whenOrNull(
          addMaterialsSuccess: (response) {
            Navigator.pop(context);
          },
          addMaterialsFailure: (error) {
            showErrorDialog(context, error);
          },
        );
      },
      builder: (context, state) {
        double progress = 0;
        if (state is AddMaterialsProgress) {
          progress = state.progress;
        }

        return Stack(
          children: [
            AbsorbPointer(
              absorbing: state is AddMaterialsProgress,
              child: Opacity(
                opacity: state is AddMaterialsProgress ? 0.2 : 1.0,
                child: CustomModalProgress(
                  isLoading: state is AddMaterialsLoading,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(title: isEdit ? S.of(context).edit : S.of(context).addStudyContent),
                        vGap(8),
                        TitleTextWidget(
                            text: isEdit 
                              ? S.of(context).addStudyContentSubtitle 
                              : S.of(context).addStudyContentSubtitle),
                        vGap(16),
                        LectureFormContent(
                          id: id,
                          isEdit: isEdit,
                          materialModel: materialModel,
                        ),
                        vGap(16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state is AddMaterialsProgress)
              LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: Colors.grey[300],
                color: AppColors.primaryColordark,
              ),
          ],
        );
      },
    );
  }
}
