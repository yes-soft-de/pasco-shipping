import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_container/enums/container_status.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
import 'package:pasco_shipping/module_gunny/request/add_shipment_to_gunny_request.dart';
import 'package:pasco_shipping/module_gunny/response/gunny_response.dart';
import 'package:pasco_shipping/module_gunny/response/stored_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/measured_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/received_deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/shipment_status_card.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AcceptedShipmentStatusReceived extends StatefulWidget {
  final List<AcceptedShipmentStatusModel> statusModel;
  final List<SubcontractModel> subcontracts;
  final List<WarehousesModel> warehouse;
  final Function onChangeStatus;

  final List<GunnyModel> gunnies;
  final StoredModel infoStoredInGunny;
  final Function onStoredInGunny;
  final Function createGunny;
  const AcceptedShipmentStatusReceived({required this.statusModel,required this.onChangeStatus,required this.subcontracts,required this.warehouse,required this.gunnies,required this.infoStoredInGunny,required this.onStoredInGunny,required this.createGunny});

  @override
  _AcceptedShipmentDetailsSuccessfullyState createState() =>
      _AcceptedShipmentDetailsSuccessfullyState();
}

class _AcceptedShipmentDetailsSuccessfullyState
    extends State<AcceptedShipmentStatusReceived> {
  // late List<Category> stats;
  late int shipmentID;
  late int clientUserID;
  late String trackNumber;
  late String transportation;
  late bool isExternalWarehouse;
  late String holderType;

  TextEditingController editingController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController volumeController = TextEditingController();
  TextEditingController qrCodeController = TextEditingController();
  TextEditingController guniQuantityController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  late DropListModel dropListModelSubContract;
  late Entry optionItemSelectedSubContract;

  late DropListModel dropListModelWarehouse;
  late Entry optionItemSelectedWarehouse;

  late DropListModel dropListModelGunny;
  late Entry optionItemSelectedGunny;

  late List<Entry> entrySubContract;
  late List<Entry> entryWarehouse;
  late List<Entry> entryGunny;

  late String packetingBy;
  late int warehouseID;
  late bool gunnyFull;
  late bool moreInfo;

  @override
  void initState() {
    super.initState();
    entrySubContract = <Entry>[];
    entryWarehouse= <Entry>[];
    entryGunny= <Entry>[];

    optionItemSelectedSubContract =  Entry('choose', 0, []);
    optionItemSelectedWarehouse =  Entry('choose', 0, []);
    optionItemSelectedGunny =  Entry('choose', 0, []);
    warehouseID = 0;
    packetingBy='';
    gunnyFull=false;
    moreInfo=false;
    iniList();
  }
 void iniList(){
   for(SubcontractModel item in widget.subcontracts){
     Entry v = Entry(item.fullName! ,item.id! ,[]);
     entrySubContract.add(v);
   }
   dropListModelSubContract = DropListModel(entrySubContract);

   for(WarehousesModel item in widget.warehouse){
     Entry v = Entry(item.name! ,item.id! ,[]);
     print("hhhhhhh" + item.name!);
     entryWarehouse.add(v);
   }
   dropListModelWarehouse = DropListModel(entryWarehouse);


   for(GunnyModel item in widget.gunnies){
     Entry v = Entry(item.identificationNumber! ,item.id! ,[]);
     entryGunny.add(v);
   }
   dropListModelGunny = DropListModel(entryGunny);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentID =arguments['id'];
    clientUserID =arguments['clientUserID'];
    trackNumber =arguments['trackNumber'].toString();
    transportation =arguments['transportation'].toString();
    isExternalWarehouse =arguments['isExternalWarehouse'];

    holderType =arguments['holderType'];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.statusModel[1].statusDetails!.isNotEmpty ?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.warning ,color: Colors.red),
                    SizedBox(width: 10,),
                    Expanded(child: Text(widget.statusModel[3].statusDetails ??'' , style:  AppTextStyle.mediumRedBold)),
                  ],
                ),
              ),
            ),
          ) :Container(),
          ListView.builder(itemBuilder: (context, index) {
            return AcceptedShipmentStatusCard(widget.statusModel[index]);
          },itemCount: widget.statusModel.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                    SizedBox(width: 5,),
                    Text(S.of(context).writeDetails , style: AppTextStyle.mediumBlackBold,)
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: S.of(context).details,
                      ),
                      controller: editingController,
                    ),
                  ),
                ),
                changeStatusCard()
              ],),
            ),
          ),

        ],
      ),
    );
  }

 Widget changeStatusCard(){

    return  Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
            SizedBox(width: 5,),
            Text(S.of(context).gunnyNumber , style: AppTextStyle.mediumBlackBold,)
          ],),
        ),
        Row(
          children: [
            Expanded(
              child: SelectDropList(
                this.optionItemSelectedGunny,
                this.dropListModelGunny,
                    (optionItem) {
                  FocusScope.of(context).unfocus();
                  optionItemSelectedGunny = optionItem;
                  setState(() {});
                },
              ),
            ),
            InkWell(
                onTap: (){
                  widget.createGunny();
                },
                child: Icon(Icons.add_circle , color: blue , size: 40,)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.only(
                top: 4,left: 16, right: 16, bottom: 4
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(15)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5
                  )
                ]
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:S.of(context).quantity,
              ),
              controller: quantityController,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppThemeDataService.AccentColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(S.of(context).gunnyFull ,style: AppTextStyle.mediumBlackBold,),
                  Checkbox(onChanged: (bool? value) {
                    setState(() {
                      gunnyFull = value!;
                      print(gunnyFull);
                    });
                  }, value: gunnyFull,
                  ),
                ],
              ),
            ),
            RoundedButton(lable: S.of(context).save, icon: '',
                color: blue, style: AppTextStyle.smallWhite, go: (){
                  if(optionItemSelectedGunny.id ==0){
                    Fluttertoast.showToast(msg: S.of(context).chooseGunny);
                  }else{
                    AddShipmentToGunnyRequest m  = AddShipmentToGunnyRequest(shipmentID: shipmentID ,trackNumber: trackNumber ,gunnyID: optionItemSelectedGunny.id,quantity: int.parse(quantityController.text), gunnyStatus:gunnyFull?'full':'notfull');
                    widget.onStoredInGunny(m);
                  }
                }, radius: 5),
          ],
        ),


        widget.infoStoredInGunny.remainedQuantity.isNotEmpty ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(S.of(context).remainedQuantity+': ',style: AppTextStyle.mediumBlackBold),
                  Text(widget.infoStoredInGunny.remainedQuantity,style: AppTextStyle.largeBlueBold)
                ],
              )
            ],
          ),
        ):Container(),

        InkWell(
          onTap: (){
            setState(() {
                moreInfo=!moreInfo;

            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
             moreInfo? Icon(Icons.arrow_circle_up_rounded ,size: 50,color: Colors.white,) :Icon(Icons.arrow_circle_down_rounded ,size: 50,color: blue,),
                Text(S.of(context).more)
            ],),
          ),
        ),

        // measured step
        Visibility(
          visible: moreInfo,
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).packingBy , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedSubContract,
                this.dropListModelSubContract,
                    (optionItem) {
                  FocusScope.of(context).unfocus();
                  optionItemSelectedSubContract = optionItem;
                  packetingBy = optionItem.title;
                  setState(() {});
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).importWarehouse , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedWarehouse,
                this.dropListModelWarehouse,
                    (optionItem) {
                  FocusScope.of(context).unfocus();
                  optionItemSelectedWarehouse = optionItem;
                  warehouseID = optionItem.id;
                  setState(() {});
                },
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).width,
                    ),
                    controller: weightController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:S.of(context).volume,
                    ),
                    controller: volumeController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).guniQuantity,
                    ),
                    controller: guniQuantityController,
                  ),
                ),
              ),
              RoundedButton(lable:S.of(context).next, icon: '', color: blue, style: AppTextStyle.mediumWhite,
                  go: (){
                    if(transportation =='sea' && holderType=='FCL'){
                      ContainerFilterRequest containerRequest = ContainerFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: 'FCL',clientUserID: clientUserID);
                      TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:TravelTypeName[TravelType.SEA]!);
                      MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,
                          shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,
                          packetingBy: packetingBy,qrCode: '',volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
                      widget.onChangeStatus(request ,containerRequest,travelFilterRequest );
                    }else if (transportation =='sea' && holderType=='LCL') {
                      ContainerFilterRequest containerRequest = ContainerFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: holderType,isExternalWarehouse: isExternalWarehouse);
                      TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:TravelTypeName[TravelType.SEA]!);
                      MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,
                          shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,
                          packetingBy: packetingBy,qrCode: '',volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
                      widget.onChangeStatus(request ,containerRequest,travelFilterRequest );
                    }

                    if(transportation =='air' && holderType=='FCL'){
                      AirwaybillFilterRequest containerRequest = AirwaybillFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: 'FCL',clientUserID: clientUserID);
                      TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:TravelTypeName[TravelType.AIR]!);
                      MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,
                          shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,
                          packetingBy: packetingBy,qrCode: '',volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
                      widget.onChangeStatus(request ,containerRequest,travelFilterRequest );
                    }else if (transportation =='air' && holderType=='LCL') {
                      print('herreee');
                      AirwaybillFilterRequest containerRequest = AirwaybillFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: holderType,isExternalWarehouse: isExternalWarehouse);
                      TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:TravelTypeName[TravelType.AIR]!);
                      MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,
                          shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,
                          packetingBy: packetingBy,qrCode: '',volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
                      widget.onChangeStatus(request ,containerRequest,travelFilterRequest );
                    }

                    // else {
                    //   AirwaybillFilterRequest containerRequest = AirwaybillFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: holderType);
                    //   TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:TravelTypeName[TravelType.AIR]!);
                    //   MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,
                    //       shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,
                    //       packetingBy: packetingBy,qrCode: '',volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
                    //   widget.onChangeStatus(request ,containerRequest,travelFilterRequest );
                    // }

                  }, radius: 10),
            ],
          ),
        ),







      ],
    );


  }
}
