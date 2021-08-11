import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/request_shipment_state.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/third_option/third_option_successfully.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';

import '../../request_routes.dart';

class ThirdOptions extends StatefulWidget {
  final RequestShipmentStateManger stateManger;
  final ShipmentRequest _shipmentRequest;
  final Function goBackStep;
  // final Function goNextStep;
  const ThirdOptions(this.stateManger, this._shipmentRequest, this.goBackStep);

  @override
  _SecondOptionState createState() => _SecondOptionState();
}

class _SecondOptionState extends State<ThirdOptions> {
  late RequestShipmentState currentState;

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();

    widget.stateManger.stateStream.listen((event) {
      print("newEvent" + event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // String id =arguments['id'].toString();
  widget.stateManger.getThirdOption(widget._shipmentRequest.userID.toString());

}
  @override
  Widget build(BuildContext context) {
    if (currentState is LoadingState) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          LoadingIndicator(AppThemeDataService.AccentColor),
        ],
      );
    } else if (currentState is ThirdOptionFetchingDataState) {
      ThirdOptionFetchingDataState? state =
      currentState as ThirdOptionFetchingDataState?;
      return ThirdOptionsSuccessfully(
          distributors: state!.distributors,
          clients: state.clients,shipmentRequest: widget._shipmentRequest,
          goBackStep: () {
            widget.goBackStep();
          }, onRequest: (request){
            Navigator.pushNamed(context, NewShipmentRoutes.REVIEW_SHIPMENTS , arguments: request);
      },);
    } else {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
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
