import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_edit_shipment/state_manager/confirmed_state_manager.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/state/confirmedshipment_state.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../state/myshipment_edited_init.dart';

@injectable
class EditedShipmentScreen extends StatefulWidget {
  final EditShipmentStateManager _stateManager;
  const EditedShipmentScreen(this._stateManager);
  @override
  _MarkScreenState createState() => _MarkScreenState();
}

class _MarkScreenState extends State<EditedShipmentScreen> {
  late ConfirmedShipmentState currentState;
  ScrollController controller = ScrollController();
 late ShipmentTempRequest shipmentTempRequest;


  @override
  Widget build(BuildContext context) {
    return Background(
      goBack: (){
        Navigator.pop(context);
      },
      controller: controller,
      isHome: false,
      child: Screen(),
      title: S.of(context).reviewShipment
      ,currentIndex: -1,
      isResultScreen: false,
    );
  }

  @override
  void initState() {
    super.initState();
    currentState = ConfirmInitState();


    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        setState(() {});
      }
    });

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentTempRequest =arguments['myWaitingShipment'];
  }

  Widget Screen(){
    if(currentState is LoadingState){
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          LoadingIndicator(AppThemeDataService.AccentColor),
        ],
      );
    }
    else if(currentState is ConfirmInitState){
      return ReviewShipmentEditedScreen(shipmentTempRequest , (request){
        widget._stateManager.addShipment(request);
      });
    }
    else if (currentState is ConfirmedState){
      ConfirmedState? state = currentState as ConfirmedState?;
      if(state!.response.isConfirmed){
        Future.delayed(Duration.zero, () => _showDialog(context));
        return Column(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            // Text('Thanks the shipme'),
          ],
        );
      }else{
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            ErrorScreen(retry: (){},error: 'error',),
          ],
        );
      }
    }
    else {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          ErrorScreen(retry: (){},error: 'error',),
        ],
      );
    }
  }
  //
  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      // title: S.of(context).success,
      backgroundColor:AppThemeDataService.PrimaryColor,
      confirmBtnColor:AppThemeDataService.AccentColor,
      onConfirmBtnTap: (){
        deleteShipment();
        Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.Home, (route) => false);
      },
      text: 'Your Shipment Added Successfully',
    );
  }
}
