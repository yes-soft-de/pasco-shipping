import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class AcceptedShipmentCard extends StatelessWidget {
  final AcceptedShipmentModel shipmentModel;
  final Function onDetails;
  final Function onEdit;
  const AcceptedShipmentCard({required this.shipmentModel,required this.onDetails,required this.onEdit});

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
            child: Row(
              children: [
                Flexible(
                  flex: 4,
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
                          Text(S.of(context).category+": " , style: AppTextStyle.mediumBlack,),
                          Text(shipmentModel.productCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text(S.of(context).subCategory+": " , style: AppTextStyle.mediumBlack,),
                          Text(shipmentModel.subProductCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text(S.of(context).exportWarehouse , style: AppTextStyle.mediumBlack,),
                       shipmentModel.isExternalWarehouse?
                       Expanded(child: Text(shipmentModel.externalWarehouseInfo ?? '' , style: AppTextStyle.mediumBlueBold,)):
                          Expanded(child: Text(shipmentModel.exportWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,)),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text(S.of(context).importWarehouse+': ' , style: AppTextStyle.mediumBlack,),
                          Expanded(child: Text(shipmentModel.importWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,)),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text(S.of(context).targetWarehouse, style: AppTextStyle.mediumBlack,),
                          Text(shipmentModel.target ?? '' , style: AppTextStyle.mediumBlueBold,),
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
                          Text(S.of(context).serialNumber , style: AppTextStyle.mediumBlack,),
                          Text(shipmentModel.clientIdentificationNumber ?? '' , style: AppTextStyle.mediumBlueBold,),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text(S.of(context).RequestedBy , style: AppTextStyle.mediumBlack,),
                          Text(shipmentModel.updatedByUser ??'', style: AppTextStyle.mediumBlueBold,),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Text(S.of(context).RequestedAt , style: AppTextStyle.mediumBlack,),
                          Text(shipmentModel.updatedAt.toString().split('.').first, style: AppTextStyle.mediumBlueBold,),
                        ],),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      onEdit(shipmentModel);
                    },
                    child: Text(
                      S.of(context).edit,
                      style: AppTextStyle.mediumWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
