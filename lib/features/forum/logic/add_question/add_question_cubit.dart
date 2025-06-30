import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/forum/data/repos/questions_repo.dart';

part 'add_question_state.dart';

class AddQuestionCubit extends Cubit<AddQuestionState> {
  final QuestionsRepo _questionsRepo;

  AddQuestionCubit(this._questionsRepo) : super(AddQuestionInitial());

  void addQuestion({
    required String body,
    String? image,
  }) async {
    emit(AddQuestionLoading());
    
    final result = await _questionsRepo.addQuestion(
      body: body,
      image: image,
    );
    
    result.when(
      success: (data) {
        emit(AddQuestionSuccess(data));
      },
      failure: (error) {
        emit(AddQuestionFailure(error: error.message ?? 'An error occurred'));
      },
    );
  }
}
