import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_my_shipment/state_manager/my_shipment_state_manger.dart';
import 'package:pasco_shipping/module_my_shipment/ui/screen/my_shipment_history.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/history_card.dart';
import 'package:pasco_shipping/module_my_shipment/ui/widget/shipment_card.dart';
import 'package:pasco_shipping/module_shipment_track/tracking_routes.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:rxdart/rxdart.dart';

import 'my_shipment_active.dart';
import 'my_shipment_waiting.dart';

@injectable
class MyShipmentScreen extends StatefulWidget {
  final MyShipmentStateManger _stateManger;
  const MyShipmentScreen(this._stateManger);

  @override
  _ShipmentTrackingScreenState createState() => _ShipmentTrackingScreenState();
}

class _ShipmentTrackingScreenState extends State<MyShipmentScreen> {
  late bool isActive;
  late bool isDone;
  late bool isWaiting;

  late ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
      goBack: (){
        Navigator.pop(context);
      },
      // controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchCard(
            onSearch: (trackNumber) {
              Navigator.pushNamed(context,
                TracingRoutes.TRACKING_SCREEN , arguments: {'trackNumber': trackNumber}, );
            },title: 'Enter the track number',
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyShipmentTypeCard('Active', '', StaticImage.box, isActive,
                    () {
                  setState(() {
                    isWaiting = false;
                    isActive = true;
                    isDone = false;
                    print(isWaiting);
                  });
                }),
                MyShipmentTypeCard('Confirm', '1', StaticImage.waiting, isWaiting, () {
                  setState(() {
                    isWaiting = true;
                    isActive = false;
                    isDone = false;
                  });
                }),
                MyShipmentTypeCard('History', '', StaticImage.history, isDone,
                    () {
                  setState(() {
                    isWaiting = false;
                    isActive = false;
                    isDone = true;
                  });
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20, start: 20),
            child: Divider(
              thickness: 2,
              color: white,
            ),
          ),
          Center(child: Screen())
          //   Visibility(
          //     visible: isWaiting,
          //     child: Container(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Padding(
          //             padding:
          //                 const EdgeInsetsDirectional.only(start: 20, top: 10),
          //             child: Text(
          //               'Shipment waiting for confirmation',
          //               style: greyWhite14text,
          //             ),
          //           ),
          //           ListView.builder(
          //               shrinkWrap: true,
          //               scrollDirection: Axis.vertical,
          //               physics: NeverScrollableScrollPhysics(),
          //               itemCount: 1,
          //               itemBuilder: (context, index) {
          //                 return waitingShipmentCard(StaticImage.car);
          //               }),
          //         ],
          //       ),
          //     ),
          //   ),
          // Visibility(
          //   visible: isDone,
          //   child: Container(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding:
          //               const EdgeInsetsDirectional.only(start: 20, top: 10),
          //           child: Text(
          //             'Previous shipments',
          //             style: greyWhite14text,
          //           ),
          //         ),
          //         ListView.builder(
          //             shrinkWrap: true,
          //             scrollDirection: Axis.vertical,
          //             physics: NeverScrollableScrollPhysics(),
          //             itemCount: 10,
          //             itemBuilder: (context, index) {
          //               return ShipmentCard(StaticImage.car, false);
          //             }),
          //       ],
          //     ),
          //   ),
          // ),
          // Visibility(
          //   visible: isActive,
          //   child: Container(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding:
          //               const EdgeInsetsDirectional.only(start: 20, top: 10),
          //           child: Text(
          //             'Current shipment',
          //             style: greyWhite14text,
          //           ),
          //         ),
          //         ListView.builder(
          //             shrinkWrap: true,
          //             scrollDirection: Axis.vertical,
          //             physics: NeverScrollableScrollPhysics(),
          //             itemCount: 2,
          //             itemBuilder: (context, index) {
          //               return ShipmentCard(StaticImage.car, true);
          //             }),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      title: S.of(context).trackShipment,
      // currentIndex: -1,
      // isResultScreen: false,
      // isHome: false,
    );
  }

  @override
  void initState() {
    super.initState();
    isWaiting = true;
    isActive = false;
    isDone = false;
    controller = ScrollController();
  }

  Widget Screen() {
    if (isActive) {
      return MyShipmentActiveScreen(widget._stateManger);
    } else if (isDone) {
      return MyShipmentHistoryScreen(widget._stateManger);
    }else if(isWaiting) {
      return MyShipmentWaiting();
    }else {
      return Container();
    }
  }
}
