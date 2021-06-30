import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_previous/model/product_type.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/NumberInputWithIncrementDecrement.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'dart:io';

class FirstOptionSuccessfully extends StatefulWidget {
  final List<Countries> countries;
  final List<Category> categories;
  final ShipmentRequest shipmentRequest;
  FirstOptionSuccessfully(
      {required this.countries,
      required this.categories,
      required this.shipmentRequest});

  @override
  _FirstOptionSuccessfullyState createState() =>
      _FirstOptionSuccessfullyState();
}

class _FirstOptionSuccessfullyState extends State<FirstOptionSuccessfully> {
  int selectedRadioGender = 1;

  late DropListModel dropListModelFrom;

  late DropListModel dropListModelTo;

  late Entry optionItemSelectedF = Entry('choose', 1, []);

  late Entry optionItemSelectedT = Entry('choose', 1, []);

  final ImagePicker _imagePicker = ImagePicker();

  late List<Entry> shippingFrom;
  late List<Entry> shippingTo;
 late TextEditingController controller;
  File? imageFile;

  @override
  void initState() {
    super.initState();
   controller = TextEditingController();
   controller.text = '0';

    shippingFrom = <Entry>[];
    shippingTo = <Entry>[];
    initShippingFrom();
    initShippingTo();
  }

  void initShippingFrom() {
    List<Entry> children = <Entry>[];
    for (Countries item in widget.countries) {
      if (item.warehouses != null) {
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
      if (item.warehouses != null) {
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
              NumberInputWithIncrementDecrement((quantity){
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
                                  // setState(() {});
                                });
                              },
                            ),
                          )),
              )
            ],
          ),
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
}
