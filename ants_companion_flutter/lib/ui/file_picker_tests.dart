import 'dart:io';

import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/ui/widgets/custom_file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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

class FilePickerTests extends StatelessWidget {
  const FilePickerTests({super.key});

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
  String? _errorMessage;
  String? _publicUrl;
  // String? _publicUrl =
  //     "http://192.168.20.7:8080/serverpod_cloud_storage?method=file&path=android-chrome-192x192.png";

  handleWebFileUpload(PlatformFile file) async {
    final fileName = file.name;
    // final fileName = 'testing';
    // final fileName = 'testing.${file.extension}';
    try {
      String? signedUrl = await client.ants.getUploadDescription(fileName);

      if (signedUrl == null) {
        print('Signed URL Null');
        return;
      }
      final stream = file.readStream;

      if (stream != null) {
        print('Upload with stream');
        FileUploader uploader = FileUploader(signedUrl);

        /// well lets see if we can do it all with stream no???
        await uploader.upload(stream, file.size);

        final verified = await client.ants.verifyUpload(fileName);
        print('Verified: $verified');

        final publicUrl = await client.ants.getProfileUrl(fileName);
        print('publicUrl: $publicUrl');

        setState(() {
          _publicUrl = publicUrl;
        });
        return;
      }

      final uint8List = file.bytes;

      final byteData = uint8List?.buffer.asByteData();

      if (byteData == null) {
        print('byteData Null');
        return;
      }

      FileUploader uploader = FileUploader(signedUrl);
      await uploader.uploadByteData(byteData);

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

  handleWithBinaryData(PlatformFile file) async {
    try {
      final fileName = file.name;
      final uint8List = file.bytes;
      final byteData = uint8List?.buffer.asByteData();

      String? signedUrl = await client.ants.getUploadDescription(fileName);

      if (signedUrl == null) {
        print('Signed URL Null');
        return;
      }
      if (byteData == null) {
        print('Signed URL Null');
        return;
      }
      FileUploader uploader = FileUploader(signedUrl);

      await uploader.uploadByteData(byteData);
      final verified = await client.ants.verifyUpload(fileName);
      print('Verified: $verified');

      final publicUrl = await client.ants.getProfileUrl(fileName);
      print('publicUrl: $publicUrl');

      setState(() {
        _publicUrl = publicUrl;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  handlePickedFile(PlatformFile file) async {
    // return handleWithBinaryData(file);
    return handleWebFileUpload(file);
    if (kIsWeb) {
      return handleWebFileUpload(file);
    }
    try {
      final fileName = file.name;
      final uint8List = file.bytes;

      print(file.name);
      print(file.size);
      print(file.extension);

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
            if (_publicUrl != null) Text(_publicUrl.toString()),
            // if (_errorMessage != null) Text(_errorMessage!),
            CustomFilePicker(onPicked: handlePickedFile),
            if (_publicUrl != null)
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  _publicUrl!,
                  fit: BoxFit.cover,
                ),
              )
          ],
        ),
      ),
    );
  }
}
