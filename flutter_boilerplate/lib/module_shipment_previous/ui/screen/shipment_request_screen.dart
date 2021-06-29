// import 'dart:io';
//
// import 'package:badges/badges.dart';
// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pasco_shipping/module_home/ui/widget/chip_card.dart';
// import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
// import 'package:pasco_shipping/module_mark/mark_routes.dart';
// import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
// import 'package:pasco_shipping/module_shipment_previous/model/product_type.dart';
// import 'package:pasco_shipping/module_shipment_previous/ui/widget/NumberInputWithIncrementDecrement.dart';
// import 'package:pasco_shipping/module_shipment_previous/ui/widget/choice_card.dart';
// import 'package:pasco_shipping/module_shipment_previous/ui/widget/select_drop_list.dart';
// import 'package:pasco_shipping/module_shipment_previous/ui/widget/text_edit.dart';
// import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
// import 'package:pasco_shipping/utils/styles/colors.dart';
// import 'package:pasco_shipping/utils/styles/static_images.dart';
// import 'package:pasco_shipping/utils/styles/text_style.dart';
// import 'package:align_positioned/align_positioned.dart';
// import 'package:pasco_shipping/utils/widget/background.dart';
//
// @injectable
// class ShipmentRequest extends StatefulWidget {
//   const ShipmentRequest();
//
//   @override
//   _ShipmentRequestState createState() => _ShipmentRequestState();
// }
//
// class _ShipmentRequestState extends State<ShipmentRequest> {
//   int activeStep = 0; // Initial step set to 0.
//
//
//
//   int selectedRadioGender = 1;
//   final ImagePicker _imagePicker = ImagePicker();
//   File? imageFile;
//   late ScrollController _controller;
//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       controller: _controller,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             NumberStepper(
//               activeStep: activeStep,
//               lineColor: AppThemeDataService.AccentColor,
//               activeStepColor: AppThemeDataService.AccentColor,
//               activeStepBorderColor: greyWhite,
//               activeStepBorderWidth: 3,
//               enableNextPreviousButtons: false,
//               lineDotRadius: 2,
//               enableStepTapping: false,
//               stepColor: greyBlack,
//               lineLength: 75,
//               onStepReached: (step) {
//                 setState(() {
//                   activeStep = step;
//                 });
//               },
//               numbers: [
//                 1,
//                 2,
//                 3,
//               ],
//             ),
//             Visibility(
//               visible: activeStep == 0 ? true : false,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'Shipping type : ',
//                           style: white18text,
//                         ),
//                         Radio(
//                           onChanged: (value) {
//                             _setSelectedRadioGender(1);
//                           },
//                           value: 1,
//                           groupValue: selectedRadioGender,
//                         ),
//                         Text(
//                           'Sea',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 75,
//                         ),
//                         Radio(
//                           onChanged: (value) {
//                             _setSelectedRadioGender(2);
//                           },
//                           value: 2,
//                           groupValue: selectedRadioGender,
//                         ),
//                         Text('Air',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ))
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Shipping from : ',
//                       style: white18text,
//                     ),
//                     SelectDropList(
//                       this.optionItemSelectedF,
//                       this.dropListModelFrom,
//                       (optionItem) {
//                         optionItemSelectedF = optionItem;
//                         setState(() {});
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Shipping to : ',
//                       style: white18text,
//                     ),
//                     SelectDropList(
//                       this.optionItemSelectedT,
//                       this.dropListModelTo,
//                       (optionItem) {
//                         optionItemSelectedT = optionItem;
//                         setState(() {});
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Product type : ',
//                       style: white18text,
//                     ),
//                     Wrap(
//                       spacing: 6.0,
//                       runSpacing: 6.0,
//                       children: items.map((item) {
//                         var index = items.indexOf(item);
//                         return InkWell(
//                             onTap: () {
//                               setState(() {
//                                 items.forEach((element) {
//                                   element.isSelected = false;
//                                 });
//                               });
//                               items[index].isSelected = true;
//                             },
//                             child: ChoiceCard(item));
//                       }).toList(),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'Quantity : ',
//                           style: white18text,
//                         ),
//                         NumberInputWithIncrementDecrement(),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'Image : ',
//                           style: white18text,
//                         ),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.only(start: 35),
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.transparent,
//                                   border: Border.all(color: Colors.grey),
//                                   borderRadius: BorderRadius.circular(6.0),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: AppThemeDataService.AccentColor)
//                                   ]),
//                               child: imageFile != null
//                                   ? Badge(
//                                       badgeContent: InkWell(
//                                           onTap: () {
//                                             setState(() {
//                                               imageFile = null;
//                                             });
//                                           },
//                                           child: Icon(
//                                             Icons.close,
//                                             color: Colors.white,
//                                             size: 15,
//                                           )),
//                                       child: Image.file(
//                                         imageFile!,
//                                         fit: BoxFit.cover,
//                                         width: 100,
//                                         height: 100,
//                                       ),
//                                     )
//                                   : Padding(
//                                       padding: const EdgeInsets.all(20.0),
//                                       child: IconButton(
//                                         icon: Icon(Icons.camera_alt),
//                                         iconSize: 50.0,
//                                         onPressed: () {
//                                           _imagePicker
//                                               .getImage(
//                                                   source: ImageSource.gallery,
//                                                   imageQuality: 70)
//                                               .then((value) {
//                                             imageFile = File(value!.path);
//                                             setState(() {});
//                                           });
//                                         },
//                                       ),
//                                     )),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: activeStep == 1 ? true : false,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Supplier Info : ',
//                       style: white18text,
//                     ),
//                     TextEdit('name here', 50),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     Text(
//                       'Recipient Info : ',
//                       style: white18text,
//                     ),
//                     TextEdit('name here', 50),
//                     TextEdit('phone number', 50),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       'Unit : ',
//                       style: white18text,
//                     ),
//                     SelectDropList(
//                       this.optionItemSelectedU,
//                       this.dropListModelUnit,
//                       (optionItem) {
//                         optionItemSelectedU = optionItem;
//                         setState(() {});
//                       },
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       'Mark : ',
//                       style: white18text,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: SelectDropList(
//                             this.optionItemSelectedMar,
//                             this.dropListModelMark,
//                             (optionItem) {
//                               optionItemSelectedMar = optionItem;
//                               setState(() {});
//                             },
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(context, MarkRoutes.mark);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Icon(
//                                   Icons.add_circle_outline_sharp,
//                                   color: AppThemeDataService.AccentColor,
//                                   size: 25,
//                                 ),
//                                 Text(
//                                   'add\nnew',
//                                   style: White14text,
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: activeStep == 2 ? true : false,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Payment time : ',
//                       style: white18text,
//                     ),
//                     SelectDropList(
//                       this.optionItemSelectedTim,
//                       this.dropListModelTime,
//                       (optionItem) {
//                         optionItemSelectedTim = optionItem;
//                         setState(() {});
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Vehicle identification number (if vehicle)',
//                       style: white18text,
//                     ),
//                     TextEdit('123...', 50),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Extra specifications',
//                       style: white18text,
//                     ),
//                     TextEdit('TEXT....', 200),
//                     Padding(
//                       padding:
//                           const EdgeInsetsDirectional.only(start: 25, end: 25),
//                       child: RoundedButton(
//                         radius: 15,
//                         lable: 'Request',
//                         icon: '',
//                         color: Theme.of(context).accentColor,
//                         go: () {
//                           _showDialog(context);
//                         },
//                         style: mainHeaderBlackStyle,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: AlignmentDirectional.bottomEnd,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     activeStep == 0
//                         ? Container()
//                         : Align(
//                             alignment: AlignmentDirectional.bottomStart,
//                             child: FloatingActionButton.extended(
//                               onPressed: () {
//                                 setState(() {
//                                   activeStep = activeStep - 1;
//                                   WidgetsBinding.instance!
//                                       .addPostFrameCallback((_) {
//                                     _controller
//                                         .animateTo(
//                                             0.0,
//                                             duration: Duration(microseconds: 1),
//                                             curve: Curves.easeOut);
//                                   });
//                                 });
//                               },
//                               label: Text('Back'),
//                               icon: Icon(
//                                 Icons.arrow_back,
//                               ),
//                             )),
//                     activeStep == 2
//                         ? Container()
//                         : Align(
//                             alignment: AlignmentDirectional.bottomEnd,
//                             child: FloatingActionButton.extended(
//                               onPressed: () {
//                                 setState(() {
//                                   activeStep = activeStep + 1;
//                                   WidgetsBinding.instance!
//                                       .addPostFrameCallback((_) {
//                                     _controller
//                                         .animateTo(
//                                         0.0,
//                                         duration: Duration(microseconds: 1),
//                                         curve: Curves.easeOut);
//                                   });
//
//                                 });
//                               },
//                               icon: Icon(
//                                 Icons.arrow_forward_outlined,
//                                 // color: bal,
//                               ),
//                               label: Text('Continue'),
//                             )),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       title: 'Request shipment',
//       currentIndex: -1,
//       isResultScreen: false,
//       isHome: false,
//     );
//   }
//
//   _setSelectedRadioGender(int val) {
//     setState(() {
//       selectedRadioGender = val;
//       print(val);
//     });
//   }
//
//   void _showDialog(BuildContext context) {
//     // flutter defined function
//     CoolAlert.show(
//       context: context,
//       type: CoolAlertType.success,
//       backgroundColor: AppThemeDataService.PrimaryColor,
//       confirmBtnColor: AppThemeDataService.AccentColor,
//       text: 'Your request added successfully!',
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = ScrollController();
//   }
// }
