import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_edit_shipment/request/add_shipment_request.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

class ReviewShipmentEditedScreen extends StatelessWidget {
  final ShipmentTempRequest shipment;
  final Function onConfirm;
  // final Function onDelete;
  ReviewShipmentEditedScreen(this.shipment , this.onConfirm);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                child: ListTile(
                    title: Text(
                      'Shipment type: ',
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.transportationType,
                      style: basic14text,
                    ))),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, NewShipmentRoutes.NEW_SHIPMENTS,
                        arguments: {'shipment': shipment});
                  },
                  child: Icon(
                    Icons.edit,
                    color: AppThemeDataService.AccentColor,
                  )),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
                child: ListTile(
                    title: Text(
                      'Shipment from: ',
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.exportWarehouseName.toString(),
                      style: basic14text,
                    ))),
            Expanded(
                child: ListTile(
                    title: Text(
                      'Shipment to: ',
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.target,
                      style: basic14text,
                    ))),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: ListTile(
                    title: Text(
                      'Product type: ',
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.productCategoryName,
                      style: basic14text,
                    ))),
            Expanded(
                child: ListTile(
                    title: Text(
                      'Quantity ',
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.quantity.toString(),
                      style: basic14text,
                    ))),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                  title: Text(
                    'Supplier Info: ',
                    style: white18text,
                  ),
                  subtitle: Text(
                    shipment.supplierName,
                    style: basic14text,
                  )),
            ),
            Expanded(
              child: ListTile(
                  title: Text(
                    'Holder type: ',
                    style: white18text,
                  ),
                  subtitle: Text(
                    shipment.holderType,
                    style: basic14text,
                  )),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                  title: Text(
                'Recipient Info: ',
                style: white18text,
              )),
            ),
            Expanded(
                child: ListTile(
                    title: Text(
                      'Name: ',
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.receiverName,
                      style: basic14text,
                    ))),
            Expanded(
                child: ListTile(
                    title: Text(
                      'Phone: ',
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.receiverPhoneNumber,
                      style: basic14text,
                    ))),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                      title: Text(
                        'Unit: ',
                        style: white18text,
                      ),
                      subtitle: Text(
                        shipment.unit,
                        style: basic14text,
                      )),
                  ListTile(
                      title: Text(
                        'Mark ',
                        style: white18text,
                      ),
                      subtitle: Text(
                        shipment.markName,
                        style: basic14text,
                      )),
                  ListTile(
                      title: Text(
                        'Payment time ',
                        style: white18text,
                      ),
                      subtitle: Text(
                        shipment.paymentTime,
                        style: basic14text,
                      )),
                  ListTile(
                      title: Text(
                        'Extra specification ',
                        style: white18text,
                      ),
                      subtitle: Text(
                        shipment.extraSpecification,
                        style: basic14text,
                      )),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(color: AppThemeDataService.AccentColor)
                      ]),
                  child: shipment.imageFilePath!.isNotEmpty
                      ? Image.file(
                          File(shipment.imageFilePath!),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            iconSize: 50.0,
                            onPressed: () {},
                          ),
                        ),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedButton(
              radius: 12,
              color: Colors.red,
              lable: 'Delete',
              style: white18text,
              icon: '',
              go: () {
                _showDeleteDialog(context);
              },
            ),
            RoundedButton(
              radius: 12,
              color: Colors.green,
              lable: 'Confirm',
              style: white18text,
              icon: '',
              go: () {
                AddShipmentRequest request =
                AddShipmentRequest(transportationType: shipment.transportationType, exportWarehouseID: shipment.exportWarehouseID, target: shipment.target,
                    productCategoryID: shipment.productCategoryID,
                    quantity: shipment.quantity,
                    supplierName: shipment.supplierName,
                    receiverName: shipment.receiverName,
                    receiverPhoneNumber: shipment.receiverPhoneNumber,
                    unit: shipment.unit, markId: shipment.markId,
                    paymentTime: shipment.paymentTime,
                    vehicleIdentificationNumber: shipment.vehicleIdentificationNumber,
                    extraSpecification: shipment.extraSpecification,
                    holderType: shipment.holderType
                    ,imageFile: shipment.imageFilePath);
                _showConfirmDialog(context ,request);
              },
            )
          ],
        )
      ],
    );
    // return Background(
    //     goBack: (){
    //       Navigator.pop(context);
    //     },
    //     controller: controller,
    //     child:
    //     Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Row(
    //           children: [
    //             Expanded(child:
    //             ListTile(title: Text('Shipment type: ' , style: white18text,),
    //                 subtitle: Text(shipment.transportationType,style: basic14text,))),
    //           Padding(
    //               padding: const EdgeInsetsDirectional.only(end: 20),
    //               child: InkWell(
    //                   onTap: (){
    //                     Navigator.pushNamed(context, NewShipmentRoutes.NEW_SHIPMENTS,arguments: {'shipment' : shipment});
    //                   },
    //                   child: Icon(Icons.edit , color: AppThemeDataService.AccentColor,)),
    //             )
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Expanded(child: ListTile(title: Text('Shipment from: ' , style: white18text,), subtitle: Text(shipment.exportWarehouseName.toString() ,style: basic14text,))),
    //             Expanded(child: ListTile(title: Text('Shipment to: ' , style: white18text,), subtitle: Text( shipment.target,style: basic14text,))),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Expanded(child: ListTile(title: Text('Product type: ' , style: white18text,), subtitle: Text(shipment.productCategoryName ,style: basic14text,))),
    //             Expanded(child: ListTile(title: Text('Quantity ' , style: white18text,), subtitle: Text(shipment.quantity.toString() ,style: basic14text,))),
    //           ],
    //         ),
    //         ListTile(title: Text('Supplier Info: ' , style: white18text,), subtitle: Text(shipment.supplierName ,style: basic14text,)),
    //         Row(
    //           children: [
    //             Expanded(
    //               child: ListTile(title: Text('Recipient Info: ' ,
    //                 style: white18text,)),
    //             ),
    //             Expanded(child: ListTile(title: Text('Name: ' , style: white18text,), subtitle: Text(shipment.receiverName ,style: basic14text,))),
    //             Expanded(child: ListTile(title: Text('Phone: ' , style: white18text,), subtitle: Text(shipment.receiverPhoneNumber ,style: basic14text,))),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Flexible(
    //               flex: 2,
    //               child: Column(children: [
    //                 ListTile(title: Text('Unit: ' , style: white18text,), subtitle: Text(shipment.unit ,style: basic14text,)),
    //                 ListTile(title: Text('Mark ' , style: white18text,), subtitle: Text(shipment.markName ,style: basic14text,)),
    //                 ListTile(title: Text('Payment time ' , style: white18text,), subtitle: Text(shipment.paymentTime ,style: basic14text,)),
    //                 ListTile(title: Text('Extra specification ' , style: white18text,), subtitle: Text(shipment.extraSpecification ,style: basic14text,)),
    //               ],),
    //             ),
    //             Flexible(
    //                 flex: 1,
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                       color: Colors.transparent,
    //                       border: Border.all(color: Colors.grey),
    //                       borderRadius: BorderRadius.circular(6.0),
    //                       boxShadow: [
    //                         BoxShadow(color: AppThemeDataService.AccentColor)
    //                       ]),
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(20.0),
    //                     child: IconButton(
    //                       icon: Icon(Icons.camera_alt),
    //                       iconSize: 50.0, onPressed: () {  },
    //                     ),
    //                   ),
    //                 ))
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             RoundedButton(radius: 12,color: Colors.red,lable: 'Delete',style: white18text ,icon: '',go: (){
    //               _showDeleteDialog(context);
    //             },),
    //             RoundedButton(radius: 12,color: Colors.green,lable: 'Confirm',style: white18text ,icon: '',go: (){
    //               // onConfirm();
    //             },)
    //           ],
    //         )
    //
    //       ],
    //     ), title: S.of(context).reviewShipment,
    //     currentIndex: -1,
    //     isHome: false,
    //     isResultScreen: false);
  }

  void _showDeleteDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: 'Do you really want to delete this request',
        backgroundColor: AppThemeDataService.PrimaryColor,
        confirmBtnColor: AppThemeDataService.AccentColor,
        onConfirmBtnTap: () {
          deleteShipment();
          Navigator.pushNamedAndRemoveUntil(
              context, HomeRoutes.Home, (route) => false);
        },
        onCancelBtnTap: () {
          Navigator.pop(context);
        });
  }
  void _showConfirmDialog(BuildContext context , AddShipmentRequest request) {
    // flutter defined function
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: 'Do you really want to add this request',
        backgroundColor: AppThemeDataService.PrimaryColor,
        confirmBtnColor: AppThemeDataService.AccentColor,
        onConfirmBtnTap: () {
          Navigator.pop(context);
         onConfirm(request);
        },
        onCancelBtnTap: () {
          Navigator.pop(context);
        });
  }
  // Future<String> _createFileFromString() async {
  //   final encodedStr = "put base64 encoded string here";
  //   Uint8List bytes = base64.decode(encodedStr);
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   File file = File(
  //       "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
  //   await file.writeAsBytes(bytes);
  //   return file.path;
  // }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }
}
