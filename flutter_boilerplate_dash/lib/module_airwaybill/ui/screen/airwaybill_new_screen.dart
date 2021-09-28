import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/state_manger/new_airwaybill_state_manger.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/addnew_state/add_airwaybill_init.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewAirwaybill extends StatefulWidget {
  final AddAirwaybillStateManager _stateManager;

  const AddNewAirwaybill(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewAirwaybill> {
  late AddAirwaybillState currentState;
  late List<SubcontractModel> subs;
  late List<AirwaybillSpecificationModel> specification;
  late List<ClientModel> clients;
  late List<HarborModel> harbors;

  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: S.of(context).add
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
    widget._stateManager.getSubContractAndSpecificationAndHarbor();
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
      subs = state!.subcontracts;
      clients = state.clients;
      harbors=state.harbors;
      return RequestAirwaybillInit(

        subContracts: subs,
        clients: clients,
        onSave: (request){
        widget._stateManager.requestAirwaybill(request);
      }, harbors: harbors,);
    }
    // else if (currentState is SuccessfullyAddState){
    //   Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
    //   return RequestAirwaybillInit(
    //     subContracts: subs,
    //     specifications: specification,
    //     clients: clients,
    //     onSave: (request){
    //     widget._stateManager.requestAirwaybill(request);
    //   },);
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
