import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  String selectedAnswer = "";
  void selectAnswer(String answer) {
    selectedAnswer = answer;
    emit(QuizAnswerSelected());
  }

  void clearAnswer() {
    selectedAnswer = "";
    emit(QuizInitial());
  }
}
