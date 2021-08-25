import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/widget/waiting_shipment_card.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class WaitingShipmentSuccessfully extends StatelessWidget {
  final List<WaitingShipmentModel> items;
  final Function onDetails;


  const WaitingShipmentSuccessfully({
    required this.items,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return WaitingShipmentCard(
          shipmentModel: items[index],
          onDetails: (model) {
            onDetails(model);
          },
        );
      },
      itemCount: items.length,
      shrinkWrap: true,
    );
  }
}
