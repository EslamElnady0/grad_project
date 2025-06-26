import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/quizes/data/repos/quizzes_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/create_quiz_request_model.dart';
part 'update_quiz_state.dart';
part 'update_quiz_cubit.freezed.dart';

class UpdateQuizCubit extends Cubit<UpdateQuizState> {
  final QuizzesRepo _repo;
  UpdateQuizCubit(this._repo) : super(const UpdateQuizState.initial());

  Future<void> updateQuiz(
    String quizId,
    QuizRequestModel quizRequestModel,
  ) async {
    emit(const UpdateQuizState.updateQuizLoading());
    final result = await _repo.updateQuiz(quizId, quizRequestModel);
    result.when(
      success: (data) {
        emit(UpdateQuizState.updateQuizSuccess(data));
      },
      failure: (error) {
        emit(UpdateQuizState.updateQuizFailure(error.getAllMessages()));
      },
    );
  }
}
