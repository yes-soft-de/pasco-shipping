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
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfParagraphApi {
   static Future<Uint8List> generateShipmentReport(List<AcceptedShipmentModel> model) async {
    final pdf = Document();
    // pdf.setMargins(0 , 0 , 0 , 0);

    // final customFont =
    // Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    final ByteData bytes =
    await rootBundle.load(StaticImage.logo);
    final Uint8List byteList = bytes.buffer.asUint8List();
    final headers =
    ['ID',
      'Client',
      'S.N',
       'way'
      ,'From' ,
    'To'

      ,'Mark' ,
    'Product type',

    'G',
    'Q',
    'Supplier',
      'Date'
    ];

    final data = model.map((user) => [
      user.shipmentId, user.clientUsername,user.clientIdentificationNumber,
      user.transportationType , user.exportWarehouseName , user.target,user.markNumber
    ,user.categoriesNames,


      user.guniQuantity,
      user.quantity,
      user.supplierName,
      user.updatedAt.toString().split(' ').first
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

                3: FixedColumnWidth(15),
                4: FixedColumnWidth(30),

                5: FixedColumnWidth(30),

                6: FixedColumnWidth(25),
                7: FixedColumnWidth(60),
                8: FixedColumnWidth(15),
                9: FixedColumnWidth(15),
                10: FixedColumnWidth(30),
                11: FixedColumnWidth(35),
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
                      Text('ID: ' ,style:TextStyle( fontSize: 18,
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
                  Text(model.discount.toString().split(' ').first.toString(),
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
}