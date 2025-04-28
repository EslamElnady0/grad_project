import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/create_quiz_request_model.dart';
import '../../data/repos/quizzes_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'quizzes_state.dart';
part 'quizzes_cubit.freezed.dart';

class QuizzesCubit extends Cubit<QuizzesState> {
  final QuizzesRepo _repo;
  QuizzesCubit(this._repo) : super(const QuizzesState.initial());

  Future<void> createQuiz(CreateQuizRequestModel createQuizRequestModel) async {
    emit(const QuizzesState.quizzesLoading());
    final result = await _repo.createQuiz(createQuizRequestModel);
    result.when(success: (data) {
      emit(QuizzesState.quizzesSuccess(data));
    }, failure: (error) {
      emit(QuizzesState.quizzesFailure(error.getAllMessages()));
    });
  }
}
