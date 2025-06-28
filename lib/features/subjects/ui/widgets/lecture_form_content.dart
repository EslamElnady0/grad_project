import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/show_snak_bar.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:grad_project/features/subjects/logic/add_materials/add_materials_cubit.dart';
import 'package:grad_project/features/subjects/ui/manager/file_upload_cubit.dart';
import 'package:grad_project/core/widgets/dispaly_list.dart';
import 'package:grad_project/features/subjects/ui/widgets/files_list_view.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_text_form_field_and_icon.dart';
import '../../../../generated/l10n.dart';

import 'file_upload_dialog.dart';

class LectureFormContent extends StatefulWidget {
  const LectureFormContent({
    super.key,
    required this.id,
    this.isEdit = false,
    this.materialModel,
  });
  final int id;
  final bool isEdit;
  final CourseMaterialData? materialModel;
  @override
  State<LectureFormContent> createState() => _LectureFormContentState();
}

class _LectureFormContentState extends State<LectureFormContent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  int weekNumber = 0;
  int type = 0;
  late String title;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.materialModel != null) {
      _initializeFormWithMaterialData();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load existing files when in edit mode
    if (widget.isEdit && widget.materialModel != null) {
      _loadExistingFiles();
    }
  }

  void _loadExistingFiles() {
    final material = widget.materialModel!;
    if (material.file != null && material.file!.isNotEmpty) {
      print('Loading existing files: ${material.file}');
      // Assuming file URLs are comma-separated or single URL
      final fileUrls = material.file!.split(',').map((url) => url.trim()).where((url) => url.isNotEmpty).toList();
      if (fileUrls.isNotEmpty) {
        print('File URLs: $fileUrls');
        context.read<FileUploadCubit>().loadExistingFiles(fileUrls);
      }
    } else {
      print('No existing files found');
    }
  }

  void _initializeFormWithMaterialData() {
    final material = widget.materialModel!;
    titleController.text = material.title ?? '';
    title = material.title ?? '';
    
    // Parse week number from material.week
    if (material.week != null) {
      final weekStr = material.week!.replaceAll(RegExp(r'[^0-9]'), '');
      weekNumber = int.tryParse(weekStr) ?? 1;
    } else {
      weekNumber = 1;
    }
    
    // Parse type from material.type
    if (material.type != null) {
      final materialType = material.type!.toLowerCase();
      if (materialType.contains('lecture')) {
        type = 0; // lecture
      } else if (materialType.contains('section')) {
        type = 1; // section
      } else {
        type = 2; // other
      }
    } else {
      type = 0;
    }
  }

  String? _getInitialWeekValue(BuildContext context) {
    if (widget.isEdit && weekNumber > 0) {
      final weekNames = getLocalizedWeekNames(
        List.generate(14, (index) => index + 1), 
        context
      );
      // weekNumber is 1-based, array is 0-based
      if (weekNumber <= weekNames.length) {
        return weekNames[weekNumber - 1];
      }
    }
    return null;
  }

  String? _getInitialTypeValue(BuildContext context) {
    if (widget.isEdit) {
      if (type == 0) return S.of(context).lecture;
      if (type == 1) return S.of(context).section;
      if (type == 2) return S.of(context).other;
    }
    return null;
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vGap(5),
          Text(
            S.of(context).lectureTitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.font16DarkerBlueSemiBold,
          ),
          vGap(5),
          CustomTextFormFieldAndicon(
              controller: titleController,
              hintText: S.of(context).lectureTitleHint,
              onSaved: (value) {
                title = value!;
              },
              icon: Assets.imagesSvgsLecTilte),
          vGap(12),
          Text(
            S.of(context).week,
            textAlign: TextAlign.start,
            style: AppTextStyles.font16DarkerBlueSemiBold,
          ),
          vGap(5),
          DisplayList(
            listValue: getLocalizedWeekNames(
                List.generate(14, (index) => index + 1), context),
            initialValue: _getInitialWeekValue(context),
            onSelected: (selectedWeek) {
              weekNumber = selectedWeek + 1;
            },
          ),
          vGap(12),
          Text(
            S.of(context).type,
            textAlign: TextAlign.start,
            style: AppTextStyles.font16DarkerBlueSemiBold,
          ),
          vGap(5),
          DisplayList(
            listValue: [
              S.of(context).lecture,
              S.of(context).section,
              S.of(context).other
            ],
            initialValue: widget.isEdit 
                ? _getInitialTypeValue(context)
                : null,
            onSelected: (selectedWeek) {
              type = selectedWeek;
            },
          ),
          vGap(12),
          CustomTextAndIconButton(
            width: double.infinity,
            style: AppTextStyles.font17WhiteSemiBold,
            text: S.of(context).uploadFiles,
            onTap: () {
 
  showFileUploadDialog(context, widget.isEdit);
            },
            icon: SvgPicture.asset(Assets.imagesSvgsPdfIcon),
            primaryButton: false,
          ),
          const FilesListView(), 
          vGap(12),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextButton(
              primary: true,
              width: 100.w,
              fontSize: 18,
              text: widget.isEdit ? S.of(context).edit : S.of(context).publish,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final selectedFiles = context.read<FileUploadCubit>().state;
                  await callCubit(selectedFiles, context);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> callCubit(
      List<FileWithMetadata> selectedFiles, BuildContext context) async {
    // Get only new files for upload
    final newFiles = context.read<FileUploadCubit>().getNewFiles();
    final fileUploadCubit = context.read<FileUploadCubit>();
    final existingFiles = fileUploadCubit.getExistingFileUrls();
 if (newFiles.isNotEmpty || existingFiles.isNotEmpty) {
  if (widget.isEdit && widget.materialModel != null) {
    await context.read<AddMaterialsCubit>().updateMaterials(
      materialId: widget.materialModel!.id!,
      type: type,
      selectedFiles: newFiles, // ممكن تبعت الملفات الجديدة بس لو الـ API بتاخد الجديد
      title: title,
      weekNumber: weekNumber,
    );
  } else {
    await context.read<AddMaterialsCubit>().addMaterials(
      id: widget.id,
      type: type,
      selectedFiles: newFiles,
      title: title,
      weekNumber: weekNumber,
    );
  }
} else {
  showSnakBar(
    context: context,
    message: S.of(context).pleaseUploadFiles,
  );
}
}}

void showFileUploadDialog(BuildContext context, bool isSingleFileMode ) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return BlocProvider.value(
        value: context.read<FileUploadCubit>(),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: FileUploadDialog( isSingleFileMode: isSingleFileMode ),
        ),
      );
    },
  );
}
