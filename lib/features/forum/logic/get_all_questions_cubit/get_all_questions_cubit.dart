import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/questions_repo.dart';
import '../../data/models/get_all_questions_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_questions_state.dart';
part 'get_all_questions_cubit.freezed.dart';

class GetAllQuestionsCubit extends Cubit<GetAllQuestionsState> {
  final QuestionsRepo _repo;
  GetAllQuestionsCubit(this._repo) : super(const GetAllQuestionsState.initial());

  List<QuestionModel> _allQuestions = [];
  int _currentPage = 1;
  bool _hasMoreData = true;
  bool _isLoadingMore = false;

  Future<void> getAllQuestions({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _hasMoreData = true;
      _allQuestions.clear();
    }

    emit(const GetAllQuestionsState.getAllQuestionsLoading());
    final result = await _repo.getAllQuestions(page: _currentPage);

    result.when(
      success: (data) {
        if (data.questions != null) {
          _allQuestions.addAll(data.questions!);
          _hasMoreData = data.questions!.isNotEmpty;
        }
        emit(GetAllQuestionsState.getAllQuestionsSuccess(
          GetAllQuestionsResponseModel(
            questions: _allQuestions,
            totalQuestions: data.totalQuestions,
          ),
        ));
      },
      failure: (error) {
        emit(GetAllQuestionsState.getAllQuestionsFailure(error.getAllMessages()));
      },
    );
  }

  Future<void> loadMoreQuestions() async {
    if (_isLoadingMore || !_hasMoreData) return;

    _isLoadingMore = true;
    _currentPage++;
    emit(const GetAllQuestionsState.loadingMoreQuestions());

    final result = await _repo.getAllQuestions(page: _currentPage);

    result.when(
      success: (data) {
        _isLoadingMore = false;
        if (data.questions != null && data.questions!.isNotEmpty) {
          _allQuestions.addAll(data.questions!);
          // تحديث شرط _hasMoreData: إذا كان عدد البيانات العائدة أقل من 10، فلا يوجد المزيد
          _hasMoreData = data.questions!.length >= 10;
        } else {
          _hasMoreData = false;
        }
        
        emit(GetAllQuestionsState.getAllQuestionsSuccess(
          GetAllQuestionsResponseModel(
            questions: _allQuestions,
            totalQuestions: data.totalQuestions,
          ),
        ));
      },
      failure: (error) {
        _isLoadingMore = false;
        _currentPage--; // Revert page increment on failure
        emit(GetAllQuestionsState.getAllQuestionsFailure(error.getAllMessages()));
      },
    );
  }

  bool get hasMoreData => _hasMoreData;
  bool get isLoadingMore => _isLoadingMore;
  List<QuestionModel> get questions => List.unmodifiable(_allQuestions);
}
