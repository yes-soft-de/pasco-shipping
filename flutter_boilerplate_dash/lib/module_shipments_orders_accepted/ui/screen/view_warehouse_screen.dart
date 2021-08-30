import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/warehouses/select_warehouse_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/warehouse_state/warehouse_state.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../accepted_shipment_routes.dart';

@injectable
class ViewWarehouseScreen extends StatefulWidget {
  final ViewWarehousesStateManager _stateManager;

  ViewWarehouseScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ViewWarehouseScreen> {
  late WarehousesState currentState;
  late List<WarehousesModel> items;
  late AcceptedShipmentFilterRequest filterRequest;
  late bool withFilter;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {

        },
        child: Screen(),
        title: S.of(context).selectWarehouse
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    filterRequest =arguments['filterRequest'];
    withFilter = arguments['withFilter'];
    WarehouseFilterRequest request = WarehouseFilterRequest();
    widget._stateManager.getWarehouses(request);
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
      items = state!.distributors;
      return SelectWarehousesSuccessfully(
        items: items,
        goToAcceptedShipment: (id){
          if(filterRequest.status != null){
            filterRequest.importWarehouseID = id;
            Navigator.pushNamed(
                context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : filterRequest,'withFilter':withFilter});
          }else{
            filterRequest.exportWarehouseID =id;
            Navigator.pushNamed(
                context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : filterRequest,'withFilter':withFilter});
          }

        },
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