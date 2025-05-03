import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentUploadCubit extends Cubit<PlatformFile?> {
  AssignmentUploadCubit() : super(null);

  void pickAssignment() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result == null) {
        return;
      }

      final file = result.files.first;

      if (file.path == null) {
        debugPrint("5. WARNING: File path is null!");
        return;
      }

      // Verify file exists
      final fileObj = File(file.path!);
      if (!await fileObj.exists()) {
        debugPrint("6. ERROR: File doesn't exist at path!");
        return;
      }

      debugPrint("7. File verified, emitting state...");
      emit(file);
    } catch (e) {
      debugPrint("8. EXCEPTION: ${e.toString()}");
      rethrow;
    }
  }

  void setAssignment(PlatformFile file) {
    emit(file);
  }

  void removeAssignment() {
    emit(null);
  }
}
