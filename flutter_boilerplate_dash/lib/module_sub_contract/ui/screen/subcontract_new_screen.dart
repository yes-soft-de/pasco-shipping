import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_sub_contract/state_manger/new_subcontract_state_manger.dart';
import 'package:pasco_shipping/module_sub_contract/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_sub_contract/ui/state/addnew_state/add_subcontract_init.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/alert_widget.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewSubcontract extends StatefulWidget {
  final AddSubcontractStateManager _stateManager;

  const AddNewSubcontract(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewSubcontract> {
  late AddSubcontractState currentState;
  late List<SubContractServiceModel> items;

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
        title: S.of(context).addNewSubContract
    );
  }


  @override
  void initState() {
    super.initState();
    items = [];
    currentState = LoadingAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    widget._stateManager.getAllService();
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
      items = state!.services;
      return AddSubcontractInit(
        services: items,
        onSave: (request){
        widget._stateManager.createSubcontract(request);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      Future.delayed(Duration.zero, () =>  AlertWidget.showAlert(context, true, S.of(context).addedSuccessfully));
      return AddSubcontractInit(
        services: items,
        onSave: (request){
        widget._stateManager.createSubcontract(request);
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
