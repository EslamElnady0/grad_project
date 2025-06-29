import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/forum/data/repos/questions_repo.dart';

part 'add_answer_state.dart';

class AddAnswerCubit extends Cubit<AddAnswerState> {
  final QuestionsRepo _questionsRepo;

  AddAnswerCubit(this._questionsRepo) : super(AddAnswerInitial());

  void addAnswer({
    required String questionId,
    required String body,
    String? image,
  }) async {
    emit(AddAnswerLoading());
    
    final result = await _questionsRepo.addAnswer(
      questionId: questionId,
      body: body,
      image: image,
    );
    
    result.when(
      success: (data) {
        emit(AddAnswerSuccess(data));
      },
      failure: (error) {
        emit(AddAnswerFailure(error: error.message ?? 'An error occurred'));
      },
    );
  }
}
