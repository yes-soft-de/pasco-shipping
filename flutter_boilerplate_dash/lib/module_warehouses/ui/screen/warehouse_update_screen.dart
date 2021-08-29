import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/state_manger/new_warehouse_state_manger.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/addnew_state/add_warehouse_init.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/update_state/update_warehouse_init.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class UpdateWarehouse extends StatefulWidget {
  final AddWarehouseStateManager _stateManager;

  const UpdateWarehouse(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<UpdateWarehouse> {
  late AddWarehouseState currentState;

  late List<ProxyModel> proxies;
  late List<SubcontractModel> subcontract;
  late List<CountryModel> countries;

  late WarehousesModel model;

  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: 'Update warehouse'
    );
  }


  @override
  void initState() {
    super.initState();
    currentState = LoadingAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        if(currentState is SuccessfullyAddState){
          Navigator.pop(context);
        }else {
          setState(() {});
        }
      }
    });
    widget._stateManager.getSubContractAndProxyAndCountry();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    model =arguments['warehouseModel'];
  }

  Widget Screen(){
    if(currentState is LoadingAddState){
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
    else if (currentState is InitAddState){
      InitAddState? state = currentState as InitAddState?;
      proxies = state!.proxies;
      subcontract = state.subcontracts;
      countries = state.country;
      return UpdateWarehouseInit(onUpdate: (request){
        widget._stateManager.updateWarehouses(request);
      },proxies: proxies,subcontract: subcontract,countries: countries, model: model,
      );
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
}
