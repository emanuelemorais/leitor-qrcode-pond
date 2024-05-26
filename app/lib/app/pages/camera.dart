import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'dart:typed_data';
import 'package:app/app/pages/display.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:app/app/services/notification.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  Uint8List? _receivedImage;

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    var uri = Uri.parse("http://10.0.2.2/image/upload");
    var request = http.MultipartRequest("POST", uri);

    var multipartFile = await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      filename: p.basename(imageFile.path),
    );

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Imagem enviada com sucesso");
      var responseData = await http.Response.fromStream(response);
      setState(() {
        _receivedImage = base64Decode(responseData.body);
      });
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "basic_channel",
            title: "Imagem editada com sucesso!",
            body: "Yay! Sua imagem foi transformada em preto e branco!"),
      );
      _navigateToImageDisplay(receivedImage: _receivedImage);
    } else {
      var responseData = await response.stream.bytesToString();
      print("Erro ao enviar imagem: $responseData");
    }
  }

  void _navigateToImageDisplay({File? imageFile, Uint8List? receivedImage}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDisplay(
          imageFile: imageFile,
          receivedImage: receivedImage,
        ),
      ),
    );
  }

  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image -> B&W'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('Nenhuma imagem selecionada.')
                : Image.file(File(_image!.path)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCamera,
              child: Text('Abrir Câmera'),
            ),
            SizedBox(height: 20),
            _image == null
                ? Container()
                : ElevatedButton(
                    onPressed: () => _uploadImage(File(_image!.path)),
                    child: Text('Tranformar em Preto e Branco'),
                  ),
          ],
        ),
      ),
    );
  }
}
