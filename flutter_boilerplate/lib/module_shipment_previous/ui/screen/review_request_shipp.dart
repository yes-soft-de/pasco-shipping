// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pasco_shipping/module_shipment_previous/previous_routes.dart';
// import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
// import 'package:pasco_shipping/utils/styles/text_style.dart';
// import 'package:pasco_shipping/utils/widget/background.dart';
//
// @injectable
// class ReviewShipmentScreen extends StatelessWidget {
//   const ReviewShipmentScreen();
//
//   @override
//   Widget build(BuildContext context) {
//     final arguments = ModalRoute.of(context)!.settings.arguments as Map;
//     ScrollController controller = ScrollController();
//     return Background(
//         controller: controller,
//         child:
//        Column(
//          mainAxisSize: MainAxisSize.min,
//          children: [
//            Row(
//              children: [
//                Expanded(child: ListTile(title: Text('Shipment type: ' , style: white18text,), subtitle: Text('Sea' ,style: basic14text,))),
//                arguments['isWaiting'] ? Padding(
//                  padding: const EdgeInsetsDirectional.only(end: 20),
//                  child: InkWell(
//                      onTap: (){
//                        Navigator.pushNamed(context, PreviousShipmentsRoutes.REQUEST_SHIPMENTS);
//                      },
//                      child: Icon(Icons.edit , color: AppThemeDataService.AccentColor,)),
//                ):Container()
//              ],
//            ),
//            Row(
//              children: [
//                Expanded(child: ListTile(title: Text('Shipment from: ' , style: white18text,), subtitle: Text('Dubai' ,style: basic14text,))),
//                Expanded(child: ListTile(title: Text('Shipment to: ' , style: white18text,), subtitle: Text('Tripoli' ,style: basic14text,))),
//              ],
//            ),
//            Row(
//              children: [
//                Expanded(child: ListTile(title: Text('Product type: ' , style: white18text,), subtitle: Text('Cars' ,style: basic14text,))),
//                Expanded(child: ListTile(title: Text('Quantity ' , style: white18text,), subtitle: Text('20' ,style: basic14text,))),
//              ],
//            ),
//            ListTile(title: Text('Supplier Info: ' , style: white18text,), subtitle: Text('RAF' ,style: basic14text,)),
//            Row(
//              children: [
//                Expanded(
//                  child: ListTile(title: Text('Recipient Info: ' ,
//                    style: white18text,)),
//                ),
//                Expanded(child: ListTile(title: Text('Name: ' , style: white18text,), subtitle: Text('HAF' ,style: basic14text,))),
//                Expanded(child: ListTile(title: Text('Phone: ' , style: white18text,), subtitle: Text('0944165' ,style: basic14text,))),
//              ],
//            ),
//            ListTile(title: Text('Unit: ' , style: white18text,), subtitle: Text('Carton' ,style: basic14text,)),
//            ListTile(title: Text('Mark ' , style: white18text,), subtitle: Text('JONI SY252' ,style: basic14text,)),
//            ListTile(title: Text('Payment time ' , style: white18text,), subtitle: Text('When received' ,style: basic14text,)),
//            ListTile(title: Text('Extra specification ' , style: white18text,), subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' ,style: basic14text,)),
//
//          ],
//     ), title: 'Review shipment request',
//         currentIndex: -1,
//         isHome: false,
//         isResultScreen: false);
//   }
// }
