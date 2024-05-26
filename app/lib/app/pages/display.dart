import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';

class ImageDisplay extends StatelessWidget {
  final File? imageFile;
  final Uint8List? receivedImage;

  ImageDisplay({this.imageFile, this.receivedImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Image'),
      ),
      body: Center(
        child: imageFile != null
            ? Image.file(imageFile!)
            : receivedImage != null
                ? Image.memory(receivedImage!)
                : Text('Nenhuma imagem disponível.'),
      ),
    );
  }
}
