import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/enums/airwaybill_status.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_request.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class RequestAirwaybillInit extends StatefulWidget {
  final List<SubcontractModel> subContracts;
  final List<ClientModel> clients;
  final List<HarborModel> harbors;
  final List<Countries> countriesExports;
  final Function onSave;
  const RequestAirwaybillInit({ required this.onSave , required this.subContracts,required this.clients,required this.harbors,required this.countriesExports});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<RequestAirwaybillInit> {
 // late TextEditingController location ;
  DropListModel dropListModelLocation = DropListModel(location);
  late Entry optionItemSelectedLocation;
  late DropListModel dropListModelFromCountries;
 late DropListModel dropListModelProvidedBy;
 late Entry optionItemSelectedProvidedBy;

 late DropListModel dropListModelConsignee;
 late Entry optionItemSelectedConsignee;

 late DropListModel dropListModelShipper;
 late Entry optionItemSelectedShipper;

 late DropListModel dropListModelSpecification;
 late Entry optionItemSelectedSpecification;

 late DropListModel dropListModelCarrier;
 late Entry optionItemSelectedCarrier;

 late DropListModel dropListModelClient;
 late Entry optionItemSelectedClient;

 late DropListModel dropListModelHarbor;
 late Entry optionItemSelectedHarbor;

 late List<Entry> entryProvidedBy;
 late List<Entry> entryConsignee;
 late List<Entry> entryShipper;
 late List<Entry> entryCarrier;
 late List<Entry> entrySpecification;
 late List<Entry> entryClient;
 late List<Entry> entryHarbor;
 late String status;
 late String type;
 late int selectedRadioType;
  late List<Entry> entryFrom;
  late Entry optionItemSelectedFrom;
 // late int shipperID;
 // late int consigneeID;
 // late int providedByID;
 late int specificationID;

 late int carrierID;
 late int clientID;

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
                  Text(S.of(context).airwaybillType, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioGender(1);
                          },
                          value: 1,
                          groupValue: selectedRadioType,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).LCL,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioGender(2);
                          },
                          value: 2,
                          groupValue: selectedRadioType,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).FCL,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).exportCity, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropListl(
                this.optionItemSelectedFrom,
                this.dropListModelFromCountries,
                    (optionItem) {
                  optionItemSelectedFrom = optionItem;
                  print(optionItem.title);
                  print(optionItem.id);
                  // widget.shipmentRequest.exportWarehouseID =optionItem.id;
                  // widget.shipmentRequest.exportWarehouseName =optionItem.title;
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).location , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedLocation,
                this.dropListModelLocation,
                    (optionItem) {
                  FocusScope.of(context).unfocus();
                  optionItemSelectedLocation = optionItem;
                  setState(() {});
                },
              ),
              //
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).harbors , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedHarbor,
                this.dropListModelHarbor,
                    (optionItem) {
                      FocusScope.of(context).unfocus();
                  optionItemSelectedHarbor = optionItem;
                  setState(() {});
                },
              ),
              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [
              //     Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
              //     SizedBox(width: 5,),
              //     Text(S.of(context).consignee , style: AppTextStyle.mediumBlackBold,)
              //   ],),
              // ),
              // SelectDropList(
              //   this.optionItemSelectedConsignee,
              //   this.dropListModelConsignee,
              //       (optionItem) {
              //         optionItemSelectedConsignee = optionItem;
              //     consigneeID = optionItem.id;
              //     setState(() {});
              //   },
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [
              //     Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
              //     SizedBox(width: 5,),
              //     Text(S.of(context).shipper , style: AppTextStyle.mediumBlackBold,)
              //   ],),
              // ),
              // SelectDropList(
              //   this.optionItemSelectedShipper,
              //   this.dropListModelShipper,
              //       (optionItem) {
              //     optionItemSelectedShipper = optionItem;
              //     shipperID = optionItem.id;
              //     setState(() {});
              //   },
              // ),
              //
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).carrier , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedCarrier,
                this.dropListModelCarrier,
                    (optionItem) {
                  optionItemSelectedCarrier= optionItem;
                  carrierID = optionItem.id;
                  setState(() {});
                },
              ),

              selectedRadioType==2 ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).client , style: AppTextStyle.mediumBlackBold,)
                ],),
              ) :Container(),
              selectedRadioType==2 ? SelectDropList(
                this.optionItemSelectedClient,
                this.dropListModelClient,
                    (optionItem) {
                  optionItemSelectedClient= optionItem;
                  clientID= optionItem.id;
                  setState(() {});
                },
              ):Container(),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [
              //     Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
              //     SizedBox(width: 5,),
              //     Text(S.of(context).specification , style: AppTextStyle.mediumBlackBold,)
              //   ],),
              // ),
              // SelectDropList(
              //   this.optionItemSelectedSpecification,
              //   this.dropListModelSpecification,
              //       (optionItem) {
              //     optionItemSelectedSpecification = optionItem;
              //     specificationID = optionItem.id;
              //     setState(() {});
              //   },
              // ),

              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                // DateTime arrivalDate = DateTime(endDate.year , endDate.month ,endDate.day ,selectedTimeEnd.hour ,selectedTimeEnd.minute);
                // DateTime launchDate = DateTime(startDate.year , startDate.month ,startDate.day ,selectedTimeStart.hour ,selectedTimeStart.minute);
                if(optionItemSelectedFrom.id ==0){
                  Fluttertoast.showToast(msg: S.of(context).exportCityConfirm);
                }else {
                  AirwaybillRequest re = AirwaybillRequest(status: status,
                    type: type,
                    consigneeID: optionItemSelectedConsignee.id,
                    shipperID: optionItemSelectedShipper.id,

                    carrierID: optionItemSelectedCarrier.id
                    ,
                    location: optionItemSelectedLocation.title,
                    providedBy: optionItemSelectedProvidedBy.id,
                    portID: optionItemSelectedHarbor.id,
                    exportCity: optionItemSelectedFrom.title,
                    exportCountryID: optionItemSelectedFrom.id,

                  );
                  widget.onSave(re);
                }

              }, radius: 15)
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
    entryClient= <Entry>[];
    entryHarbor= <Entry>[];

    entrySpecification = <Entry>[];

    // location=TextEditingController();

    status= AirwaybillStatusName[AirwaybillStatus.NOTFULL]!;

    selectedRadioType = 1;
    type = AirwaybillTypeName[AirwaybillType.PUBLIC]!;

    optionItemSelectedProvidedBy =  Entry('choose', 0, []);
    optionItemSelectedShipper =  Entry('choose', 0, []);
    optionItemSelectedConsignee =  Entry('choose', 0, []);
    optionItemSelectedSpecification =  Entry('choose', 0, []);
    optionItemSelectedCarrier =  Entry('choose', 0, []);
    optionItemSelectedClient =  Entry('choose', 0, []);
    optionItemSelectedHarbor =  Entry('choose', 0, []);
    optionItemSelectedLocation =  Entry('choose', 0, []);
    optionItemSelectedFrom=Entry('choose', 0, []);
    entryFrom =[];
    initList();
    initShippingFrom();
  }

  void initList(){
    for(SubcontractModel item in widget.subContracts){
      Entry v = Entry(item.fullName! ,item.id! ,[]);
      entryProvidedBy.add(v);
      entryShipper.add(v);
      entryConsignee.add(v);
      entryCarrier.add(v);
    }
    dropListModelProvidedBy = DropListModel(entryProvidedBy);
    dropListModelShipper = DropListModel(entryShipper);
    dropListModelConsignee= DropListModel(entryConsignee);
    dropListModelCarrier= DropListModel(entryCarrier);




    for(ClientModel  item in widget.clients){
      Entry v = Entry(item.userName! ,item.id! ,[]);
      entryClient.add(v);
    }
    dropListModelClient = DropListModel(entryClient);


    for(HarborModel  item in widget.harbors){
      Entry v = Entry(item.name! ,item.id! ,[]);
      entryHarbor.add(v);
    }
    dropListModelHarbor = DropListModel(entryHarbor);
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

  void initShippingFrom() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.countriesExports) {
      if (item.warehouses!.isNotEmpty && item.type=='export') {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (Warehouse warehouseItem in item.warehouses!) {
          print(warehouseItem.countryName);
          Entry warehouse = Entry(warehouseItem.city!, country.id, []);
          children.add(warehouse);
        }
        country.children = children;
        entryFrom.add(country);
      }
    }
    dropListModelFromCountries = DropListModel(entryFrom);
  }

}
