import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_edit_shipment/request/update_shipment_request.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';

class ShipmentEditedScreen extends StatefulWidget {
  final Function onUpdate;
  final Function onLoadingMore;


  final  List<UnitModel> units;
  final  List<ReceiverModel> receivers;
  final  List<DistributorModel> dists;
  final  List<Mark> marks;
  final  List<ProductModel> products;

  final AcceptedShipmentModel shipment;

  final bool isFullOption;
  ShipmentEditedScreen({required this.onUpdate ,required this.onLoadingMore  ,required this.dists ,required this.units ,required this.receivers ,required this.marks ,required this.products,required this.shipment,required this.isFullOption });

  @override
  _ShipmentEditedScreenState createState() => _ShipmentEditedScreenState();
}

class _ShipmentEditedScreenState extends State<ShipmentEditedScreen> {
  // late Entry optionItemSelectedDist;
  late Entry optionItemSelectedMarks;
  late Entry optionItemSelectedReceiver;
  late Entry optionItemSelectedTim = Entry('choose', 0, []);

  //second
  late Entry optionItemSelectedCategory ;
  late Entry optionItemSelectedU;

  late List<Entry> marksEntry;
  late List<Entry> receiverEntry;

  late List<Entry> unitsEntry;
  late List<Entry>  categories;

  DropListModel dropListModelTime = DropListModel(dataTime);
  late DropListModel dropListModelMarks;
  late DropListModel dropListModelReceiver;

  //second
  late DropListModel dropListModelCat;
  late DropListModel dropListModelUnit;

  late String vehicle;
  late String extra;

  @override
  void initState() {
    super.initState();
    marksEntry= <Entry>[];
    receiverEntry = <Entry>[];

    unitsEntry = <Entry>[];
    categories =<Entry>[];

    if (widget.shipment.markID != null) {
      optionItemSelectedMarks = Entry(widget.shipment.markNumber??'', widget.shipment.markID??0, []);
    } else {
      optionItemSelectedMarks = Entry('choose', 0, []);
    }

    if (widget.shipment.receiverID !=null) {
      optionItemSelectedReceiver = Entry(widget.shipment.receiverName??'', widget.shipment.receiverID??0, []);
    } else {
      optionItemSelectedReceiver = Entry('choose', 0, []);
    }

    if(widget.shipment.paymentTime != null){
      optionItemSelectedTim = Entry(widget.shipment.paymentTime??'', 0, []);
    }else {
      optionItemSelectedTim = Entry('choose', 0, []);
    }


    if(widget.shipment.productCategoryID !=null){
      optionItemSelectedCategory=Entry(widget.shipment.productCategoryName??'', widget.shipment.productCategoryID??0, []);
    } else {
      optionItemSelectedCategory = Entry('choose', 0, []);
    }
    if(widget.shipment.unit != null){
      optionItemSelectedU = Entry(widget.shipment.unit??'', 0, []);
    }else{
      optionItemSelectedU=Entry('choose', 0, []);
    }

    if (widget.shipment.extraSpecification != null) {
      extra = widget.shipment.extraSpecification??'';
    } else {
      extra = 'Text...';
    }

    if (widget.shipment.vehicleIdentificationNumber != null) {
      vehicle = widget.shipment.vehicleIdentificationNumber ??'';
    } else {
      vehicle = '123...';
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for(Mark item in widget.marks){
      Entry v = Entry(item.markNumber! ,item.id??0 ,[]);
      marksEntry.add(v);
    }
    dropListModelMarks = DropListModel(marksEntry);


    for(ReceiverModel item in widget.receivers){
      Entry v = Entry(item.fullName! ,item.id??0 ,[Entry(item.phone! ,item.id??0,[])]);
      receiverEntry.add(v);
    }
    dropListModelReceiver = DropListModel(receiverEntry);

    for(UnitModel item in widget.units){
      Entry v = Entry(item.name! ,item.id! ,[]);
      unitsEntry.add(v);
    }
    dropListModelUnit = DropListModel(unitsEntry);

    category();
  }
  void category() {
    List<Entry> children = <Entry>[];
    for (ProductModel item in widget.products) {
      if (item.subs!.isNotEmpty ) {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (SubbProductModel warehouseItem in item.subs!) {
          Entry warehouse = Entry(warehouseItem.name!, warehouseItem.id!, []);
          children.add(warehouse);
        }
        country.children = children;
        categories.add(country);
      }
    }
    dropListModelCat = DropListModel(categories);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).receiverInfo,
            style: AppTextStyle.mediumBlackBold,
          ),
          SelectDropList(
            this.optionItemSelectedReceiver,
            this.dropListModelReceiver,
                (optionItem) {
              optionItemSelectedReceiver = optionItem;
              setState(() {});
            },
          ),
          SizedBox(
            height: 15,
          ),


