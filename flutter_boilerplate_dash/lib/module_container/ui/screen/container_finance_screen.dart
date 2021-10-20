import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/state_manger/conatiner_finance_state_manager.dart';
import 'package:pasco_shipping/module_container/ui/state/container_finance_state/container_finance_state.dart';
import 'package:pasco_shipping/module_container/ui/state/container_finance_state/container_finance_successfully.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';



@injectable
class ContainerFinanceScreen extends StatefulWidget {
  final ContainerFinanceStateManager _stateManager;

  ContainerFinanceScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ContainerFinanceScreen> {
  late FinanceContainerState currentState;
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
        child: Screen(),
        title: S.of(context).containerFinance
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
     id =arguments['id'];
     type =arguments['type'];
     ContainerFilterFinanceRequest request = ContainerFilterFinanceRequest(id: id);
    if(type =='LCL') {
      widget._stateManager.getContainerLCLFinance(request);
    }else {
      widget._stateManager.getContainerFCLFinance(request);
    }
  }

  @override
  void initState() {
    super.initState();
    subs =[];
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
      return ContainerFinanceSuccessfullyScreen(
     containerID: id,
     containerFinances: state.finances,
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
             widget._stateManager.createContainerLCLFinance(request,subs,proxies);
           }else{
             widget._stateManager.createContainerFCLFinance(request,subs,proxies);
           }
         },
         text: S.of(context).addCostConfirm,
       );

     }, subContracts: subs,
        type: type, proxies:proxies,
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
