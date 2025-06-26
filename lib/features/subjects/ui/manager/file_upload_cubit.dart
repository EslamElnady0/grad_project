import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUploadCubit extends Cubit<List<PlatformFile>> {
  FileUploadCubit() : super([]);

  bool _isPickingFiles = false;

  void pickFiles() async {
    if (_isPickingFiles) return; 
    _isPickingFiles = true;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );

      if (result != null) {
        emit([...state, ...result.files]);
      }
    } catch (e) {
      // Handle any exceptions if needed
      print('Error picking files: $e');
    } finally {
      _isPickingFiles = false; // Reset the flag
    }
  }

  void removeFile(int index) {
    final updatedFiles = List<PlatformFile>.from(state);
    updatedFiles.removeAt(index);
    emit(updatedFiles);
  }
}
