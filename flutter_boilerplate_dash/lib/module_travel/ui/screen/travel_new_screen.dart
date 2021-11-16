import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/state_manger/new_travel_state_manger.dart';
import 'package:pasco_shipping/module_travel/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_travel/ui/state/addnew_state/add_travel_init.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewTravel extends StatefulWidget {
  final AddTravelStateManager _stateManager;

  const AddNewTravel(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewTravel> {
  late AddTravelState currentState;
  late List<CountryModel> countries;
  late List<SubcontractModel> subs;

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
        title: S.of(context).addNewTravel
    );
  }


  @override
  void initState() {
    super.initState();
    currentState = InitAddState(subcontracts: [],countries: []);
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });
    // widget._stateManager.getCountriesAndSubContract();
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
      return AddTravelInit(
        onSave: (request){
          CoolAlert.show(
            context: context,
            width: 150,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            confirmBtnText: S.of(context).ok,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            onConfirmBtnTap: (){
              Navigator.pop(context);
              widget._stateManager.createTravel(request);
            },
            text: 'Do you really want to create a new travel',
          );

      },);
    }
    else if (currentState is SuccessfullyAddState){
      Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
      return AddTravelInit(
        onSave: (request){
        widget._stateManager.createTravel(request);
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
