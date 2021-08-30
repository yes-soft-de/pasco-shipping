import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_airwaybill/state_manger/new_airwaybill_state_manger.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/addnew_state/add_airwaybill_init.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/update_state/update_airwaybill_init.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class UpdateAirwaybill extends StatefulWidget {
  final AddAirwaybillStateManager _stateManager;

  const UpdateAirwaybill(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<UpdateAirwaybill> {
  late AddAirwaybillState currentState;
  late List<SubcontractModel> subs;
  late List<AirwaybillSpecificationModel> specification;
  late AirwaybillModel model;

  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: S.of(context).updateAirwaybill
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
    widget._stateManager.getSubContractAndSpecification();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    model =arguments['airwaybillModel'];
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
      specification = state!.specifications;
      subs = state.subcontracts;
      return UpdateAirwaybillInit(
        specifications: specification,
        subContracts: subs,
        model: model,
        onUpdate: (request){
        widget._stateManager.updateAirwaybill(request);
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
