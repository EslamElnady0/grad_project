import 'dart:convert';
import 'dart:io';

class ImageHelper {
  static String fileToBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    return base64Encode(imageBytes);
  }
}
