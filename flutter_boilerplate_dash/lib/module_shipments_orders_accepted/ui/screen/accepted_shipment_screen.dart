import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_state/accepted_shipment_state.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_state/accepted_shipments_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../accepted_shipment_routes.dart';

@injectable
class AcceptedShipmentScreen extends StatefulWidget {
  final AcceptedShipmentsStateManager _stateManager;

  AcceptedShipmentScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AcceptedShipmentScreen> {
  late AcceptedShipmentsState currentState;
  late Data items;
  late AcceptedShipmentFilterRequest filterRequest;
  late bool withFilter;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: withFilter,
        goBack: ()  {
          Navigator.pushNamed(context, AcceptedShipmentRoutes.FILTER ,arguments: {'filterRequest' : filterRequest}).then((value) {
            filterRequest = (value as Map)['filterRequest'];
            widget._stateManager.getAcceptedShipment(filterRequest);

          });
        },
        child: Screen(),
        title: S.of(context).acceptedShipment
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    filterRequest =arguments['filterRequest'];
    withFilter =arguments['withFilter'];
    widget._stateManager.getAcceptedShipment(filterRequest);
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();
    widget._stateManager.stateStream.listen((event) {
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
      return AcceptedShipmentSuccessfully(
        items: items,
        onDetails: (id){
          Navigator.pushNamed(context,AcceptedShipmentRoutes.DETAILS , arguments: {'id' : id} ).then((value){
            widget._stateManager.getAcceptedShipment(filterRequest);
          });
        },
        onSearch: (number){
          filterRequest.trackNumber = number;
          widget._stateManager.getAcceptedShipment(filterRequest);
        },
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