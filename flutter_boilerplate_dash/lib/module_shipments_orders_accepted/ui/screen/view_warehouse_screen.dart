import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/airwaybill_routes.dart';
import 'package:pasco_shipping/module_container/container_routes.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/warehouses/select_warehouse_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/warehouse_state/warehouse_state.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
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
  late String typeOfCountry;

  late int selectedRadioGender;
  late String type;
 late WarehouseFilterRequest request;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {

        },
        child: Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: S.of(context).selectWarehouse
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    filterRequest =arguments['filterRequest'];
    withFilter = arguments['withFilter'];
    if(filterRequest.status=='arrived'){
      typeOfCountry = 'import';
      type = 'import';
      request = WarehouseFilterRequest(typeOfCountry: typeOfCountry);
    }else{
      typeOfCountry = 'export';
      type = 'export';
      request = WarehouseFilterRequest(typeOfCountry: typeOfCountry);
    }
    widget._stateManager.getWarehouses(request);
  }

  @override
  void initState() {
    super.initState();
    selectedRadioGender = 2;
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
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
           filterRequest.status != 'arrived'?  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioGender(2);
                          },
                          value: 2,
                          groupValue: selectedRadioGender,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).export,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppThemeDataService.AccentColor,
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (value) {
                            _setSelectedRadioGender(1);
                          },
                          value: 1,
                          groupValue: selectedRadioGender,
                          activeColor: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          S.of(context).import,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ) : Container(),
              SelectWarehousesSuccessfully(
                items: items,
                goToAcceptedShipment: (id){
                  if(typeOfCountry =='import'){
                    filterRequest.importWarehouseID = id;
                    Navigator.pushNamed(
                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : filterRequest,'withFilter':withFilter});
                  }else{
                    filterRequest.exportWarehouseID = id;
                    Navigator.pushNamed(
                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : filterRequest,'withFilter':withFilter});
                  }
                },
              ),
            ],
          ),
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
  void _setSelectedRadioGender(int val) {
    setState(() {
      selectedRadioGender = val;
      if (val == 1) {
        type = 'import';
        typeOfCountry = 'import';
        request.typeOfCountry ='import';
        widget._stateManager.getWarehouses(request);
      } else if (val == 2) {
        print('sss');
        typeOfCountry = 'export';
        type = 'export';
        request.typeOfCountry ='export';
        widget._stateManager.getWarehouses(request);
      }
      print(val);
    });
  }
}