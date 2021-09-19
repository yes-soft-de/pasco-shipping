import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_sub_contract/state_manger/new_subcontract_state_manger.dart';
import 'package:pasco_shipping/module_sub_contract/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_sub_contract/ui/state/update_state/update_sub_contarct_init.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class UpdateSubContract extends StatefulWidget {
  final AddSubcontractStateManager  _stateManager;

  const UpdateSubContract(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<UpdateSubContract> {
  late AddSubcontractState currentState;
  late List<SubContractServiceModel> services;
  late SubcontractModel model;

  @override
  Widget build(BuildContext context) {

    return Background(
      showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: S.of(context).edit
    );
  }


  @override
  void initState() {
    super.initState();
    services = [];
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
    widget._stateManager.getAllService();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    model =arguments['subcontractModel'];
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
      services = state!.services;
      return UpdateSubContractInit(onUpdate: (request){
        widget._stateManager.updateSubContract(request);
      }, services:services, subProductModel: model,);
    }
    // else if (currentState is SuccessfullyAddState){
    //   Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
    //   return Container();
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
