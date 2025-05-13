import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repos/quizzes_repo.dart';
part 'start_students_quiz_state.dart';
part 'start_students_quiz_cubit.freezed.dart';

class StartStudentsQuizCubit extends Cubit<StartStudentsQuizState> {
  final QuizzesRepo _repo;
  StartStudentsQuizCubit(this._repo)
      : super(const StartStudentsQuizState.initial());

  Future<void> startStudentsQuiz(String quizId) async {
    emit(const StartStudentsQuizState.startStudentsQuizLoading());
    final result = await _repo.startStudentsQuiz(quizId);
    result.when(success: (data) {
      emit(StartStudentsQuizState.startStudentsQuizSuccess(data));
    }, failure: (error) {
      emit(StartStudentsQuizState.startStudentsQuizFailure(
          error.getAllMessages()));
    });
  }
}
