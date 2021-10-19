import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ShipmentShiftCard extends StatelessWidget {
  final ShipmentShiftingModel model;
  final Function onChangeStatus;
  final bool hideButton;
  const ShipmentShiftCard({Key? key,required this.model,required this.onChangeStatus,required this.hideButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('#' + model.id.toString() , style: AppTextStyle.largeBlackBold,),
                        Row(
                          children: [
                            Text(
                              'Shipment ID: ',
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child: Text(
                              model.shipmentID.toString(),
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              S.of(context).trackNumber,
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child: Text(
                              model.trackNumber ?? '',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              S.of(context).importantNote+': ',
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child:Text(
                              model.notes ?? '',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              S.of(context).shippingFrom,
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child:Text(
                              model.fromImportWarehouseCity + "/"+ model.fromImportWarehouseName,
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              S.of(context).shippingTo,
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child:Text(
                              model.toImportWarehouseCity + "/"+ model.toImportWarehouseName,
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Payment status'+': ',
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child:Text(
                              model.paymentStatus ??'',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                        Row(
                          children: [
                            Text(
                              S.of(context).status+': ',
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child:Text(
                              model.status ??'',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                      ])),
             hideButton ?Container(): Flexible(
                flex: 1,
                child: Column(
                  children: [
                   model.status=='started'? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                       onChangeStatus(model,'refused');
                      },
                      child: Text(
                        'refused',
                        style: AppTextStyle.mediumWhite,
                      ),
                    ):Container(),
                    SizedBox(
                      height: 10,
                    ),
                    (  model.status == 'refused' || model.status == 'done')?Container(): ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        if(model.status =='started') {
                          onChangeStatus(model,'accepted');
                        }else {
                          onChangeStatus(model,'done');
                        }
                      },
                      child: Text(
                      model.status=='started'?  S.of(context).accept : 'done',
                        style: AppTextStyle.mediumWhite,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        )));
  }
}
