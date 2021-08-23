import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AcceptedShipmentDetailsSuccessfully extends StatefulWidget {
  final AcceptedShipmentDetailsModel shipment;
  // final List<ContainerModel> containers;
  final Function onShowStatus;
  final Function onShowFinance;
  const AcceptedShipmentDetailsSuccessfully({required this.shipment,required this.onShowStatus,required this.onShowFinance});

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
                          S.of(context).shippingType,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Text(
                          widget.shipment.transportationType??'',
                          style: AppTextStyle.smallBlueBold,
                        )
                      ],


                    )),
                Expanded(
                    child: Row(
                      children: [
              Text(
                S.of(context).client,
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
                        S.of(context).shippingFrom,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.exportWarehouseName.toString(),
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).shippingTo,
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
                        S.of(context).category,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.productCategoryName ?? '',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).quantity,
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
                          S.of(context).supplierInfo,
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
                      S.of(context).receiverInfo,
                      style: AppTextStyle.mediumBlack,
                    )),
              ),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).name,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.receiverName ??'',
                        style: AppTextStyle.smallBlueBold,
                      ))),
              Expanded(
                  child: ListTile(
                      title: Text(
                        S.of(context).phone,
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
                      S.of(context).unit,
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
                      S.of(context).mark,
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
                S.of(context).paymentTime,
                style: AppTextStyle.mediumBlack,
              ),
              subtitle: Text(
                widget.shipment.paymentTime ?? '',
                style: AppTextStyle.smallBlueBold,
              )),
          Divider(color: Colors.grey[300],thickness: 2,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Show QR'),
                InkWell(
                  onTap: (){
                    _showQrAlert();
                  },
                  child: Icon(
                    Icons.qr_code_scanner,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(widget.shipment.imagePath!.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                  child: Image.network(
                    widget.shipment.imagePath![index].url,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                );
              })
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text( S.of(context).shipmentStatus , style: AppTextStyle.largeBlueBold,),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  Text( S.of(context).trackNumber , style: AppTextStyle.mediumBlack,),
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
              Row(
                children: [
                  RoundedButton(lable: S.of(context).showFinance, icon: '', color: blue, style: AppTextStyle.mediumWhite, go: (){
                    widget.onShowFinance(widget.shipment.shipmentId , subShipmentModel.trackNumber);
                  }, radius: 12),
                  RoundedButton(lable: 'Show Status', icon: '', color: blue, style: AppTextStyle.mediumWhite, go: (){
                    widget.onShowStatus(widget.shipment.shipmentId , subShipmentModel.trackNumber,widget.shipment.target,'public', subShipmentModel.shipmentStatus,widget.shipment.transportationType);
                  }, radius: 12),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }


   _showQrAlert(){
     showDialog(
         context: context,
         builder: (BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text('Shipment QR'),
      content: SizedBox(
        width: 200,
        height: 200,
        child: QrImage(
          data: widget.shipment.toString(),
          // version: QrVersions.auto,
          size: 200,
        ),
      ),
      actions: [
        FlatButton(onPressed: (){}, child: Row(children: [
          Icon(Icons.print, color: blue,size: 30,),
        ],))
      ],
    );
  });
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
