import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:pasco_shipping/module_shipment_previous/model/product_type.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/NumberInputWithIncrementDecrement.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/choice_card.dart';
import 'package:pasco_shipping/module_shipment_request/ui/widget/select_drop_list.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/first_option/fisrt_option_successfully.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/request_shipment_state.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';


@injectable
class FirstOptions extends StatefulWidget {
  final RequestShipmentStateManger stateManger;
  final ShipmentRequest _shipmentRequest;
  final Function goToSecondStep;
  FirstOptions(this.stateManger, this._shipmentRequest, this.goToSecondStep);

  @override
  _FirstOptionsState createState() => _FirstOptionsState();
}

class _FirstOptionsState extends State<FirstOptions> {
  late RequestShipmentState currentState;

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();

    widget.stateManger.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget.stateManger.getFirstOption();
  }

  @override
  Widget build(BuildContext context) {
    if (currentState is LoadingState) {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          LoadingIndicator(AppThemeDataService.AccentColor),
        ],
      );    }
    else if (currentState is FirstOptionFetchingDataState) {
      FirstOptionFetchingDataState? state =
          currentState as FirstOptionFetchingDataState?;
      return FirstOptionSuccessfully(
        categories: state!.categories,
        countries: state.warehouses,
        shipmentRequest: widget._shipmentRequest,
        goToSecondStep:(){
          widget.goToSecondStep();
        }
      );
    }  else {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          ErrorScreen(retry: (){},error: 'error',),
        ],
      );
    }
  }
}
