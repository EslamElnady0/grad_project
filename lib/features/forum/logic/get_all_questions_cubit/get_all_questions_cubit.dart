import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/questions_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_questions_state.dart';
part 'get_all_questions_cubit.freezed.dart';

class GetAllQuestionsCubit extends Cubit<GetAllQuestionsState> {
  final QuestionsRepo _repo;
  GetAllQuestionsCubit(this._repo) : super(const GetAllQuestionsState.initial());

Future<void> getAllQuestions() async {
    emit(const GetAllQuestionsState.getAllQuestionsLoading());
    final result = await _repo.getAllQuestions();

    result.when(
      success: (data) {
        emit(GetAllQuestionsState.getAllQuestionsSuccess(data));
      },
      failure: (error) {
        emit(GetAllQuestionsState.getAllQuestionsFailure(error.getAllMessages()));
      },
    );
  }

}
