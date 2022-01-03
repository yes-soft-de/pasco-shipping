

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_price/response/container_price_response.dart';
import 'package:pasco_shipping/module_price/state_manager/container_price_state_manager/add_container_price_state_manager.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/add_container_price_state/add_container_price_state.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/update_container_state/update_conatiner_price_init.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class UpdateContainerPrice extends StatefulWidget {
  final AddContainerPriceStateManager _stateManager;

  const UpdateContainerPrice(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<UpdateContainerPrice> {
  late AddContainerPriceState currentState;

  late List<Countries> countriesExport;
  late List<HarborModel> harbors;
  late List<ContainerSpecificationModel> specification;
  late ContainerPriceModel model;
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
        title: S.of(context).edit
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
        if(currentState is SuccessfullyAddState){
          Navigator.pop(context);
        }else {
          setState(() {});
        }
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

      return UpdateContainerPriceInit(
      countriesExports: countriesExport,
        harbors: harbors,
        specification: specification,
        onUpdate: (req){
        widget._stateManager.updateContainerPrice(req);
      }, model: model,);
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    model =arguments['model'];
  }
}