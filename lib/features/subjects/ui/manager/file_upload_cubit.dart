import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;

// Custom class to track file metadata
class FileWithMetadata {
  final PlatformFile platformFile;
  final bool isExisting;
  final String? originalUrl;

  FileWithMetadata({
    required this.platformFile,
    this.isExisting = false,
    this.originalUrl,
  });
}

class FileUploadCubit extends Cubit<List<FileWithMetadata>> {
  FileUploadCubit() : super([]);

  bool _isPickingFiles = false;

void pickFiles({required bool isSingleFileMode}) async {
  if (_isPickingFiles) return;
  _isPickingFiles = true;

  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: !isSingleFileMode, // لو single, ميسمحش باختيار أكتر من واحد
    );

    if (result != null) {
      final newFiles = result.files.map((file) => FileWithMetadata(
        platformFile: file,
        isExisting: false,
      )).toList();

      if (isSingleFileMode) {
        // استبدل القائمة كلها بالملف الجديد
        emit(newFiles);
      } else {
        emit([...state, ...newFiles]);
      }
    }
  } catch (e) {
    print('Error picking files: $e');
  } finally {
    _isPickingFiles = false;
  }
}


  void removeFile(int index) {
    final updatedFiles = List<FileWithMetadata>.from(state);
    updatedFiles.removeAt(index);
    emit(updatedFiles);
  }

  // Add method to load existing files from URLs
  void loadExistingFiles(List<String> fileUrls) {
    print('FileUploadCubit: Loading ${fileUrls.length} existing files');
    final existingFiles = fileUrls.map((url) {
      final fileName = _getFileNameFromUrl(url);
      print('Creating file: $fileName from URL: $url');
      return FileWithMetadata(
        platformFile: PlatformFile(
          name: fileName,
          size: 0, // Size unknown for existing files
          path: null, // No local path for existing files
          bytes: null,
        ),
        isExisting: true,
        originalUrl: url,
      );
    }).toList();
    
    print('Emitting ${existingFiles.length} existing files');
    emit(existingFiles);
  }

  String _getFileNameFromUrl(String url) {
    try {
      final uri = Uri.parse(url);
      final fileName = path.basename(uri.path);
      return fileName.isNotEmpty ? fileName : 'Unknown File';
    } catch (e) {
      return 'Unknown File';
    }
  }

  // Clear all files
  void clearFiles() {
    emit([]);
  }

  // Get only newly picked files (for API submission)
  List<PlatformFile> getNewFiles() {
    return state
        .where((fileWithMeta) => !fileWithMeta.isExisting)
        .map((fileWithMeta) => fileWithMeta.platformFile)
        .toList();
  }

  // Get existing file URLs
  List<String> getExistingFileUrls() {
    return state
        .where((fileWithMeta) => fileWithMeta.isExisting)
        .map((fileWithMeta) => fileWithMeta.originalUrl!)
        .toList();
  }
}
