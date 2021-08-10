import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:pasco_shipping/module_shipments_orders_accepted/response/warehouse_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/shipment_status_card.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class AcceptedShipmentStatusReceived extends StatefulWidget {
  final List<AcceptedShipmentStatusModel> statusModel;
  final List<SubcontractModel> subcontracts;
  final List<WarehouseModel> warehouse;
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

   for(WarehouseModel item in widget.warehouse){
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

    holderType =arguments['holderType'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                    Text('Write a Details about next status' , style: AppTextStyle.mediumBlackBold,)
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
                        hintText: 'details',
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
            Text('Packing By' , style: AppTextStyle.mediumBlackBold,)
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
            Text('Import Warehouse' , style: AppTextStyle.mediumBlackBold,)
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
                hintText: 'weight',
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
                hintText: 'volume',
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
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'qrCode',
              ),
              controller: qrCodeController,
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
                hintText: 'guni Quantity',
              ),
              controller: guniQuantityController,
            ),
          ),
        ),

        RoundedButton(lable: 'Next', icon: '', color: blue, style: AppTextStyle.mediumWhite,
              go: (){
          ContainerFilterRequest containerRequest = ContainerFilterRequest(status: ContainerStatusName[ContainerStatus.NOTFULL],type: holderType);
                MeasuredRequest request  = MeasuredRequest(shipmentStatus: AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!,shipmentId: shipmentID,statusDetails: editingController.text,trackNumber: trackNumber,guniQuantity:int.parse(guniQuantityController.text),importWarehouseID: warehouseID,packetingBy: packetingBy,qrCode: qrCodeController.text,volume: double.parse(volumeController.text),weight: double.parse(weightController.text) );
                widget.onChangeStatus(request ,containerRequest );
              }, radius: 10),
      ],
    );


  }
}
