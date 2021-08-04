import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_my_shipment/state_manager/my_shipment_state_manger.dart';
import 'package:pasco_shipping/module_my_shipment/ui/state/my_shipment_active/myshipment_active_successfully.dart';
import 'package:pasco_shipping/module_my_shipment/ui/state/my_shipment_state.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

class MyShipmentActiveScreen extends StatefulWidget {
  final MyShipmentStateManger stateManger;
  const MyShipmentActiveScreen(this.stateManger);

  @override
  _MyShipmentActiveScreenState createState() => _MyShipmentActiveScreenState();
}

class _MyShipmentActiveScreenState extends State<MyShipmentActiveScreen> {
  late MyShipmentState currentState;

  @override
  void initState() {
    super.initState();
    currentState = LoadingMyShipmentState();

    widget.stateManger.stateStream.listen((event) {
      print("newEvent" + event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget.stateManger.getMyShipmentActive();
  }

  @override
  Widget build(BuildContext context) {
    if (currentState is LoadingMyShipmentState) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          LoadingIndicator(AppThemeDataService.AccentColor),
        ],
      );
    } else if (currentState is SuccessfullyFetchActiveShipmentState) {
      SuccessfullyFetchActiveShipmentState? state =
          currentState as SuccessfullyFetchActiveShipmentState?;
      return MyShipmentActiveSuccessfully(state!.shipmentWaiting , state.shipmentActive);
    } else {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          ErrorScreen(
            retry: () {},
            error: 'Connection error',
            isEmptyData: false,
          ),
        ],
      );
    }
  }
}
