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
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/image_full_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/widget/holder_card.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:collection/collection.dart';

class AcceptedShipmentDetailsSuccessfully extends StatefulWidget {
  final AcceptedShipmentDetailsModel shipment;
  // final List<ContainerModel> containers;
  final Function onShowStatus;
  final Function onShowFinance;
  final Function onRequestShift;
  final Function onCreateInvoice;
  final Function onShowInvoice;
  const AcceptedShipmentDetailsSuccessfully({required this.shipment,required this.onShowStatus,required this.onShowFinance,required this.onRequestShift,required this.onCreateInvoice,required this.onShowInvoice});

  @override
  _AcceptedShipmentDetailsSuccessfullyState createState() => _AcceptedShipmentDetailsSuccessfullyState();
}

class _AcceptedShipmentDetailsSuccessfullyState extends State<AcceptedShipmentDetailsSuccessfully> {
  // late List<Category> stats;
 late final Map releaseDateMap;

  @override
  void initState() {
    super.initState();
    // var newMap = groupBy(widget.shipment.pendingHolders, (obj) => obj!['']?? '');
    releaseDateMap = widget.shipment.pendingHolders.groupListsBy((m) => m.specificationName);
    // stats = [
    //   Category(id: 1, name: 'Accepted', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!, isSelected: false),
    //   Category(id: 1, name: 'Received in warehouse', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]!, isSelected: false),
    //   Category(id: 1, name: 'Measured', description: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!, isSelected: false),
    //   Category(id: 1, name: 'Stored in holder', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.STORED]!, isSelected: false),
    //   Category(id: 1, name: 'On board', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.UPLOADED]!, isSelected: false),
    //   Category(id: 1, name: 'Started Travel', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.STARTED]!, isSelected: false),
    //   Category(id: 1, name: 'Released Travel', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED]!, isSelected: false),
    //   Category(id: 1, name: 'Cleared holder', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!, isSelected: false),
    //   Category(id: 1, name: 'Arrived to warehouse', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!, isSelected: false),
    //   Category(id: 1, name: 'Delivered to Client', description:AcceptedShipmentStatusName[AcceptedShipmentStatus.DELIVERED]!, isSelected: false),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(S.of(context).serialNumber , style: AppTextStyle.mediumBlack, ),
                    Text( widget.shipment.clientIdentificationNumber ??'' ,style: AppTextStyle.mediumBlueBold, ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    _showSerAlert();
                  },
                  child: Icon(
                    Icons.print,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
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
                          S.of(context).shippingType+': ',
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
                        S.of(context).subCategory,
                        style: AppTextStyle.mediumBlack,
                      ),
                      subtitle: Text(
                        widget.shipment.subProductCategoryName ?? '',
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
                        Expanded(
                          child: Text(
                            widget.shipment.supplierName.toString(),
                            style: AppTextStyle.smallBlueBold,
                          ),
                        )
                      ],


                    )),
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
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).holderType,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.holderType ?? '',
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).inExternalWarehouse,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.isExternalWarehouse ? S.of(context).yes:S.of(context).no,
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).paymentTime,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.paymentTime ?? '',
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).holderCount,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.holderCount.toString(),
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Row(
            children: [
              Expanded(
                child: ListTile(
                    title: Text(
                      S.of(context).vehicleNumber,
                      style: AppTextStyle.mediumBlack,
                    ),
                    subtitle: Text(
                      widget.shipment.vehicleIdentificationNumber ?? '',
                      style: AppTextStyle.smallBlueBold,
                    )),
              ),
            ],
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).showQR),
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
      widget.shipment.shipmentInvoiceID != 0 ?
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Show Invoice'),
            InkWell(
              onTap: (){
                widget.onShowInvoice(widget.shipment.shipmentId);
              },
              child: Icon(
                Icons.remove_red_eye,
                size: 50,
                color: Colors.black,
              ),
            ),
          ],
        ),
      )
       :Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Create Invoice'),
                InkWell(
                  onTap: (){
                  widget.onCreateInvoice(widget.shipment.shipmentId);
                  },
                  child: Icon(
                    Icons.insert_invitation_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Divider(color: Colors.grey[300],thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Information from the receptionist'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.red[100],
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Row(children: [
                  Text('Quantity received: '),
                  Text(widget.shipment.info.receivedQuantity??'',style: AppTextStyle.mediumBlackBold,),
                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Expanded(child: Text(S.of(context).supplierInfo)),
                  Expanded(child: Text(widget.shipment.info.supplierName??'',style: AppTextStyle.mediumBlackBold,)),
                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Text(S.of(context).importantNote+': ',),
                  Expanded(child: Text(widget.shipment.info.notes??'',style: AppTextStyle.mediumBlackBold,)),
                ],)
              ],),
            ),),
          ),

          Divider(color: Colors.grey[300],thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Gunny' ,style: AppTextStyle.mediumBlack, ),
          ),
          ListView.builder(itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.green[100],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(S.of(context).gunnyNumber+': '),
                            Text(widget.shipment.gunnyModel![index].gunnyIdentificationNumber!+',' , style: AppTextStyle.mediumBlackBold,),
                          ],
                        ),
                        Row(
                          children: [
                            Text(S.of(context).unitQuantity+': '),
                            Text(widget.shipment.gunnyModel![index].quantity.toString() , style: AppTextStyle.mediumBlackBold,),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          },itemCount: widget.shipment.gunnyModel!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          Divider(color: Colors.grey[300],thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(S.of(context).holder ,style: AppTextStyle.mediumBlack, ),
          ),
        ListView.builder(itemBuilder: (context , index){
          String key = releaseDateMap.keys.elementAt(index);
          var valueCount = releaseDateMap.values.elementAt(index);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(key+': ' ,style: AppTextStyle.mediumBlack,),
                Text(valueCount.length.toString(),style: AppTextStyle.smallBlueBold,)
              ],
            ),
          );
        },itemCount: releaseDateMap.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),

        widget.shipment.pendingHolders.isNotEmpty ?  ListView.builder(itemBuilder:(context , index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: HolderCard(
                  pendingHolders: widget.shipment.pendingHolders[index]),
            );
          },
            itemCount: widget.shipment.pendingHolders.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ) :Container(),
          Divider(color: Colors.grey[300],thickness: 2,),

          Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(S.of(context).attached ,style: AppTextStyle.mediumBlack),
         ),
         widget.shipment.imagePath!.isEmpty?Container(): GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
             physics: NeverScrollableScrollPhysics(),
             children: List.generate(widget.shipment.imagePath!.length, (index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FullImageScreen(widget.shipment.imagePath![index].url , false)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                    child: Image.network(
                      widget.shipment.imagePath![index].url,
                      fit: BoxFit.fill,
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              })
          ),
          // Divider(color: Colors.grey[300],thickness: 2,),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text( S.of(context).trackNumber , style: AppTextStyle.mediumBlack,),
                  Text(subShipmentModel.trackNumber?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text(S.of(context).status+': ' , style: AppTextStyle.mediumBlack,),
                      Text(subShipmentModel.shipmentStatus ??'' , style: AppTextStyle.mediumBlueBold,),
                    ],),
                  ),
                  subShipmentModel.shipmentStatus !='accepted'?   InkWell(
                    onTap: () async {
                      final pdfFile = await PdfParagraphApi.generateReceivedReport(subShipmentModel ,widget.shipment.shipmentId.toString(),widget.shipment.transportationType,widget.shipment.clientUsername,widget.shipment.supplierName,widget.shipment.info.receivedQuantity.toString(),widget.shipment.updatedAt.toString().split(' ').first);

                      PdfParagraphApi.openFile(pdfFile);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.document_scanner_sharp ,size: 50,),
                        Text('Received Report')
                      ],
                    ),
                  ):Container()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text( S.of(context).holder , style: AppTextStyle.mediumBlack,),
                ],),
              ),
              ListView.builder(itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      color: Colors.yellow[100],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(S.of(context).number+': '),
                                Text(subShipmentModel.storingHolder[index].holderInfoShipment.IdentificationNumber??"" , style: AppTextStyle.mediumBlackBold,),
                              ],
                            ),
                            Row(
                              children: [
                                Text(S.of(context).status+': '),
                                Text(subShipmentModel.storingHolder[index].holderInfoShipment.shippingStatus??'' , style: AppTextStyle.mediumBlackBold,),
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              },itemCount: subShipmentModel.storingHolder.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              RoundedButton(lable: S.of(context).showStatus, icon: '', color: blue, style: AppTextStyle.smallWhite, go: (){
                widget.onShowStatus(widget.shipment.shipmentId , subShipmentModel.trackNumber,widget.shipment.target,widget.shipment.holderType, subShipmentModel.shipmentStatus,widget.shipment.transportationType ,widget.shipment.isExternalWarehouse, widget.shipment.clientUserID);
              }, radius: 12),

              Row(
                children: [
                  RoundedButton(lable: 'Shift Shipment', icon: '', color: blue, style: AppTextStyle.smallWhite, go: (){
                    widget.onRequestShift(widget.shipment.shipmentId , subShipmentModel.trackNumber);
                  }, radius: 12),
                 widget.shipment.holderType =='LCL'?  RoundedButton(lable: S.of(context).shipmentCost, icon: '', color: blue, style: AppTextStyle.smallWhite, go: (){
                    widget.onShowFinance(widget.shipment.shipmentId , subShipmentModel.trackNumber);
                  }, radius: 12) :Container(),

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
      title: Text(S.of(context).shipmentQR),
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
        Row(children: [
          FlatButton(onPressed: (){}, child: Row(children: [
            Icon(Icons.print, color: blue,size: 30,),
          ],)),
          Text('1' +'\\'+ widget.shipment.quantity.toString()),
          Text(' Copy')
        ],


        )

      ],
    );
  });
  }

  _showSerAlert(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Text(S.of(context).shipmentSticker),
            content: SizedBox(
              width: 200,
              height: 100,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).shippingFrom,
                        style: AppTextStyle.mediumBlack,
                      ),
                      Expanded(
                        child: Text(
                          widget.shipment.exportWarehouseName.toString(),
                          style: AppTextStyle.smallBlueBold,
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(
                        S.of(context).shippingTo,
                        style: AppTextStyle.mediumBlack,
                      ),
                      Text(
                        widget.shipment.target ??'',
                        style: AppTextStyle.smallBlueBold,
                      )

                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(children: [
                    Text(S.of(context).serialNumber, style: AppTextStyle.mediumBlack,),
                    Text(widget.shipment.clientIdentificationNumber ??'' , style: AppTextStyle.mediumBlue,)
                  ],)
                ],
              ),
            ),
            actions: [
              Row(
                children: [
                  FlatButton(onPressed: (){}, child: Row(children: [
                    Icon(Icons.print, color: blue,size: 30,),
                  ],)),
                  Text('1' +'\\'+ widget.shipment.quantity.toString()),
                  Text(' Copy')
                ],
              )

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
