import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_active_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class MyShipmentActiveSuccessfully extends StatelessWidget {
 final List<MyShipment> activeShipments;
 final List<MyHistoryShipment> waitingShipments;
   MyShipmentActiveSuccessfully(this.waitingShipments ,this.activeShipments, );

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsetsDirectional.only(start: 20, top: 10),
            child: Text(
              'Waiting for approval',
              style: basic14text,
            ),
          ),
         waitingShipments.isEmpty ?Text('No Waiting Shipment',style: greyWhite14text,): ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: waitingShipments.length,
              itemBuilder: (context, index) {
                return ShipmentHistoryCard(StaticImage.box, true,waitingShipments[index]);
              }),
          Padding(
            padding:
            const EdgeInsetsDirectional.only(start: 20, top: 10),
            child: Text(
              'Current shipment',
              style: greyWhite14text,
            ),
          ),
          activeShipments.isEmpty? Text('No Current Shipment',style: greyWhite14text,) : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: activeShipments.length,
              itemBuilder: (context, index) {
                return ShipmentActiveCard(StaticImage.box, false,activeShipments[index]);
              }),
        ],
      ),
    );
  }
}
