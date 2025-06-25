import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/quiz_details_response.dart';
import '../../data/repos/quizzes_repo.dart';

part 'quiz_details_state.dart';
part 'quiz_details_cubit.freezed.dart';

class QuizDetailsCubit extends Cubit<QuizDetailsState> {
  final QuizzesRepo repo;
  QuizDetailsCubit(this.repo) : super(const QuizDetailsState.initial());

  Future<void> fetchQuizDetails(String quizId) async {
    emit(const QuizDetailsState.loading());
    final result = await repo.getStudentsQuizAnswers(quizId);
    result.when(
      success: (data) => emit(QuizDetailsState.success(data)),
      failure: (error) =>
          emit(QuizDetailsState.failure(error.getAllMessages())),
    );
  }
}
