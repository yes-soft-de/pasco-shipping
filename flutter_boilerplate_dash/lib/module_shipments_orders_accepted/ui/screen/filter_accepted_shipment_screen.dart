import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/filter_accepted_shipment_state/filter_accepted_shipment_init.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class AcceptedShipmentFilterScreen extends StatefulWidget {
  // final AcceptedShipmentsStateManager _stateManager;

  AcceptedShipmentFilterScreen();

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AcceptedShipmentFilterScreen> {
  late AcceptedShipmentFilterRequest filterRequest;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {

        },
        child: FilterAcceptedShipmentInit(
          filterRequest: filterRequest,
          onSave: (request){
            Navigator.pop(context, {'filterRequest' : request});
        },),
        title: 'Filter By'
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    filterRequest =arguments['filterRequest'];
    // widget._stateManager.getAcceptedShipment(filterRequest);
  }

  @override
  void initState() {
    super.initState();
    // currentState = LoadingState();
    // widget._stateManager.stateStream.listen((event) {
    //   currentState = event;
    //   if (this.mounted) {
    //     setState(() {});
    //   }
    // });
  }

}