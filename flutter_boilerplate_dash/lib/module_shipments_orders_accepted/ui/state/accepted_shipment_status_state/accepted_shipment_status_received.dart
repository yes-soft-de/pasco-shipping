import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_container/enums/container_status.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/widget/status_card.dart';
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
  const AcceptedShipmentStatusReceived({required this.statusModel,required this.onChangeStatus,required this.subcontracts,required this.warehouse});

  @override
  _AcceptedShipmentDetailsSuccessfullyState createState() =>
      _AcceptedShipmentDetailsSuccessfullyState();
}

class _AcceptedShipmentDetailsSuccessfullyState
    extends State<AcceptedShipmentStatusReceived> {
  // late List<Category> stats;
  late int shipmentID;
  late String trackNumber;
  late String transportation;
  late String holderType;

  TextEditingController editingController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController volumeController = TextEditingController();
  TextEditingController qrCodeController = TextEditingController();
  TextEditingController guniQuantityController = TextEditingController();

  late DropListModel dropListModelSubContract;
  late Entry optionItemSelectedSubContract;

  late DropListModel dropListModelWarehouse;
  late Entry optionItemSelectedWarehouse;

  late List<Entry> entrySubContract;
  late List<Entry> entryWarehouse;

  late String packetingBy;
  late int warehouseID;

  @override
  void initState() {
    super.initState();
    entrySubContract = <Entry>[];
    entryWarehouse= <Entry>[];

    optionItemSelectedSubContract =  Entry('choose', 1, []);
    optionItemSelectedWarehouse =  Entry('choose', 1, []);
    warehouseID = 0;
    packetingBy='';
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentID =arguments['id'];
    trackNumber =arguments['trackNumber'].toString();
    transportation =arguments['transportation'].toString();

    holderType =arguments['holderType'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.statusModel[3].statusDetails!.isNotEmpty ?Padding(
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
          if(transportation =='sea'){
            ContainerFilterRequest containerRequest = ContainerFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: holderType);
            TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:TravelTypeName[TravelType.SEA]!);
            MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,
                shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,
                packetingBy: packetingBy,qrCode: '',volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
            widget.onChangeStatus(request ,containerRequest,travelFilterRequest );
          }else {
            AirwaybillFilterRequest containerRequest = AirwaybillFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: holderType);
            TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:TravelTypeName[TravelType.AIR]!);
            MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,
                shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,
                packetingBy: packetingBy,qrCode: '',volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
            widget.onChangeStatus(request ,containerRequest,travelFilterRequest );
          }

              }, radius: 10),
      ],
    );


  }
}
