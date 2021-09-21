import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/holder_request_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/image_full_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/enums/waiting_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/accepted_rejected_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/widget/holder_card.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WaitingShipmentDetailsInit extends StatelessWidget {
  final WaitingShipmentModel shipment;
  final Function onRejected;
  final Function onAccepted;
  const WaitingShipmentDetailsInit({required this.shipment,required this.onRejected,required this.onAccepted});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).serialNumber,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.clientIdentificationNumber ?? '',
                          style: AppTextStyle.smallBlueBold,
                        ))),

              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).inExternalWarehouse,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.isExternalWarehouse.toString(),
                          style: AppTextStyle.smallBlueBold,
                        ))),
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).warehouseInfo,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.externalWarehouseInfo??'',
                          style: AppTextStyle.smallBlueBold,
                        ))),
              ],
            ),


            Row(
              children: [
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).client,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.clientUsername ?? '',
                          style: AppTextStyle.smallBlueBold,
                        ))),
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).shippingWay,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.transportationType ?? '',
                          style: AppTextStyle.smallBlueBold,
                        ))),
              ],
            ),

            Row(
              children: [
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).shippingFrom,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.exportWarehouseName.toString(),
                          style: AppTextStyle.smallBlueBold,
                        ))),
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).shippingTo,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.target ??'',
                          style: AppTextStyle.smallBlueBold,
                        ))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).category,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.productCategoryName ?? '',
                          style: AppTextStyle.smallBlueBold,
                        ))),
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).subCategory,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.subProductCategoryName ?? '',
                          style: AppTextStyle.smallBlueBold,
                        ))),

              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).quantity,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.quantity.toString(),
                          style: AppTextStyle.smallBlueBold,
                        ))),
                Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).supplierInfo,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.supplierName ?? '',
                        style: AppTextStyle.smallBlueBold,
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).receiverInfo,
                        style: AppTextStyle.mediumBlack,
                      )),
                ),
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).name,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.receiverName ??'',
                          style: AppTextStyle.smallBlueBold,
                        ))),
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).phone,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.receiverPhoneNumber ??'',
                          style: AppTextStyle.smallBlueBold,
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
                            S.of(context).unit,
                            style: AppTextStyle.mediumBlack,
                          ),
                          subtitle: Text(
                            shipment.unit ??'',
                            style: AppTextStyle.smallBlueBold,
                          )),
                      ListTile(
                          title: Text(
                            S.of(context).mark,
                            style: AppTextStyle.mediumBlack,
                          ),
                          subtitle: Text(
                            shipment.markNumber??'',
                            style: AppTextStyle.smallBlueBold,
                          )),
                      ListTile(
                          title: Text(
                            S.of(context).paymentTime,
                            style: AppTextStyle.mediumBlack,
                          ),
                          subtitle: Text(
                            shipment.paymentTime ?? '',
                            style: AppTextStyle.smallBlueBold,
                          )),
                      ListTile(
                          title: Text(
                            S.of(context).extraSpecification,
                            style: AppTextStyle.mediumBlack,
                          ),
                          subtitle: Text(
                            shipment.extraSpecification ??'',
                            style: AppTextStyle.smallBlueBold,
                          )),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          _showQrAlert(context);
                        },
                        child: QrImage(
                          data: shipment.toString(),
                          // version: QrVersions.auto,
                          size: 150,
                        ),
                      ),
                    ],
                  ),
                ),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).holder ,style: AppTextStyle.mediumBlack, ),
            ),
            ListView.builder(itemBuilder:(context , index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: HolderCard(
                  pendingHolders: shipment.pendingHolders[index]),
              );
            },
              itemCount: shipment.pendingHolders.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).attached ,style: AppTextStyle.mediumBlack, ),
            ),
           shipment.imagePath!.isNotEmpty? GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(shipment.imagePath!.length, (index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FullImageScreen(shipment.imagePath![index].url , false)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                      child: Image.network(
                        shipment.imagePath![index].url,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  );
                })
            ) :Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  radius: 12,
                  color: Colors.red,
                  lable: S.of(context).reject,
                  style: AppTextStyle.mediumWhite,
                  icon: '',
                  go: () {
                    AcceptedOrRejectedRequest re =AcceptedOrRejectedRequest(shipmentId: shipment.shipmentId!, status: WaitingShipmentStatusName[WaitingShipmentStatus.REJECTED]!);
                 onRejected(re);
                  },
                ),
                RoundedButton(
                  radius: 12,
                  color: Colors.green,
                  lable: S.of(context).accept,
                  style: AppTextStyle.mediumWhite,
                  icon: '',
                  go: () {
                    AcceptedOrRejectedRequest re =AcceptedOrRejectedRequest(shipmentId: shipment.shipmentId!, status: WaitingShipmentStatusName[WaitingShipmentStatus.ACCEPTED]!);
                    onAccepted(re);
                  },
                )
              ],
            ),



          ],
        ),
      ),
    );

  }
  _showQrAlert(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Text(S.of(context).shipmentQR),
            content: SizedBox(
              width: 200,
              height: 200,
              child: QrImage(
                data: shipment.toString(),
                // version: QrVersions.auto,
                size: 200,
              ),
            ),
            actions: [
              FlatButton(onPressed: (){}, child: Row(children: [
                Icon(Icons.print, color: blue,size: 30,),
              ],))
            ],
          );
        });
  }
}
