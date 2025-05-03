import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/quizes/data/repos/quizzes_repo.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_state.dart';

class GetStudentsQuizzesCubit extends Cubit<GetStudentsQuizzesState> {

  final QuizzesRepo quizzesRepo;
  GetStudentsQuizzesCubit(this.quizzesRepo)
      : super(const GetStudentsQuizzesState.initial());


  Future<void> getStudentsQuizzes() async {
    emit(const GetStudentsQuizzesState.getStudentsQuizzesLoading());
    final result = await quizzesRepo.getStudentQuizzes();

    result.when(
      success: (data) {
        emit(GetStudentsQuizzesState.getStudentsQuizzesSuccess(data));
      },
      failure: (error) {
        emit(GetStudentsQuizzesState.getStudentsQuizzesFailure(error.getAllMessages()));
      },
    );
  }
}
