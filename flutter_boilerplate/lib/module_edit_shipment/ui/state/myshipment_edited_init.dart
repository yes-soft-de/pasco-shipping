import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_edit_shipment/request/add_shipment_request.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/screen/image_full_screen.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/holder_request_card.dart';
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
print(shipment.extraSpecification);
print('TIZ');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                child: ListTile(
                    title: Text(
                     S.of(context).shippingWay,
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
                      S.of(context).shippingFrom,
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.exportWarehouseName.toString(),
                      style: basic14text,
                    ))),
            Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).shippingTo,
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
                    S.of(context).receivers,
                    style: white18text,
                  ),
                  subtitle: Text(
                    shipment.receiverName,
                    style: basic14text,
                  )),
            ),
            Expanded(
              child: ListTile(
                  title: Text(
                    S.of(context).phone,
                    style: white18text,
                  ),
                  subtitle: Text(
                    shipment.receiverPhoneNumber,
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
                      S.of(context).subCategory,
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.productCategoryName,
                      style: basic14text,
                    ))),
            Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).quantity,
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
                    S.of(context).supplierInfo,
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
                    S.of(context).shippingType,
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
                      S.of(context).isExternalWarehouse,
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.isExternalWarehouse.toString(),
                      style: basic14text,
                    ))),
            Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).externalWarehouseInfo,
                      style: white18text,
                    ),
                    subtitle: Text(
                      shipment.externalWarehouseInfo ??'',
                      style: basic14text,
                    ))),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                  title: Text(
                    S.of(context).unit,
                    style: white18text,
                  ),
                  subtitle: Text(
                    shipment.unit,
                    style: basic14text,
                  )),
            ),
            Expanded(
              child: ListTile(
                  title: Text(
                    S.of(context).mark,
                    style: white18text,
                  ),
                  subtitle: Text(
                    shipment.markName,
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
                    S.of(context).paymentTime,
                    style: white18text,
                  ),
                  subtitle: Text(
                    shipment.paymentTime,
                    style: basic14text,
                  )),
            ),


          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: Text(
            S.of(context).holder,
            style: white18text,
          ),
        ),

        shipment.holders.isNotEmpty ?
          ListView.builder(itemBuilder: (context , index){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: RequestHolderCard(requestHolder:  shipment.holders[index],),
            );
          },itemCount: shipment.holders.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ) :Container(),
        ListTile(
            title: Text(
              S.of(context).extraSpecification,
              style: white18text,
            ),
            subtitle: Text(
              shipment.extraSpecification,
              style: basic14text,
            )),


        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Row(
            children: [
              Text(S.of(context).attached, style: white18text,),
            ],
          ),
        ),
        shipment.imageFilePath!.isNotEmpty ?
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(shipment.imageFilePath!.length, (index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FullImageScreen(shipment.imageFilePath![index],true)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                    child: Image.file(
                      File(shipment.imageFilePath![index]),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              })
          ),
        ):Container(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedButton(
              radius: 12,
              color: Colors.red,
              lable: S.of(context).reject,
              style: white18text,
              icon: '',
              go: () {
                _showDeleteDialog(context);
              },
            ),
            RoundedButton(
              radius: 12,
              color: Colors.green,
              lable: S.of(context).accept,
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
                    holderType: shipment.holderType,
                    exportCountryID: shipment.exportCountryID,
                    exportCountryName: shipment.exportCountryName,
                    holders: shipment.holders,
                    holderCount: 1,
                    receiverID: 1,
                    externalWarehouseInfo: shipment.externalWarehouseInfo
                    ,imageFilePath: shipment.imageFilePath, isExternalWarehouse: shipment.isExternalWarehouse);
                onConfirm(request);
                // _showConfirmDialog(context ,request);
              },
            )
          ],
        )
      ],
    );

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
