import 'dart:convert';
import 'dart:typed_data';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_previous/model/product_type.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/NumberInputWithIncrementDecrement.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/image_full_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'dart:io';
import 'package:image/image.dart' as ImageProcess;
import 'package:pasco_shipping/utils/widget/text_edit.dart';

class FirstOptionSuccessfully extends StatefulWidget {
  final List<Countries> countries;
  final List<ProductModel> categories;
  final ShipmentRequest shipmentRequest;
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
 late int selectedRadioWarehouse;

  late DropListModel dropListModelFrom;

  late DropListModel dropListModelTo;
  late DropListModel dropListModelCat;
  late DropListModel dropListModelSubCat;

  late Entry optionItemSelectedF;

  late Entry optionItemSelectedT ;
  late Entry optionItemSelectedCategory ;
  late Entry optionItemSelectedSubCategory ;

  final ImagePicker _imagePicker = ImagePicker();

  late List<Entry> shippingFrom;
  late List<Entry> shippingTo;
  late List<Entry>  categories;
  late List<Entry>  subCategories;
 late TextEditingController controller;
 // File? imageFile;
  late String initQuantity;

  List<File> imageArray=[];
  var image;

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
    if(widget.shipmentRequest.isExternalWarehouse){
      selectedRadioWarehouse = 1;
    }else {selectedRadioWarehouse = 2;
    widget.shipmentRequest.isExternalWarehouse = false;
    }
   if(widget.shipmentRequest.quantity == 0){
     initQuantity = '0';
   }else {
     initQuantity = widget.shipmentRequest.quantity.toString();
   }
   if(widget.shipmentRequest.imageFilePath != null && widget.shipmentRequest.imageFilePath!.isNotEmpty){
     for(var i in widget.shipmentRequest.imageFilePath!){
       imageArray.add(File(i));
     }
     // imageFile = File(widget.shipmentRequest.imageFilePath![0]);
   }else{
     imageArray = [];
     widget.shipmentRequest.imageFilePath = [];
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
     optionItemSelectedF = Entry('choose', 0, []);
   }

   // if(widget.shipmentRequest.productCategoryID !=0){
   //   widget.categories.forEach((element) {
   //     element.subs!.forEach((sub) {
   //       if(sub.id == widget.shipmentRequest.productCategoryID) {
   //         // sub.isSelected = true;
   //         optionItemSelectedCategory = Entry(sub.name!, sub.id!, []);
   //         // optionItemSelectedSubCategory =
   //       } else {
   //         // sub.isSelected = false;
   //         optionItemSelectedCategory = Entry('choose', 0, []);
   //
   //       }
   //     });
   //
   //   });
   //
   // } else {
   //   // sub.isSelected = false;
   //
   //
   // }
    optionItemSelectedCategory = Entry('choose', 0, []);
    optionItemSelectedSubCategory= Entry('choose', 0, []);
    shippingFrom = <Entry>[];
    shippingTo = <Entry>[];
    categories = <Entry>[];
    subCategories = <Entry>[];
    initShippingFrom();
    initShippingTo();
    category();
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

