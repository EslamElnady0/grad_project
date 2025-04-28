import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'custom_radio_button.dart';

class QuestionContainer extends StatefulWidget {
  final int index;
  const QuestionContainer({super.key, required this.index});

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _answerControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  List<String> answersLetters = ['A', 'B', 'C', 'D'];
  int? _selectedAnswerIndex;

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    '${widget.index + 1}- ',
                    style: AppTextStyles.font12GraySemiBold,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _questionController,
                      decoration: InputDecoration(
                        hintText: 'Enter your question',
                        hintStyle: AppTextStyles.font12GrayMedium,
                        border: InputBorder.none,
                      ),
                      style: AppTextStyles.font12GrayMedium,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Answer Fields
            ...List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Custom Radio Button
                    CustomRadioButton(
                      value: index,
                      groupValue: _selectedAnswerIndex,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedAnswerIndex = value;
                        });
                      },
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      "${answersLetters[index]}) ",
                      style: AppTextStyles.font12GraySemiBold,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _answerControllers[index],
                        decoration: InputDecoration(
                          hintText: 'Enter answer ${index + 1}',
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
