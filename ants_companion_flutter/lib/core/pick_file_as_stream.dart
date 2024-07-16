import 'dart:io';
import 'dart:async';
import 'package:file_picker/file_picker.dart';

Future<Map<String, dynamic>?> pickFileAsStream() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null && result.files.single.path != null) {
    File file = File(result.files.single.path!);
    Stream<List<int>> stream = file.openRead();
    int length = await file.length();
    String fileName = result.files.single.name;

    return {
      'stream': stream,
      'length': length,
      'fileName': fileName,
    };
  }
  return null;
}
