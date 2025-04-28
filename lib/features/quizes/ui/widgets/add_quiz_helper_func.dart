import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/create_quiz_request_model.dart';
import '../cubit/add_quiz_cubit/add_quiz_cubit.dart';
import '../models/question_data.dart';

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyles.font12WhiteMedium,
      ),
    ),
  );
}

bool validateQuestions(
    List<QuestionData> questionDataList, BuildContext context) {
  for (final questionData in questionDataList) {
    if (questionData.question.isEmpty) {
      showErrorSnackBar(context, S.of(context).incompleteQuestionError);
      return false;
    }
    if (questionData.answers.every((answer) => answer.isEmpty)) {
      showErrorSnackBar(context, S.of(context).incompleteQuestionError);
      return false;
    }
    if (questionData.selectedAnswerIndex == null) {
      showErrorSnackBar(context, S.of(context).incompleteQuestionError);
      return false;
    }
  }
  return true;
}

List<QuestionModel> buildNewQuestions(List<QuestionData> questionDataList) {
  return questionDataList.asMap().entries.map((entry) {
    final questionData = entry.value;
    return QuestionModel(
      question: questionData.question,
      answers: questionData.answers.asMap().entries.map((answerEntry) {
        final answerIndex = answerEntry.key;
        return AnswerModel(
          answer: answerEntry.value,
          isCorrect: questionData.selectedAnswerIndex == answerIndex ? 1 : 0,
        );
      }).toList(),
    );
  }).toList();
}

void scrollToTop(AddQuizCubit cubit) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (cubit.scrollController.hasClients) {
      cubit.scrollController.animateTo(
        cubit.scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  });
}

bool validateDateAndTime(AddQuizCubit cubit, BuildContext context) {
  if (cubit.selectedDate == null ||
      cubit.selectedDate!.isEmpty ||
      cubit.selectedStartTime == null ||
      cubit.selectedStartTime!.isEmpty) {
    showErrorSnackBar(context, S.of(context).dateAndTimeError);
    return false;
  }
  return true;
}

void scrollToElement(AddQuizCubit cubit, GlobalKey key) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!cubit.scrollController.hasClients) return;

    final context = key.currentContext;
    if (context == null) return;

    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) return;

    // Find the CustomScrollView's render object
    final scrollViewRenderObject = cubit
        .scrollController.position.context.notificationContext
        ?.findRenderObject();
    if (scrollViewRenderObject is! RenderBox) return;

    // Calculate the offset relative to the CustomScrollView to align the element's top with the viewport's top
    final offset = renderObject
        .localToGlobal(Offset.zero, ancestor: scrollViewRenderObject)
        .dy;

    final position = cubit.scrollController.position;

    // Ensure the offset is within bounds
    final targetOffset = offset.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    cubit.scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  });
}
