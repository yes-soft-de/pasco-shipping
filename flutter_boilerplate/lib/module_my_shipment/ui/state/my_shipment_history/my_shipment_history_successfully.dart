import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_active_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class MyShipmentHistorySuccessfully extends StatelessWidget {
  final List<MyHistoryShipment> shipments;
  const MyShipmentHistorySuccessfully(this.shipments);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shipments.isNotEmpty ?  Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 20, top: 10),
              child: Text(
                'Previous shipments',
                style: greyWhite14text,
              ),
            ) :Container(),
          shipments.isEmpty ?  Center(child: Text('No Previous Shipments',style: greyWhite14text,)):  ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: shipments.length,
                itemBuilder: (context, index) {
                  return ShipmentHistoryCard(StaticImage.box, false, shipments[index]);
                }),
          ],
        ),
      );
  }
}