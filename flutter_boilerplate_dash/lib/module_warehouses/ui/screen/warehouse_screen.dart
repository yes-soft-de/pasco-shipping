import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/state_manger/warehouse_state_manager.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/warehouse_state/warehouse_state.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/warehouse_state/warehouses_successfully.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class WarehouseScreen extends StatefulWidget {
  final WarehouseStateManager _stateManager;

  WarehouseScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<WarehouseScreen> {
  late WarehousesState currentState;
  late List<WarehousesModel> items;
  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: 'Warehouses'
    );
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
    widget._stateManager.getWarehouses();
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
      return WarehousesSuccessfully(items: items ,onDelete: (id){
        widget._stateManager.deleteWarehouses(id.toString());
      },
        onEdit: (request){
          widget._stateManager.updateWarehouses(request);
        },
      );
    }
    // else if(currentState is SuccessfullyModifyMarkState){
    //   SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
    //   items = state.marks;
    //   // Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
    //   _markNumberController.clear();
    //   return MarkSuccessfullyScreen(deleteMark: (id){
    //     widget._stateManager.deleteMark(id.toString());
    //   }, items: items, addMark: (request){
    //     widget._stateManager.createMark(request);
    //   },markNumberController: _markNumberController,);
    // }
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
