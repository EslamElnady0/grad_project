import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/get_quizzes_request_query_params_model.dart';
import '../../data/repos/quizzes_repo.dart';
part 'get_quizzes_state.dart';
part 'get_quizzes_cubit.freezed.dart';

class GetQuizzesCubit extends Cubit<GetQuizzesState> {
  final QuizzesRepo _repo;
  GetQuizzesCubit(this._repo) : super(const GetQuizzesState.initial());
  Future<void> getQuizzes({
    required String courseId,
    required String quizStatus,
    required String fromDate,
  }) async {
    emit(const GetQuizzesState.getQuizzesLoading());
    final result = await _repo.getQuizzes(
      GetQuizzesRequestQueryParamsModel(
        courseId: courseId,
        quizStatus: quizStatus,
        fromDate: fromDate,
      ),
    );
    result.when(
      success: (data) => emit(GetQuizzesState.getQuizzesSuccess(data)),
      failure: (error) =>
          emit(GetQuizzesState.getQuizzesFailure(error.getAllMessages())),
    );
  }
}
