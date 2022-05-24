import 'dart:io';

import 'package:flutter/services.dart';

class FileUtils {
  static Future<ByteData> getFileData(File file) async {
    final bytes = await file.readAsBytes(); // Uint8List
    final byteData = bytes.buffer.asByteData(); // ByteData

    return byteData;
  }
}