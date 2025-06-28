import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/add_materials_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_materials_state.dart';
part 'add_materials_cubit.freezed.dart';

class AddMaterialsCubit extends Cubit<AddMaterialsState> {
  final SubjectsRepo _repo;
  AddMaterialsCubit(this._repo) : super(const AddMaterialsState.initial());
  
  Future<void> addMaterials(
      {required int id,
      required int type,
      required List<PlatformFile> selectedFiles,
      required String title,
      required int weekNumber}) async {
    emit(const AddMaterialsState.addMaterialsLoading());
    String typeWord = type == 0
        ? "lecture"
        : type == 1
            ? "section"
            : "other";


FormData data = FormData();

for (var file in selectedFiles) {
  if (file.path != null) {
    data.files.add(MapEntry(
      'material[]',
      MultipartFile.fromFileSync(file.path!, filename: file.name),
    ));
  }
}

data.fields.add(MapEntry('title', title));
data.fields.add(MapEntry('week', (weekNumber + 1).toString()));
data.fields.add(MapEntry('type', typeWord));

    final result = await _repo.upload(
      id: id,
      data: data,
      onProgress: (sent, total) {
        double progress = sent / total;

        emit(AddMaterialsState.addMaterialsProgress(progress));
      },
    );

    result.when(
      success: (data) {
        emit(AddMaterialsState.addMaterialsSuccess(data));
      },
      failure: (error) {
        emit(AddMaterialsState.addMaterialsFailure(error.getAllMessages()));
      },
    );
  }

  Future<void> updateMaterials(
      {required int materialId,
      required int type,
      required List<PlatformFile> selectedFiles,
      required String title,
      required int weekNumber}) async {
    emit(const AddMaterialsState.addMaterialsLoading());
    String typeWord = type == 0
        ? "lecture"
        : type == 1
            ? "section"
            : "other";

FormData data = FormData();

for (var file in selectedFiles) {
  if (file.path != null) {
    data.files.add(MapEntry(
      'material',
      MultipartFile.fromFileSync(file.path!, filename: file.name),
    ));
  }
}

data.fields.add(MapEntry('title', title));
data.fields.add(MapEntry('week', weekNumber.toString()));
data.fields.add(MapEntry('type', typeWord));

    final result = await _repo.updateMaterial(
      materialId: materialId,
      data: data,
      onProgress: (sent, total) {
        double progress = sent / total;

        emit(AddMaterialsState.addMaterialsProgress(progress));
      },
    );

    result.when(
      success: (data) {
        emit(AddMaterialsState.addMaterialsSuccess(data));
      },
      failure: (error) {
        emit(AddMaterialsState.addMaterialsFailure(error.getAllMessages()));
      },
    );
  }
}
