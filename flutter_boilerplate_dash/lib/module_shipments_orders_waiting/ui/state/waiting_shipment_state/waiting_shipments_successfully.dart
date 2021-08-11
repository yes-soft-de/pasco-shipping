import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/widget/waiting_shipment_card.dart';

class WaitingShipmentSuccessfully extends StatelessWidget {
  final List<WaitingShipmentModel> items;
  final Function onDetails;
  final bool isExternalWarehouse;

  const WaitingShipmentSuccessfully({
    required this.items,
    required this.onDetails,required this.isExternalWarehouse,
  });

  @override
  Widget build(BuildContext context) {
    print("inSideBulid" + isExternalWarehouse.toString() );
    return ListView.builder(
      itemBuilder: (context, index) {
        return WaitingShipmentCard(
          shipmentModel: items[index],
          onDetails: (model) {
            onDetails(model);
          },
        );
        // if(items[index].isExternalWarehouse && isExternalWarehouse){
        //   return WaitingShipmentCard(
        //     shipmentModel: items[index],
        //     onDetails: (model) {
        //       onDetails(model);
        //     },
        //   );
        // }
        // // else if(!isExternalWarehouse && items[index].isExternalWarehouse)
        // //   {print("dddd" + isExternalWarehouse.toString());
        // //     return WaitingShipmentCard(
        // //     shipmentModel: items[index],
        // //     onDetails: (model) {
        // //       onDetails(model);
        // //     },
        // //   );
        // //   }
        // else {
        //   return Container();
        // }
      },
      itemCount: items.length,
      shrinkWrap: true,
    );
  }
}
