import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_details_state/accepted_shipment_details_state.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_details_state/accepted_shipment_details_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

import '../../accepted_shipment_routes.dart';

@injectable
class AcceptedShipmentDetailsScreen extends StatefulWidget {
  final AcceptedShipmentsDetailsStateManager _stateManager;

  AcceptedShipmentDetailsScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<AcceptedShipmentDetailsScreen> {
  late AcceptedShipmentDetailsState currentState;

  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Screen(),
        title: S.of(context).details
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String id =arguments['id'].toString();
    widget._stateManager.getDetailsShipment(id);
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
    else if (currentState is initDetailsState) {
      initDetailsState state = currentState as initDetailsState;
      AcceptedShipmentDetailsModel detailsModel = state.model;
      // List<ContainerModel> containers = state.containers;
      return AcceptedShipmentDetailsSuccessfully(
     shipment: detailsModel, onShowStatus: (id , trackNumber, cityName,holderType,status , transportationType){
          Navigator.pushNamed(context,AcceptedShipmentRoutes.STATUS , arguments: {'id' : id ,'trackNumber': trackNumber ,'cityName':cityName , 'holderType':holderType,'status':status , 'transportation':transportationType} ).then((value){
            widget._stateManager.getDetailsShipment(id.toString());
          });
      }, onShowFinance: (id , trackNumber){
        Navigator.pushNamed(context,AcceptedShipmentRoutes.FINANCE , arguments: {'id' : id ,'trackNumber': trackNumber} ).then((value){
          widget._stateManager.getDetailsShipment(id.toString());
        });
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
