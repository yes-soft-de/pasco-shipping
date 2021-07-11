import 'dart:convert';
import 'dart:typed_data';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_previous/model/product_type.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/NumberInputWithIncrementDecrement.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'dart:io';
import 'package:image/image.dart' as ImageProcess;

class FirstOptionSuccessfully extends StatefulWidget {
  final List<Countries> countries;
  final List<Category> categories;
  final ShipmentTempRequest shipmentRequest;
  final Function goToSecondStep;
  FirstOptionSuccessfully(
      {required this.countries,
      required this.categories,
      required this.shipmentRequest,required this.goToSecondStep});

  @override
  _FirstOptionSuccessfullyState createState() =>
      _FirstOptionSuccessfullyState();
}

class _FirstOptionSuccessfullyState extends State<FirstOptionSuccessfully> {
 late int selectedRadioGender;

  late DropListModel dropListModelFrom;

  late DropListModel dropListModelTo;

  late Entry optionItemSelectedF;

  late Entry optionItemSelectedT ;

  final ImagePicker _imagePicker = ImagePicker();

  late List<Entry> shippingFrom;
  late List<Entry> shippingTo;
 late TextEditingController controller;
 File? imageFile;
  late String initQuantity;

  @override
  void initState() {
    super.initState();
   controller = TextEditingController();

   controller.text = '0';

   if(widget.shipmentRequest.target.isEmpty){
     optionItemSelectedT =  Entry('choose', 1, []);
   }else {
     optionItemSelectedT = Entry(widget.shipmentRequest.target, 1, []);
   }
   if(widget.shipmentRequest.transportationType =='sea'){
     selectedRadioGender = 1;
   }else {selectedRadioGender = 2;
   widget.shipmentRequest.transportationType = 'air';
   }

   if(widget.shipmentRequest.quantity == 0){
     initQuantity = '0';
   }else {
     initQuantity = widget.shipmentRequest.quantity.toString();
   }
   if(widget.shipmentRequest.imageFilePath != null && widget.shipmentRequest.imageFilePath!.isNotEmpty){
     imageFile = File(widget.shipmentRequest.imageFilePath!);
   }else{
     imageFile = null;
   }
   if(widget.shipmentRequest.exportWarehouseID !=0){
     for (Countries item in widget.countries) {
       if (item.warehouses!.isNotEmpty) {
         for (Warehouse warehouseItem in item.warehouses!) {
           if(warehouseItem.id ==widget.shipmentRequest.exportWarehouseID) {
             optionItemSelectedF = Entry(
               warehouseItem.city! + "/" + warehouseItem.name!,
               warehouseItem.id!, []);
           }
         }}}
   }else{
     optionItemSelectedF = Entry('choose', 1, []);
   }

   if(widget.shipmentRequest.productCategoryID !=0){
     widget.categories.forEach((element) {
       if(element.id == widget.shipmentRequest.productCategoryID) {
         element.isSelected = true;
       } else {
         element.isSelected = false;
       }
     });

   }

    shippingFrom = <Entry>[];
    shippingTo = <Entry>[];
    initShippingFrom();
    initShippingTo();
  }

