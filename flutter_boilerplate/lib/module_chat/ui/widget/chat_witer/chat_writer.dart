import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_upload/service/image_upload/image_upload_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ChatWriterWidget extends StatefulWidget {
  final Function(String) onMessageSend;
  // final ImageUploadService uploadService;

  ChatWriterWidget({
    required this.onMessageSend,
    // required this.uploadService,
  });

  @override
  State<StatefulWidget> createState() => _ChatWriterWidget();
}

class _ChatWriterWidget extends State<ChatWriterWidget> {
  final TextEditingController _msgController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  // late File imageFile;

  @override
  Widget build(BuildContext context) {
    // if (imageFile != null) {
    //   return Container(
    //     height: 120,
    //     child: Stack(
    //       children: [
    //         Positioned.fill(
    //           child: Image.file(
    //             imageFile,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         Positioned(
    //           right: 8,
    //           bottom: 8,
    //           child: Container(
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               backgroundBlendMode: BlendMode.darken,
    //               color: Colors.black38,
    //             ),
    //             child: IconButton(
    //               icon: Icon(
    //                 Icons.send,
    //                 color: Colors.white,
    //               ),
    //               onPressed: () {
    //                 // widget.uploadService
    //                 //     .uploadImage(imageFile.path)
    //                 //     .then((value) {
    //                 //   imageFile = Null as File;
    //                 //   sendMessage(value!.contains('http')
    //                 //       ? value
    //                 //       : Urls.IMAGES_ROOT + value);
    //                 //   setState(() {});
    //                 // });
    //               },
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: DropdownButton(
        //     items: [
        //       DropdownMenuItem(
        //         child: Icon(
        //           Icons.image,
        //           color: AppThemeDataService.AccentColor,
        //         ),
        //         onTap: () {
        //           // _imagePicker
        //           //     .getImage(source: ImageSource.gallery, imageQuality: 70)
        //           //     .then((value) {
        //           //   if (value != null) {
        //           //     imageFile = File(value.path);
        //           //   }
        //           //   setState(() {});
        //           // });
        //         },
        //       ),
        //       // DropdownMenuItem(
        //       //   child: Icon(
        //       //     Icons.camera,
        //       //     color: AppThemeDataService.PrimaryColor,
        //       //   ),
        //       //   onTap: () {
        //       //     _imagePicker
        //       //         .getImage(source: ImageSource.camera, imageQuality: 70)
        //       //         .then((value) {
        //       //       if (value != null) {
        //       //         imageFile = File(value.path);
        //       //         setState(() {});
        //       //       }
        //       //     });
        //       //   },
        //       // ),
        //     ],
        //     // onChanged: (value) {},
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: white)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: white16text,
                decoration: InputDecoration(
                  hintText: 'Start writing',
                  hintStyle: White14text,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                controller: _msgController,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            backgroundBlendMode: BlendMode.darken,
            color: Colors.black38,
          ),
          child: IconButton(
            padding: EdgeInsets.all(4),
            onPressed: () {
              sendMessage(_msgController.text.trim());
            },
            icon: Icon(
              Icons.send,
              color: AppThemeDataService.AccentColor,
            ),
          ),
        )
      ],
    );
  }

  void sendMessage(String msg) {
    widget.onMessageSend(msg);
    _msgController.clear();
  }
}
