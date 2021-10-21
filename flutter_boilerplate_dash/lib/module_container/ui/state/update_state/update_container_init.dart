import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/enums/container_status.dart';
import 'package:pasco_shipping/module_container/request/container_request.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';
import 'package:pasco_shipping/module_shipper/shipper_module.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class UpdateContainerInit extends StatefulWidget {
  final List<SubcontractModel> subContracts;
  final List<ContainerSpecificationModel> specifications;
  final List<ShipperModel> shippers;
  final List<HarborModel> harbors;
  final List<Countries> countriesExports;
  final ContainerModel model;
  final Function onUpdate;
  const UpdateContainerInit({ required this.onUpdate , required this.subContracts,required this.specifications,required this.model,required this.shippers,required this.harbors,required this.countriesExports});

  @override
  _AddCountryInitState createState() => _AddCountryInitState();
}

class _AddCountryInitState extends State<UpdateContainerInit> {
  late TextEditingController containerNumber ;
  late TextEditingController consigneeController ;
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

  late DropListModel dropListModelHarbor;
  late Entry optionItemSelectedHarbor;

  late List<Entry> entryProvidedBy;
  late List<Entry> entryConsignee;
  late List<Entry> entryShipper;
  late List<Entry> entryCarrier;
  late List<Entry> entrySpecification;
  late List<Entry> entryHarbor;

  late String status;
  late String type;
  late String exportCity;
  late int selectedRadioType;

  late int shipperID;
  late int consigneeID;
  late int providedByID;
  late int specificationID;

