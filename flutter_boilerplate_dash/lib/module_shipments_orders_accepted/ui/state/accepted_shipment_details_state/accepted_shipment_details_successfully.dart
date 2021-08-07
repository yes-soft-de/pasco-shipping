import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class AcceptedShipmentDetailsSuccessfully extends StatefulWidget {
  final AcceptedShipmentDetailsModel shipment;
  // final List<ContainerModel> containers;
  final Function onShowStatus;
  const AcceptedShipmentDetailsSuccessfully({required this.shipment,required this.onShowStatus});

  @override
  _AcceptedShipmentDetailsSuccessfullyState createState() => _AcceptedShipmentDetailsSuccessfullyState();
}

class _AcceptedShipmentDetailsSuccessfullyState extends State<AcceptedShipmentDetailsSuccessfully> {
  late List<Category> stats;


  @override
  void initState() {
    super.initState();
    stats = [
      Category(id: 1, name: 'Accepted', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!, isSelected: false),
      Category(id: 1, name: 'Received in warehouse', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]!, isSelected: false),
      Category(id: 1, name: 'Measured', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!, isSelected: false),
      Category(id: 1, name: 'Stored in holder', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.STORED]!, isSelected: false),
      Category(id: 1, name: 'On board', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.UPLOADED]!, isSelected: false),
      Category(id: 1, name: 'Started Travel', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.STARTED]!, isSelected: false),
      Category(id: 1, name: 'Released Travel', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED]!, isSelected: false),
      Category(id: 1, name: 'Cleared holder', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!, isSelected: false),
      Category(id: 1, name: 'Arrived to warehouse', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!, isSelected: false),
      Category(id: 1, name: 'Delivered to Client', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.DELIVERED]!, isSelected: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                      children: [
              Text(
              'Client name: ',
              style: AppTextStyle.mediumBlack,
            ),
                        Text(
                          widget.shipment.clientUsername.toString(),
                          style: AppTextStyle.smallBlueBold,
                        )
                      ],


                    )),
              ],
            ),
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Shipment from: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.exportWarehouseName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Shipment to: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.target ??'',
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Product type: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.productCategoryName ?? '',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Quantity ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.quantity.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Supplier Name: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Text(
                          widget.shipment.supplierName.toString(),
                          style: AppTextStyle.smallBlueBold,
                        )
                      ],


                    )),
              ],
            ),
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      'Recipient Info: ',
                      style: AppTextStyle.mediumBlack,
                    )),
              ),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Name: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.receiverName ??'',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        'Phone: ',
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.receiverPhoneNumber ??'',
                        style: AppTextStyle.smallBlueBold,
                      ))),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      'Unit: ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.unit ??'',
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
              Expanded(
                child: ListTile(
                    title: Text(
                      'Mark ',
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.markNumber??'',
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
            ],
          ),
          ListTile(
              title: Text(
                'Payment time ',
                style: AppTextStyle.mediumBlack,
              ),
              subtitle: Text(
                widget.shipment.paymentTime ?? '',
                style: AppTextStyle.smallBlueBold,
              )),
          Divider(color: Colors.grey[300],thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Sub Shipment Info' , style: AppTextStyle.largeBlueBold,),
          ),
          ListView.builder(itemBuilder:(context , index){
            return subShipmentCard(widget.shipment.subShipmentModelList![index]);
          },itemCount: widget.shipment.subShipmentModelList!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

          )

        ],
      ),
    );
  }

  Widget subShipmentCard(SubShipmentModel subShipmentModel){
    return InkWell(
      onTap: (){
        widget.onShowStatus(widget.shipment.shipmentId , subShipmentModel.trackNumber,widget.shipment.target,'public', subShipmentModel.shipmentStatus);
      },
      child: Padding(
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
                    Text(subShipmentModel.trackNumber?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('Status: ' , style: AppTextStyle.mediumBlack,),
                    Text(subShipmentModel.shipmentStatus ??'' , style: AppTextStyle.mediumBlueBold,),
                  ],),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Widget selectContainer(){
  //   return
  //     Column(children: [
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(children: [
  //           Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
  //           SizedBox(width: 5,),
  //           Text('Choose Container' , style: AppTextStyle.mediumBlackBold,)
  //         ],),
  //       ),
  //       SelectDropList(
  //         this.optionItemSelectedTravels,
  //         this.dropListModelTravels,
  //             (optionItem) {
  //           FocusScope.of(context).unfocus();
  //           optionItemSelectedTravels = optionItem;
  //           travelID = optionItem.id;
  //           setState(() {});
  //         },
  //       ),
  //       RoundedButton(lable: 'Done', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
  //         AddContainerToTravelRequest re = AddContainerToTravelRequest(holderType: 'container' , holderID: widget.model.id!, travelID: travelID , shipmentStatus: 'uploaded');
  //         widget.onUploadedToTravel(re);
  //       },radius: 12)
  //
  //     ],);
  // }
}