          Text(
            S.of(context).mark,
            style: AppTextStyle.mediumBlackBold,
          ),
          SelectDropList(
            this.optionItemSelectedMarks,
            this.dropListModelMarks,
                (optionItem) {
              optionItemSelectedMarks = optionItem;
              setState(() {});
            },
          ),
          SizedBox(
            height: 15,
          ),

          Text(
            S.of(context).paymentTime,
            style: AppTextStyle.mediumBlackBold,
          ),
          SelectDropList(
            this.optionItemSelectedTim,
            this.dropListModelTime,
                (optionItem) {
              optionItemSelectedTim = optionItem;
              setState(() {});
            },
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            S.of(context).extraSpecification,
            style: AppTextStyle.mediumBlackBold,
          ),
          TextEdit(hint: extra, title: widget.shipment.extraSpecification??'',onChange: (extra) {
            widget.shipment.extraSpecification = extra;
          }),
          Visibility(
            visible: widget.shipment.productCategoryName=='Car' ? true :false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).vehicleNumber,
                  style: AppTextStyle.mediumBlackBold,
                ),
                TextEdit(hint: vehicle, title: widget.shipment.vehicleIdentificationNumber??'',onChange: (number) {
                  widget.shipment.vehicleIdentificationNumber = number ?? "";
                }),
              ],
            ),
          ),
          Visibility(
            visible: !widget.isFullOption,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: (){
                      widget.onLoadingMore();
                    },
                    child: Icon(Icons.arrow_circle_down_rounded , size: 50,color: blue,)),
                RoundedButton(lable: S.of(context).save ,icon: '',
                    color: blue, style: AppTextStyle.mediumWhite,
                    go: (){
                      UpdateShipmentRequest request =UpdateShipmentRequest(
                        id: int.parse(widget.shipment.shipmentId!),
                        markId: optionItemSelectedMarks.id,
                        paymentTime: optionItemSelectedTim.title,
                        unit: optionItemSelectedU.title,
                        receiverID: optionItemSelectedReceiver.id,
                        extraSpecification: widget.shipment.extraSpecification,
                        vehicleIdentificationNumber: vehicle,
                        productCategoryID: optionItemSelectedCategory.id,

                      );

                  widget.onUpdate(request);
                    }, radius: 12)
              ],
            ),
          ),

          Visibility(
            visible: widget.isFullOption,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).productType,
                  style: AppTextStyle.mediumBlackBold,
                ),
                SelectDropListl(
                  this.optionItemSelectedCategory,
                  this.dropListModelCat,
                      (optionItem) {
                    optionItemSelectedCategory= optionItem;
                    // widget.shipmentRequest.productCategoryID = optionItem.id;
                    // widget.shipmentRequest.productCategoryName = optionItem.title;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  S.of(context).unit,
                  style: AppTextStyle.mediumBlackBold,
                ),
                SelectDropList(
                  this.optionItemSelectedU,
                  this.dropListModelUnit,
                      (optionItem) {
                    optionItemSelectedU = optionItem;
                    setState(() {});
                  },
                ),

                RoundedButton(lable: S.of(context).save ,icon: '',
                    color: blue, style: AppTextStyle.mediumWhite,
                    go: (){
                      UpdateShipmentRequest request =UpdateShipmentRequest(
                        id: int.parse(widget.shipment.shipmentId!),
                        markId: optionItemSelectedMarks.id,
                        paymentTime: optionItemSelectedTim.title,
                        unit: optionItemSelectedU.title,
                        receiverID: optionItemSelectedReceiver.id,
                        extraSpecification: widget.shipment.extraSpecification,
                        vehicleIdentificationNumber: vehicle,
                        productCategoryID: optionItemSelectedCategory.id,
                      );

                      widget.onUpdate(request);
                    }, radius: 12)
              ],
            ),
          )



        ],
      ),
    );

  }

  void _showDeleteDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        text: 'Do you really want to delete this request',
        backgroundColor: AppThemeDataService.PrimaryColor,
        confirmBtnColor: AppThemeDataService.AccentColor,
        onConfirmBtnTap: () {
          deleteShipment();
          Navigator.pushNamedAndRemoveUntil(
              context, HomeRoutes.Home, (route) => false);
        },
        onCancelBtnTap: () {
          Navigator.pop(context);
        });
  }
}
