import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Shipment from: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.exportWarehouseName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Shipment to: ',
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
                        'Product type: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.productCategoryName ?? '',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Quantity ',
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
                      'Supplier Info: ',
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
                      'Recipient Info: ',
                      style: AppTextStyle.mediumBlack,
                    )),
              ),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Name: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        shipment.receiverName ??'',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Phone: ',
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
                          'Unit: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.unit ??'',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Mark ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.markNumber??'',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Payment time ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        subtitle: Text(
                          shipment.paymentTime ?? '',
                          style: AppTextStyle.smallBlueBold,
                        )),
                    ListTile(
                        title: Text(
                          'Extra specification ',
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
                lable: 'Reject',
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
                lable: 'Accept',
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
    );
  }
}
