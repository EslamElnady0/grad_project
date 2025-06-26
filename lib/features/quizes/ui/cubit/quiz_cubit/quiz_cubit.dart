import 'package:bloc/bloc.dart';
import 'package:grad_project/features/quizes/data/models/submit_quiz_request_body.dart';
import 'package:meta/meta.dart';
import '../../../data/models/get_quiz_using_id_response.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  final SubmitQuizRequestBody submitQuizRequestModel =
      SubmitQuizRequestBody(questions: []);
  final Map<int, String> selectedAnswerIds = {};

  void initializeQuestions() {
    submitQuizRequestModel.questions = [];
    selectedAnswerIds.clear();
    emit(QuizInitial());
  }

  void selectAnswer(int questionIndex, String answerId) {
    selectedAnswerIds[questionIndex] = answerId;
    emit(QuizAnswerSelected());
  }

  String? getSelectedAnswer(int questionIndex) {
    return selectedAnswerIds[questionIndex];
  }

  void clearAnswer(int questionIndex) {
    selectedAnswerIds.remove(questionIndex);
    emit(QuizInitial());
  }

  void prepareSubmission(List<Question> quizQuestions) {
    submitQuizRequestModel.questions = selectedAnswerIds.entries.map((entry) {
      final questionIndex = entry.key;
      final answerId = entry.value;
      final question = quizQuestions[questionIndex];
      return QuestionSubmitionModel(
        questionId: question.id.toString(),
        answerId: answerId,
      );
    }).toList();
  }

  SubmitQuizRequestBody getSubmission() {
    return submitQuizRequestModel;
  }
}
