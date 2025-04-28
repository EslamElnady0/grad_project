import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import '../models/question_data.dart';
import 'custom_radio_button.dart';
import 'question_list_widget.dart';

// Widget to display a single question with four answer options
class QuestionContainer extends StatelessWidget {
  final int index;
  const QuestionContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionListCubit, List<QuestionData>>(
      builder: (context, questionDataList) {
        final questionData = questionDataList[index];
        final questionController =
            TextEditingController(text: questionData.question);
        final answerControllers = questionData.answers
            .asMap()
            .entries
            .map((entry) => TextEditingController(text: entry.value))
            .toList();

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question TextField
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}- ',
                        style: AppTextStyles.font12GraySemiBold,
                      ),
                      Expanded(
                        child: TextField(
                          controller: questionController,
                          decoration: InputDecoration(
                            hintText: 'Enter your question',
                            hintStyle: AppTextStyles.font12GrayMedium,
                            border: InputBorder.none,
                          ),
                          style: AppTextStyles.font12BlackMedium,
                          maxLines: null,
                          onChanged: (value) {
                            context
                                .read<QuestionListCubit>()
                                .updateQuestion(index, value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Answer Fields
                ...List.generate(4, (answerIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Custom Radio Button
                        CustomRadioButton(
                          value: answerIndex,
                          groupValue: questionData.selectedAnswerIndex,
                          onChanged: (int? value) {
                            context
                                .read<QuestionListCubit>()
                                .selectCorrectAnswer(index, value);
                          },
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          "${['A', 'B', 'C', 'D'][answerIndex]}) ",
                          style: AppTextStyles.font12GraySemiBold,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: answerControllers[answerIndex],
                            decoration: InputDecoration(
                              hintText: 'Enter answer ${answerIndex + 1}',
                              hintStyle: AppTextStyles.font12GrayMedium,
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                            onChanged: (value) {
                              context
                                  .read<QuestionListCubit>()
                                  .updateAnswer(index, answerIndex, value);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
