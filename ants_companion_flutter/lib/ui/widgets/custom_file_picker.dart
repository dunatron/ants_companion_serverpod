import 'dart:io';

import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomFilePicker extends StatefulWidget {
  const CustomFilePicker({super.key, required this.onPicked});

  final Function(PlatformFile) onPicked;

  @override
  State<CustomFilePicker> createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  final _logger = appLogger(CustomFilePicker);

  PlatformFile? _pickedFile;

  _pickFile() async {
    _logger.d('Waiting for user to pick a file');
    // FilePickerResult? filePickerResult =
    //     await FilePicker.platform.pickFiles(withData: true);

    // FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    FilePickerResult? filePickerResult =
        await FilePicker.platform.pickFiles(withReadStream: true);

    if (filePickerResult != null) {
      _logger.d('File has been picked');
      final firstFile = filePickerResult.files.first;
      _logger.d('First file: ${firstFile.name}');

      widget.onPicked(firstFile);

      setState(() {
        _pickedFile = firstFile;
      });
    } else {
      _logger.d('File picking was cancelled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.antiAlias, // Ensures ink splash is clipped
      child: InkWell(
        onTap: () => _pickFile(),
        child: Container(
          padding: const EdgeInsets.all(24),
          // height: 100,
          width: 200,
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text('Pick File'),
              if (_pickedFile != null)
                _PickedFileDetails(
                  file: _pickedFile!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PickedFileDetails extends StatelessWidget {
  const _PickedFileDetails({required this.file});

  final PlatformFile file;

  String formatBytes(int bytes) {
    const int kB = 1024;
    const int mB = kB * 1024;
    const int gB = mB * 1024;

    if (bytes >= gB) {
      return '${(bytes / gB).toStringAsFixed(1)} GB';
    } else if (bytes >= mB) {
      return '${(bytes / mB).toStringAsFixed(1)} MB';
    } else if (bytes >= kB) {
      return '${(bytes / kB).toStringAsFixed(1)} KB';
    } else {
      return '$bytes bytes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${file.name}'),
        Text(formatBytes(file.size)),
        // ToDo: file.path not accessible on web, access file.bytes way of doing it instead
        if (!kIsWeb && file.path != null && file.path!.isNotEmpty)
          Image.file(File(file.path!))
        else if (file.bytes != null)
          Image.memory(file.bytes!),
      ],
    );
  }
}
