import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/quizes/data/repos/quizzes_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/submit_quiz_request_body.dart';
part 'submit_quiz_state.dart';
part 'submit_quiz_cubit.freezed.dart';

class SubmitQuizCubit extends Cubit<SubmitQuizState> {
  final QuizzesRepo _repo;
  SubmitQuizCubit(this._repo) : super(const SubmitQuizState.initial());

  Future<void> submitQuiz(
      {required String quizId,
      required SubmitQuizRequestBody submitQuizRequestModel}) async {
    emit(const SubmitQuizState.submitQuizLoading());
    final result = await _repo.submitQuiz(
        quizId: quizId, submitQuizRequestModel: submitQuizRequestModel);
    result.when(
        failure: (error) =>
            emit(SubmitQuizState.submitQuizFailure(error.getAllMessages())),
        success: (data) => emit(SubmitQuizState.submitQuizSuccess(data)));
  }
}
