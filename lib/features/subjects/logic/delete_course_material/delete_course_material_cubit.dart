import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grad_project/features/subjects/data/repos/add_materials_repo.dart';



part 'delete_course_material_state.dart';
part 'delete_course_material_cubit.freezed.dart';

class DeleteCourseMaterialCubit extends Cubit<DeleteCourseMaterialState> {
  final SubjectsRepo _repo;

  DeleteCourseMaterialCubit(this._repo) : super(const DeleteCourseMaterialState.initial());

  Future<void> deleteCourseMaterial(int id) async {
    
    emit(const DeleteCourseMaterialState.deleteCourseMaterialLoading());
    final result = await _repo.deleteCourseMaterial(id);

    result.when(
      success: (data) => emit(DeleteCourseMaterialState.deleteCourseMaterialSuccess(data)),
      failure: (error) => emit(DeleteCourseMaterialState.deleteCourseMaterialFailure(error.getAllMessages())),
    );
  }
}  