import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignment_asnwer_status/get_assignment_answer_status_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignment_asnwer_status/get_assignment_answer_status_state.dart';
import 'package:grad_project/features/assignments/presentation/views/pdf_web_view.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_desc_section.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_details_section.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_label_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_solution_upload_button.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_button.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:permission_handler/permission_handler.dart';

class AssignmentDetailsViewBody extends StatelessWidget {
  const AssignmentDetailsViewBody({super.key, required this.assignmentModel});

  final dynamic assignmentModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInnerScreensAppBar(title: S.of(context).assignment_details),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TitleTextWidget(
                      text: FlavorsFunctions.isStudent()
                          ? S
                              .of(context)
                              .student_assignment_details_welcome_message
                          : S
                              .of(context)
                              .teacher_assignment_details_welcome_message),
                  vGap(10),
                  AssignmentLabelWidget(
                    assignmentModel: assignmentModel,
                  ),
                  vGap(16),
                  AssignmentDescSection(
                    assignmentModel: assignmentModel,
                  ),
                  vGap(16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            GoRouter.of(context).push(
                              PdfWebViewPage.routeName,
                              extra: assignmentModel.file,
                            );
                          },
                          text: S.of(context).preview,
                        ),
                      ),
                      hGap(20),
                      Expanded(
                        child: CustomButton(
                            onTap: () async {
                              await downloadPdfFile(
                                context,
                                assignmentModel.file,
                                assignmentModel.title,
                              );
                            },
                            text: S.of(context).download),
                      ),
                    ],
                  ),
                  FlavorsFunctions.isStudent()
                      ? Column(children: [
                          vGap(20),
                          BlocBuilder<GetAssignmentAnswerStatusCubit,
                              GetAssignmentAnswerStatusState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () => const SizedBox(),
                                success: (data) {
                                  return AssignmentDetailsSection(
                                    answerStatus: data.data.answerStatus,
                                  );
                                },
                              );
                            },
                          )
                        ])
                      : const SizedBox(),
                  vGap(20),
                  FlavorsFunctions.isStudent()
                      ? assignmentModel.status != "finished"
                          ? AssignmentSolutionUploadButton(
                              assignmentModel: assignmentModel,
                            )
                          : const SizedBox()
                      : const SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> downloadPdfFile(
    BuildContext context, String url, String title) async {
  try {
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied')),
      );
      return;
    }

    Dio dio = Dio();

    Directory dir = Directory('/storage/emulated/0/Download');

    String fileName = title;

    String savePath = '${dir.path}/$fileName';

    await dio.download(
      'https://$url',
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          debugPrint(
              "Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded to: $savePath')),
    );
  } catch (e) {
    debugPrint('Download error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download failed')),
    );
  }
}
