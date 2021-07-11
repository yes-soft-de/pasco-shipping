// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pasco_shipping/module_shipment_previous/ui/widget/history_card.dart';
// import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
// import 'package:pasco_shipping/module_shipment_previous/ui/widget/shipment_card.dart';
// import 'package:pasco_shipping/utils/styles/colors.dart';
// import 'package:pasco_shipping/utils/styles/static_images.dart';
// import 'package:pasco_shipping/utils/styles/text_style.dart';
// import 'package:pasco_shipping/utils/widget/background.dart';
//
// @injectable
// class ShipmentTrackingScreen extends StatefulWidget {
//   const ShipmentTrackingScreen();
//
//   @override
//   _ShipmentTrackingScreenState createState() => _ShipmentTrackingScreenState();
// }
//
// class _ShipmentTrackingScreenState extends State<ShipmentTrackingScreen> {
//   late bool isActive;
//   late bool isDone;
//   late bool isWaiting;
//   late ScrollController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       controller: controller,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SearchCard(onSearch: (_){},),
//             Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   historyCard('Tracking', '2 Active',
//                       StaticImage.box,
//                       isActive,
//                       () {
//                     setState(() {
//                       isWaiting = false;
//                       isActive = true;
//                       isDone=false;
//                       print(isWaiting);
//                     });
//                   }),
//                   historyCard(
//                       'Waiting', '1',
//                       StaticImage.waiting,
//                       isWaiting,
//                           () {
//                         setState(() {
//                           isWaiting = true;
//                           isActive = false;
//                           isDone=false;
//                         });
//                       }),
//                   historyCard(
//                       'history', '10 Done',
//                       StaticImage.history,
//                       isDone,
//                       () {
//                     setState(() {
//                       isWaiting = false;
//                       isActive = false;
//                       isDone=true;
//                     });
//                   }),
//
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.only(end: 20, start: 20),
//               child: Divider(
//                 thickness: 2,
//                 color: white,
//               ),
//             ),
//             Visibility(
//               visible: isWaiting,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsetsDirectional.only(start: 20, top: 10),
//                       child: Text(
//                         'Shipment waiting for confirmation',
//                         style: greyWhite14text,
//                       ),
//                     ),
//                     ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: 1,
//                         itemBuilder: (context, index) {
//                           return waitingShipmentCard(StaticImage.car);
//                         }),
//                   ],
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: isDone,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsetsDirectional.only(start: 20, top: 10),
//                       child: Text(
//                         'Previous shipments',
//                         style: greyWhite14text,
//                       ),
//                     ),
//                     ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: 10,
//                         itemBuilder: (context, index) {
//                           return ShipmentCard(StaticImage.car, false);
//                         }),
//                   ],
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: isActive,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsetsDirectional.only(start: 20, top: 10),
//                       child: Text(
//                         'Current shipment',
//                         style: greyWhite14text,
//                       ),
//                     ),
//                     ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: 2,
//                         itemBuilder: (context, index) {
//                           return ShipmentCard(StaticImage.car, true);
//                         }),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         title: 'Shipments tracking',
//       currentIndex: -1,
//       isResultScreen: false,
//       isHome: false,
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     isWaiting = true;
//     isActive = false;
//     isDone = false;
//     controller = ScrollController();
//   }
// }
