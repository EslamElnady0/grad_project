import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/publish_row.dart';
import 'package:grad_project/features/annoucements/ui/widgets/title_and_desc_text_fields.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_request_model.dart';
import 'package:grad_project/features/quizes/ui/widgets/add_quiz_helper_func.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/quizzes_cubit/quizzes_cubit.dart';
import '../cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'add_quiz_drop_downs.dart';
import 'question_list_widget.dart';
import 'quiz_date_and_time_pickers.dart';
import 'schedule_quiz_text.dart';

class AddQuizViewBody extends StatelessWidget {
  final int courseId;
  const AddQuizViewBody({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    final addQuizCubit = context.read<AddQuizCubit>();
    final questionListCubit = context.read<QuestionListCubit>();
    final quizzesCubit = context.read<QuizzesCubit>();
    GlobalKey dateTimePickerKey = GlobalKey();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: CustomScrollView(
        controller: addQuizCubit.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInnerScreensAppBar(title: S.of(context).createQuiz),
                vGap(4),
                TitleTextWidget(text: S.of(context).quizHelperText),
                vGap(22),
                TitleAndDescTextFields(
                  formKey: addQuizCubit.formKey,
                  titleController: addQuizCubit.titleController,
                  descController: addQuizCubit.descController,
                  title: S.of(context).quizTitle,
                  titleHintText: S.of(context).quizTitleHelper,
                  desc: S.of(context).quizDescription,
                  descHintText: S.of(context).quizDescriptionHelper,
                ),
                vGap(12),
                const AddQuizDropDowns(),
                vGap(14),
                ScheduleQuizText(dateTimePickerKey: dateTimePickerKey),
                vGap(12),
                const QuizDateAndTimePickers(),
                vGap(12),
                Text(
                  S.of(context).questions,
                  style: AppTextStyles.font14BlackLightSemibold
                      .copyWith(color: AppColors.darkerBlue),
                ),
                vGap(12),
              ],
            ),
          ),
          const QuestionListWidget(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                vGap(12),
                FloatingActionButton(
                  onPressed: () {
                    questionListCubit.addQuestion(
                      context: context,
                      selectedQuestionsCount:
                          addQuizCubit.selectedQuestionsCount,
                      scrollController: addQuizCubit.scrollController,
                    );
                  },
                  backgroundColor: AppColors.darkblue,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                vGap(20),
                PublishRow(
                  onTap: () async {
                    if (!addQuizCubit.formKey.currentState!.validate()) {
                      scrollToTop(addQuizCubit);
                      return;
                    }
                    if (!validateDateAndTime(addQuizCubit, context)) {
                      scrollToElement(
                        addQuizCubit,
                        dateTimePickerKey,
                      );
                      return;
                    }
                    final questionDataList = questionListCubit.state;
                    if (!validateQuestions(questionDataList, context)) {
                      return;
                    }

                    final newQuestions = buildNewQuestions(questionDataList);
                    final createQuizRequestModel = QuizRequestModel(
                      courseId: courseId.toString(),
                      title: addQuizCubit.titleController.text,
                      description: addQuizCubit.descController.text,
                      totalDegree: addQuizCubit.finalDegree.toString(),
                      questionDegree:
                          addQuizCubit.selectedQuestionGrade.toString(),
                      date: addQuizCubit.selectedDate!,
                      startTime: addQuizCubit.selectedStartTime!,
                      duration: addQuizCubit.selectedTime.toString(),
                      newQuestions: newQuestions,
                    );

                    quizzesCubit.createQuiz(createQuizRequestModel);
                  },
                ),
                vGap(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
