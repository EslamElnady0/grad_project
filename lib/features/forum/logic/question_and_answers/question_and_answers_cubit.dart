import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grad_project/features/forum/data/repos/questions_repo.dart';



part 'question_and_answers_state.dart';
part 'question_and_answers_cubit.freezed.dart';

class QuestionAndAnswersCubit extends Cubit<QuestionAndAnswersState> {
  final QuestionsRepo _repo;

  QuestionAndAnswersCubit(this._repo) : super(const QuestionAndAnswersState.initial());

  Future<void> getQuestionAndAnswers(String questionId) async {
    emit(const QuestionAndAnswersState.loading());
    final result = await _repo.getQuestionAndAnswers(questionId);

    result.when(
      success: (data) => emit(QuestionAndAnswersState.success(data)),
      failure: (error) => emit(QuestionAndAnswersState.failure(error.getAllMessages())),
    );
  }
}