import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container_specification/state_manger/new_container_specification_state_manger.dart';
import 'package:pasco_shipping/module_container_specification/ui/state/addnew_state/add_container_specification_init.dart';
import 'package:pasco_shipping/module_container_specification/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewContainerSpecification extends StatefulWidget {
  final AddContainerSpecificationStateManager _stateManager;

  const AddNewContainerSpecification(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewContainerSpecification> {
  late AddContainerSpecificationState currentState;

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
                    child:  Screen(   )))),
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
      return AddContainerSpecificationInit(onSave: (request){
        widget._stateManager.createContainerSpecification(request);
      },);
    }
    else if (currentState is SuccessfullyAddState){
      Fluttertoast.showToast(msg: S.of(context).addedSuccessfully);
      return AddContainerSpecificationInit(onSave: (request){
        widget._stateManager.createContainerSpecification(request);
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
