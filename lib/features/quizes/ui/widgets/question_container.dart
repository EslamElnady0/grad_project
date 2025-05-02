import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import '../../../../core/helpers/debouncer.dart';
import '../models/question_data.dart';
import 'custom_radio_button.dart';
import 'question_list_widget.dart';

class QuestionContainer extends StatefulWidget {
  final QuestionData questionData;
  final int index;
  const QuestionContainer({
    super.key,
    required this.index,
    required this.questionData,
  });

  @override
  _QuestionContainerState createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  late final TextEditingController questionController;
  late final List<TextEditingController> answerControllers;
  late final Debouncer questionDebouncer;
  late final List<Debouncer> answerDebouncers;

  @override
  void initState() {
    super.initState();
    // Initialize with widget.questionData
    questionController =
        TextEditingController(text: widget.questionData.question);
    answerControllers = widget.questionData.answers
        .asMap()
        .entries
        .map((entry) => TextEditingController(text: entry.value))
        .toList();

    questionDebouncer = Debouncer(delay: const Duration(milliseconds: 500));
    answerDebouncers = List.generate(
      4, // Always initialize 4 debouncers
      (_) => Debouncer(delay: const Duration(milliseconds: 500)),
    );

    questionController.addListener(() {
      questionDebouncer.run(() {
        context
            .read<QuestionListCubit>()
            .updateQuestion(widget.index, questionController.text);
      });
    });

    for (int i = 0; i < answerControllers.length; i++) {
      answerControllers[i].addListener(() {
        answerDebouncers[i].run(() {
          context
              .read<QuestionListCubit>()
              .updateAnswer(widget.index, i, answerControllers[i].text);
        });
      });
    }
  }

  @override
  void dispose() {
    questionController.dispose();
    for (var controller in answerControllers) {
      controller.dispose();
    }
    questionDebouncer.dispose();
    for (var debouncer in answerDebouncers) {
      debouncer.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionData = widget.questionData;
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    '${widget.index + 1}- ',
                    style: AppTextStyles.font12GraySemiBold,
                  ),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                      controller: questionController,
                      decoration: InputDecoration(
                        hintText: 'Enter your question',
                        hintStyle: AppTextStyles.font12GrayMedium,
                        border: InputBorder.none,
                      ),
                      style: AppTextStyles.font12BlackMedium,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ...List.generate(4, (answerIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomRadioButton(
                      value: answerIndex,
                      groupValue: questionData.selectedAnswerIndex,
                      onChanged: (int? value) {
                        context
                            .read<QuestionListCubit>()
                            .selectCorrectAnswer(widget.index, value);
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
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                        controller: answerControllers[answerIndex],
                        decoration: InputDecoration(
                          hintText: 'Enter answer ${answerIndex + 1}',
                          hintStyle: AppTextStyles.font12GrayMedium,
                          border: InputBorder.none,
                        ),
                        maxLines: null,
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
  }
}
