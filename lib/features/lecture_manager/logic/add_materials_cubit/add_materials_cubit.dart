import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/add_materials_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_materials_state.dart';
part 'add_materials_cubit.freezed.dart';
class AddMaterialsCubit extends Cubit<AddMaterialsState> {
  final AddMaterialsRepo _repo;
  AddMaterialsCubit(this._repo) : super(const AddMaterialsState.initial());


  Future<void> add(int materialId, dynamic addMaterialRequestModel) async {
    emit(const AddMaterialsState.addMaterialsLoading());
    final result = await _repo.createMaterial(
      materialId: materialId,
      addMaterialRequestModel: addMaterialRequestModel,
    );
    result.when(
      success: (response) {
        emit(AddMaterialsState.addMaterialsSuccess(response));
      },
      failure: (error) {
        emit(AddMaterialsState.addMaterialsFailure(error.getAllMessages()));
      },
    );
  }
}
