import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/state_manger/new_country_state_manger.dart';
import 'package:pasco_shipping/module_countries/ui/state/addnew_state/add_country_init.dart';
import 'package:pasco_shipping/module_countries/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/alert_widget.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewCountry extends StatefulWidget {
  final AddCountryStateManager _stateManager;

  const AddNewCountry(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewCountry> {
  late AddCountriesState currentState;

  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
        goBack: (){
        },
        child:Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: S.of(context).addNewCountries
    );
  }


  @override
  void initState() {
    super.initState();
    currentState = InitAddCountriesState();
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
    if(currentState is LoadingAddCountriesState){
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
    else if (currentState is InitAddCountriesState){
      return AddCountryInit(onSave: (request){
        CoolAlert.show(
          width: 150,
          context: context,
          type: CoolAlertType.info,
          title:  S.of(context).careful,
          confirmBtnText: S.of(context).ok,
          backgroundColor:AppThemeDataService.PrimaryColor,
          confirmBtnColor:AppThemeDataService.AccentColor,
          onConfirmBtnTap: (){
            Navigator.pop(context);
            widget._stateManager.createCountry(request);},
          text: S.of(context).confirmAddCountry,
        );
      },);
    }
    else if (currentState is SuccessfullyAddCountryState){
      Future.delayed(Duration.zero, () =>  AlertWidget.showAlert(context, true, S.of(context).addedSuccessfully));
      return AddCountryInit(onSave: (request){
        CoolAlert.show(
          width: 150,
          context: context,
          type: CoolAlertType.info,
          title:  S.of(context).careful,
          confirmBtnText: S.of(context).ok,
          backgroundColor:AppThemeDataService.PrimaryColor,
          confirmBtnColor:AppThemeDataService.AccentColor,
          onConfirmBtnTap: (){
            Navigator.pop(context);
            widget._stateManager.createCountry(request);},
          text: S.of(context).confirmAddCountry,
        );
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
