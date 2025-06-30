import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/questions_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_questions_state.dart';
part 'filter_questions_cubit.freezed.dart';

class FilterQuestionsCubit extends Cubit<FilterQuestionsState> {
  final QuestionsRepo _repo;
  FilterQuestionsCubit(this._repo) : super(const FilterQuestionsState.initial());

  Future<void> getFilteredQuestions({
    int? page,
    int? department,
    int? semester,
    bool? likes,
    bool? myQuestions,
  }) async {
    emit(const FilterQuestionsState.filterQuestionsLoading());
    final result = await _repo.getFilteredQuestions(
      page: page,
      department: department,
      semester: semester,
      likes: likes,
      myQuestions: myQuestions,
    );

    result.when(
      success: (data) {
        emit(FilterQuestionsState.filterQuestionsSuccess(data));
      },
      failure: (error) {
        emit(FilterQuestionsState.filterQuestionsFailure(error.getAllMessages()));
      },
    );
  }
}
