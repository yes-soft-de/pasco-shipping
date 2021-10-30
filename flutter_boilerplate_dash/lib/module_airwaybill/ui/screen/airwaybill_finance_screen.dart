import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/state_manger/airwaybill_finance_state_manager.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/airwaybill_finance_state/airwatbill_finance_state.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/airwaybill_finance_state/airwaybill_finance_successfully.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';



@injectable
class AirwaybillFinanceScreen extends StatefulWidget {
  final AirwaybillFinanceStateManager _stateManager;

  AirwaybillFinanceScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AirwaybillFinanceScreen> {
  late FinanceAirwaybillState currentState;
  late List<SubcontractModel> subs;
  late List<ProxyModel> proxies;
  late int id;
  late String type;

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
                child:  Screen()),
          ),
        ),
        title: S.of(context).airwaybillFinance
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    id =arguments['id'];
    type =arguments['type'];
    AirwaybillFilterFinanceRequest request = AirwaybillFilterFinanceRequest(id: id);
    if(type =='LCL') {
      widget._stateManager.getAirwaybillLCLFinance(request);
    }else {
      widget._stateManager.getAirwaybillFCLFinance(request);
    }
  }

  @override
  void initState() {
    super.initState();
    subs=[];
    proxies=[];
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
    else if (currentState is SuccessfullyFetchState) {
      SuccessfullyFetchState state = currentState as SuccessfullyFetchState;
      subs = state.subcontracts;
      proxies = state.proxies;
      return AirwaybillFinanceSuccessfullyScreen(
     airwaybillID: id,
     type: type,
     subContracts: subs,
     proxies: proxies,
     airwaybillFinances: state.finances,
     addFinance: (request){
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
           if(type=='LCL') {
             widget._stateManager.createAirwaybillLCLFinance(request,subs,proxies);
           }else{
             widget._stateManager.createAirwaybillFCLFinance(request,subs,proxies);
           }
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
