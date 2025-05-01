import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/file_utils.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/networking/dio_factory.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/core/widgets/custom_text_button.dart';
import 'package:grad_project/features/lecture_manager/ui/cubit/file_upload_cubit.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/dispaly_week_list.dart';
import 'package:path/path.dart' as path;
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_text_form_field_and_icon.dart';
import '../../../../generated/l10n.dart';

import 'file_upload_dialog.dart';

class LectureFormContent extends StatefulWidget {
  const LectureFormContent({
    super.key,
  });

  @override
  State<LectureFormContent> createState() => _LectureFormContentState();
}

class _LectureFormContentState extends State<LectureFormContent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  int weekNumber = 0;
  int type = 0;
  late String title;
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
            onSelected: (selectedWeek) {
              weekNumber = selectedWeek;
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
              showFileUploadDialog(context);
            },
            icon: SvgPicture.asset(Assets.imagesSvgsPdfIcon),
            primaryButton: false,
          ),
          BlocBuilder<FileUploadCubit, List<PlatformFile>>(
            builder: (context, uploadedFiles) {
              if (uploadedFiles.isEmpty) {
                return const SizedBox.shrink();
              }

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: uploadedFiles.length,
                  itemBuilder: (context, index) {
                    final file = uploadedFiles[index];
                    final extension =
                        path.extension(file.name).replaceFirst('.', '');
                    final icon = getFileIcon(extension);

                    return ListTile(
                      leading: Icon(icon, color: Colors.blue),
                      title: Text(
                        file.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () =>
                            context.read<FileUploadCubit>().removeFile(index),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          vGap(12),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextButton(
              primary: true,
              width: 100.w,
              fontSize: 18,
              text: S.of(context).publish,
            
onTap: () async {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();

    // Get the selected files
    final selectedFiles = context.read<FileUploadCubit>().state;
    String typeWord = type == 0
        ? "lecture"
        : type == 1
            ? "section"
            : "other";

    var data = FormData.fromMap({
      'files': selectedFiles.map((file) {
        if (file.path != null) {
          return MultipartFile.fromFile(file.path!,
              filename: file.name);
        } else {
          // You can handle the error or provide a default value here
          return MultipartFile.fromFile('',
              filename: file.name); // Empty string as fallback
        }
      }).toList(),
      'title': title,
      'week': (weekNumber + 1).toString(),
      'type': typeWord,
      'material': selectedFiles.isNotEmpty
          ? await MultipartFile.fromFile(selectedFiles.first.path!,
              filename: selectedFiles.first.name)
          : null, // Make sure material is a file
    });

    try {
      // Get Dio instance using DioFactory
      Dio dio = await DioFactory.getDio();

      var response = await dio.request(
        'https://nextgenedu-database.azurewebsites.net/api/teachers/course-materials/198',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        // Handle success
      } else {
        print(response.statusMessage);
        // Handle failure
      }
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
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
}

void showFileUploadDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return BlocProvider.value(
        value: context.read<FileUploadCubit>(),
        child: const Dialog(
          backgroundColor: Colors.transparent,
          child: FileUploadDialog(),
        ),
      );
    },
  );
}
