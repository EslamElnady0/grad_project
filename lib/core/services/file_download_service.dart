import 'dart:io';
import 'package:dio/dio.dart';
import 'package:grad_project/core/networking/dio_factory.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class FileDownloadService {
  static final FileDownloadService _instance = FileDownloadService._internal();
  factory FileDownloadService() => _instance;
  FileDownloadService._internal();

  late Dio? _dio;
  final Map<String, String> _downloadedFiles = {};

  /// Download a file from URL and save it locally
  Future<String?> downloadFile(
    String url,
    String fileName, {
    void Function(int, int)? onReceiveProgress,
  }) async {
    _dio = await DioFactory.getDio();
    try {
      // Check if file is already downloaded
      if (_downloadedFiles.containsKey(url)) {
        return _downloadedFiles[url];
      }

      // Get the documents directory
      Directory? documentsDirectory;
      if (Platform.isAndroid) {
        documentsDirectory = await getExternalStorageDirectory();
      } else {
        documentsDirectory = await getApplicationDocumentsDirectory();
      }

      if (documentsDirectory == null) {
        throw Exception('Could not access documents directory');
      }

      // Create downloads directory if it doesn't exist
      final downloadsDirectory =
          Directory('${documentsDirectory.path}/downloads');
      if (!await downloadsDirectory.exists()) {
        await downloadsDirectory.create(recursive: true);
      }

      // Create file path
      final filePath = '${downloadsDirectory.path}/$fileName';

      // Download the file
      await _dio!.download(
        url,
        filePath,
        onReceiveProgress: onReceiveProgress,
      );

      // Store the file path
      _downloadedFiles[url] = filePath;

      if (kDebugMode) {
        print('File downloaded successfully: $filePath');
      }

      return filePath;
    } catch (e) {
      if (kDebugMode) {
        print('Error downloading file: $e');
      }
      return null;
    }
  }

  /// Check if a file is already downloaded
  bool isFileDownloaded(String url) {
    return _downloadedFiles.containsKey(url);
  }

  /// Get the local path of a downloaded file
  String? getDownloadedFilePath(String url) {
    return _downloadedFiles[url];
  }

  /// Check if a file exists at the given path
  Future<bool> fileExists(String filePath) async {
    try {
      final file = File(filePath);
      return await file.exists();
    } catch (e) {
      return false;
    }
  }

  /// Delete a downloaded file
  Future<bool> deleteDownloadedFile(String url) async {
    try {
      final filePath = _downloadedFiles[url];
      if (filePath != null) {
        final file = File(filePath);
        if (await file.exists()) {
          await file.delete();
          _downloadedFiles.remove(url);
          return true;
        }
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting file: $e');
      }
      return false;
    }
  }

  /// Get all downloaded files
  Map<String, String> getDownloadedFiles() {
    return Map.from(_downloadedFiles);
  }

  /// Clear all downloaded files
  Future<void> clearAllDownloads() async {
    try {
      for (String url in _downloadedFiles.keys) {
        await deleteDownloadedFile(url);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error clearing downloads: $e');
      }
    }
  }
}
