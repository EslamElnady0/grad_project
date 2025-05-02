import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/quizes/data/repos/quizzes_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_quiz_by_id_state.dart';
part 'get_quiz_by_id_cubit.freezed.dart';

class GetQuizByIdCubit extends Cubit<GetQuizByIdState> {
  final QuizzesRepo _repo;
  GetQuizByIdCubit(this._repo) : super(const GetQuizByIdState.initial());

  Future<void> getQuizById(String quizId) async {
    emit(const GetQuizByIdState.getQuizByIdLoading());
    final result = await _repo.getQuizById(quizId);
    result.when(
      success: (data) {
        emit(GetQuizByIdState.getQuizByIdSuccess(data));
      },
      failure: (error) {
        emit(GetQuizByIdState.getQuizByIdFailure(error.getAllMessages()));
      },
    );
  }
}
