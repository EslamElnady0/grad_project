import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/student_quiz_answers_response.dart';
import '../../data/repos/quizzes_repo.dart';

part 'student_quiz_answers_state.dart';
part 'student_quiz_answers_cubit.freezed.dart';

class StudentQuizAnswersCubit extends Cubit<StudentQuizAnswersState> {
  final QuizzesRepo repo;
  StudentQuizAnswersCubit(this.repo)
      : super(const StudentQuizAnswersState.initial());

  Future<void> fetchStudentQuizAnswers(String quizId, String studentId) async {
    emit(const StudentQuizAnswersState.loading());
    final result = await repo.getStudentQuizAnswers(quizId, studentId);
    result.when(
      success: (data) => emit(StudentQuizAnswersState.success(data)),
      failure: (error) =>
          emit(StudentQuizAnswersState.failure(error.getAllMessages())),
    );
  }

  Future<void> fetchStudentQuizAnswersForHimself(String quizId) async {
    emit(const StudentQuizAnswersState.loading());
    final result = await repo.getStudentQuizAnswersForHimself(quizId);
    result.when(
      success: (data) => emit(StudentQuizAnswersState.success(data)),
      failure: (error) =>
          emit(StudentQuizAnswersState.failure(error.getAllMessages())),
    );
  }
}
