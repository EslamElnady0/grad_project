import 'package:flutter/material.dart';

String getFileType(String? fileUrl) {
  try {
    if (fileUrl == null || fileUrl.isEmpty) {
      return 'unknown';
    }
    final Uri uri = Uri.parse(fileUrl);
    final String path = uri.path;
    final String extension = path.split('.').last.toLowerCase();
    return extension;
  } catch (e) {
    return '';
  }
}

IconData getFileIcon(String extension) {
    switch (extension.toLowerCase()) {
      // Documents
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
      case 'txt':
      case 'rtf':
      case 'odt':
        return Icons.description;

      // Presentations
      case 'ppt':
      case 'pptx':
      case 'pps':
      case 'ppsx':
      case 'odp':
        return Icons.slideshow;

      // Spreadsheets
      case 'xls':
      case 'xlsx':
      case 'csv':
      case 'ods':
        return Icons.table_chart;

      // Images
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
      case 'bmp':
      case 'webp':
      case 'tiff':
      case 'svg':
      case 'ico':
        return Icons.image;

      // Videos
      case 'mp4':
      case 'avi':
      case 'mkv':
      case 'mov':
      case 'wmv':
      case 'flv':
      case 'webm':
      case '3gp':
        return Icons.video_library;

      // Audio
      case 'mp3':
      case 'wav':
      case 'ogg':
      case 'm4a':
      case 'aac':
      case 'wma':
      case 'flac':
        return Icons.music_note;

      // Archives
      case 'zip':
      case 'rar':
      case '7z':
      case 'tar':
      case 'gz':
      case 'bz2':
        return Icons.folder_zip;

      // Code files
      case 'html':
      case 'css':
      case 'js':
      case 'json':
      case 'xml':
      case 'py':
      case 'java':
      case 'cpp':
      case 'cs':
      case 'php':
        return Icons.code;

      // Database files
      case 'sql':
      case 'db':
      case 'sqlite':
      case 'mdb':
        return Icons.storage;

      // Font files
      case 'ttf':
      case 'otf':
      case 'woff':
      case 'woff2':
        return Icons.text_fields;

      // Design files
      case 'psd':
      case 'ai':
      case 'eps':
      case 'sketch':
      case 'xd':
        return Icons.design_services;

      // CAD files
      case 'dwg':
      case 'dxf':
      case 'stl':
        return Icons.architecture;

      // Executable files
      case 'exe':
      case 'msi':
      case 'app':
      case 'apk':
        return Icons.apps;

      // Configuration files
      case 'ini':
      case 'cfg':
      case 'conf':
      case 'env':
        return Icons.settings;

      // Backup files
      case 'bak':
      case 'backup':
        return Icons.backup;

      default:
        return Icons.insert_drive_file;
    }
  }