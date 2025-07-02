import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_search_text_field.dart';
import 'package:grad_project/features/assignments/data/models/assignment_answers_model.dart';
import 'package:grad_project/features/assignments/presentation/views/pdf_web_view.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_analysis_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_desc_section.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_row.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_button.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/header_row.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentResultsViewBody extends StatefulWidget {
  const AssignmentResultsViewBody(
      {super.key, required this.assignmentAnswersModel});

  final AssignmentAnswersModel assignmentAnswersModel;

  @override
  State<AssignmentResultsViewBody> createState() => _AssignmentResultsViewBodyState();
}

class _AssignmentResultsViewBodyState extends State<AssignmentResultsViewBody> {
  late List<Answer> allAnswers;
  late List<Answer> filteredAnswers;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    allAnswers = widget.assignmentAnswersModel.data.answers;
    filteredAnswers = List.from(allAnswers);
    _searchController = TextEditingController();
  }

  void _onSearchChanged(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredAnswers = allAnswers.where((answer) {
        return answer.student.toLowerCase().contains(lowerQuery) ||
            answer.code.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    AssignmentDetails assignmentDetails = widget.assignmentAnswersModel.data;
    double averageScore = assignmentDetails.answers.isNotEmpty
        ? assignmentDetails.answers
                .map((e) => e.degree)
                .reduce((a, b) => a + b) /
            assignmentDetails.answers.length
        : 0;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(title: S.of(context).results),
            TitleTextWidget(
              text: S.of(context).assignment_correction_welcome_message,
            ),
            vGap(20),
            // const EvaluationRow(),
            AssignmentDescSection(
              description: assignmentDetails.description,
              date: assignmentDetails.date,
              time: assignmentDetails.time,
            ),
            vGap(20),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push(
                  PdfWebViewPage.routeName,
                  extra: assignmentDetails.fileUrl,
                );
              },
              text: S.of(context).preview,
            ),
            vGap(10),
            AssignmentAnalysisWidget(
              numberOfStudents: assignmentDetails.answers.length,
              averageScore: averageScore,
            ),
            vGap(10),
            CustomSearchTextField(
              controller: _searchController,
              hintText: S.of(context).enter_student_name_or_code,
              onChanged: _onSearchChanged,
            ),
            vGap(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 650.w,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const HeaderRow();
                      } else {
                        return AssignmentRow(
                          answer: filteredAnswers[index - 1],
                          totalDegree: assignmentDetails.totalDegree,
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return vGap(10);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredAnswers.length + 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
