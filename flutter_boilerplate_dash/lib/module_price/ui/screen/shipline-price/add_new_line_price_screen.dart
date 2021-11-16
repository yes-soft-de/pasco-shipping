import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_price/state_manager/shipping_line_state_manager/add_new_price_state_manager.dart';
import 'package:pasco_shipping/module_price/ui/state/shipline_price/addNew_state/add__lines_state.dart';
import 'package:pasco_shipping/module_price/ui/state/shipline_price/addNew_state/add_lines_price_init.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewLinesPrice extends StatefulWidget {
  final AddLinePriceStateManager _stateManager;

  const AddNewLinesPrice(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewLinesPrice> {
  late AddLinesPriceState currentState;
  late List<Countries> countriesImport;
  late List<Countries> countriesExport;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: (){
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
        title: S.of(context).addNewLinePrice
    );
  }


  @override
  void initState() {
    super.initState();
    countriesImport =[];
    countriesExport=[];
    // currentState = InitAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getCountries();
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
      countriesExport = state!.countriesExport;
      countriesImport = state.countriesImport;
      return AddShippingLinePriceInit(countriesImports:countriesImport ,countriesExports: countriesExport, onSave: (req){
        widget._stateManager.createShippingLinePrice(req);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
      return AddShippingLinePriceInit(
        countriesExports: countriesExport,
        countriesImports: countriesImport,
        onSave: (request){
        // widget._stateManager.createUnit(request);
      },);
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