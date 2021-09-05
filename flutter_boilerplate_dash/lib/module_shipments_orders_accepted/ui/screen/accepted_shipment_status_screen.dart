import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_container/enums/container_status.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_measured_airwaybill.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_measured_container.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_received.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_state.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
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
  late bool isExternalWarehouse;
 late  ContainerFilterRequest containerFilterRequest;
 late  AirwaybillFilterRequest airwaybillFilterRequest;
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
    int shipmentID =arguments['id'];
    String cityName =arguments['cityName'].toString();
    String holderType =arguments['holderType'].toString();
    String status =arguments['status'].toString();
    String trackNumber =arguments['trackNumber'].toString();
    transportation =arguments['transportation'].toString();
    isExternalWarehouse =arguments['isExternalWarehouse'];

    if(isExternalWarehouse){
      containerFilterRequest =ContainerFilterRequest(status:ContainerStatusName[ContainerStatus.FULL] ,type: 'FCL',isExternalWarehouse: true,shipmentID: shipmentID);
      airwaybillFilterRequest =AirwaybillFilterRequest(status:ContainerStatusName[ContainerStatus.FULL] ,type: 'FCL',isExternalWarehouse: true,shipmentID: shipmentID);
    }else{
      containerFilterRequest =ContainerFilterRequest(status:ContainerStatusName[ContainerStatus.NOTFULL] ,type: holderType,isExternalWarehouse: false);
      airwaybillFilterRequest =AirwaybillFilterRequest(status:ContainerStatusName[ContainerStatus.NOTFULL] ,type: holderType,isExternalWarehouse: false);
    }

    TravelFilterRequest travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT] ,type:transportation=='sea' ?'cruise':'flight');
    if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!) {
      widget._stateManager.getShipmentStatus(id,trackNumber);
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]!){
      widget._stateManager.getReceivedStatus(id,cityName,trackNumber);
    }

    else if (status == AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]! && transportation=='sea'){
      widget._stateManager.getMeasuredContainerStatus(id,containerFilterRequest,trackNumber,travelFilterRequest);
    }else if (status == AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]! && transportation=='air'){
      widget._stateManager.getMeasuredAirwaybillStatus(id,airwaybillFilterRequest,trackNumber,travelFilterRequest);
    }

    else {
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
          widget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Scrollbar(
              isAlwaysShown: true,
              showTrackOnHover: true,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(S.of(context).reviewInformation , style: AppTextStyle.mediumRedBold,),
                        Row(
                          children: [
                            Text(S.of(context).details + ': ' , style: AppTextStyle.mediumBlackBold,),
                            Expanded
                              (child: Text( re.statusDetails , style: AppTextStyle.mediumBlack,))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
        onChangeStatus: (re , holderFilterRequest ,travelFilterRequest){
          CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            widget: Container(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Scrollbar(
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(S.of(context).reviewInformation , style: AppTextStyle.mediumRedBold,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).details + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( re.statusDetails , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).packingBy + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( re.packetingBy , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).weight + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( re.weight.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).volume + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( re.volume.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).guniQuantity + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( re.guniQuantity.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            confirmBtnText: S.of(context).ok,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            onConfirmBtnTap: (){
              Navigator.pop(context);
              if(transportation =='sea'){
                widget._stateManager.measuredContainerShipment(re, holderFilterRequest,travelFilterRequest);
              }else{
                widget._stateManager.measuredAirwaybillShipment(re, holderFilterRequest,travelFilterRequest);
              }
            },
            text: S.of(context).changeStatusConfirm,
          );
      },
      );
    }
    else if (currentState is MeasuredContainerStatusState) {
      MeasuredContainerStatusState state = currentState as MeasuredContainerStatusState;
      List<AcceptedShipmentStatusModel> statusModels = state.model;
      return AcceptedShipmentStatusMeasuredContainer(
        statusModel: statusModels,
        containers:state.containers,
        travels: state.travels,
        onChangeStatus: (request , isSeperate,containers ,travels){
          CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            widget: Container(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Scrollbar(
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(S.of(context).reviewInformation , style: AppTextStyle.mediumRedBold,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).details + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( request.statusDetails , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).travelNumber + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( request.travelNumber , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).containerNumber + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( request.holderNumber.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).amount + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(request.amount.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).shipmentSeparation + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(isSeperate.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            confirmBtnText: S.of(context).ok,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            onConfirmBtnTap: (){
              Navigator.pop(context);
              widget._stateManager.storedContainerShipment(request,isSeperate,containers ,travels);
            },
            text: S.of(context).changeStatusConfirm,
          );
        },
        // onChangeStatus: (re , containerFilterRequest){
        // },
      );
    }


    else if (currentState is MeasuredAirwaybillStatusState) {
      MeasuredAirwaybillStatusState state = currentState as MeasuredAirwaybillStatusState;
      List<AcceptedShipmentStatusModel> statusModels = state.model;
      return AcceptedShipmentStatusMeasuredAirwaybill(
        statusModel: statusModels,
        containers:state.airwaybills,
        travels: state.travels,
        onChangeStatus: (request , isSeperate,containers ,travels){
          CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            title:  S.of(context).careful,
            widget: Container(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Scrollbar(
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(S.of(context).reviewInformation , style: AppTextStyle.mediumRedBold,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).details + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( request.statusDetails , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).travelNumber + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( request.travelNumber , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).containerNumber + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text( request.holderNumber.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).amount + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(request.amount.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).shipmentSeparation + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(isSeperate.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            confirmBtnText: S.of(context).ok,
            backgroundColor:AppThemeDataService.PrimaryColor,
            confirmBtnColor:AppThemeDataService.AccentColor,
            onConfirmBtnTap: (){
              Navigator.pop(context);
              widget._stateManager.storedAirwaybillShipment(request,isSeperate,containers ,travels);
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
