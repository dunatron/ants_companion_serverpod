import 'dart:io';

import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/ui/widgets/custom_file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
// var client = Client('http://$localhost:8080/')
//   ..connectivityMonitor = FlutterConnectivityMonitor();

// var client = Client('http://$localhost:8080/');

var client = Client('http://192.168.20.7:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

class ServerpodTestApp extends StatelessWidget {
  const ServerpodTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // These fields hold the last result or error message that we've received from
  // the server or null if no result exists yet.
  String? _resultMessage;
  String? _errorMessage;

  String? _publicUrl =
      "http://192.168.20.7:8080/serverpod_cloud_storage?method=file&path=android-chrome-192x192.png";

  final _textEditingController = TextEditingController();

  // Calls the `hello` method of the `example` endpoint. Will set either the
  // `_resultMessage` or `_errorMessage` field, depending on if the call
  // is successful.
  void _callHello() async {
    try {
      final result = await client.example.hello(_textEditingController.text);
      setState(() {
        _errorMessage = null;
        _resultMessage = result;
      });

      FilePickerResult? filePickerResult =
          await FilePicker.platform.pickFiles(withData: true);

      if (filePickerResult != null) {
        final PlatformFile file = filePickerResult.files.first;
        final fileName = file.name;
        final uint8List = file.bytes;

        print(file.name);
        print(file.bytes);
        print(file.size);
        print(file.extension);
        print(file.path);

        final byteData = uint8List?.buffer.asByteData();

        if (byteData == null) {
          print('byteData Null');
          return;
        }

        String? signedUrl = await client.ants.getUploadDescription(fileName);

        if (signedUrl == null) {
          print('Signed URL Null');
          return;
        }

        FileUploader uploader = FileUploader(signedUrl);
        final fileStream = File(file.path!).openRead();
        final fileLength = await File(file.path!).length();

        await uploader.upload(fileStream, fileLength);

        // FileUploader uploader = FileUploader(signedUrl);
        // await uploader.uploadByteData(byteData);

        // await uploader.upload(stream, length)

        final verified = await client.ants.verifyUpload(fileName);
        print('Verified: $verified');

        final publicUrl = await client.ants.getProfileUrl(fileName);
        print('publicUrl: $publicUrl');

        setState(() {
          _publicUrl = publicUrl;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }

  handlePickedFile(PlatformFile file) async {
    try {
      final fileName = file.name;
      final uint8List = file.bytes;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      final byteData = uint8List?.buffer.asByteData();

      if (byteData == null) {
        print('byteData Null');
        return;
      }

      String? signedUrl = await client.ants.getUploadDescription(fileName);

      if (signedUrl == null) {
        print('Signed URL Null');
        return;
      }

      FileUploader uploader = FileUploader(signedUrl);
      final fileStream = File(file.path!).openRead();
      final fileLength = await File(file.path!).length();

      await uploader.upload(fileStream, fileLength);

      // FileUploader uploader = FileUploader(signedUrl);
      // await uploader.uploadByteData(byteData);

      // await uploader.upload(stream, length)

      final verified = await client.ants.verifyUpload(fileName);
      print('Verified: $verified');

      final publicUrl = await client.ants.getProfileUrl(fileName);
      print('publicUrl: $publicUrl');

      setState(() {
        _publicUrl = publicUrl;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
            ),
            CustomFilePicker(onPicked: handlePickedFile),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _callHello,
                child: const Text('Send to Server'),
              ),
            ),
            _ResultDisplay(
              resultMessage: _resultMessage,
              errorMessage: _errorMessage,
            ),
            if (_publicUrl != null) Image.network(_publicUrl!)
          ],
        ),
      ),
    );
  }
}

// _ResultDisplays shows the result of the call. Either the returned result from
// the `example.hello` endpoint method or an error message.
class _ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const _ResultDisplay({
    this.resultMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return Container(
      height: 50,
      color: backgroundColor,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
