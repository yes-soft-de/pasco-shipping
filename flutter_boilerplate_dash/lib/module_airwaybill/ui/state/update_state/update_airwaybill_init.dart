import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/consts/subcontarct_service.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/enums/airwaybill_status.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/alert_widget.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class UpdateAirwaybillInit extends StatefulWidget {
  final List<SubcontractModel> subContracts;
  final List<ShipperModel> shipper;
  // final List<HarborModel> harbors;
  // final List<Countries> countriesExports;
  final AirwaybillModel model;
  final Function onUpdate;
  final Function goToShipper;
  final Function goToSubcontract;
  const UpdateAirwaybillInit({ required this.onUpdate , required this.subContracts,required this.model,required this.shipper,required this.goToShipper,required this.goToSubcontract});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<UpdateAirwaybillInit> {
 late TextEditingController containerNumber ;
 late TextEditingController consigneeController ;
 late TextEditingController weightController ;
 // DropListModel dropListModelLocation = DropListModel(location);
 // late Entry optionItemSelectedLocation;
 // late DropListModel dropListModelFromCountries;
 late DropListModel dropListModelProvidedBy;
 late Entry optionItemSelectedProvidedBy;

 late DropListModel dropListModelConsignee;
 late Entry optionItemSelectedConsignee;

 late DropListModel dropListModelShipper;
 late Entry optionItemSelectedShipper;

 // late DropListModel dropListModelHarbor;
 // late Entry optionItemSelectedHarbor;

 late DropListModel dropListModelCarrier;
 late Entry optionItemSelectedCarrier;

 late List<Entry> entryProvidedBy;
 late List<Entry> entryConsignee;
 late List<Entry> entryShipper;
 late List<Entry> entryCarrier;
 // late List<Entry> entrySpecification;
 // late List<Entry> entryHarbor;

 late String status;
 late String type;
 late int selectedRadioType;

 late int shipperID;
 late int consigneeID;
 late int providedByID;
 late int specificationID;
 // late String exportCity;
 late int carrierID;
 // late List<Entry> entryFrom;
 // late Entry optionItemSelectedFrom;
 // TimeOfDay selectedTimeStart = TimeOfDay.now();
 // TimeOfDay selectedTimeEnd = TimeOfDay.now();
 //
 // DateTime now = DateTime.now();
 //
 // DateTime startDate = DateTime.now();
 // DateTime endDate = DateTime.now();
 // var formatter = new DateFormat('dd-MM-yyyy');
 // late String formattedDateStart;
 // late String formattedDateEnd;
 //
 // late String formattedTimeStart;
 // late String formattedTimeEnd;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Image.asset(StaticImage.airwaybill),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).shippingType, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Text(widget.model.type??'' , style: AppTextStyle.mediumBlue,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).airwaybillNumber , style: AppTextStyle.mediumBlackBold,)
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
                      hintText: S.of(context).number,
                    ),
                    controller: containerNumber,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).weight , style: AppTextStyle.mediumBlackBold,)
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
                      hintText: S.of(context).number,
                    ),
                    controller: weightController,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).exportWarehouse , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Text(widget.model.exportLocationName??'' , style: AppTextStyle.mediumBlue,),

              widget.model.location != null?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                      SizedBox(width: 5,),
                      Text(S.of(context).exportWarehouseExternal , style: AppTextStyle.mediumBlackBold,)
                    ],),
                  ),
                  Text(widget.model.location??'' , style: AppTextStyle.mediumBlue,),
                ],):Container(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).exportHarbor , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Text(widget.model.exportPortName??'' , style: AppTextStyle.mediumBlue,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).importHarbor , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Text(widget.model.portName??'' , style: AppTextStyle.mediumBlue,),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).provided , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedProvidedBy,
                this.dropListModelProvidedBy,
                    (optionItem) {
                      FocusScope.of(context).unfocus();
                  optionItemSelectedProvidedBy = optionItem;
                      providedByID = optionItem.id;
                  setState(() {});
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).consignee , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Row(
                children: [
                  Expanded(
                    child: SelectDropList(
                      this.optionItemSelectedConsignee,
                      this.dropListModelConsignee,
                          (optionItem) {
                            optionItemSelectedConsignee = optionItem;
                        consigneeID = optionItem.id;
                        setState(() {});
                      },
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        widget.goToSubcontract();
                      },
                      child: Icon(Icons.add_circle , color: blue , size: 40,)),
                ],
              ),
              widget.model.type=='FCL'?  Padding(
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
                      hintText: S.of(context).consignee,
                    ),
                    controller: consigneeController,
                  ),
                ),
              ):Container(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).shipper , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Row(
                children: [
                  Expanded(
                    child: SelectDropList(
                      this.optionItemSelectedShipper,
                      this.dropListModelShipper,
                          (optionItem) {
                        optionItemSelectedShipper = optionItem;
                        shipperID = optionItem.id;
                        setState(() {});
                      },
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        widget.goToShipper();
                      },
                      child: Icon(Icons.add_circle , color: blue , size: 40,)),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).carrier , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Row(
                children: [
                  Expanded(
                    child: SelectDropList(
                      this.optionItemSelectedCarrier,
                      this.dropListModelCarrier,
                          (optionItem) {
                        optionItemSelectedCarrier= optionItem;
                        carrierID = optionItem.id;
                        setState(() {});
                      },
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        widget.goToSubcontract();
                      },
                      child: Icon(Icons.add_circle , color: blue , size: 40,)),
                ],
              ),



              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                if(optionItemSelectedProvidedBy.id==0){
                  AlertWidget.showAlert(context,false,S.of(context).selectProvider);
                }else {
                  Entry c = Entry(containerNumber.text, widget.model.id!, []);

                  AirwaybillRequest re = AirwaybillRequest(
                      type: type,
                      consigneeID: optionItemSelectedConsignee.id,
                      consignee: consigneeController.text,
                      shipperID: optionItemSelectedShipper.id,
                      carrierID: optionItemSelectedCarrier.id,
                      weight: int.parse(weightController.text),
                      airwaybillNumber: containerNumber.text,
                      providedBy: optionItemSelectedProvidedBy.id,
                      portID: widget.model.portID,
                      exportLocation: widget.model.exportLocationID,
                      exportPortID: widget.model.exportPortID,
                      id: widget.model.id
                  );
                  widget.onUpdate(re, c);
                }}, radius: 15)
            ],),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    entryProvidedBy = <Entry>[];
    entryShipper= <Entry>[];
    entryConsignee= <Entry>[];
    entryCarrier= <Entry>[];


    containerNumber=TextEditingController();
    weightController=TextEditingController();
    weightController..text = widget.model.weight??'';
    consigneeController=TextEditingController();
    containerNumber..text = widget.model.airwaybillNumber??'';

    status= widget.model.status!;
    type= widget.model.type!;

    optionItemSelectedProvidedBy =  Entry('choose', 0, []);
    optionItemSelectedShipper =  Entry('choose', 0, []);
    optionItemSelectedConsignee =  Entry('choose', 0, []);
    optionItemSelectedCarrier =  Entry('choose', 0, []);
    // optionItemSelectedLocation = Entry(widget.model.location??'', 0, []);
    initList();

  }

  void initList(){
    for(SubcontractModel item in widget.subContracts){
      if(widget.model.subcontractName == item.fullName){
        optionItemSelectedProvidedBy = Entry(item.fullName! ,item.id! ,[]);
      }
      if(widget.model.consigneeName == item.fullName){
        optionItemSelectedConsignee = Entry(item.fullName! ,item.id! ,[]);
      }
      if(widget.model.carrierName == item.fullName){
        optionItemSelectedCarrier = Entry(item.fullName! ,item.id! ,[]);
      }


      Entry v = Entry(item.fullName! ,item.id! ,[]);
      if(item.serviceName == Service.airwaybillProvider) {
        entryProvidedBy.add(v);
      }

      if(item.serviceName ==Service.Consignee) {
        entryConsignee.add(v);
      }
      if(item.serviceName == Service.Carrier) {
        entryCarrier.add(v);
      }
    }
    dropListModelProvidedBy = DropListModel(entryProvidedBy);
    dropListModelConsignee= DropListModel(entryConsignee);
    dropListModelCarrier= DropListModel(entryCarrier);

    for(ShipperModel  item in widget.shipper){
      if(widget.model.shipperName == item.fullName){
        optionItemSelectedShipper = Entry(item.fullName! ,item.id! ,[]);
      }
      Entry v = Entry(item.fullName! ,item.id! ,[]);
      entryShipper.add(v);
    }
    dropListModelShipper = DropListModel(entryShipper);
  }

 void _setSelectedRadioGender(int val) {
   setState(() {
     selectedRadioType = val;
     if (val == 1) {
       type = AirwaybillTypeName[AirwaybillType.PUBLIC]!;
     } else if (val == 2) {
       type = AirwaybillTypeName[AirwaybillType.PRIVATE]!;
     }
     print(val);
   });
 }

}
