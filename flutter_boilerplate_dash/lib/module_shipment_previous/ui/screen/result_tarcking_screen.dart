// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pasco_shipping/module_shipment_previous/model/trackModel.dart';
// import 'package:pasco_shipping/module_shipment_previous/ui/widget/tracking_card.dart';
// import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
// import 'package:pasco_shipping/utils/styles/colors.dart';
// import 'package:pasco_shipping/utils/styles/static_images.dart';
// import 'package:pasco_shipping/utils/styles/text_style.dart';
// import 'package:pasco_shipping/utils/widget/background.dart';
//
// @injectable
// class ResultTrackingScreen extends StatefulWidget {
//   const ResultTrackingScreen();
//
//   @override
//   _ResultTrackingScreenState createState() => _ResultTrackingScreenState();
// }
//
// class _ResultTrackingScreenState extends State<ResultTrackingScreen> {
//   // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   List<TrackModel> items = [
//     TrackModel(1,  "Requested", "20 min ago",true , false),
//     TrackModel(1,  "Accepted", "20 min ago",true, false),
//
//     TrackModel(1, "Received in the warehouse.", "20 min ago",false, false),
//
//     TrackModel(1,  "shipping started","1",false ,true),
//     TrackModel(1, " Arrived at the target city", "20 min ago", false ,true),
//     TrackModel(1,"Delivered", "20 min ago", false , true),
//   ];
//   final ScrollController _controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       controller: _controller,
//       isHome: false,
//       // bottomNavigationBar: Padding(
//       //   padding: const EdgeInsetsDirectional.only(start: 10 , end: 10),
//       //   child: Container(
//       //     height: 65,
//       //       width: MediaQuery.of(context).size.width,
//       //       decoration:BoxDecoration(
//       //         borderRadius: BorderRadius.circular(15),
//       //         color: black,
//       //       ),
//       //       child: Padding(
//       //         padding: const EdgeInsets.all(8.0),
//       //         child: Card(
//       //             color: black,
//       //             child: Text('The other part of the shipment will arrive on the next flight, please track it via the following number 4567.',style: TextStyle(color: Colors.red),)),
//       //       )),
//       // ),
//         child: CustomScrollView(
//           shrinkWrap: true,
//           slivers: [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               backgroundColor: greyBlack,
//               collapsedHeight: 420,
//               pinned: false,
//               floating: true,
//               flexibleSpace: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsetsDirectional.only(start: 20),
//                         child: Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.menu,
//                                   color: white,
//                                 ),
//                                 onPressed: () {
//                                   // _scaffoldKey.currentState!.openDrawer();
//                                 }),
//                             Text(
//                               'Result tracking',
//                               style: white18text,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Image.asset(
//                         StaticImage.divider,
//                         width: MediaQuery.of(context).size.width,
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsetsDirectional.only(top: 10 , bottom: 10),
//                         child: Text('Shipment Info' , style: basic14text,),
//                       ),
//
//                       Card(
//                         // margin: new EdgeInsets.symmetric(vertical: 20.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         elevation: 5.0,
//                         color: black,
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.track_changes,
//                                     color: white,
//                                     size: 20,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     'Track number',
//                                     style: White14text,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     '123589',
//                                     style: basic14text,
//                                   )
//                                 ],
//                               ),
//                               SizedBox(height: 10,),
//                               Row(
//                                 children: [
//
//                                   Icon(
//                                     Icons.person,
//                                     color: white,
//                                     size: 20,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     'Distributor name: ',
//                                     style: White14text,
//                                   ),
//                                   Text(
//                                     'Rami',
//                                     style: basic14text,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_on,
//                                     color: white,
//                                     size: 20,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text('Import warehouse city: ',
//                                       style: White14text),
//                                   Text(' Sirte, LIBYA ', style: basic14text),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.info,
//                                     color: white,
//                                     size: 20,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     "Is in one holder",
//                                     style: White14text,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Icon(
//                                     Icons.check_circle_outline,
//                                     color: green,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//
//                               Text('Important note',style: TextStyle(color: AppThemeDataService.AccentColor),),
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text('The other part of the shipment will arrive on the next flight, please track it via the following number 4567.',style: TextStyle(color: Colors.red),),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       // Container(
//                       //     height: 65,
//                       //     width: MediaQuery.of(context).size.width,
//                       //     decoration:BoxDecoration(
//                       //       borderRadius: BorderRadius.circular(15),
//                       //       color: black,
//                       //     ),
//                       //     child: Padding(
//                       //       padding: const EdgeInsets.all(10.0),
//                       //       child: Text('The other part of the shipment will arrive on the next flight, please track it via the following number 4567.',style: TextStyle(color: Colors.red),),
//                       //     )),
//                       SizedBox(height: 15,),
//                       Center(
//                         child: Text(
//                           'Tracking the shipment',
//                           style: basic14text,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   // if(index == items.length ) {
//                   //   return Padding(
//                   //     padding: const EdgeInsets.all(8.0),
//                   //     child: Card(
//                   //         color: black,
//                   //         child: Text('The other part of the shipment will arrive on the next flight, please track it via the following number 4567.',style: TextStyle(color: Colors.red),)),
//                   //   );
//                   // }
//                   return TrackingCard(model: items[index]);
//
//                 },
//                 childCount: items.length, // 1000 list items
//               ),
//             ),
//
//             // Card(
//             //   // margin: new EdgeInsets.symmetric(vertical: 20.0),
//             //   shape: RoundedRectangleBorder(
//             //     borderRadius: BorderRadius.circular(15.0),
//             //   ),
//             //   elevation: 5.0,
//             //   color: black,
//             //   child: Padding(
//             //     padding: const EdgeInsets.all(20.0),
//             //     child: Column(
//             //       crossAxisAlignment: CrossAxisAlignment.start,
//             //       children: [
//             //         Row(
//             //           children: [
//             //             Icon(Icons.person ,color: white,size: 20,),
//             //             SizedBox(width: 5,),
//             //             Text(
//             //               'Distributor name: ',
//             //               style: White14text,
//             //             ),
//             //             Text(
//             //               'Rami',
//             //               style: basic14text,
//             //             ),
//             //           ],
//             //         ),
//             //         SizedBox(height: 10,),
//             //         Row(
//             //           children: [
//             //             Icon(Icons.location_on ,color: white,size: 20,),
//             //             SizedBox(width: 5,),
//             //             Text('Import warehouse city: ', style: White14text),
//             //             Text(' Sirte, LIBYA ', style: basic14text),
//             //           ],
//             //         ),
//             //         SizedBox(height: 10,),
//             //         Row(
//             //           children: [
//             //             Icon(Icons.info , color: white,size: 20,),
//             //             SizedBox(width: 5,),
//             //             Text(
//             //               "Is in one holder",
//             //               style: White14text,
//             //             ),
//             //             SizedBox(width: 5,),
//             //             Icon(Icons.check_circle_outline , color: green,),
//             //           ],
//             //         ),
//             //
//             //         SizedBox(height: 10,),
//             //         Row(
//             //           children: [
//             //             Icon(Icons.track_changes , color: white,size: 20,),
//             //             SizedBox(width: 5,),
//             //             Text(
//             //               'Holder Identification number: ',
//             //               style: White14text,
//             //             ),
//             //             SizedBox(width: 5,),
//             //             Text('123589' ,  style: basic14text,)
//             //           ],
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             // Text(
//             //   'Tracking the shipments',
//             //   style: basic14text,
//             // ),
//           ],
//           // child: Column(
//           //   children: [
//           //     Padding(
//           //       padding: const EdgeInsets.all(20.0),
//           //       child: Column(
//           //         mainAxisSize: MainAxisSize.min,
//           //         crossAxisAlignment: CrossAxisAlignment.start,
//           //         children: [
//           //           Card(
//           //             // margin: new EdgeInsets.symmetric(vertical: 20.0),
//           //             shape: RoundedRectangleBorder(
//           //               borderRadius: BorderRadius.circular(15.0),
//           //             ),
//           //             elevation: 5.0,
//           //             color: black,
//           //             child: Padding(
//           //               padding: const EdgeInsets.all(20.0),
//           //               child: Column(
//           //                 crossAxisAlignment: CrossAxisAlignment.start,
//           //                 children: [
//           //                   Row(
//           //                     children: [
//           //                       Icon(Icons.person ,color: white,size: 20,),
//           //                       SizedBox(width: 5,),
//           //                       Text(
//           //                         'Distributor name: ',
//           //                         style: White14text,
//           //                       ),
//           //                       Text(
//           //                         'Rami',
//           //                         style: basic14text,
//           //                       ),
//           //                     ],
//           //                   ),
//           //                   SizedBox(height: 10,),
//           //                   Row(
//           //                     children: [
//           //                       Icon(Icons.location_on ,color: white,size: 20,),
//           //                       SizedBox(width: 5,),
//           //                       Text('Import warehouse city: ', style: White14text),
//           //                       Text(' Sirte, LIBYA ', style: basic14text),
//           //                     ],
//           //                   ),
//           //                   SizedBox(height: 10,),
//           //                   Row(
//           //                     children: [
//           //                       Icon(Icons.info , color: white,size: 20,),
//           //                       SizedBox(width: 5,),
//           //                       Text(
//           //                         "Is in one holder",
//           //                         style: White14text,
//           //                       ),
//           //                       SizedBox(width: 5,),
//           //                       Icon(Icons.check_circle_outline , color: green,),
//           //                     ],
//           //                   ),
//           //
//           //                   SizedBox(height: 10,),
//           //                   Row(
//           //                     children: [
//           //                       Icon(Icons.track_changes , color: white,size: 20,),
//           //                       SizedBox(width: 5,),
//           //                       Text(
//           //                         'Holder Identification number: ',
//           //                         style: White14text,
//           //                       ),
//           //                       SizedBox(width: 5,),
//           //                       Text('123589' ,  style: basic14text,)
//           //                     ],
//           //                   ),
//           //                 ],
//           //               ),
//           //             ),
//           //           ),
//           //           Text(
//           //             'Tracking the shipments',
//           //             style: basic14text,
//           //           ),
//           //           SizedBox(
//           //             height: 15,
//           //           ),
//           //           ListView.builder(
//           //             shrinkWrap: true,
//           //             scrollDirection: Axis.vertical,
//           //             physics: NeverScrollableScrollPhysics(),
//           //             itemBuilder: (context, index) {
//           //               return TrackingCard(model: items[index]);
//           //             },
//           //             itemCount: items.length,
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //
//           //   ],
//           // ),
//         ),
//       isResultScreen: true,
//       currentIndex: -1,
//       title: 'Result tracking',
//       );
//   }
//
//   List<Widget> _buildDropListOptions(List<TrackModel> items) {
//     return items
//         .map((item) => TrackingCard(
//               model: item,
//             ))
//         .toList();
//   }
// }
