import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_client/state_manager/new_client_state_manger.dart';
import 'package:pasco_shipping/module_client/ui/state/add_new_client/add_client_init.dart';
import 'package:pasco_shipping/module_client/ui/state/add_new_client/add_new_client_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewClient extends StatefulWidget {
  final AddClientStateManager _stateManager;

  const AddNewClient(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewClient> {
  late AddClientState currentState;

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
                child:  Screen()),
          ),
        ),
        title: S.of(context).addNewClient
    );
  }


  @override
  void initState() {
    super.initState();
    currentState = InitAddState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    // widget._stateManager.getCountries();
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
      return AddClientInit(onSave: (request){
        widget._stateManager.createClient(request);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      SuccessfullyAddState? state = currentState as SuccessfullyAddState?;
      Future.delayed(Duration.zero, () => _showAlert(context,state!.response.isConfirmed));
      return AddClientInit(onSave: (request){
        widget._stateManager.createClient(request);
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
  _showAlert(BuildContext context , bool success){
    return CoolAlert.show(
        context: context,
        width: 150,
        type:success ?CoolAlertType.success :CoolAlertType.error,
        title:success?S.of(context).success : S.of(context).errorHappened,
        confirmBtnText:S.of(context).ok,
        backgroundColor:AppThemeDataService.PrimaryColor,
        text: success?S.of(context).clientAdd :S.of(context).clientAlreadyExists
    );
  }
}
