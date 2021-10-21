import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/gunny_shipment_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PdfParagraphApi {
   static Future<Uint8List> generateShipmentReport(List<AcceptedShipmentModel> model,int volum,int weight ,int gunny,int quntity) async {
    final pdf = Document();
    String trasType = '';
    // pdf.setMargins(0 , 0 , 0 , 0);

    // final customFont =
    // Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    if(model.isNotEmpty){
      trasType = model[0].transportationType ?? '';
    }
    final headersSea =
    [
      'Date',
      'ID',
      'Q',
      'G',
      'Volume',
      'Product type',
      'Client',
      'Payment',
       'way'

    ];
    final headersAir =
    [
      'Date',
      'ID',
      'Q',
      'G',
      'weight',
      'Product type',
      'Client',
      'Payment',
      'way'

    ];
    final dataSea = model.map((user) => [
      user.updatedAt.toString().split(' ').first, user.shipmentId,
      user.receivedQuantity,  user.guniQuantity,user.volume   ,user.categoriesNames,
      user.clientUsername,
      user.paymentTime , user.transportationType

    ]).toList();
    final dataAir = model.map((user) => [
      user.updatedAt.toString().split(' ').first, user.shipmentId,
      user.quantity,  user.guniQuantity,user.weight   ,user.categoriesNames,
      user.clientUsername,
      user.paymentTime , user.transportationType

    ]).toList();
    pdf.addPage(
      MultiPage(
        theme: ThemeData.withFont(
          base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
        ),
        margin: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.landscape,
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
        //   Column(children: List.generate(model.length, (index){
        // return   Padding(padding: EdgeInsets.all(8.0) ,child: generateShipmentNewReport(model[index]));
        //
        //   })),
          Table.fromTextArray(
            headers:trasType=='sea'? headersSea:headersAir,
            data:trasType=='sea'? dataSea : dataAir,
            headerStyle: TextStyle(fontWeight: FontWeight.bold),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 30,

              columnWidths: {
                0: FixedColumnWidth(35),
                1: FixedColumnWidth(15),
                2: FixedColumnWidth(35),

                3: FixedColumnWidth(15),
                4: FixedColumnWidth(30),

                5: FixedColumnWidth(30),

                6: FixedColumnWidth(25),
                7: FixedColumnWidth(60),
                8: FixedColumnWidth(15),
                // 9: FixedColumnWidth(15),
                // 10: FixedColumnWidth(30),
                // 11: FixedColumnWidth(35),
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
              8: Alignment.center,
              9: Alignment.center,
              10: Alignment.center,
              11: Alignment.center,
            },
              // headerPadding: Padding(padding: 12)
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Total: ' + model.length.toString(),
            style: TextStyle( fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          Text(
            'Total Gunny: ' + gunny.toString(),
            style: TextStyle( fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          Text(
            'Total Volume: ' + volum.toString(),
            style: TextStyle( fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          Text(
            'Total Weight: ' + weight.toString(),
            style: TextStyle( fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          Text(
            'Total received quantity: ' + quntity.toString(),
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

    return await pdf.save();
  }

  static Future<Uint8List> generateContainerReport(List<ContainerModel> model) async {
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
        orientation: PageOrientation.landscape,
        theme: ThemeData.withFont(
          base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
        ),
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
    return await pdf.save();
  }

  static  Future<Uint8List> generateAirwaybillReport(List<AirwaybillModel> model) async {
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
        orientation: PageOrientation.landscape,
        theme: ThemeData.withFont(
          base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
        ),
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
    return await pdf.save();
  }

  static Future<Uint8List> generateTravelReport(List<TravelModel> model) async {
    final pdf = Document();

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    final headers =
    ['ID',S.current.travelNumber,S.current.type,
      S.current.launchCountry,S.current.startDate,
    S.current.destinationCountry,S.current.arrivalDate
      ,S.current.createdBy ,
    ];

    final data = model.map((user) =>
    [user.id,user.travelNumber, user.type,
      user.launchCountry,user.launchDate.toString().split(' ').first,
      user.destinationCountry,user.arrivalDate.toString().split(' ').first,
      user.createdByUser ,
    ]).toList();
    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.landscape,
        theme: ThemeData.withFont(
          base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
        ),
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
            'Travel Report',
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
              1: FixedColumnWidth(30),
              2: FixedColumnWidth(30),

              3: FixedColumnWidth(30),
              4: FixedColumnWidth(30),

              5: FixedColumnWidth(30),

              6: FixedColumnWidth(30),
              7: FixedColumnWidth(30),
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
    return await pdf.save();
  }

  static Future<Uint8List> generateReceivedReport(SubShipmentModel model
      ,String ID,type,client,supplier,String quantity ,date) async {
    final pdf = Document();

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.landscape,
        theme: ThemeData.withFont(
          base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
        ),
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
            'Received Report',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Table(
            tableWidth: TableWidth.max,
            border: TableBorder.all(),
            children: [
               TableRow(
                  children: [
                    Padding( padding: const EdgeInsets.all(8.0), child: Row(children: [
                      Text('ShipmentID: ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(ID,style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ])),
                    Padding( padding: const EdgeInsets.all(8.0), child: Row(children: [
                      Text('Type: ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(type,style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),
                  ]),
              TableRow(
                  children: [
                    Padding( padding: const EdgeInsets.all(8.0), child:   Row(children: [
                      Text('Client: ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(client,style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),
                    Padding( padding: const EdgeInsets.all(8.0), child:    Row(children: [
                      Text('Supplier: ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(supplier,style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),

                  ]),
              TableRow(
                  children: [
                    Padding( padding: const EdgeInsets.all(8.0), child:  Row(children: [
                      Text('Quantity: ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(quantity,style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),
                    Padding( padding: const EdgeInsets.all(8.0), child:   Row(children: [
                      Text('Date: ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(date,style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),
                  ]),
            ],


            // headerPadding: Padding(padding: 12)
          )


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
    return await pdf.save();
  }


  static Future<Uint8List> generateContainerDetailsReport(ContainerDetailsModel model) async {
    final pdf = Document();
    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    final headers =
    ['ShipmentID',S.current.paymentTime,S.current.guniQuantity,
      S.current.quantity,S.current.trackNumber,S.current.targetWarehouse,S.current.productType
    ];
    final data = model.shipments.map((user) =>
    [user.id,user.paymentTime, user.guniQuantity,
      user.quantity,user.trackNumber,
      user.target,
      user.categoriesNames
    ]).toList();
    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.landscape,
        theme: ThemeData.withFont(
          base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
        ),
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
            'Container Report',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Table(
            tableWidth: TableWidth.max,
            border: TableBorder.all(),
            children: [
              TableRow(
                  children: [
                    Padding( padding: const EdgeInsets.all(8.0), child: Row(children: [
                      Text('ID: ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(model.id.toString(),style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ])),
                    Padding( padding: const EdgeInsets.all(8.0), child: Row(children: [
                      Text(S.current.containerNumber+': ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(model.containerNumber ??'',style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),
                  ]),
              TableRow(
                  children: [
                    Padding( padding: const EdgeInsets.all(8.0), child:   Row(children: [
                      Text(S.current.RequestedBy ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(model.updatedByUser ??'',style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),
                    Padding( padding: const EdgeInsets.all(8.0), child:    Row(children: [
                      Text(S.current.shippingType+': ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(model.type ??'',style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),

                  ]),

              TableRow(
                  children: [
                    Padding( padding: const EdgeInsets.all(8.0), child:   Row(children: [
                      Text(S.current.shipper ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(model.shipperName ??'',style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),
                    Padding( padding: const EdgeInsets.all(8.0), child:    Row(children: [
                      Text(S.current.consignee+': ' ,style:TextStyle( fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,) ),
                      Text(model.consigneeName ??'',style:TextStyle( fontSize: 16,
                        color: PdfColors.blue,))
                    ]),),

                  ]),
            ],
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Shipment in container',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          Table.fromTextArray(
            headers: headers,
            data: data,
            headerStyle: TextStyle(fontWeight: FontWeight.bold),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 30,

            columnWidths: {
              0: FixedColumnWidth(15),
              1: FixedColumnWidth(30),
              2: FixedColumnWidth(30),

              3: FixedColumnWidth(30),
              4: FixedColumnWidth(30),

              5: FixedColumnWidth(30),
              6: FixedColumnWidth(30),

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
              // 8: Alignment.center,
            },
            // headerPadding: Padding(padding: 12)
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
    return await pdf.save();
  }
  static Future<Uint8List> generateShipmentInvoiceReport(InvoiceModel model) async {
    final pdf = Document();
    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    final headers =
    ['Stage Name',S.current.stageCost,S.current.description,
    ];
    final data = model.billingDetails.map((user) =>
    [user.shipmentStatus,user.stageCost, user.stageDescription,
    ]).toList();
    pdf.addPage(
      MultiPage(
        theme: ThemeData.withFont(
          base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
        ),
        margin: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.landscape,
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
            'Invoice Report',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Padding(padding: EdgeInsets.all( 8 * PdfPageFormat.mm) ,child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text('Invoice Number: ', style:TextStyle( fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                        )),
                        Text(model.id.toString(),
                            style:TextStyle( fontSize: 18,
                              color: PdfColors.black,
                            )
                        ),
                      ]),
                      Row(children: [
                        Text('Payment Date: ', style:TextStyle( fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                        )),
                        Text(model.paymentDate.toString().split(' ').first.toString(),
                            style:TextStyle( fontSize: 18,
                              color: PdfColors.black,
                            )
                        ),
                      ]),


                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text('Client Name: ', style:TextStyle( fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                        )),
                        Text(model.clientUserName.toString().split(' ').first.toString(),
                            style:TextStyle( fontSize: 18,
                              color: PdfColors.black,
                            )
                        ),
                      ]),
                      Row(children: [
                        Text('Client Phone: ', style:TextStyle( fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                        )),
                        Text(model.clientPhone.toString().split(' ').first.toString(),
                            style:TextStyle( fontSize: 18,
                              color: PdfColors.black,
                            )
                        ),
                      ]),


                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text('Serial Number: ', style:TextStyle( fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                        )),
                        Text(model.clientIdentificationNumber.toString().split(' ').first.toString(),
                            style:TextStyle( fontSize: 18,
                              color: PdfColors.black,
                            )
                        ),
                      ]),
                      Row(children: [
                        Text('Payment Time: ', style:TextStyle( fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                        )),
                        Text(model.paymentTime.toString().split(' ').first.toString(),
                            style:TextStyle( fontSize: 18,
                              color: PdfColors.black,
                            )
                        ),
                      ]),


                    ]),
              ]
          ),),

          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Invoice Details',
            style: TextStyle( fontSize: 24,
              fontWeight: FontWeight.bold,
              color: PdfColors.blue,),
          ),
          Table.fromTextArray(
            headers: headers,
            data: data,
            headerStyle: TextStyle(fontWeight: FontWeight.bold),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 30,
            columnWidths: {
              0: FixedColumnWidth(15),
              1: FixedColumnWidth(30),
              2: FixedColumnWidth(30),

              3: FixedColumnWidth(30),
              4: FixedColumnWidth(30),

              5: FixedColumnWidth(30),

              // 8: FixedColumnWidth(30),
            },
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.center,
              2: Alignment.center,
              3: Alignment.center,
              4: Alignment.center,
              5: Alignment.center,
              // 8: Alignment.center,
            },
            // headerPadding: Padding(padding: 12)
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Divider(height: 1,thickness: 2),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  Row(children: [
                    Text('Total: ', style:TextStyle( fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black,
                    )),
                    Text(model.totalCost.toString(),
                        style:TextStyle( fontSize: 18,
                          color: PdfColors.black,
                        )
                    ),
                  ]),
                  SizedBox(height: 0.5 * PdfPageFormat.cm),
                  Row(
                      children: [
                        Text('Final amount: ', style:TextStyle( fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.black,
                        )),
                        Text(model.finalAmount.toString().split(' ').first.toString(),
                            style:TextStyle( fontSize: 18,
                              color: PdfColors.black,
                            )
                        ),
                      ]),
                ]),


                Row(children: [
                  Text('Discount: ', style:TextStyle( fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: PdfColors.black,
                  )),
                  Text(model.discount.toString() +'%',
                      style:TextStyle( fontSize: 18,
                        color: PdfColors.black,
                      )
                  ),
                ]),

              ]),

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
    return await pdf.save();
  }

   static Future<Uint8List> generateReceiptReceivedReport(String cost,String clientName,String  date) async {
     final pdf = Document();
     final ByteData bytes =
     await rootBundle.load(StaticImage.logo);
     final Uint8List byteList = bytes.buffer.asUint8List();
     pdf.addPage(
       Page(
         theme: ThemeData.withFont(
           base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
         ),
         margin: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
         pageFormat: PdfPageFormat.a4,
         orientation: PageOrientation.landscape,
         build: (context) =>
         Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
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
                Padding(padding: EdgeInsets.all( 5 * PdfPageFormat.mm),
                 child: Column(children: [
               Text('Payment Information', style:TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.bold,
                 color: PdfColors.black,
               ),),
                   Padding(padding: EdgeInsets.all( 5 * PdfPageFormat.mm),),

                   Row(children: [
                 Text('The undersigned acknowledge that they received the sum of',
                   style:TextStyle(
                   fontSize: 24,
                   color: PdfColors.black,
                 ),),

               ]),
                   Row(children: [
                     Text(cost+' US',style: TextStyle(
                       decoration: TextDecoration.underline,
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: PdfColors.blue,
                     ),),
                     Padding(padding: EdgeInsets.all( 5 * PdfPageFormat.mm),),

                     Text('from',style: TextStyle(
                       fontSize: 24,
                       color: PdfColors.black,
                     )),
                     Padding(padding: EdgeInsets.all( 5 * PdfPageFormat.mm),),

                     Text(clientName,style: TextStyle(
                       decoration: TextDecoration.underline,
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: PdfColors.blue,
                     ),),
                     Padding(padding: EdgeInsets.all( 5 * PdfPageFormat.mm),),

                     Text('on',style:TextStyle(
                       decoration: TextDecoration.underline,
                       fontSize: 24,
                       color: PdfColors.black,
                     ),),
                     Padding(padding: EdgeInsets.all( 5 * PdfPageFormat.mm),),

                     Text(date,style: TextStyle(
                       decoration: TextDecoration.underline,
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: PdfColors.blue,
                     ),),
                   ])

             ]))
     ]))
     );
     return await pdf.save();
   }

   static  Future<Uint8List> generateQR(String qr) async {
     final pdf = Document();
     // final customFont =
     // Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

     final ByteData bytes =
     await rootBundle.load(StaticImage.logo);
     final Uint8List byteList = bytes.buffer.asUint8List();

     pdf.addPage(
       MultiPage(
         orientation: PageOrientation.portrait,
         theme: ThemeData.withFont(
           base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
         ),
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
           SizedBox(height: 0.5 * PdfPageFormat.cm),
           Center(child: BarcodeWidget(
             data: qr,
             width: 300,
             height: 300,
             barcode: Barcode.qrCode(),
           ), )


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
     return await pdf.save();
   }
   static  Future<Uint8List> generateGunny(GunnyShipmentModel model) async {
     final pdf = Document();
     // final customFont =
     // Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

     final ByteData bytes =
     await rootBundle.load(StaticImage.logo);
     final Uint8List byteList = bytes.buffer.asUint8List();

     pdf.addPage(
       MultiPage(
         orientation: PageOrientation.portrait,
         theme: ThemeData.withFont(
           base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
         ),
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
           Container(
             padding: EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Text('Gunny Number'+': '),
                                 Text(model.gunnyIdentificationNumber ??''),
                               ],
                             ),
                             Row(
                               children: [
                                 Text('Unit Quantity: '),
                                 Text(model.quantity.toString()),
                               ],
                             ),
                           ],),
                       ],
                     ),
                   )),
             ),
           SizedBox(height: 0.5 * PdfPageFormat.cm),


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
     return await pdf.save();
   }
   static  Future<Uint8List> generateSticker(String from ,String to,String number) async {
     final pdf = Document();
     // final customFont =
     // Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

     final ByteData bytes =
     await rootBundle.load(StaticImage.logo);
     final Uint8List byteList = bytes.buffer.asUint8List();

     pdf.addPage(
       MultiPage(
         orientation: PageOrientation.portrait,
         theme: ThemeData.withFont(
           base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
         ),
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

           Center(child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
             Row(children: [
               Text('Shipping from: '),
               Text(from , style: TextStyle(color: PdfColors.blue ,fontWeight: FontWeight.bold) )
             ]),
             SizedBox(height: 0.5 * PdfPageFormat.cm),
             Row(children: [
               Text('Shipping to: '),
               Text(to,style: TextStyle(color: PdfColors.blue ,fontWeight: FontWeight.bold))
             ]),
             SizedBox(height: 0.5 * PdfPageFormat.cm),
             Row(children: [
               Text('Serial Number: '),
               Text(number,style: TextStyle(color: PdfColors.blue ,fontWeight: FontWeight.bold))
             ]),
           ]))


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
     return await pdf.save();
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
      // final dir = await getApplicationDocumentsDirectory();
      // file = File('${dir.path}/$name');
      final file = File('$name');
      await file.writeAsBytes(await pdf.save());
    }catch(e){
      await Fluttertoast.showToast(msg: e.toString());
    }


    // await file.writeAsBytes(bytes);

    return file;
  }


   static Widget generateShipmentNewReport(AcceptedShipmentModel user)  {
     // final pdf = Document();
     // pdf.setMargins(0 , 0 , 0 , 0);

     // final customFont =
     // Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

     // final ByteData bytes =
     // await rootBundle.load(StaticImage.logo);
     // final Uint8List byteList = bytes.buffer.asUint8List();
     // final headers =
     // [
     //   'Client',
     //   'S.N',
     //   'way'
     //   ,'From' ,
     //   'To'
     //
     //   ,'Mark' ,
     //   'Product type',
     //
     //   'G',
     //   'Q',
     //   'Supplier',
     //   'Date'
     // ];
     //
     // final data = [
     //   user.shipmentId, user.clientUsername,user.clientIdentificationNumber,
     //   user.transportationType , user.exportWarehouseName , user.target,user.markNumber
     //   ,user.categoriesNames,
     //
     //
     //   user.guniQuantity,
     //   user.quantity,
     //   user.supplierName,
     //   user.updatedAt.toString().split(' ').first
     // ];
     // TableRow(
     //     children: [
     //   Text('Client'),
     //   Text('S.N'),
     //   Text('way'),
     //   Text('From'),
     //   Text('To'),
     //   Text('Mark'),
     // ]);
     // TableRow(
     //     children: [
     //   Text(user.clientUsername ??''),
     //   Text(user.clientIdentificationNumber ??''),
     //   Text(user.transportationType ??''),
     //   Text(user.exportWarehouseName ??''),
     //   Text(user.target ??''),
     //   Text(user.markNumber ??''),
     // ]);
     // TableRow(
     //     children: [
     //       Text('Product type'),
     //       Text('G'),
     //       Text('Q'),
     //       Text('Supplier'),
     //       Text('Date'),
     //     ]);
     // TableRow(
     //     children: [
     //       Text(user.categoriesNames ??''),
     //       Text(user.guniQuantity.toString() ??''),
     //       Text(user.quantity.toString() ??''),
     //       Text(user.supplierName ??''),
     //       Text(user.updatedAt.toString().split(' ').first),
     //     ]);
     return Column(

crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             user.shipmentId.toString(),
             style: TextStyle( fontSize: 20,
               fontWeight: FontWeight.bold,
               color: PdfColors.black,),
           ),
     Padding(  padding: EdgeInsets.all(4), child:  Row(
     children: [

     Table(
         columnWidths: {
           0: FixedColumnWidth(90),
           1: FixedColumnWidth(90),
           2: FixedColumnWidth(90),

           3: FixedColumnWidth(90),
           4: FixedColumnWidth(90),

           5: FixedColumnWidth(90),
           6: FixedColumnWidth(90),

           // 8: FixedColumnWidth(30),
         },
         border: TableBorder(
           verticalInside: BorderSide(width: 1, color: PdfColors.black, style: BorderStyle.solid),
             horizontalInside:
         BorderSide(width: 1, color: PdfColors.black, style: BorderStyle.solid)
         ),
         tableWidth:TableWidth.max ,
         children:[
           TableRow(
               decoration: BoxDecoration(
                 border: Border.all(),
                 color:PdfColors.grey300,

               ),
               children: [
                 Padding(
                     padding: const EdgeInsets.all(8.0),child:Text('Client'), ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),child: Text('S.N'), ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),child: Text('way'), ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),child: Text('From'), ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),child:  Text('To'), ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),child:  Text('Mark'),),
               ]
           ),

     TableRow(
         decoration: BoxDecoration(
           border: Border.all(),

         ),
     children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
          child:
       Text(user.clientUsername ??''),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:  Text(user.clientIdentificationNumber ??''),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:   Text(user.transportationType ??''),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:Text(user.exportWarehouseName ??''),),
       Padding(
         padding: const EdgeInsets.all(8.0),child: Text(user.target ??''),),
       Padding(
         padding: const EdgeInsets.all(8.0),child: Text(user.markNumber ??''),),
     ]),
     TableRow(
         decoration: BoxDecoration(
           border: Border.all(),
           color:  PdfColors.grey300
         ),
     children: [
       Padding(
         padding: const EdgeInsets.all(8.0),child: Text('Product type'), ),
       Padding(
         padding: const EdgeInsets.all(8.0),child:Text('G'), ),
       Padding(
         padding: const EdgeInsets.all(8.0),child: Text('Q'),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:  Text('Supplier'),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:   Text('Date'),),
     ]),
     TableRow(
         decoration: BoxDecoration(
           border: Border.all(),
         ),
     children: [
       Padding(
         padding: const EdgeInsets.all(8.0),child: Text(user.categoriesNames ??''),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:Text(user.guniQuantity.toString()),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:Text(user.quantity.toString()),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:Text(user.supplierName ??''),),
       Padding(
         padding: const EdgeInsets.all(8.0),child:    Text(user.updatedAt.toString().split(' ').first),),

     ]),
     ] ),
     ]) )
     ]);



     // pdf.addPage(
     //   MultiPage(
     //     theme: ThemeData.withFont(
     //       base: Font.ttf(await rootBundle.load('assets/arial.ttf')),
     //     ),
     //     margin: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
     //     pageFormat: PdfPageFormat.a4,
     //     orientation: PageOrientation.portrait,
     //     build: (context) => <Widget>[
     //
     //     ],
     //   ),
     // );
     //
     // return await pdf.save();
   }

}