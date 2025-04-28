class QuestionData {
  final String question;
  final List<String> answers;
  final int? selectedAnswerIndex;

  QuestionData({
    required this.question,
    required this.answers,
    required this.selectedAnswerIndex,
  });

  QuestionData copyWith({
    String? question,
    List<String>? answers,
    int? selectedAnswerIndex,
  }) {
    return QuestionData(
      question: question ?? this.question,
      answers: answers ?? this.answers,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
    );
  }
}
