import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/presentation/views/pdf_web_view.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_desc_section.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_label_widget.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:permission_handler/permission_handler.dart';

class AssignmentDetailsViewBody extends StatelessWidget {
  const AssignmentDetailsViewBody({super.key, required this.assignmentModel});

  final AssignmentModel assignmentModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInnerScreensAppBar(title: S.of(context).assignment),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TitleTextWidget(text: S.of(context).testYourKnowledge),
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
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(
                              PdfWebViewPage.routeName,
                              extra: assignmentModel.file,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: Constants.secondaryGrad,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Center(
                                child: Text(S.of(context).preview,
                                    style: AppTextStyles.font16WhiteSemiBold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      hGap(20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await downloadPdfFile(
                                context, assignmentModel.file);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: Constants.secondaryGrad,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Center(
                                child: Text(S.of(context).download,
                                    style: AppTextStyles.font16WhiteSemiBold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> downloadPdfFile(BuildContext context, String url) async {
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

    String fileName = url.split('/').last;

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
