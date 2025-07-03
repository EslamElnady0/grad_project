import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/get_quizzes_request_query_params_model.dart';
import '../../data/models/get_quizzes_response.dart';
import '../../data/repos/quizzes_repo.dart';
part 'get_quizzes_state.dart';
part 'get_quizzes_cubit.freezed.dart';

class GetQuizzesCubit extends Cubit<GetQuizzesState> {
  final QuizzesRepo _repo;
  List<QuizModel> _allQuizzes = [];
  String _searchQuery = '';

  GetQuizzesCubit(this._repo) : super(const GetQuizzesState.initial());

  List<QuizModel> get filteredQuizzes {
    if (_searchQuery.isEmpty) return _allQuizzes;
    return _allQuizzes.where((quiz) {
      final title = quiz.title.toLowerCase();
      final description = quiz.description.toLowerCase();
      return title.contains(_searchQuery) || description.contains(_searchQuery);
    }).toList();
  }

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
      success: (data) {
        _allQuizzes = data.data;
        emit(GetQuizzesState.getQuizzesSuccess(data));
      },
      failure: (error) =>
          emit(GetQuizzesState.getQuizzesFailure(error.getAllMessages())),
    );
  }

  void updateSearchQuery(String query) {
    _searchQuery = query.trim().toLowerCase();
    emit(GetQuizzesState.getQuizzesSuccess(
      GetQuizzesResponse(code: 200, data: filteredQuizzes),
    ));
  }
}
