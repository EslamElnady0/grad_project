part of '../../widgets/question_list_widget.dart';

class QuestionListCubit extends Cubit<List<QuestionData>> {
  QuestionListCubit()
      : super([
          QuestionData(
            question: '',
            answers: ['', '', '', ''],
            selectedAnswerIndex: null,
          )
        ]);

  void addQuestion({
    required BuildContext context,
    required int selectedQuestionsCount,
    required ScrollController scrollController,
  }) {
    if (state.length >= selectedQuestionsCount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).maximumNumberOfQuestions,
            style: AppTextStyles.font12WhiteMedium,
          ),
        ),
      );
      return;
    }

    final updatedList = List<QuestionData>.from(state)
      ..add(QuestionData(
        question: '',
        answers: ['', '', '', ''],
        selectedAnswerIndex: null,
      ));
    emit(updatedList);

    // Schedule scroll to max extent after the frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void updateQuestion(int index, String question) {
    final updatedList = List<QuestionData>.from(state);
    updatedList[index] = updatedList[index].copyWith(question: question);
    emit(updatedList);
  }

  void updateAnswer(int questionIndex, int answerIndex, String answer) {
    final updatedList = List<QuestionData>.from(state);
    final updatedAnswers =
        List<String>.from(updatedList[questionIndex].answers);
    updatedAnswers[answerIndex] = answer;
    updatedList[questionIndex] =
        updatedList[questionIndex].copyWith(answers: updatedAnswers);
    emit(updatedList);
  }

  void selectCorrectAnswer(int questionIndex, int? answerIndex) {
    final updatedList = List<QuestionData>.from(state);
    updatedList[questionIndex] =
        updatedList[questionIndex].copyWith(selectedAnswerIndex: answerIndex);
    emit(updatedList);
  }
}
