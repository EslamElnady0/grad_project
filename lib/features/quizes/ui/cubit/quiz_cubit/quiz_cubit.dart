import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  final Map<int, String> selectedAnswers = {}; // Key = questionIndex

  void selectAnswer(int questionIndex, String answer) {
    selectedAnswers[questionIndex] = answer;
    emit(QuizAnswerSelected());
  }

  String? getSelectedAnswer(int questionIndex) {
    return selectedAnswers[questionIndex];
  }

  void clearAnswer(int questionIndex) {
    selectedAnswers.remove(questionIndex);
    emit(QuizInitial());
  }
}
