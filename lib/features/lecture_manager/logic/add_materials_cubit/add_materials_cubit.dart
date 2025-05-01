import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/add_materials_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_materials_state.dart';
part 'add_materials_cubit.freezed.dart';

class AddMaterialsCubit extends Cubit<AddMaterialsState> {
  final AddMaterialsRepo _repo;
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

    FormData data = FormData.fromMap({
      'files': selectedFiles.map((file) {
        if (file.path != null) {
          return MultipartFile.fromFile(file.path!, filename: file.name);
        } else {
          // You can handle the error or provide a default value here
          return MultipartFile.fromFile('',
              filename: file.name); // Empty string as fallback
        }
      }).toList(),
      'title': title,
      'week': (weekNumber + 1).toString(),
      'type': typeWord,
      'material': selectedFiles.isNotEmpty
          ? await MultipartFile.fromFile(selectedFiles.first.path!,
              filename: selectedFiles.first.name)
          : null, // Make sure material is a file
    });

    final result = await _repo.upload(
      id: id,
      data: data,
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
