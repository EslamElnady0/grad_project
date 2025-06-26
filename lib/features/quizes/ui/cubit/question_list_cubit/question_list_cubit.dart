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
    required ScrollController scrollController,
  }) {
    final updatedList = List<QuestionData>.from(state)
      ..add(QuestionData(
        question: '',
        answers: ['', '', '', ''],
        selectedAnswerIndex: null,
      ));
    emit(updatedList);

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

  void addQuestionsFromApiCall(List<Question> questions) {
    final updatedList = <QuestionData>[];
    for (var question in questions) {
      // Get the API answers and pad with empty strings to ensure 4 answers
      final apiAnswers = question.answers.map((e) => e.answer).toList();
      final paddedAnswers = List<String>.filled(4, '');
      for (int i = 0; i < apiAnswers.length && i < 4; i++) {
        paddedAnswers[i] = apiAnswers[i];
      }
      updatedList.add(QuestionData(
        question: question.question,
        answers: paddedAnswers,
        selectedAnswerIndex:
            question.answers.indexWhere((element) => element.correct == 1),
      ));
    }
    emit(updatedList);
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