 void category() {
   List<Entry> children = <Entry>[];
   for (ProductModel item in widget.categories) {
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

  void _openCamera() async {

    image = await _imagePicker.getImage(source: ImageSource.camera ,imageQuality: 70);
    var imageFile = File(image!.path);
    imageArray.add(imageFile);
    setState(() {
      imageArray;
    });
  }
 void _openGallery() async {

   image = await _imagePicker.getImage(source: ImageSource.gallery ,imageQuality: 70);
   var imageFile = File(image!.path);
   imageArray.add(imageFile);
   setState(() {
     imageArray;
   });
 }
 void _showPicker(context) {
   showModalBottomSheet(
       context: context,
       builder: (BuildContext bc) {
         return SafeArea(
           child: Container(
             child: new Wrap(
               children: <Widget>[
                 new ListTile(
                     leading: new Icon(Icons.photo_library),
                     title: new Text(S.of(context).showLibrary),
                     onTap: () {
                       _openGallery();
                       Navigator.of(context).pop();
                     }),
                 new ListTile(
                   leading: new Icon(Icons.photo_camera),
                   title: new Text(S.of(context).camera),
                   onTap: () {
                     _openCamera();
                     Navigator.of(context).pop();
                   },
                 ),
               ],
             ),
           ),
         );
       }
   );
 }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  style: AppTextStyle.mediumBlackBold,
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
                    color: Colors.black,
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
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).shippingFrom,
              style: AppTextStyle.mediumBlackBold,
            ),
            SelectDropListl(
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
              style: AppTextStyle.mediumBlackBold,
            ),
            SelectDropListl(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).warehouseInfo,
                  style: AppTextStyle.mediumBlackBold,
                ),

               Row(
                 children: [
                   Radio(
                     onChanged: (value) {
                       _setSelectedRadioWarehouse(2);
                     },
                     value: 2,
                     groupValue: selectedRadioWarehouse,
                   ),
                   Text( S.of(context).inLocalWarehouse,
                       style: TextStyle(
                         color: Colors.black,
                       ))
                 ],
               ),
                Row(
                  children: [
                    Radio(
                      onChanged: (value) {
                        _setSelectedRadioWarehouse(1);
                      },
                      value: 1,
                      groupValue: selectedRadioWarehouse,
                    ),
                    Text(
                      S.of(context).inExternalWarehouse,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Visibility(
              visible: widget.shipmentRequest.isExternalWarehouse ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  S.of(context).warehouseInfo,
                  style: AppTextStyle.mediumBlackBold,
                ),
                TextEdit('info', 50, (info) {
                  widget.shipmentRequest.externalWarehouseInfo = info;
                }),
              ],),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).productType,
              style: AppTextStyle.mediumBlackBold,
            ),
            SizedBox(height: 15,),

            SelectDropListl(
              this.optionItemSelectedCategory,
              this.dropListModelCat,
                  (optionItem) {
                optionItemSelectedCategory= optionItem;
                widget.shipmentRequest.productCategoryID = optionItem.id;
                widget.shipmentRequest.productCategoryName = optionItem.title;
                setState(() {});
              },
            ),

            // Wrap(
            //   direction: Axis.vertical,
            //   spacing: 6.0,
            //   runSpacing: 6.0,
            //   children: widget.categories.map((item) {
            //     var index = widget.categories.indexOf(item);
            //     return Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(widget.categories[index].name!, style: AppTextStyle.mediumBlueBold,),
            //         Column(
            //           children: widget.categories[index].subs!.map((item) {
            //             var indexSub = widget.categories[index].subs!.indexOf(item);
            //             return InkWell(
            //                 onTap: () {
            //                   setState(() {
            //                     widget.categories.forEach((category) {
            //                       category.subs!.forEach((element) {
            //                         element.isSelected = false;
            //                       });
            //                     });
            //                   });
            //                   widget.categories[index].subs![indexSub].isSelected = true;
            //                   widget.shipmentRequest.productCategoryID = widget.categories[index].subs![indexSub].id!;
            //                   widget.shipmentRequest.productCategoryName = widget.categories[index].subs![indexSub].name!;
            //                 },
            //                 child: ChoiceCard2(item));
            //           }).toList(),
            //         ),
            //       ],
            //     );
            //   }).toList(),
            // ),
            // Wrap(
            //   spacing: 6.0,
            //   runSpacing: 6.0,
            //   children: widget.categories.map((item) {
            //     var index = widget.categories.indexOf(item);
            //     return InkWell(
            //         onTap: () {
            //           setState(() {
            //             widget.categories.forEach((element) {
            //               element.isSelected = false;
            //             });
            //           });
            //           widget.categories[index].isSelected = true;
            //           widget.shipmentRequest.productCategoryID = widget.categories[index].id;
            //           widget.shipmentRequest.productCategoryName = widget.categories[index].name;
            //         },
            //         child: ChoiceCard(item));
            //   }).toList(),
            // ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  S.of(context).quantity,
                  style: AppTextStyle.mediumBlackBold,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).image,
                  style: AppTextStyle.mediumBlackBold,
                ),
                imageArray.isNotEmpty ? InkWell(
                    onTap: (){
                      _showPicker(context);
                    },
                    child: Icon(Icons.add_circle ,size: 30, color: blue,)): Container(),

                // Padding(
                //   padding: const EdgeInsetsDirectional.only(start: 35),
                //   child: Container(
                //       decoration: BoxDecoration(
                //           color: Colors.transparent,
                //           border: Border.all(color: Colors.grey),
                //           borderRadius: BorderRadius.circular(6.0),
                //           boxShadow: [
                //             BoxShadow(color:blue)
                //           ]),
                //       child: imageFile != null
                //           ? Badge(
                //               badgeContent: InkWell(
                //                   onTap: () {
                //                     setState(() {
                //                       imageFile = null;
                //                     });
                //                   },
                //                   child: Icon(
                //                     Icons.close,
                //                     color: Colors.white,
                //                     size: 15,
                //                   )),
                //               child: Image.file(
                //                 imageFile!,
                //                 fit: BoxFit.cover,
                //                 width: 100,
                //                 height: 100,
                //               ),
                //             )
                //           : Padding(
                //               padding: const EdgeInsets.all(20.0),
                //               child: IconButton(
                //                 icon: Icon(Icons.camera_alt),
                //                 iconSize: 50.0,
                //                 onPressed: () {
                //                   _imagePicker
                //                       .getImage(
                //                           source: ImageSource.camera,
                //                           imageQuality: 70)
                //                       .then((value) {
                //                     imageFile = File(value!.path);
                //                     // final _imageFile = ImageProcess.decodeImage(
                //                     //   b.readAsBytesSync(),
                //                     // );
                //                     // String base64Image = base64Encode(ImageProcess.encodePng(_imageFile!));
                //                     // imageFile = Base64Decoder().convert(base64Image);
                //                     // widget.shipmentRequest.imageFilePath =value.path;
                //                     setState(() {});
                //                   });
                //                 },
                //               ),
                //             )),
                // )

              ],
            ),
            imageArray.isEmpty ? Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(color:blue)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  iconSize: 50.0,
                  onPressed: () {
                    _showPicker(context);
                  },
                ),
              ),
            ) :
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                children: List.generate(imageArray.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(top: 10,right: 5 ,left: 5),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          imageArray.remove(imageArray[index]);
                        });
                      },
                      child: Badge(
                        badgeContent: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                        child: Image.file(
                          imageArray[index],
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  );
                })
            ),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    widget.shipmentRequest.imageFilePath =[];
                    for(File i in imageArray ){
                      widget.shipmentRequest.imageFilePath!.add(i.path);
                    }
                   widget.goToSecondStep();
                  },
                  icon: Icon(
                    Icons.arrow_forward_outlined,
                    // color: bal,
                  ),
                  label: Text(S.of(context).next),
                ))
          ],
        ),
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

 void _setSelectedRadioWarehouse(int val) {
   setState(() {
     selectedRadioWarehouse = val;
     if (val == 1) {
       widget.shipmentRequest.isExternalWarehouse = true;
     } else if (val == 2) {
       widget.shipmentRequest.isExternalWarehouse = false;
     }
     print(val);
   });
 }

}
