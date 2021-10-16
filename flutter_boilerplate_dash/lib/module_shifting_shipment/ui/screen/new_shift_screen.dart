import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shifting_shipment/state_manager/new_shifting_state_manager.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/state/new_shifting_state/new_shifing_state.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/state/new_shifting_state/new_shift_init.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AddNewShift extends StatefulWidget {
  final NewShiftingStateManager _stateManager;

  const AddNewShift(this._stateManager);

  @override
  _AddNewCountryState createState() => _AddNewCountryState();
}

class _AddNewCountryState extends State<AddNewShift> {
  late NewShiftingState currentState;
  late int shipmentID;
  late String trackNumber;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentID =arguments['id'];
    trackNumber =arguments['trackNumber'].toString();
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();
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
    widget._stateManager.getWarehouse();
  }

  Widget Screen(){
    if(currentState is LoadingState){
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
    else if (currentState is SuccessfullyInitState){
      SuccessfullyInitState? state = currentState as SuccessfullyInitState?;
      return NewShiftInit(
        trackNumber: trackNumber,
        shipmentID: shipmentID,
        warehouses: state!.wearhouses,
        onRequest: (request){
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
              widget._stateManager.createShift(request);
            },
            text: 'Do you really want to shift the shipment',
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