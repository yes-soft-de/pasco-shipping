import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class ContainerTravelDetailsSuccessfully extends StatefulWidget {
  final ContainerDetailsModel model;
  final List<TravelModel> travels;
  final Function onShipmentReview;
  final Function onUploadedToTravel;
  final Function onClearedOrArrived;
  const ContainerTravelDetailsSuccessfully({required this.model,required this.onShipmentReview,required this.travels,required this.onUploadedToTravel,required this.onClearedOrArrived });

  @override
  _ContainerDetailsSuccessfullyState createState() => _ContainerDetailsSuccessfullyState();
}

class _ContainerDetailsSuccessfullyState extends State<ContainerTravelDetailsSuccessfully> {
  late DropListModel dropListModelTravels;
  late Entry optionItemSelectedTravels;
  late List<Entry> entryTravels;
  late int travelID;


  @override
  void initState() {
    super.initState();
    entryTravels = <Entry>[];
    optionItemSelectedTravels =  Entry('choose', 1, []);


  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    for(TravelModel item in widget.travels){
      Entry v = Entry(item.travelNumber! ,item.id! ,[]);
      entryTravels.add(v);
    }
    dropListModelTravels = DropListModel(entryTravels);
  }
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
            child: Text('Container Information' , style: AppTextStyle.largeBlueBold,),
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
                      Text('Provided By'),
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
          (widget.model.shipments!.isNotEmpty && widget.model.shipments![0].travelStatus == null)?
          selectTravel() :
          (widget.model.shipments!.isNotEmpty  &&  widget.model.shipments![0].travelStatus != null && widget.model.shipments![0].travelStatus == TravelStatusName[TravelStatus.CURRENT]) ?
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text('This container is already included in an existing trip, do you want to change the trip' ,style: AppTextStyle.mediumRed,),
                // ),
                selectTravel()
              ],
            ):
          (widget.model.shipments!.isNotEmpty  &&  widget.model.shipments![0].travelStatus != null && widget.model.shipments![0].travelStatus == TravelStatusName[TravelStatus.RELEASED]) ?
          changeContainerStatus():
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('This container is already included in an existing trip ' , style: AppTextStyle.mediumRed,),
          ),
        ],
      ),
    );
  }

  Widget firstCard(){
    if(widget.model.status == ContainerStatusName[ContainerStatus.FULL]){
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
                Text("This container is full", style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:

                    [
                      Text("Container Number: " , style: AppTextStyle.mediumBlackBold,),
                      Text('#'+ widget.model.containerNumber! , style: AppTextStyle.mediumBlackBold,),

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
                  Text('Product Category Name: ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.productCategoryName ?? '' , style: AppTextStyle.mediumBlueBold,),
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
                  Text('Export Warehouse Name: ' , style: AppTextStyle.mediumBlack,),
                  Text(shipmentModel.exportWarehouseName ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectTravel(){
    bool isFull;
    if(widget.model.status == ContainerStatusName[ContainerStatus.FULL]){
      isFull = true;
    }else {
      isFull = false;
    }

    return
    Column(children: [
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(children: [
      //     Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
      //     SizedBox(width: 5,),
      //     Text('Choose Travel' , style: AppTextStyle.mediumBlackBold,)
      //   ],),
      // ),
      // SelectDropList(
      //   this.optionItemSelectedTravels,
      //   this.dropListModelTravels,
      //       (optionItem) {
      //     FocusScope.of(context).unfocus();
      //     optionItemSelectedTravels = optionItem;
      //     travelID = optionItem.id;
      //     setState(() {});
      //   },
      // ),
      RoundedButton(lable: 'Upload container to travel', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
        AddContainerToTravelRequest re = AddContainerToTravelRequest( holderID: widget.model.id!, shipmentStatus: 'uploaded');
        widget.onUploadedToTravel(re);
      },radius: 12)

    ],);
  }

  Widget changeContainerStatus(){
    if(widget.model.shipments!.isNotEmpty  &&  widget.model.shipments![0].travelStatus != null
        && widget.model.shipments![0].travelStatus == TravelStatusName[TravelStatus.RELEASED]
        && widget.model.shipments![0].shipmentStatus == AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED])
      {
      return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Container Status' , style: AppTextStyle.largeBlueBold,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusCard('cleared' ,false),
              Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
              StatusCard('arrived' ,false),
            ],),
         RoundedButton(lable: 'Next Status', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
           AddContainerToTravelRequest re1 = AddContainerToTravelRequest(holderID: widget.model.id!,shipmentStatus:AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!);
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
                child: Text('Container Status' , style: AppTextStyle.largeBlueBold,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatusCard('cleared' ,true),
                  Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
                  StatusCard('arrived' ,false),
                ],),
              RoundedButton(lable: 'Next Status', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
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
        child: Text('this Container arrived to warehouse' , style: AppTextStyle.mediumRedBold,),
      );
    }
    else {
      return Container();
    }
    }
}
