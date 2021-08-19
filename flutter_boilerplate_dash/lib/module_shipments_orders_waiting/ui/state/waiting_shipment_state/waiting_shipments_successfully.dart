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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Date: '+DateTime.now().toString().split(' ').first, style:  AppTextStyle.mediumRedBold),
                  Text('Total Count : '+items.length.toString() , style:  AppTextStyle.mediumRedBold),
                ],
              ),
            ),
          ),
        ),
        ListView.builder(
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
        ),

      ],
    );
  }
}
