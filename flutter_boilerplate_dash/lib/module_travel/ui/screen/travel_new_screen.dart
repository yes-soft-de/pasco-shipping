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
        setState(() {});
      }
    });
    widget._stateManager.getCountriesAndSubContract();
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
      countries = state!.countries;
      subs = state.subcontracts;
      return AddTravelInit(
        countries: countries,
        subContracts: subs,
        onSave: (request){
        widget._stateManager.createTravel(request);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
      return AddTravelInit(
        subContracts: subs,
        countries: countries,
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
