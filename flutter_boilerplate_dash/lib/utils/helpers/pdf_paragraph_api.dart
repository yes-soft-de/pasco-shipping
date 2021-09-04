import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfParagraphApi {
  static Future<File> generate(AcceptedShipmentDetailsModel model) async {
    final pdf = Document();
    final customFont =
    Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
      Container(
      padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
      ),
      child: Row(
        children: [
          Image(
             MemoryImage(
                byteList,
              ),
              height: 150,
              width: 150,
              fit: BoxFit.contain),
          SizedBox(width: 0.5 * PdfPageFormat.cm),
          Text(
           'Shipment Report',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
        ],
      ),
    ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Paragraph(
            text:
            'This is my custom font that displays also characters such as €, Ł, ...',
            style: TextStyle(font: customFont, fontSize: 20),
          ),
          buildCustomHeadline(),
          Header(child: Text('Shipment Information' , style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: PdfColors.blue,
          ))),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    Text('#' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.shipmentId.toString() , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:    Row(
                  children: [
                    Text(S.current.shippingWay , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.transportationType ??'', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:    Row(
                  children: [
                    Text(S.current.shippingFrom , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.exportWarehouseName ??'' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    Text(S.current.shippingTo , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.target ??'' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    Text(S.current.serialNumber , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.clientIdentificationNumber ??'' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    Text(S.current.category , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.productCategoryName ??'' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    Text(S.current.subCategory , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.subProductCategoryName ??'' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Row(
                  children: [
                    Text(S.current.mark , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.markNumber ??'' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:     Row(
                  children: [
                    Text(S.current.supplierInfo , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text( model.supplierName ??'' , style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.blue,
                    ),),
                  ],
                ),
              ),
            ],
          ),
          Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),
        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );
    return saveDocument(name: 'shipment report.pdf', pdf: pdf);
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
  static Future<Widget> buildCustomHeader() async{

   return Container(
      padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: PdfColors.blue)),
      ),
      child: Row(
        children: [


          SizedBox(width: 0.5 * PdfPageFormat.cm),
          Text(
            'Create Your PDF',
            style: TextStyle(fontSize: 20, color: PdfColors.blue),
          ),
        ],
      ),
    );
  }



  static Widget buildCustomHeadline() => Header(
    child: Text(
      'My Third Headline',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(color: PdfColors.red),
  );

  static Widget buildLink() => UrlLink(
    destination: 'https://flutter.dev',
    child: Text(
      'Go to flutter.dev',
      style: TextStyle(
        decoration: TextDecoration.underline,
        color: PdfColors.blue,
      ),
    ),
  );

  static List<Widget> buildBulletPoints() => [
    Bullet(text: 'First Bullet'),
    Bullet(text: 'Second Bullet'),
    Bullet(text: 'Third Bullet'),
  ];

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }
}