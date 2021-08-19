import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart';
import 'package:pasco_shipping/module_airwaybill_specification/ui/state/addnew_state/add_airwaybill_specification_init.dart';
import 'package:pasco_shipping/module_airwaybill_specification/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewAirwaybillSpecification extends StatefulWidget {
  final AddAirwaybillSpecificationStateManager _stateManager;

  const AddNewAirwaybillSpecification(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewAirwaybillSpecification> {
  late AddAirwaybillSpecificationState currentState;

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
      return AddAirwaybillSpecificationInit(onSave: (request){
        widget._stateManager.createAirwaybillSpecification(request);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
      return AddAirwaybillSpecificationInit(onSave: (request){
        widget._stateManager.createAirwaybillSpecification(request);
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
