import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/module_airwaybill/enums/airwaybill_status.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_change_state_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_details_response.dart';
import 'package:pasco_shipping/module_airwaybill/widget/status_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AirwaybillDetailsSuccessfully extends StatefulWidget {
  final AirwaybillDetailsModel model;
  final Function onChangeStatus;
  final Function onShipmentReview;
  final Function onShowFinance;

  const AirwaybillDetailsSuccessfully({required this.model,required this.onChangeStatus ,required this.onShipmentReview,required this.onShowFinance});

  @override
  _ContainerDetailsSuccessfullyState createState() => _ContainerDetailsSuccessfullyState();
}

class _ContainerDetailsSuccessfullyState extends State<AirwaybillDetailsSuccessfully> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstCard(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Air Waybill Information' , style: AppTextStyle.largeBlueBold,),
                InkWell(
                    onTap: (){
                      widget.onShowFinance(widget.model.id);
                    },
                    child: Icon(Icons.money , color: blue,size: 40,))
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Type'),
                      Text(widget.model.type ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Consignee Name'),
                      Text(widget.model.consigneeName ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('shipper Name'),
                      Text(widget.model.shipperName ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subcontract Name'),
                      Text(widget.model.subcontractName ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Air Waybill specification'),
                      Text(widget.model.specificationName ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Requested by'),
                      Text(widget.model.updatedByUser ?? ''),
                    ],
                  ),
                ),

                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Requested at'),
                      Text(widget.model.createdAt.toString().split('.').first),
                    ],
                  ),
                ),
            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Shipment Information' , style: AppTextStyle.largeBlueBold,),
          ),
           widget.model.shipments!.isEmpty?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No shipment has been added to this container' ,style: AppTextStyle.mediumRed,),
            ) :
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context , index){
                return InkWell(
                  onTap: (){
                    widget.onShipmentReview(widget.model.shipments![index]);
                  },
                  child: shipmentCard(widget.model.shipments![index] ,
                  ),
                );
              },
              itemCount: widget.model.shipments!.length,
            ),
          statusCard()
        ],
      ),
    );
  }

  Widget firstCard(){
    if(widget.model.status == AirwaybillStatusName[AirwaybillStatus.NOTFULL]) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Icon(
                  Icons.warning,
                  color: Colors.yellow[800],
                  size: 40,
                ),
                Text('Not full yet' ,style: AppTextStyle.largeBlack,)
              ],),
            ) ,
            Text('This AirWaybill has some space' , style: AppTextStyle.mediumBlack,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:

              [
                Text("AirWaybill Number: " , style: AppTextStyle.mediumBlackBold,),
                Text('#'+ widget.model.airwaybillNumber! , style: AppTextStyle.mediumBlackBold,),

              ],),
            ),
          ],),
        ),
    ),
      );
    } else if(widget.model.status == AirwaybillStatusName[AirwaybillStatus.FULL]){
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green[800],
                        size: 40,
                      ),
                      Text('Full ' ,style: AppTextStyle.largeBlack,)
                    ],),
                ) ,
                Text("This Airwaybill is full", style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:

                    [
                      Text('Air Waybill Number: ' , style: AppTextStyle.mediumBlackBold,),
                      Text('#'+ widget.model.airwaybillNumber! , style: AppTextStyle.mediumBlackBold,),

                    ],),
                ),
              ],),
          ),
        ),
      );
    }else {
      return Container();
    }

  }

  Widget shipmentCard(ShipmentModel shipmentModel){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Track Number: ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.trackNumber?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Weight: ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.weight.toString() , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Product Category : ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.productCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('target Warehouse : ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.target ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Export Warehouse : ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.exportWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statusCard(){
    bool isFull;
    if(widget.model.status == AirwaybillStatusName[AirwaybillStatus.FULL]){
      isFull = true;
    }else {
      isFull = false;
    }

    return
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Air Waybill Status' , style: AppTextStyle.largeBlueBold,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusCard('not full' ,!isFull),
              Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
              StatusCard('Full' ,isFull),
          ],),
         isFull ? Container() :  RoundedButton(lable: 'Next Status', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
          if (widget.model.shipments!.isEmpty){
              Fluttertoast.showToast(msg: 'You have not added any shipment to this holder');
            }else {
            AirwaybillChangeStateRequest re1 = AirwaybillChangeStateRequest(id: widget.model.id!.toInt() ,status: AirwaybillStatusName[AirwaybillStatus.FULL]!);
              widget.onChangeStatus(re1);
            }

            },radius: 12)
        ],
      ),
    );
  }
}
