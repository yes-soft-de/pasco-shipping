import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_my_shipment/state_manager/my_shipment_state_manger.dart';
import 'package:pasco_shipping/module_my_shipment/ui/state/my_shipment_history/my_shipment_history_successfully.dart';
import 'package:pasco_shipping/module_my_shipment/ui/state/my_shipment_state.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

class MyShipmentHistoryScreen extends StatefulWidget {
  final MyShipmentStateManger stateManger;
  const MyShipmentHistoryScreen(this.stateManger);

  @override
  _MyShipmentHistoryScreenState createState() => _MyShipmentHistoryScreenState();
}

class _MyShipmentHistoryScreenState extends State<MyShipmentHistoryScreen> {
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
    widget.stateManger.getMyShipmentHistory();
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
    } else if (currentState is SuccessfullyFetchHistoryShipmentState) {
      SuccessfullyFetchHistoryShipmentState? state =
      currentState as SuccessfullyFetchHistoryShipmentState?;

      return MyShipmentHistorySuccessfully(state!.shipments);
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
