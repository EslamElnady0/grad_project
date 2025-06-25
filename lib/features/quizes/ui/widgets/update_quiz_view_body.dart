import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/quizes/data/models/create_quiz_request_model.dart';
import 'package:grad_project/features/quizes/data/models/get_quiz_using_id_response.dart';
import 'package:grad_project/features/quizes/logic/get_quiz_by_id_cubit/get_quiz_by_id_cubit.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_inner_screens_app_bar.dart';
import '../../../../core/widgets/publish_row.dart';
import '../../../../generated/l10n.dart';
import '../../../annoucements/ui/widgets/title_and_desc_text_fields.dart';
import '../../../home/ui/widgets/title_text_widget.dart';
import '../../logic/update_quiz_cubit/update_quiz_cubit.dart';
import '../cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'add_quiz_drop_downs.dart';
import 'add_quiz_helper_func.dart';
import 'question_list_widget.dart';
import 'quiz_date_and_time_pickers.dart';
import 'schedule_quiz_text.dart';

class UpdateQuizViewBody extends StatelessWidget {
  const UpdateQuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final addQuizCubit = context.read<AddQuizCubit>();
    final questionListCubit = context.read<QuestionListCubit>();
    final updateQuizzesCubit = context.read<UpdateQuizCubit>();
    GlobalKey dateTimePickerKey = GlobalKey();
    return BlocBuilder<GetQuizByIdCubit, GetQuizByIdState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.darkblue,
            ),
          );
        },
        getQuizByIdSuccess: (data) {
          data as GetQuizByIdResponse;
          addQuizCubit.titleController.text = data.data.title;
          addQuizCubit.descController.text = data.data.description;
          addQuizCubit.selectedDate = DateFormat('yyyy/MM/dd', 'en_US')
              .format(DateTime.parse(data.data.date));
          addQuizCubit.selectedStartTime = data.data.startTime;
          addQuizCubit.selectedTime = data.data.duration;
          questionListCubit.addQuestionsFromApiCall(data.data.questions);

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: CustomScrollView(
              controller: addQuizCubit.scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInnerScreensAppBar(
                        title: S.of(context).editQuiz,
                      ),
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
                            scrollToElement(addQuizCubit, dateTimePickerKey);
                            return;
                          }
                          final questionDataList = questionListCubit.state;
                          if (!validateQuestions(questionDataList, context)) {
                            return;
                          }
                          final newQuestions =
                              buildNewQuestions(questionDataList);
                          final totalDegree = (questionDataList.length *
                                  addQuizCubit.selectedQuestionGrade)
                              .toString();
                          final quizRequestModel = QuizRequestModel(
                            courseId: data.data.course.id.toString(),
                            title: addQuizCubit.titleController.text,
                            description: addQuizCubit.descController.text,
                            totalDegree: totalDegree,
                            questionDegree:
                                addQuizCubit.selectedQuestionGrade.toString(),
                            date: addQuizCubit.selectedDate!,
                            startTime: addQuizCubit.selectedStartTime!,
                            duration: addQuizCubit.selectedTime.toString(),
                            newQuestions: newQuestions,
                          );
                          updateQuizzesCubit.updateQuiz(
                            data.data.id.toString(),
                            quizRequestModel,
                          );
                        },
                      ),
                      vGap(24),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
