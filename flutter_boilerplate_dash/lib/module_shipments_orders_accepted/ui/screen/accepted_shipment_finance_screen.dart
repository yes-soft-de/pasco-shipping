import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_finance_state/shipemnt_finance_successfully.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_finance_state/shipment_finance_state.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class AcceptedShipmentFinanceScreen extends StatefulWidget {
  final AcceptedShipmentsFinanceStateManager _stateManager;

  AcceptedShipmentFinanceScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AcceptedShipmentFinanceScreen> {
  late FinanceShipmentsState currentState;
  late List<ShipmentFinanceModel> finances;
  late List<SubcontractModel> subcontracts;
  late List<ProxyModel> proxies;

  late String trackNumber;
  late String paymentWay;
  late int id;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Screen(),
        title: S.of(context).shipmentFinance
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
     id =arguments['id'];
     trackNumber =arguments['trackNumber'].toString();
    paymentWay =arguments['paymentWay'];
    ShipmentLCLFilterFinanceRequest request = ShipmentLCLFilterFinanceRequest(shipmentID: id,trackNumber: trackNumber);
    widget._stateManager.getShipmentLCLFinance(request);
  }

  @override
  void initState() {
    super.initState();
    currentState = LoadingState();
    subcontracts =[];
    proxies =[];
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
    else if (currentState is SuccessfullyFetchState) {
      SuccessfullyFetchState state = currentState as SuccessfullyFetchState;
      subcontracts = state.subcontracts;
      proxies = state.proxies;
      return ShipmentFinanceSuccessfullyScreen(
        trackNumber:trackNumber ,
     shipmentID: id,
     paymentWay: paymentWay,
     shipmentFinance: state.finances,
     subContracts: subcontracts,
     proxies: proxies,
     addFinance: (request){
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
           widget._stateManager.addShipmentFinance(request,subcontracts ,proxies);
         },
         text: S.of(context).addCostConfirm,
       );
     },
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
