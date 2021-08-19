import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class WaitingShipmentCard extends StatelessWidget {
  final WaitingShipmentModel shipmentModel;
  final Function onDetails;
  const WaitingShipmentCard({required this.shipmentModel,required this.onDetails});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onDetails(shipmentModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Client Name: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.clientUsername ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Product Category: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.productCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('target Warehouse: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.target ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Export Warehouse: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.exportWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Requested at: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.updatedAt.toString().split('.').first, style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
