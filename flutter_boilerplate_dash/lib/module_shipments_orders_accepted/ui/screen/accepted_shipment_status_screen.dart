import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/enums/container_status.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_measured.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_received.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_state.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AcceptedShipmentStatusScreen extends StatefulWidget {
  final AcceptedShipmentsStatusStateManager _stateManager;

  AcceptedShipmentStatusScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AcceptedShipmentStatusScreen> {
  late AcceptedShipmentStatusState currentState;

  late String transportation;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Screen(),
        title: S.of(context).shipmentStatus
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String id =arguments['id'].toString();
    String cityName =arguments['cityName'].toString();
    String holderType =arguments['holderType'].toString();
    String status =arguments['status'].toString();
    String trackNumber =arguments['trackNumber'].toString();
    transportation =arguments['transportation'].toString();

    ContainerFilterRequest containerFilterRequest =ContainerFilterRequest(status:ContainerStatusName[ContainerStatus.NOTFULL] ,type: holderType);
    TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:'cruise');
    if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!) {
      widget._stateManager.getShipmentStatus(id,trackNumber);
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]!){
      widget._stateManager.getReceivedStatus(id,cityName,trackNumber);
    }else if (status == AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!){
      widget._stateManager.getMeasuredStatus(id,containerFilterRequest,trackNumber,travelFilterRequest);
    }else {
      widget._stateManager.getShipmentStatus(id,trackNumber);
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();
    widget._stateManager.stateStream.listen((event) {
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
    else if (currentState is AcceptedStatusState) {
      AcceptedStatusState state = currentState as AcceptedStatusState;
      List<AcceptedShipmentStatusModel> statusModels = state.model;
      return AcceptedShipmentStatusSuccessfully(
      statusModel: statusModels, onChangeStatus: (re , cityName , isDelivred){
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          title:  S.of(context).careful,
          confirmBtnText: S.of(context).ok,
          backgroundColor:AppThemeDataService.PrimaryColor,
          confirmBtnColor:AppThemeDataService.AccentColor,
          onConfirmBtnTap: (){
            Navigator.pop(context);
            widget._stateManager.receivedOrDelevired(re,cityName,isDelivred);
          },
          text: S.of(context).changeStatusConfirm,
        );
      },
      );
    }
    else if (currentState is ReceivedStatusState) {
      print('in status screen');
      ReceivedStatusState state = currentState as ReceivedStatusState;
      List<AcceptedShipmentStatusModel> statusModels = state.model;
      return AcceptedShipmentStatusReceived(
        statusModel: statusModels,
        subcontracts:state.subContracts ,
        warehouse: state.warehouse,
        onChangeStatus: (re , containerFilterRequest ,travelFilterRequest){
          CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            confirmBtnText: S.of(context).ok,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            onConfirmBtnTap: (){
              Navigator.pop(context);
              widget._stateManager.measuredShipment(re, containerFilterRequest,travelFilterRequest);
            },
            text: S.of(context).changeStatusConfirm,
          );
      },
      );
    }
    else if (currentState is MeasuredStatusState) {
      MeasuredStatusState state = currentState as MeasuredStatusState;
      List<AcceptedShipmentStatusModel> statusModels = state.model;
      return AcceptedShipmentStatusMeasured(
        statusModel: statusModels,
        containers:state.containers,
        travels: state.travels,
        onChangeStatus: (request , isSeperate,containers ,travels){
          CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            confirmBtnText: S.of(context).ok,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            onConfirmBtnTap: (){
              Navigator.pop(context);
              widget._stateManager.storedShipment(request,isSeperate,containers ,travels);
            },
            text: S.of(context).changeStatusConfirm,
          );
        },
        // onChangeStatus: (re , containerFilterRequest){
        // },
      );
    }
    // else if(currentState is SuccessfullyModifyState){
    //   SuccessfullyModifyState state = currentState as SuccessfullyModifyState;
    //   if(state.response.isConfirmed){
    //     Fluttertoast.showToast(msg: 'The operation was completed successfully');
    //     Navigator.pop(context);
    //     return Container();
    //   }else{
    //     Fluttertoast.showToast(msg: 'some thing wrong');
    //     return WaitingShipmentDetailsInit(shipment: shipmentModel,
    //       onAccepted: (request) {
    //         widget._stateManager.acceptedOrRejectedShipment(request);
    //       },
    //       onRejected: (request) {
    //         widget._stateManager.acceptedOrRejectedShipment(request);
    //       },
    //     );
    //   }
    // }
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
}
