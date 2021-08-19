import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_finance_request.dart';
import 'package:pasco_shipping/module_travel/state_manger/travel_finance_state_manager.dart';
import 'package:pasco_shipping/module_travel/ui/state/travel_finance_state/travel_finance_state.dart';
import 'package:pasco_shipping/module_travel/ui/state/travel_finance_state/travel_finance_successfully.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';



@injectable
class TravelFinanceScreen extends StatefulWidget {
  final TravelFinanceStateManager _stateManager;

  TravelFinanceScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<TravelFinanceScreen> {
  late FinanceTravelState currentState;

  late int id;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Screen(),
        title: 'Travel Finance'
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
     id =arguments['id'];
     TravelFilterFinanceRequest request = TravelFilterFinanceRequest(id: id);
    widget._stateManager.getTravelFinance(request);
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
    else if (currentState is SuccessfullyFetchState) {
      SuccessfullyFetchState state = currentState as SuccessfullyFetchState;
      return TravelFinanceSuccessfullyScreen(
     travelID: id,
     travelFinances: state.finances,
     addFinance: (request){
          widget._stateManager.addTravelFinance(request);
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
