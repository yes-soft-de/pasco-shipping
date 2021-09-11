import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
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
              S.of(context).waitingApproveShipment,
              style: basic14text,
            ),
          ),
         waitingShipments.isEmpty ?Padding(
           padding: const EdgeInsets.all(8.0),
           child: Center(child: Text(S.of(context).noWaitingApproveShipment,style: greyWhite14text,)),
         ): ListView.builder(
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
              S.of(context).currentShipment,
              style: greyWhite14text,
            ),
          ),
          activeShipments.isEmpty? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(S.of(context).noCurrentShipment,style: greyWhite14text,)),
          ) : ListView.builder(
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
