import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/annoucements/data/repos/annoucements_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_teacher_cources_state.dart';
part 'get_teacher_cources_cubit.freezed.dart';

class GetTeacherCourcesCubit extends Cubit<GetTeacherCourcesState> {
  final AnnoucementsRepo _repo;
  GetTeacherCourcesCubit(this._repo)
      : super(const GetTeacherCourcesState.initial());

  Future<void> getTeacherCourses() async {
    emit(const GetTeacherCourcesState.getTeacherCourcesLoading());
    final result = await _repo.getTeacherCourses();
    result.when(
      success: (data) {
        emit(GetTeacherCourcesState.getTeacherCourcesSuccess(data));
      },
      failure: (error) {
        emit(GetTeacherCourcesState.getTeacherCourcesFailure(
            error.getAllMessages()));
      },
    );
  }
}
