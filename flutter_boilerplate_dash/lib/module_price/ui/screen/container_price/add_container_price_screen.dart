import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_price/state_manager/container_price_state_manager/add_container_price_state_manager.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/add_container_price_state/add_container_price_init.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/add_container_price_state/add_container_price_state.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewContainerPrice extends StatefulWidget {
  final AddContainerPriceStateManager _stateManager;

  const AddNewContainerPrice(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewContainerPrice> {
  late AddContainerPriceState currentState;

  late List<Countries> countriesExport;
  late List<HarborModel> harbors;
  late List<ContainerSpecificationModel> specification;

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
        title: S.of(context).add
    );
  }


  @override
  void initState() {
    super.initState();
    countriesExport=[];
    specification=[];
    harbors=[];
    // currentState = InitAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getCountriesAndHarborAndSpecification();
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
    else if (currentState is InitAddPriceContainerState){
      InitAddPriceContainerState? state = currentState as InitAddPriceContainerState?;
      countriesExport = state!.countriesExport;
      harbors = state.harbors;
      specification = state.specification;

      return AddContainerPriceInit(
      countriesExports: countriesExport,
        harbors: harbors,
        specification: specification,
        onSave: (req){
        widget._stateManager.createContainerPrice(req);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
      return AddContainerPriceInit(
        countriesExports: countriesExport,
        harbors: harbors,
        specification: specification,
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