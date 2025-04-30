import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class AssignmentUploadCubit extends Cubit<PlatformFile?> {
  AssignmentUploadCubit() : super(null);

  bool _isPickingAssignment = false;

  void pickAssignment() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      print('Storage permission denied');
      return;
    }

    if (_isPickingAssignment) return; // Prevent multiple simultaneous calls
    _isPickingAssignment = true;

    debugPrint("1. Starting file picker...");
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      debugPrint("2. File picker returned: ${result != null}");

      if (result == null) {
        debugPrint("3. User cancelled file selection");
        return;
      }

      final file = result.files.first;
      debugPrint("""
    4. Selected File Details:
       Name: ${file.name}
       Size: ${file.size} bytes
       Path: ${file.path}
       Extension: ${file.extension}
    """);

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

  void removeAssignment() {
    emit(null);
  }
}
