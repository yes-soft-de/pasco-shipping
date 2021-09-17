import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfParagraphApi {
  static Future<File> generateShipmentReport(List<AcceptedShipmentModel> model) async {
    final pdf = Document();
    // pdf.setMargins(0 , 0 , 0 , 0);

    // final customFont =
    // Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    final headers =
    ['ID',
      S.current.client,
      'S.N',
     'way'
      ,S.current.from ,
      S.current.to

      ,S.current.mark ,
    S.current.productType,
    ];

    final data = model.map((user) => [
      user.shipmentId, user.clientUsername,user.clientIdentificationNumber,
      user.transportationType , user.exportWarehouseName , user.target,user.markNumber
    ,user.categoriesNames,
    ]).toList();
    pdf.addPage(
      MultiPage(
        margin: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        pageFormat: PdfPageFormat.a4,
        build: (context) => <Widget>[
           Container(
      padding: EdgeInsets.all( 5 * PdfPageFormat.mm),

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
          SizedBox(width: 5 * PdfPageFormat.cm),
         Column(
           children: [
             Text(S.current.date ,  style: TextStyle(color: PdfColors.black ,fontWeight: FontWeight.bold),),
             Text(DateTime.now().toString().split('.').first, style: TextStyle(color: PdfColors.black ,fontWeight: FontWeight.bold),)
           ]
         )
        ],
      ),
    ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Shipment Report',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Table.fromTextArray(
            headers: headers,
            data: data,
            headerStyle: TextStyle(fontWeight: FontWeight.bold),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 30,

              columnWidths: {
                0: FixedColumnWidth(15),
                1: FixedColumnWidth(40),
                2: FixedColumnWidth(35),

                3: FixedColumnWidth(20),
                4: FixedColumnWidth(30),

                5: FixedColumnWidth(30),

                6: FixedColumnWidth(30),
                7: FixedColumnWidth(60),
                // 8: FixedColumnWidth(30),
              },
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.center,
              2: Alignment.center,
              3: Alignment.center,
              4: Alignment.center,
              5: Alignment.center,
              6: Alignment.center,
              7: Alignment.center,
              // 8: Alignment.center,
            },
              // headerPadding: Padding(padding: 12)
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Total: ' + data.length.toString(),
            style: TextStyle( fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          // Paragraph(text: LoremText().paragraph(60)),
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

    return saveDocument(name: 'shipmentReport.pdf', pdf: pdf);
  }

  static Future<File> generateContainerReport(List<ContainerModel> model) async {
    final pdf = Document();
    final customFont =
    Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    final headers =
    ['ID',S.current.containerNumber,S.current.shippingType,
      S.current.type
      ,S.current.RequestedBy ,
    ];

    final data = model.map((user) =>
    [user.id,user.containerNumber, user.type,user.specificationName,
      user.createdByUser ,
    ]).toList();
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
                SizedBox(width: 5 * PdfPageFormat.cm),
                Column(
                    children: [
                      Text(S.current.date ,  style: TextStyle(color: PdfColors.black ,fontWeight: FontWeight.bold),),
                      Text(DateTime.now().toString().split('.').first, style: TextStyle(color: PdfColors.black ,fontWeight: FontWeight.bold),)
                    ]
                )
              ],
            ),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Container Report',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Table.fromTextArray(
            headers: headers,
            data: data,
            headerStyle: TextStyle(fontWeight: FontWeight.bold),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 30,

            columnWidths: {
              0: FixedColumnWidth(30),
              1: FixedColumnWidth(30),
              2: FixedColumnWidth(30),
              3: FixedColumnWidth(30),
              4: FixedColumnWidth(30),
            },
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.center,
              2: Alignment.center,
              3: Alignment.center,
              4: Alignment.center,
            },
            // headerPadding: Padding(padding: 12)
          ),
          Text(
            'Total: ' + data.length.toString(),
            style: TextStyle( fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          // Paragraph(text: LoremText().paragraph(60)),
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
    return saveDocument(name: 'containerReport.pdf', pdf: pdf);
  }

  static Future<File> generateAirwaybillReport(List<AirwaybillModel> model) async {
    final pdf = Document();
    final customFont =
    Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    final headers =
    ['ID',S.current.airwaybillNumber,S.current.shippingType,
      S.current.type
      ,S.current.RequestedBy ,
    ];

    final data = model.map((user) =>
    [user.id,user.airwaybillNumber, user.type,user.specificationName,
      user.createdByUser ,
    ]).toList();
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
                SizedBox(width: 5 * PdfPageFormat.cm),
                Column(
                    children: [
                      Text(S.current.date ,  style: TextStyle(color: PdfColors.black ,fontWeight: FontWeight.bold),),
                      Text(DateTime.now().toString().split('.').first, style: TextStyle(color: PdfColors.black ,fontWeight: FontWeight.bold),)
                    ]
                )
              ],
            ),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Air waybill Report',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Table.fromTextArray(
            headers: headers,
            data: data,
            headerStyle: TextStyle(fontWeight: FontWeight.bold),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 30,

            columnWidths: {
              0: FixedColumnWidth(30),
              1: FixedColumnWidth(30),
              2: FixedColumnWidth(30),
              3: FixedColumnWidth(30),
              4: FixedColumnWidth(30),
            },
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.center,
              2: Alignment.center,
              3: Alignment.center,
              4: Alignment.center,
            },
            // headerPadding: Padding(padding: 12)
          ),
          Text(
            'Total: ' + data.length.toString(),
            style: TextStyle( fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          // Paragraph(text: LoremText().paragraph(60)),
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
    return saveDocument(name: 'airReport.pdf', pdf: pdf);
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

    var file =File('');

    try{
      final dir = await getApplicationDocumentsDirectory();
      file = File('${dir.path}/$name');

    }catch(e){
      await Fluttertoast.showToast(msg: e.toString());
    }


    await file.writeAsBytes(bytes);

    return file;
  }
}