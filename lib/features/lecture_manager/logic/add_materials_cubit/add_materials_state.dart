part of 'add_materials_cubit.dart';
@freezed
class AddMaterialsState<T> with _$AddMaterialsState {
  const factory AddMaterialsState.initial() = _Initial;
  const factory AddMaterialsState.addMaterialsLoading() = AddMaterialsLoading;
  const factory AddMaterialsState.addMaterialsSuccess(T data) = AddMaterialsSuccess<T>;
  const factory AddMaterialsState.addMaterialsFailure(String error) = AddMaterialsFailure;
}
