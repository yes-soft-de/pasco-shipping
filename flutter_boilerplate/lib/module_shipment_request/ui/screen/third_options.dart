import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/request_shipment_state.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/third_option/third_options_successfully.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ThirdOption extends StatefulWidget {
  final RequestShipmentStateManger stateManger;
  final ShipmentTempRequest shipmentRequest;
  final Function goBackStep;
  final Function goReceiverPage;
  const ThirdOption({required this.stateManger,required this.shipmentRequest,required this.goBackStep,required this.goReceiverPage});

  @override
  _SecondOptionState createState() => _SecondOptionState();
}

class _SecondOptionState extends State<ThirdOption> {
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
    widget.stateManger.getThirdOption();
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
      return ThirdOptionsSuccessfully(receiver: state!.receivers
        ,shipmentRequest: widget.shipmentRequest,
        goBackStep: () {
          widget.goBackStep();
        }, goReceiver: (){
        widget.goReceiverPage();
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
