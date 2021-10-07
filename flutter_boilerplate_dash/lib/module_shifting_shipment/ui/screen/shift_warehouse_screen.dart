import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/filter_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/state_manager/view_warehouse_state_manager.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/state/warehouses/shift_select_warehouse_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/warehouse_state/warehouse_state.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../shifting_routes.dart';

@injectable
class ShiftWarehouseScreen extends StatefulWidget {
  final ViewWarehousesStateManager _stateManager;

  ShiftWarehouseScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ShiftWarehouseScreen> {
  late WarehousesState currentState;
  late List<WarehousesModel> items;
  late int selectedRadioGender;

 late ShiftingShipmentFilterRequest request;
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
    widget._stateManager.getWarehouses(WarehouseFilterRequest(typeOfCountry: 'import'));
  }

  @override
  void initState() {
    super.initState();
    selectedRadioGender = 1;
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
              Row(
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
                          S.of(context).shiftingFrom,
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
                          S.of(context).shiftingTo,
                          style: AppTextStyle.mediumWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SelectShiftingWarehousesSuccessfully(
                items: items,
                goToShiftShipment: (id){
                  if(selectedRadioGender == 1){
                    request = ShiftingShipmentFilterRequest(fromImportWarehouseID: id);
                    Navigator.pushNamed(context, ShiftingRoutes.VIEW_ALL , arguments: {'filterRequest' : request});
                  }else{
                    request = ShiftingShipmentFilterRequest(toImportWarehouseID: id);
                    Navigator.pushNamed(context, ShiftingRoutes.VIEW_ALL , arguments: {'filterRequest' : request});
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

      } else if (val == 2) {

      }
      print(val);
    });
  }
}