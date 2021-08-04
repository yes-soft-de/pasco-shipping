import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_details_state/waiting_shipment_details_init.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_details_state/waiting_shipment_details_state.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class WantingShipmentDetailsScreen extends StatefulWidget {
  final WaitingShipmentsDetailsStateManager _stateManager;

  WantingShipmentDetailsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<WantingShipmentDetailsScreen> {
  late WaitingShipmentDetailsState currentState;

  late WaitingShipmentModel shipmentModel;
  late String transportationType;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Screen(),
        title: 'Waiting Shipment Details'
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    shipmentModel =arguments['shipmentModel'];
    // widget._stateManager.getWaitingShipment(transportationType);
  }

  @override
  void initState() {
    super.initState();
    shipmentModel = WaitingShipmentModel();
    currentState = initDetailsState(shipmentModel);
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
  }

  Widget Screen(){
    if(currentState is LoadingState){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingIndicator(AppThemeDataService.AccentColor),
          ],
        ),
      );
    }
    else if (currentState is initDetailsState) {
      return WaitingShipmentDetailsInit(shipment: shipmentModel,
        onAccepted: (request) {
        widget._stateManager.acceptedOrRejectedShipment(request);
        },
        onRejected: (request) {
        widget._stateManager.acceptedOrRejectedShipment(request);
        },
      );
    }
    else if(currentState is SuccessfullyModifyState){
      SuccessfullyModifyState state = currentState as SuccessfullyModifyState;
      if(state.response.isConfirmed){
        Fluttertoast.showToast(msg: 'The operation was completed successfully');
        Navigator.pop(context);
        return Container();
      }else{
        Fluttertoast.showToast(msg: 'some thing wrong');
        return WaitingShipmentDetailsInit(shipment: shipmentModel,
          onAccepted: (request) {
            widget._stateManager.acceptedOrRejectedShipment(request);
          },
          onRejected: (request) {
            widget._stateManager.acceptedOrRejectedShipment(request);
          },
        );
      }
    }
    else if(currentState is ErrorState) {
      ErrorState? state = currentState as ErrorState?;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error:'Error', isEmptyData: false,),
          ],
        ),
      );
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'Error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
}
