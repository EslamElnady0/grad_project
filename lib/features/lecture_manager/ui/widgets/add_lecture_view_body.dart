import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/features/lecture_manager/logic/add_materials_cubit/add_materials_cubit.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/lecture_form_content.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class AddLectureViewBody extends StatelessWidget {
  const AddLectureViewBody({super.key, required this.id});
  final int id;
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
      CustomModalProgress(
        isLoading: state is AddMaterialsLoading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: S.of(context).addStudyContent),
              vGap(8),
              TitleTextWidget(text: S.of(context).addStudyContentSubtitle),
              vGap(16),
              LectureFormContent(id: id),
              vGap(16),
            ],
          ),
        ),
      ),
     if (state is AddMaterialsProgress)
        LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          backgroundColor: Colors.grey[300],
          
          color: AppColors.primaryColordark,
        ),
    ],
  );
},

    );
  }
}
