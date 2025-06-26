import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/quiz_details_cubit/quiz_details_cubit.dart';
import '../models/student_answers_review_navigation.dart';
import '../views/students_answers_review_view.dart';
import 'student_result_tile.dart';

class StudentsResultsListViewBlocBuilder extends StatelessWidget {
  const StudentsResultsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizDetailsCubit, QuizDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
              child: CircularProgressIndicator(
            color: AppColors.darkblue,
          )),
          failure: (error) => Center(child: Text(error)),
          success: (data) {
            final students = data.data.students;
            final maxDegree = data.data.maxDegree;
            if (students.isEmpty) {
              return Center(
                  child: Text(S.of(context).noStudentsFound,
                      style: AppTextStyles.font16BlackBold));
            }
            return ListView.separated(
              itemCount: students.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final student = students[index];
                return StudentResultTile(
                  quizId: data.data.id,
                  student: student,
                  maxDegree: maxDegree,
                  onTap: () {
                    GoRouter.of(context).push(
                        StudentsAnswersReviewView.routeName,
                        extra: StudentAnswersReviewNavigation(
                            quizId: data.data.id.toString(),
                            studentId: student.studentId.toString()));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