  void initShippingFrom() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.countries) {
      if (item.warehouses!.isNotEmpty && item.type=='export') {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (Warehouse warehouseItem in item.warehouses!) {
          print(warehouseItem.countryName);
          Entry warehouse = Entry(
              warehouseItem.city! + "/" + warehouseItem.name!,
              warehouseItem.id!, []);
          children.add(warehouse);
        }
        country.children = children;
        shippingFrom.add(country);
      }
    }
    dropListModelFrom = DropListModel(shippingFrom);
  }

  void initShippingTo() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.countries) {
      if (item.warehouses!.isNotEmpty && item.type=='import') {
        Entry country = Entry(item.name!, item.id!, children);
        print(country.id);
        children = [];
        for (Warehouse warehouseItem in item.warehouses!) {
          print(warehouseItem.countryName);
          Entry warehouse = Entry(warehouseItem.city!, warehouseItem.id!, []);
          children.add(warehouse);
        }
        country.children = children;
        shippingTo.add(country);
      }
    }
    dropListModelTo = DropListModel(shippingTo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                S.of(context).shippingType,
                style: white18text,
              ),
              Radio(
                onChanged: (value) {
                  _setSelectedRadioGender(1);
                },
                value: 1,
                groupValue: selectedRadioGender,
              ),
              Text(
                S.of(context).sea,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 75,
              ),
              Radio(
                onChanged: (value) {
                  _setSelectedRadioGender(2);
                },
                value: 2,
                groupValue: selectedRadioGender,
              ),
              Text(S.of(context).air,
                  style: TextStyle(
                    color: Colors.white,
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            S.of(context).shippingFrom,
            style: white18text,
          ),
          SelectDropList(
            this.optionItemSelectedF,
            this.dropListModelFrom,
            (optionItem) {
              optionItemSelectedF = optionItem;
              widget.shipmentRequest.exportWarehouseID =optionItem.id;
              widget.shipmentRequest.exportWarehouseName =optionItem.title;
              print("nameWear"  +  optionItem.title);
              setState(() {});
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            S.of(context).shippingTo,
            style: white18text,
          ),
          SelectDropList(
            this.optionItemSelectedT,
            this.dropListModelTo,
            (optionItem) {
              optionItemSelectedT = optionItem;
              widget.shipmentRequest.target = optionItem.title;
              setState(() {});
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            S.of(context).productType,
            style: white18text,
          ),
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: widget.categories.map((item) {
              var index = widget.categories.indexOf(item);
              return InkWell(
                  onTap: () {
                    setState(() {
                      widget.categories.forEach((element) {
                        element.isSelected = false;
                      });
                    });
                    widget.categories[index].isSelected = true;
                    widget.shipmentRequest.productCategoryID = widget.categories[index].id;
                    widget.shipmentRequest.productCategoryName = widget.categories[index].name;
                  },
                  child: ChoiceCard(item));
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                S.of(context).quantity,
                style: white18text,
              ),
              NumberInputWithIncrementDecrement(initQuantity , (quantity ){
                widget.shipmentRequest.quantity = quantity;
              }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                S.of(context).image,
                style: white18text,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 35),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(6.0),
                        boxShadow: [
                          BoxShadow(color: AppThemeDataService.AccentColor)
                        ]),
                    child: imageFile != null
                        ? Badge(
                            badgeContent: InkWell(
                                onTap: () {
                                  setState(() {
                                    imageFile = null;
                                  });
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 15,
                                )),
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: IconButton(
                              icon: Icon(Icons.camera_alt),
                              iconSize: 50.0,
                              onPressed: () {
                                _imagePicker
                                    .getImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 70)
                                    .then((value) {
                                  imageFile = File(value!.path);
                                  // final _imageFile = ImageProcess.decodeImage(
                                  //   b.readAsBytesSync(),
                                  // );
                                  // String base64Image = base64Encode(ImageProcess.encodePng(_imageFile!));
                                  // imageFile = Base64Decoder().convert(base64Image);
                                  widget.shipmentRequest.imageFilePath =value.path;
                                  setState(() {});
                                });
                              },
                            ),
                          )),
              )
            ],
          ),
          Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: FloatingActionButton.extended(
                onPressed: () {
                 widget.goToSecondStep();
                },
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  // color: bal,
                ),
                label: Text('Continue'),
              ))
        ],
      ),
    );
  }

 void _setSelectedRadioGender(int val) {
    setState(() {
      selectedRadioGender = val;
      if (val == 1) {
        widget.shipmentRequest.transportationType = 'sea';
      } else if (val == 2) {
        widget.shipmentRequest.transportationType = 'air';
      }
      print(val);
    });
  }
 String parseImage(File imageFile){
   List<int> imageBytes = imageFile.readAsBytesSync();
   return  base64.encode(imageBytes);
 }
}
