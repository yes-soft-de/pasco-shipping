import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class AcceptedShipmentCard extends StatelessWidget {
  final AcceptedShipmentModel shipmentModel;
  final Function onDetails;
  const AcceptedShipmentCard({required this.shipmentModel,required this.onDetails});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onDetails(shipmentModel.shipmentId);
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
                    // Text('Order Number' , style: AppTextStyle.largeBlackBold,),

                    Text('#'+shipmentModel.shipmentId.toString() , style: AppTextStyle.largeBlackBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('client Username: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.clientUsername ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Product Category Name: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.productCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Export Warehouse Name: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.exportWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('target Warehouse Name ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.target ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Receiver Name: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.receiverName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Requested by: ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.updatedByUser ??'', style: AppTextStyle.mediumBlueBold,),
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
