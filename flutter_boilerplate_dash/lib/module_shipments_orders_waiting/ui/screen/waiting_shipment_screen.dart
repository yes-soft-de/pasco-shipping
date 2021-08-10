import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_state/wainting_shipment_state.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_state/waiting_shipments_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../waiting_shipment_routes.dart';

@injectable
class WaitingShipmentScreen extends StatefulWidget {
  final WaitingShipmentsStateManager _stateManager;

  WaitingShipmentScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<WaitingShipmentScreen> {
  late WaitingShipmentsState currentState;
  late List<WaitingShipmentModel> items;
  late String transportationType;
  late bool isExternalWarehouse;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Screen(),
        title: 'Waiting Shipment'
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    transportationType =arguments['transportationType'];
    isExternalWarehouse =arguments['isExternalWarehouse'];
    widget._stateManager.getWaitingShipment(transportationType);
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();
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
    else if (currentState is SuccessfullyFetchState){
      SuccessfullyFetchState? state = currentState as SuccessfullyFetchState?;
      items = state!.waitingShipments;
      return WaitingShipmentSuccessfully(items: items,
        onDetails: (model){
          Navigator.pushNamed(context, WaitingShipmentRoutes.DETAILS , arguments: {'shipmentModel' : model} ).then((value){
            widget._stateManager.getWaitingShipment(transportationType);
          });
        }, isExternalWarehouse: isExternalWarehouse,
      );
    }
    else if(currentState is ErrorState) {
      ErrorState? state = currentState as ErrorState?;
      bool   empty = state!.isEmptyData;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: state.error,isEmptyData: empty,),
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