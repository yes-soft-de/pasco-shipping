import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/request_shipment_state.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/second_option/second_option_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

class SecondOption extends StatefulWidget {
  final RequestShipmentStateManger stateManger;
  final ShipmentTempRequest _shipmentRequest;
  final Function goBackStep;
  final Function goNextStep;
  final Function goMarkPage;
  const SecondOption(this.stateManger, this._shipmentRequest, this.goBackStep,
      this.goNextStep, this.goMarkPage);

  @override
  _SecondOptionState createState() => _SecondOptionState();
}

class _SecondOptionState extends State<SecondOption> {
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
    widget.stateManger.getSecondOption();
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
    } else if (currentState is SecondOptionFetchingDataState) {
      SecondOptionFetchingDataState? state =
          currentState as SecondOptionFetchingDataState?;
      return SecondOptionSuccessfully(marks: state!.marks, units: state.units,shipmentRequest: widget._shipmentRequest,
          goBackStep: () {
        widget.goBackStep();
      },goNextPage: () {
        widget.goNextStep();
      }, goMarkPage: (){
        widget.goMarkPage();
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
          ),
        ],
      );
    }
  }
}