  late int carrierID;
  late List<Entry> entryFrom;
  late Entry optionItemSelectedFrom;
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
              Image.asset(StaticImage.container),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).shippingType, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
                Text(widget.model.type??'' , style: AppTextStyle.mediumBlue,),
        //       widget.model.shipmentID != null ? Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //                 primary: AppThemeDataService.AccentColor,
        //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        //             ),
        //             onPressed: () {
        //             },
        //             child: Row(
        //               children: [
        //                 Radio(
        //                   onChanged: (value) {
        //                     _setSelectedRadioGender(2);
        //                   },
        //                   value: 2,
        //                   groupValue: selectedRadioType,
        //                   activeColor: Colors.white,
        //                 ),
        //                 SizedBox(
        //                   width: 5,
        //                 ),
        //                 Text(
        //                   S.of(context).FCL,
        //                   style: AppTextStyle.mediumWhite,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ):
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //   ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //        primary: AppThemeDataService.AccentColor,
        //        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        //     ),
        //     onPressed: () {
        //     },
        //     child: Row(
        //       children: [
        //        Radio(
        //          onChanged: (value) {
        //            _setSelectedRadioGender(2);
        //          },
        //          value: 2,
        //          groupValue: selectedRadioType,
        //          activeColor: Colors.white,
        //        ),
        //        SizedBox(
        //          width: 5,
        //        ),
        //        Text(
        //          S.of(context).FCL,
        //          style: AppTextStyle.mediumWhite,
        //        ),
        //       ],
        //     ),
        //   ),
        //   ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //        primary: AppThemeDataService.AccentColor,
        //        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        //     ),
        //     onPressed: () {
        //     },
        //     child: Row(
        //       children: [
        //        Radio(
        //          onChanged: (value) {
        //            _setSelectedRadioGender(1);
        //          },
        //          value: 1,
        //          groupValue: selectedRadioType,
        //          activeColor: Colors.white,
        //        ),
        //        SizedBox(
        //          width: 5,
        //        ),
        //        Text(
        //          S.of(context).LCL,
        //          style: AppTextStyle.mediumWhite,
        //        ),
        //       ],
        //     ),
        //   ),
        //   ],),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).containerNumber , style: AppTextStyle.mediumBlackBold,)
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
                      errorText: validateContainerNumber(containerNumber.text),
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
              SelectDropList(
                this.optionItemSelectedConsignee,
                this.dropListModelConsignee,
                    (optionItem) {
                  optionItemSelectedConsignee = optionItem;
                  consigneeID = optionItem.id;
                  setState(() {});
                },
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).from, style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              Text(widget.model.exportCountryName +' / '+ '${exportCity}'),
              // Text(exportCity),
           widget.model.type=='FCL'?   SelectDropList(
                this.optionItemSelectedFrom,
                this.dropListModelFromCountries,
                    (optionItem) {
                  optionItemSelectedFrom = optionItem;
                  print(optionItem.title);
                  print(optionItem.id);
                  print(optionItem.children[0].id);
                  // widget.shipmentRequest.exportWarehouseID =optionItem.id;
                  // widget.shipmentRequest.exportWarehouseName =optionItem.title;
                  setState(() {});
                },
              ) :Container(),


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
              SelectDropList(
                this.optionItemSelectedShipper,
                this.dropListModelShipper,
                    (optionItem) {
                  optionItemSelectedShipper = optionItem;
                  shipperID = optionItem.id;
                  setState(() {});
                },
              ),

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


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(Icons.circle ,color: AppThemeDataService.AccentColor,),
                  SizedBox(width: 5,),
                  Text(S.of(context).specification , style: AppTextStyle.mediumBlackBold,)
                ],),
              ),
              SelectDropList(
                this.optionItemSelectedSpecification,
                this.dropListModelSpecification,
                    (optionItem) {
                  optionItemSelectedSpecification = optionItem;
                  specificationID = optionItem.id;
                  setState(() {});
                },
              ),

              RoundedButton(lable: S.of(context).save, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.largeWhiteBold, go: (){
                if(optionItemSelectedProvidedBy.id==0){
                  Fluttertoast.showToast(msg: S.of(context).selectProvider);
                }else {
                  Entry c = Entry(containerNumber.text, widget.model.id!, []);
                  ContainerRequest re = ContainerRequest(status: status,
                      type: type,
                      exportCity: widget.model.exportCity,
                      exportCountryID: widget.model.exportCountryID,
                      exportWarehouseID: optionItemSelectedFrom.id,
                      consignee: consigneeController.text,
                      specificationID: optionItemSelectedSpecification.id,
                      consigneeID: optionItemSelectedConsignee.id,
                      shipperID: optionItemSelectedShipper.id,
                      carrierID: optionItemSelectedCarrier.id
                      ,
                      containerNumber: containerNumber.text,
                      providedBy: optionItemSelectedProvidedBy.id,
                      id: widget.model.id, portID: optionItemSelectedHarbor.id, location:optionItemSelectedLocation.title
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
    entryFrom = <Entry>[];
    entryShipper= <Entry>[];
    entryConsignee= <Entry>[];
    entryCarrier= <Entry>[];

    entrySpecification = <Entry>[];
    entryHarbor= <Entry>[];

    containerNumber=TextEditingController();
    consigneeController=TextEditingController();
    containerNumber..text = widget.model.containerNumber??'';

    status= widget.model.status!;
    type= widget.model.type!;
    exportCity = widget.model.exportCity ??'';

    // if(widget.model.type =='LCL'){
    //   selectedRadioType = 1;
    //   type = ContainerTypeName[ContainerType.PUBLIC]!;
    // }else{
    //   selectedRadioType = 2;
    //   type = ContainerTypeName[ContainerType.PRIVATE]!;
    // }


    optionItemSelectedProvidedBy =  Entry('choose', 0, []);
    optionItemSelectedShipper =  Entry('choose', 0, []);
    optionItemSelectedConsignee =  Entry('choose', 0, []);
    optionItemSelectedSpecification =  Entry('choose', 0, []);
    optionItemSelectedCarrier =  Entry('choose', 0, []);
    optionItemSelectedHarbor =  Entry('choose', 0, []);
    optionItemSelectedFrom =  Entry('', widget.model.exportCountryID??0, []);
    optionItemSelectedLocation = Entry(widget.model.location??'', 0, []);
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
      entryProvidedBy.add(v);

      entryConsignee.add(v);
      entryCarrier.add(v);
    }
    dropListModelProvidedBy = DropListModel(entryProvidedBy);

    dropListModelConsignee= DropListModel(entryConsignee);
    dropListModelCarrier= DropListModel(entryCarrier);


    for(ContainerSpecificationModel  item in widget.specifications){
      if(widget.model.specificationName == item.name){
        optionItemSelectedSpecification = Entry(item.name! ,item.id! ,[]);
      }
      Entry v = Entry(item.name! ,item.id! ,[]);
      entrySpecification.add(v);
    }
    dropListModelSpecification = DropListModel(entrySpecification);


    for(ShipperModel  item in widget.shippers){
      if(widget.model.shipperName == item.fullName){
        optionItemSelectedShipper = Entry(item.fullName! ,item.id! ,[]);
      }
      Entry v = Entry(item.fullName! ,item.id! ,[]);
      entryShipper.add(v);
    }
    dropListModelShipper = DropListModel(entryShipper);

    for(HarborModel  item in widget.harbors){
      if(widget.model.portName == item.name){
        optionItemSelectedHarbor = Entry(item.name! ,item.id! ,[]);
      }
      Entry v = Entry(item.name! ,item.id! ,[]);
      entryHarbor.add(v);
    }
    dropListModelHarbor = DropListModel(entryHarbor);
    initShippingFrom();
  }

  void _setSelectedRadioGender(int val) {
    setState(() {
      selectedRadioType = val;
      if (val == 1) {
        type = ContainerTypeName[ContainerType.PUBLIC]!;
      } else if (val == 2) {
        type = ContainerTypeName[ContainerType.PRIVATE]!;
      }
      print(val);
    });
  }
  String? validateContainerNumber(String value) {
    if(value.length == 11){
      var d=value.substring(0 ,3);
      if(!d.contains(new RegExp(r'[0-9]'))) {
        var n=value.substring(4 ,10);
        final number = num.tryParse(n);
        if (number != null) {
          return null;
        }
      }
    }
      return 'Container number consists of 4 letters at the beginning, followed by 7 digits';
  }
  void initShippingFrom() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.countriesExports) {
      if (item.warehouses!.isNotEmpty && item.type=='export') {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (Warehouse warehouseItem in item.warehouses!) {
          if (widget.model.exportCity == warehouseItem.city) {
            Entry warehouse = Entry(
                warehouseItem.name!, warehouseItem.id ?? 0, []);
            entryFrom.add(warehouse);
          }
        }
      }
    }
    dropListModelFromCountries = DropListModel(entryFrom);
  }
}
