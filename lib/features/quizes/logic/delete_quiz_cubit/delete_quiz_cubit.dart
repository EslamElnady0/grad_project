import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repos/quizzes_repo.dart';
part 'delete_quiz_state.dart';
part 'delete_quiz_cubit.freezed.dart';

class DeleteQuizCubit extends Cubit<DeleteQuizState> {
  final QuizzesRepo _repo;
  DeleteQuizCubit(this._repo) : super(const DeleteQuizState.initial());

  Future<void> deleteQuiz(String quizId) async {
    emit(const DeleteQuizState.deleteQuizLoading());
    final result = await _repo.deleteQuiz(quizId);
    result.when(
      success: (data) {
        emit(DeleteQuizState.deleteQuizSuccess(data));
      },
      failure: (error) {
        emit(DeleteQuizState.deleteQuizFailure(error.getAllMessages()));
      },
    );
  }
}
