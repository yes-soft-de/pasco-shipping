import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/filter_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/update_shifting_status_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';
import 'package:pasco_shipping/module_shifting_shipment/state_manager/shipments_shifitng_state_manager.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/state/shipment_shifting_state/shifitng_state.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/state/shipment_shifting_state/shipment_shifting_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';


@injectable
class ShipmentShiftingScreen extends StatefulWidget {
  final ShipmentsShiftingStateManager _stateManager;

  ShipmentShiftingScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ShipmentShiftingScreen> {
  late ShiftingState currentState;
  late List<ShipmentShiftingModel> items;
  late String type;
  late ShiftingShipmentFilterRequest filterRequest;
  late bool hideButton;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Screen(),
        title: S.of(context).shipmentShifting
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    filterRequest = arguments['filterRequest'];
    if(filterRequest.fromImportWarehouseID != null ){
      hideButton = true;
    }else {
      hideButton = false;
    }
    widget._stateManager.getShiftingShipment(filterRequest);
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();
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
    else if (currentState is SuccessfullyFetchState){
      SuccessfullyFetchState? state = currentState as SuccessfullyFetchState?;
      items = state!.shipments;
      return ShiftingShipmentSuccessfully(items: items ,
        onChangeStatus: (model,status){
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
              UpdateShiftingStatusRequest request =UpdateShiftingStatusRequest(model.id,status);
              widget._stateManager.updateStatus(request,filterRequest);
            },
            text: S.of(context).changeStatusConfirm,
          );

        }, hideButton: hideButton,
        // onDetails: (id){
        // // Navigator.pushNamed(context, TravelRoutes.DETAILS , arguments: {'id' : id}).then((value){
        // //   widget._stateManager.getTravelWithFilter(travelFilterRequest);
        // // });
        // },
      );
    }
    // else if(currentState is SuccessfullyModifyMarkState){
    //   SuccessfullyModifyMarkState state = currentState as SuccessfullyModifyMarkState;
    //   items = state.marks;
    //   // Future.delayed(Duration.zero, () => _showDialog(context,state.response.message));
    //   _markNumberController.clear();
    //   return MarkSuccessfullyScreen(deleteMark: (id){
    //     widget._stateManager.deleteMark(id.toString());
    //   }, items: items, addMark: (request){
    //     widget._stateManager.createMark(request);
    //   },markNumberController: _markNumberController,);
    // }
    else if(currentState is ErrorState) {
      ErrorState? state = currentState as ErrorState?;
      bool   empty = state!.isEmptyData;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: state.error,isEmptyData: empty,),
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
}
