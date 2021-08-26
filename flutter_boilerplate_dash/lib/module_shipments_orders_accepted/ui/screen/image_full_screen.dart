import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:io';

class FullImageScreen extends StatelessWidget {
  // final String tage;
  var url;
  final bool isFile;
  FullImageScreen(this.url, this.isFile);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isFile
            ? PhotoView(imageProvider: FileImage(File(url)))
            : PhotoView(imageProvider: NetworkImage(url)),
      ),
    );
  }
}
