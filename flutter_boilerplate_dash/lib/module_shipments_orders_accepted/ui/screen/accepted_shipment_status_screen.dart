import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/airwaybill_routes.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_container/container_routes.dart';
import 'package:pasco_shipping/module_container/enums/container_status.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_gunny/response/stored_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
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

  late String id;
  late String trackNumber;
  late TravelFilterRequest travelFilterRequest;

  late String transportation;
  late String quantity;
  late bool isExternalWarehouse;
 late  ContainerFilterRequest containerFilterRequest;
 late  AirwaybillFilterRequest airwaybillFilterRequest;
 late bool updated;
 late String holderType;
 late String cityName;

 late Entry optionItemSelectedContainer;
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
     id =arguments['id'].toString();
    int shipmentID =arguments['id'];
    int clientUserID =arguments['clientUserID'];
    cityName =arguments['cityName'].toString();
    holderType =arguments['holderType'].toString();
    String status =arguments['status'].toString();
     trackNumber =arguments['trackNumber'].toString();
    quantity =arguments['quantity'].toString();
    transportation =arguments['transportation'].toString();
    isExternalWarehouse =arguments['isExternalWarehouse'];

    if(holderType=='FCL'){
      containerFilterRequest =ContainerFilterRequest(status:ContainerStatusName[ContainerStatus.NOTFULL] ,type: 'FCL',isExternalWarehouse: isExternalWarehouse,clientUserID: clientUserID);
      airwaybillFilterRequest =AirwaybillFilterRequest(status:ContainerStatusName[ContainerStatus.NOTFULL] ,type: 'FCL',isExternalWarehouse: isExternalWarehouse,clientUserID: clientUserID);
    }else{
      containerFilterRequest =ContainerFilterRequest(status:ContainerStatusName[ContainerStatus.NOTFULL] ,type: holderType,isExternalWarehouse: isExternalWarehouse);
      airwaybillFilterRequest =AirwaybillFilterRequest(status:ContainerStatusName[ContainerStatus.NOTFULL] ,type: holderType,isExternalWarehouse: isExternalWarehouse);
    }

     travelFilterRequest =TravelFilterRequest(status:TravelStatusName[TravelStatus.CURRENT]??'' ,type:transportation=='sea' ?'cruise':'flight');
    if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!) {
      widget._stateManager.getShipmentStatus(id,trackNumber);
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]! && !(holderType =='FCL' && isExternalWarehouse)){
      widget._stateManager.getReceivedStatus(id,cityName,trackNumber);
    }

    else if (status == AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]! && transportation=='sea' ||(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]! && holderType =='FCL' && isExternalWarehouse && transportation=='sea') ){
      widget._stateManager.getMeasuredContainerStatus(id,containerFilterRequest,trackNumber,travelFilterRequest,cityName);
    }else if (status == AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]! && transportation=='air' || status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]! && holderType =='FCL' && isExternalWarehouse&& transportation=='air'){
      widget._stateManager.getMeasuredAirwaybillStatus(id,airwaybillFilterRequest,trackNumber,travelFilterRequest,cityName);
    }

    else {
      widget._stateManager.getShipmentStatus(id,trackNumber);
    }
  }

  @override
  void initState() {
    super.initState();
    optionItemSelectedContainer = Entry('', 0, []);
    updated = false;
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
      statusModel: statusModels, onReceived: (re , cityName){
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
                              (child: Text( re.notes , style: AppTextStyle.mediumBlack,))
                          ],
                        ),
                        Row(
                          children: [
                            Text('Received Quantity' + ': ' , style: AppTextStyle.mediumBlackBold,),
                            Expanded
                              (child: Text( re.receivedQuantity.toString() , style: AppTextStyle.mediumBlack,))
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
            if(holderType == 'FCL' && isExternalWarehouse && transportation=='sea'){
              widget._stateManager.receivedSeaShipmentFCLExternal(re, containerFilterRequest, travelFilterRequest,cityName);
            }else if(holderType == 'FCL' && isExternalWarehouse && transportation=='air'){
              widget._stateManager.receivedAirShipmentFCLExternal(re, airwaybillFilterRequest, travelFilterRequest,cityName);
            }
            else {
              widget._stateManager.receivedLocalWarehouse(re,cityName);
            }
          },
          text: S.of(context).changeStatusConfirm,
        );
      },
        onDelivered: (req){
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
                                (child: Text(req.statusDetails , style: AppTextStyle.mediumBlack,))
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
                widget._stateManager.deliveredShipment(req);
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
      print(state.gunnies.length);
      return AcceptedShipmentStatusReceived(
        statusModel: statusModels,
        subcontracts:state.subContracts ,
        lastGunnies: state.lastGunnies,
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
                widget._stateManager.measuredContainerShipment(re, holderFilterRequest,travelFilterRequest,cityName);
              }else{
                widget._stateManager.measuredAirwaybillShipment(re, holderFilterRequest,travelFilterRequest,cityName);
              }
            },
            text: S.of(context).changeStatusConfirm,
          );
      },
        createGunny: (){
          widget._stateManager.createGunny(statusModels,state.subContracts,state.lastGunnies);
        }, infoStoredInGunny: state.storedModelInfo, onStoredInGunny: (m){
          widget._stateManager.storedShipmentInGunny(m,statusModels,state.subContracts);
      }, gunnies: state.gunnies,
      );
    }
    else if (currentState is ReceivedStatusWithGunniesState) {
      ReceivedStatusWithGunniesState state = currentState as ReceivedStatusWithGunniesState;
      List<AcceptedShipmentStatusModel> statusModels = state.model;
      print(state.gunnies.length);
      Future.delayed(Duration.zero, () => _showAlert(context,state.gunnies.first.identificationNumber??''));
      return AcceptedShipmentStatusReceived(
        statusModel: statusModels,
        subcontracts:state.subContracts ,
        lastGunnies: state.lastGunnies,
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
                widget._stateManager.measuredContainerShipment(re, holderFilterRequest,travelFilterRequest,cityName);
              }else{
                widget._stateManager.measuredAirwaybillShipment(re, holderFilterRequest,travelFilterRequest,cityName);
              }
            },
            text: S.of(context).changeStatusConfirm,
          );
        },
        createGunny: (){
          widget._stateManager.createGunny(statusModels,state.subContracts,state.lastGunnies);
        }, infoStoredInGunny: state.storedModelInfo, onStoredInGunny: (m){
        widget._stateManager.storedShipmentInGunny(m,statusModels,state.subContracts);
      }, gunnies: state.gunnies,
      );
    }
    else if (currentState is MeasuredContainerStatusState) {
      MeasuredContainerStatusState state = currentState as MeasuredContainerStatusState;
      List<AcceptedShipmentStatusModel> statusModels = state.model;
      return AcceptedShipmentStatusMeasuredContainer(
        statusModel: statusModels,
        containers:state.containers,
        travels: state.travels,
        warehouse: state.warehouse,
        onChangeStatus: (request , isSeperate){
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
                                    (child: Text(updated? optionItemSelectedContainer.title: request.holderNumber.toString(), style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).amount + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(request.amount == 0?quantity:request.amount.toString(), style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).shipmentSeparation + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(isSeperate?S.of(context).yes:S.of(context).no , style: AppTextStyle.mediumBlack,))
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
              widget._stateManager.storedContainerShipment(request,isSeperate,state.containers ,state.travels,state.warehouse,isExternalWarehouse);
            },
            text: S.of(context).changeStatusConfirm,
          );
        },
        onUpdateContainerInfo: (containerModel){
          Navigator.pushNamed(context, ContainerRoutes.UPDATE,arguments: {'containerModel':containerModel}).then((value) {
            if(value != null){
              updated = true;
              optionItemSelectedContainer = value as Entry;
              print(optionItemSelectedContainer.title);
            }
            widget._stateManager.getMeasuredContainerStatus(id,containerFilterRequest,trackNumber,travelFilterRequest,cityName);
          });
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
        onChangeStatus: (request , isSeperate){
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
                                  Text(S.of(context).airwaybillNumber + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(updated ? optionItemSelectedContainer.title: request.holderNumber.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).amount + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(request.amount == 0?quantity:request.amount.toString() , style: AppTextStyle.mediumBlack,))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(S.of(context).shipmentSeparation + ': ' , style: AppTextStyle.mediumBlackBold,),
                                  Expanded
                                    (child: Text(isSeperate?S.of(context).yes:S.of(context).no , style: AppTextStyle.mediumBlack,))
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
              widget._stateManager.storedAirwaybillShipment(request,isSeperate,state.airwaybills ,state.travels,state.warehouse,isExternalWarehouse);
            },
            text: S.of(context).changeStatusConfirm,
          );
        },
        onUpdateAirwaybillInfo: (model){
          Navigator.pushNamed(context, AirwaybillRoutes.UPDATE,arguments: {'airwaybillModel':model}).then((value) {
            if(value != null){
              updated = true;
              optionItemSelectedContainer = value as Entry;
              print(optionItemSelectedContainer.title);
            }
            widget._stateManager.getMeasuredAirwaybillStatus(id,airwaybillFilterRequest,trackNumber,travelFilterRequest,cityName);
          });
        }, warehouse: state.warehouse,
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

  _showAlert(BuildContext context,String gunnyNumber){
    return CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title:  S.of(context).success,
      confirmBtnText: S.of(context).ok,
      backgroundColor:AppThemeDataService.PrimaryColor,
      text: 'Successfully added gunny number: '+gunnyNumber
    );
  }
}
