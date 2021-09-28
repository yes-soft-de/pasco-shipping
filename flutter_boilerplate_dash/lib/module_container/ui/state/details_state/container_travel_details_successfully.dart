import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/enums/container_status.dart';
import 'package:pasco_shipping/module_container/request/add_container_to_travel_request.dart';
import 'package:pasco_shipping/module_container/request/container_change_state_request.dart';
import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class ContainerTravelDetailsSuccessfully extends StatefulWidget {
  final ContainerDetailsModel model;
  // final List<TravelModel> travels;
  final Function onShipmentReview;
  final Function onUploadedToTravel;
  final Function onClearedOrArrived;
  final Function onShowFinance;
  const ContainerTravelDetailsSuccessfully({required this.model,required this.onShipmentReview,required this.onUploadedToTravel,required this.onClearedOrArrived ,required this.onShowFinance});

  @override
  _ContainerDetailsSuccessfullyState createState() => _ContainerDetailsSuccessfullyState();
}

class _ContainerDetailsSuccessfullyState extends State<ContainerTravelDetailsSuccessfully> {

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
                Text(S.of(context).containerInformation , style: AppTextStyle.largeBlueBold,),
                InkWell(
                    onTap: (){
                      widget.onShowFinance(widget.model.id);
                    },
                    child: Column(
                      children: [
                        Image.asset(StaticImage.accounting),
                        Text(S.of(context).cost,style: AppTextStyle.mediumBlackBold)
                      ],
                    ))
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
                      Text(S.of(context).type),
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
                      Text(S.of(context).consignee),
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
                      Text(S.of(context).harbors),
                      Text(widget.model.portName ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).shipper),
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
                      Text(S.of(context).subcontract),
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
                      Text(S.of(context).carrier),
                      Text(widget.model.carrierName ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).specification),
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
                      Text(S.of(context).freeCapacity),
                      Text(widget.model.freeCapacity ?? ''),
                    ],
                  ),
                ),

                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).RequestedBy),
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
                      Text(S.of(context).RequestedAt),
                      Text(widget.model.createdAt.toString().split('.').first),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(S.of(context).shipmentInformation, style: AppTextStyle.largeBlueBold,),
          ),
          widget.model.shipments!.isEmpty?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(S.of(context).noShipmentAdd ,style: AppTextStyle.mediumRed,),
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
          (widget.model.shipmentID !=null  && widget.model.shipments!.isEmpty)?(
              Container(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('this container requested for specific shipment' , style: AppTextStyle.mediumRed,),
              ),)
          ):          (widget.model.shipments!.isNotEmpty
              &&  widget.model.shipments![0].shipmentStatus != null
              &&  widget.model.shipments![0].shipmentStatus
                  == AcceptedShipmentStatusName[AcceptedShipmentStatus.STORED]) ?
          uploadToTravel():
          (widget.model.shipments!.isNotEmpty  &&  widget.model.shipments![0].travelStatus != null && widget.model.shipments![0].travelStatus == TravelStatusName[TravelStatus.RELEASED]) ?
          changeContainerStatus():

              Container(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('this Container uploaded to travel' , style: AppTextStyle.mediumRed,),
              ),)
        ],
      ),
    );
  }

  Widget firstCard(){
    if(widget.model.status == ContainerStatusName[ContainerStatus.NOTFULL]) {
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
                      Text(S.of(context).notFull ,style: AppTextStyle.largeBlack,)
                    ],),
                ) ,
                Text(S.of(context).haveSpace , style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:

                    [
                      Text(S.of(context).containerNumber , style: AppTextStyle.mediumBlackBold,),
                      Text('#'+ widget.model.containerNumber! , style: AppTextStyle.mediumBlackBold,),

                    ],),
                ),
              ],),
          ),
        ),
      );
    } else if(widget.model.status == ContainerStatusName[ContainerStatus.FULL]){
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
                      Text(S.of(context).full ,style: AppTextStyle.largeBlack,)
                    ],),
                ) ,
                Text(S.of(context).noSpace, style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:

                    [
                      Text(S.of(context).containerNumber +'#', style: AppTextStyle.mediumBlackBold,),
                      Text(widget.model.containerNumber??'' , style: AppTextStyle.mediumBlackBold,),

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
                  Text(S.of(context).trackNumber , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.trackNumber?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).volume+': ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.volume.toString() , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).category+': ' , style: AppTextStyle.mediumBlack,),
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
                  Text(S.of(context).targetWarehouse , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.target ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).exportWarehouse , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.exportWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).guniQuantity+': ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.guniQuantity.toString() , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget uploadToTravel(){
    return
    Column(children: [
      RoundedButton(lable: S.of(context).uploadContainer, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
        AddContainerToTravelRequest re = AddContainerToTravelRequest( holderID: widget.model.id!, shipmentStatus: 'uploaded');
        widget.onUploadedToTravel(re);
      },radius: 12)

    ],);
  }

  Widget changeContainerStatus(){
    if(widget.model.shipments!.isNotEmpty  &&  widget.model.shipments![0].travelStatus != null
        && widget.model.shipments![0].travelStatus == TravelStatusName[TravelStatus.RELEASED]
        && widget.model.shipments![0].shipmentStatus == AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED]
        && !(widget.model.type == 'FCL' &&
            widget.model.shipments![0].isExternalWarehouse!)
    )
      {
      return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(S.of(context).containerStatus , style: AppTextStyle.largeBlueBold,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusCard(S.of(context).cleared ,false),
              Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
              StatusCard(S.of(context).arrived ,false),
            ],),
         RoundedButton(lable: S.of(context).nextStatus, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
           AddContainerToTravelRequest re1 = AddContainerToTravelRequest(holderID: widget.model.id!,shipmentStatus:AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!);
              widget.onClearedOrArrived(re1);

          },radius: 12)
        ],
      ),
    );
    }else if (widget.model.shipments!.isNotEmpty &&
        widget.model.shipments![0].travelStatus != null &&
        widget.model.shipments![0].travelStatus ==
            TravelStatusName[TravelStatus.RELEASED] &&
        widget.model.shipments![0].shipmentStatus ==
            AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED] &&
        widget.model.type == 'FCL' &&
        widget.model.shipments![0].isExternalWarehouse!) {
      return  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(S.of(context).containerStatus , style: AppTextStyle.largeBlueBold,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatusCard(S.of(context).arrived ,false),
              ],),
            RoundedButton(lable: S.of(context).nextStatus, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
              AddContainerToTravelRequest re1 = AddContainerToTravelRequest(holderID: widget.model.id!,shipmentStatus:AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!);
              widget.onClearedOrArrived(re1);

            },radius: 12)
          ],
        ),
      );
    }
    else if (widget.model.shipments!.isNotEmpty
        &&  widget.model.shipments![0].shipmentStatus != null && widget.model.shipments![0].shipmentStatus == AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED])
    {
        return  Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(S.of(context).containerStatus , style: AppTextStyle.largeBlueBold,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatusCard(S.of(context).cleared ,true),
                  Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
                  StatusCard(S.of(context).arrived ,false),
                ],),
              RoundedButton(lable: S.of(context).nextStatus, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
                AddContainerToTravelRequest re1 = AddContainerToTravelRequest(holderID: widget.model.id!,shipmentStatus:AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!);
                widget.onClearedOrArrived(re1);

              },radius: 12)
            ],
          ),
        );
  }
    else if (widget.model.shipments!.isNotEmpty
        &&  widget.model.shipments![0].shipmentStatus != null && widget.model.shipments![0].shipmentStatus == AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]){
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(S.of(context).containerArrived , style: AppTextStyle.mediumRedBold,),
      );
    }
    else {
      return Container();
    }
    }
}
