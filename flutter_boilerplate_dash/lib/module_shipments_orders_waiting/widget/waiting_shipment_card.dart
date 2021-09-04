import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
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
                    // Text('Order Number' , style: AppTextStyle.largeBlackBold,),

                    Text('#'+shipmentModel.shipmentId.toString() , style: AppTextStyle.largeBlackBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).client , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.clientUsername ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).serialNumber , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.clientIdentificationNumber ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).category+": " , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.productCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).subCategory+': ' , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.subProductCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).receiverInfo , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.receiverName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).targetWarehouse , style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.target ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).exportWarehouse, style: AppTextStyle.mediumBlack,),
                    Text(shipmentModel.exportWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(S.of(context).RequestedAt, style: AppTextStyle.mediumBlack,),
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
