import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/attached_doc_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';

class UpdateInitAttchedDoc extends StatefulWidget {
  final InvoiceModel model;
  final Function onUpdateAttached;
  const UpdateInitAttchedDoc({Key? key,required this.model,required this.onUpdateAttached}) : super(key: key);

  @override
  _UpdateAttchedDocState createState() => _UpdateAttchedDocState();
}

class _UpdateAttchedDocState extends State<UpdateInitAttchedDoc> {
late  AttachedDocInvoiceRequest request;
var receiptImage;
var invoiceImage;
late File? invoiceImageFile;
late File? receiptImageFile;
final ImagePicker _imagePicker = ImagePicker();

@override
  void initState() {
  super.initState();
  invoiceImageFile = null;
  receiptImageFile = null;
  request =AttachedDocInvoiceRequest(id: widget.model.id,invoiceImage: widget.model.invoiceImage??'',receiptImage: widget.model.invoiceImage ??'');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            'Receipt Image',
            style: AppTextStyle.mediumBlackBold,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 35),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(color:blue)
                    ]),
                child: receiptImageFile != null
                    ? Badge(
                        badgeContent: InkWell(
                            onTap: () {
                              setState(() {
                                receiptImageFile = null;
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15,
                            )),
                        child: Image.file(
                          receiptImageFile!,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt),
                          iconSize: 50.0,
                          onPressed: () {
                           _showPicker(context);
                          },
                        ),
                      )),
          ),

            SizedBox(height: 30,),
            Text(
              'Invoice Image',
              style: AppTextStyle.mediumBlackBold,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 35),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(color:blue)
                      ]),
                  child: invoiceImageFile != null
                      ? Badge(
                    badgeContent: InkWell(
                        onTap: () {
                          setState(() {
                            invoiceImageFile = null;
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        )),
                    child: Image.file(
                      invoiceImageFile!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      iconSize: 50.0,
                      onPressed: () {
                        _showPickerInvo(context);
                      },
                    ),
                  )),
            ),
            Text(
              S.of(context).importantNote,
              style: AppTextStyle.mediumBlackBold,
            ),
            TextEdit(title: widget.model.notes ??'', hint:S.of(context).importantNote,onChange:(notes) {
              request.notes = notes;
            }),
            Text(
              'Discount',
              style: AppTextStyle.mediumBlackBold,
            ),
            TextEdit(title: widget.model.discount.toString() , hint:'Discount',onChange:(dis) {
              request.discount = int.parse(dis);
            }),
            RoundedButton(lable: S.of(context).save, icon: '',
                color: blue, style: AppTextStyle.mediumWhiteBold, go: (){
              if(receiptImageFile != null){
                request.receiptImage = receiptImageFile!.path;
              }
              if(invoiceImageFile != null){
                request.invoiceImage =
                    invoiceImageFile!.path;
              }
              widget.onUpdateAttached(request);
              }, radius: 12)
        ],),
      ),
    );
  }

void _openCamera() async {

  receiptImage = await _imagePicker.getImage(source: ImageSource.camera ,imageQuality: 70);
  receiptImageFile = File(receiptImage!.path);
  setState(() {
  });
}
void _openGallery() async {

  receiptImage = await _imagePicker.getImage(source: ImageSource.gallery ,imageQuality: 70);
  receiptImageFile = File(receiptImage!.path);
  setState(() {

  });
}
void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text(S.of(context).showLibrary),
                    onTap: () {
                      _openGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text(S.of(context).camera),
                  onTap: () {
                    _openCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}


void _openCameraInVo() async {

  invoiceImage = await _imagePicker.getImage(source: ImageSource.camera ,imageQuality: 70);
  invoiceImageFile = File(invoiceImage!.path);
  setState(() {
  });
  // imageArray.add(imageFile);
  // setState(() {
  //   imageArray;
  // });
}
void _openGalleryInvo() async {

  invoiceImage = await _imagePicker.getImage(source: ImageSource.gallery ,imageQuality: 70);
  invoiceImageFile = File(invoiceImage!.path);
  setState(() {

  });
}
void _showPickerInvo(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text(S.of(context).showLibrary),
                    onTap: () {
                      _openGalleryInvo();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text(S.of(context).camera),
                  onTap: () {
                    _openCameraInVo();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}
}
