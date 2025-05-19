import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerCubit extends Cubit<FilePickerState> {
  FilePickerCubit() : super(FilePickerInitial());

  Future<void> pickImages(BuildContext context) async {
    emit(FilePickerLoading());
    try {
      final picker = ImagePicker();
      final images = await picker.pickMultiImage();
      if (images.isNotEmpty) {
        final files = images.map((image) => File(image.path)).toList();
        emit(FilePickerSuccess(files: state.files..addAll(files)));
      } else {
        emit(FilePickerSuccess(files: state.files));
      }
    } catch (e) {
      emit(FilePickerError(message: "error picking file"));
    }
  }

  Future<void> pickFiles(BuildContext context) async {
    emit(FilePickerLoading());
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );
      if (result != null && result.files.isNotEmpty) {
        final files = result.paths.map((path) => File(path!)).toList();
        emit(FilePickerSuccess(files: state.files..addAll(files)));
      } else {
        emit(FilePickerSuccess(files: state.files));
      }
    } catch (e) {
      emit(FilePickerError(message: "error picking file"));
    }
  }

  void removeFile(int index) {
    final updatedFiles = List<File>.from(state.files)..removeAt(index);
    emit(FilePickerSuccess(files: updatedFiles));
  }

  void clearFiles() {
    emit(FilePickerSuccess(files: []));
  }
}

class FilePickerState {
  final List<File> files;
  FilePickerState(this.files);
}

class FilePickerInitial extends FilePickerState {
  FilePickerInitial() : super([]);
}

class FilePickerLoading extends FilePickerState {
  FilePickerLoading() : super([]);
}

class FilePickerSuccess extends FilePickerState {
  FilePickerSuccess({required List<File> files}) : super(files);
}

class FilePickerError extends FilePickerState {
  final String message;
  FilePickerError({required this.message}) : super([]);
}
