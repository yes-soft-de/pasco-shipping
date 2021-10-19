import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/state_manager/review_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/review_shipment/review_init.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/review_shipment_request.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class RequestShipmentReview extends StatefulWidget {
  final ReviewShipmentStateManger _stateManger;
  RequestShipmentReview(this._stateManger);

  @override
  _ContainerShipmentReviewState createState() => _ContainerShipmentReviewState();
}

class _ContainerShipmentReviewState extends State<RequestShipmentReview> {
  late ReviewRequestShipmentState currentState;
  late ShipmentRequest shipment;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: (){
        },
        child: Screen(),
        title: S.of(context).shipmentReview
    );
  }



  @override
  void initState() {
    super.initState();
    currentState = RequestShipmentInitState();
    widget._stateManger.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        if(currentState is SuccessfullyAddedShipment){
       Fluttertoast.showToast(msg: S.of(context).shipmentAddSuccessfully);
        Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.controller, (route) => false);
        }else {
          setState(() {});
        }
      }
    });
    // widget._stateManger.();
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
    else if (currentState is RequestShipmentInitState){
      // SuccessfullyFetchState? state = currentState as SuccessfullyFetchState?;
      // items = state!.proxies;
      return RequestShipmentReviewInit(shipment,(request){
        widget._stateManger.addShipment(request);
      });
    }
    if(currentState is SuccessfullyAddedShipment){
      return Container();
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
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: 'error',isEmptyData: false,),
          ],
        ),
      );
    }
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    shipment = ModalRoute.of(context)!.settings.arguments as ShipmentRequest;
  }
  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      // title: S.of(context).success,
      backgroundColor:AppThemeDataService.PrimaryColor,
      confirmBtnColor:AppThemeDataService.AccentColor,
      onConfirmBtnTap: (){
        Navigator.pushNamedAndRemoveUntil(
            context,
            HomeRoutes.Home,
                (route) => false);
      },
      text: S.of(context).addedSuccessfully,
    );
  }
}
