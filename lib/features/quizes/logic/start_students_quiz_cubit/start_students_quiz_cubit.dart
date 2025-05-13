import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repos/quizzes_repo.dart';
part 'start_students_quiz_state.dart';
part 'start_students_quiz_cubit.freezed.dart';

class StartStudentsQuizCubit extends Cubit<StartStudentsQuizState> {
  final QuizzesRepo _repo;
  StartStudentsQuizCubit(this._repo)
      : super(const StartStudentsQuizState.initial());
}
