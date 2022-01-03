import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_details_state/waiting_shipment_details_init.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_details_state/waiting_shipment_details_state.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class WantingShipmentDetailsScreen extends StatefulWidget {
  final WaitingShipmentsDetailsStateManager _stateManager;

  WantingShipmentDetailsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<WantingShipmentDetailsScreen> {
  late WaitingShipmentDetailsState currentState;

  late WaitingShipmentModel shipmentModel;
  late String transportationType;
  late bool isAccepted;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child:  Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: S.of(context).details
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentModel =arguments['shipmentModel'];
    // widget._stateManager.getWaitingShipment(transportationType);
  }

  @override
  void initState() {
    super.initState();
    shipmentModel = WaitingShipmentModel(isExternalWarehouse: false,pendingHolders: []);
    currentState = initDetailsState(shipmentModel);
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
          setState(() {});
      }
    });
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
    else if (currentState is initDetailsState) {
      return WaitingShipmentDetailsInit(shipment: shipmentModel,
        onAccepted: (request) {
          CoolAlert.show(
            width: 150,
            context: context,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            confirmBtnText: S.of(context).ok,
            onConfirmBtnTap: (){
              isAccepted=true;
              Navigator.pop(context);
              widget._stateManager.acceptedOrRejectedShipment(request);
            },
            text: S.of(context).acceptedConfirm,
          );
        },
        onRejected: (request) {
          CoolAlert.show(
            context: context,
            width: 150,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            confirmBtnText: S.of(context).ok,
            onConfirmBtnTap: (){
              isAccepted=false;
              Navigator.pop(context);
              widget._stateManager.acceptedOrRejectedShipment(request);
            },
            text: S.of(context).rejectConfirm,
          );
        },
      );
    }
    else if(currentState is SuccessfullyModifyState){
      SuccessfullyModifyState state = currentState as SuccessfullyModifyState;
      if(state.response.isConfirmed){
        if(isAccepted) {
          Future.delayed(Duration.zero, () => _showAlert(context,true,shipmentModel.shipmentId.toString(),(){
          Navigator.pop(context);
        }));
        }else{
          Future.delayed(Duration.zero, () => _showAlert(context,false,shipmentModel.shipmentId.toString(),(){
            Navigator.pop(context);
          }));
        }
        return WaitingShipmentDetailsInit(shipment: shipmentModel,
          onAccepted: (request) {
            CoolAlert.show(
              width: 150,
              context: context,
              type: CoolAlertType.info,
              title:  S.of(context).careful,
              backgroundColor:AppThemeDataService.PrimaryColor,
              confirmBtnColor:AppThemeDataService.AccentColor,
              confirmBtnText: S.of(context).ok,
              onConfirmBtnTap: (){
                Navigator.pop(context);
                widget._stateManager.acceptedOrRejectedShipment(request);
              },
              text: S.of(context).acceptedConfirm,
            );
          },
          onRejected: (request) {
            CoolAlert.show(
              context: context,
              width: 150,
              type: CoolAlertType.info,
              title:  S.of(context).careful,
              backgroundColor:AppThemeDataService.PrimaryColor,
              confirmBtnColor:AppThemeDataService.AccentColor,
              confirmBtnText: S.of(context).ok,
              onConfirmBtnTap: (){
                Navigator.pop(context);
                widget._stateManager.acceptedOrRejectedShipment(request);
              },
              text: S.of(context).rejectConfirm,
            );
          },
        );
      }else{
        Future.delayed(Duration.zero, () => _showAlert(context,false,shipmentModel.shipmentId.toString(),(){

        }));
        return WaitingShipmentDetailsInit(shipment: shipmentModel,
          onAccepted: (request) {
            CoolAlert.show(
              width: 150,
              context: context,
              type: CoolAlertType.info,
              title:  S.of(context).careful,
              backgroundColor:AppThemeDataService.PrimaryColor,
              confirmBtnColor:AppThemeDataService.AccentColor,
              confirmBtnText: S.of(context).ok,
              onConfirmBtnTap: (){
                Navigator.pop(context);
                widget._stateManager.acceptedOrRejectedShipment(request);
              },
              text: S.of(context).acceptedConfirm,
            );
          },
          onRejected: (request) {
            CoolAlert.show(
              context: context,
              width: 150,
              type: CoolAlertType.info,
              title:  S.of(context).careful,
              backgroundColor:AppThemeDataService.PrimaryColor,
              confirmBtnColor:AppThemeDataService.AccentColor,
              confirmBtnText: S.of(context).ok,
              onConfirmBtnTap: (){
                Navigator.pop(context);
                widget._stateManager.acceptedOrRejectedShipment(request);
              },
              text: S.of(context).rejectConfirm,
            );
          },
        );
      }
    }
    else if(currentState is ErrorState) {
      ErrorState? state = currentState as ErrorState?;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error:'Error', isEmptyData: false,),
          ],
        ),
      );
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'Error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
  _showAlert(BuildContext context , bool success,String id,Function pop){
    return CoolAlert.show(
        context: context,
        width: 150,
        type:success ?CoolAlertType.success :CoolAlertType.error,
        title:S.of(context).success,
        confirmBtnText:S.of(context).ok,
        backgroundColor:AppThemeDataService.PrimaryColor,
        onConfirmBtnTap: (){
          Navigator.pop(context);
          pop();
        },
        text: success?S.of(context).shipmentAddSuccessfully+'\n'
            +'ShipmentID: ' + id
            :S.of(context).refusedShipmentSuccessfully
    );
  }
}
