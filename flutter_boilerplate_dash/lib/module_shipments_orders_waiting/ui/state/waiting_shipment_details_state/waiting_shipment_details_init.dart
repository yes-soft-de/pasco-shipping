import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/enums/waiting_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/accepted_rejected_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

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
          children: [
            Row(
              children: [
                Expanded(
                    child: ListTile(
                        title: Text(
                          S.of(context).shippingType,
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
                          S.of(context).quantity,
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.quantity.toString(),
                          style: AppTextStyle.smallBlueBold,
                        ))),
              ],
            ),
            Row(
              children: [
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
              ],
            ),

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
            )

          ],
        ),
      ),
    );
  }
}
