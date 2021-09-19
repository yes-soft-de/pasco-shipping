import 'package:cool_alert/cool_alert.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_edit_shipment/state_manager/edite_shipment_state_manager.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/state/edit_shipment_state.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/state/shipment_edited_init.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_shipment_request/presistance/shipment_prefs_helper.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

@injectable
class EditedShipmentScreen extends StatefulWidget {
  final EditShipmentStateManager _stateManager;
  const EditedShipmentScreen(this._stateManager);
  @override
  _MarkScreenState createState() => _MarkScreenState();
}

class _MarkScreenState extends State<EditedShipmentScreen> {
  late EditShipmentState currentState;
  // ScrollController controller = ScrollController();
 late AcceptedShipmentModel shipmentModel;

  late  List<UnitModel> units;
  late  List<ReceiverModel> receivers;
  late  List<DistributorModel> dists;
  late  List<Mark> marks;
  late  List<ProductModel> products;


  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
      goBack: (){
      },
      // controller: controller,
      // isHome: false,
      child: Screen(),
      title: S.of(context).reviewShipment
      // ,currentIndex: -1,
      // isResultScreen: false,
    );
  }

  @override
  void initState() {
    super.initState();

    currentState = LoadingFirstState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
      currentState = event;
      if (this.mounted) {
        if(currentState is ConfirmedEditedState){
          Navigator.pop(context);
        }else {
          setState(() {});
        }
      }
    });

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    shipmentModel =arguments['shipment'];
    widget._stateManager.getFirstPage(shipmentModel.clientUserID!);
  }

  Widget Screen(){
    if(currentState is LoadingFirstState){
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
    else if(currentState is SuccessfullyFirstState){
      SuccessfullyFirstState? state = currentState as SuccessfullyFirstState?;
      receivers = state!.receivers;
      marks = state.marks;
      return SingleChildScrollView(
        child: ShipmentEditedScreen(
          shipment: shipmentModel,
          dists: [],
          marks: marks,
          receivers: receivers, onLoadingMore: (){
            widget._stateManager.getSecondPage();
        }, onUpdate: (request){
            widget._stateManager.updateShipment(request);
        }, units: [], products: [], isFullOption: false,
        ),
      );
    }
    else if(currentState is LoadingSecondState){
      return SingleChildScrollView(
        child: Column(
          children: [
            ShipmentEditedScreen(
              shipment: shipmentModel,
              dists: [],
              marks: marks,
              receivers: receivers, onLoadingMore: (){
              widget._stateManager.getSecondPage();
            }, onUpdate: (){
            }, units: [], products: [], isFullOption: false,
            ),
            LoadingIndicator(AppThemeDataService.AccentColor),
          ],
        ),
      );
    }
    else if(currentState is SuccessfullySecondState){
      SuccessfullySecondState? state = currentState as SuccessfullySecondState?;
     units = state!.units;
     products = state.categories;
      return SingleChildScrollView(
        child: ShipmentEditedScreen(
          shipment: shipmentModel,
          dists: [],
          marks: marks,
          receivers: receivers, onLoadingMore: (){

        }, onUpdate: (request){
          widget._stateManager.updateShipment(request);
        }, units: units, products: products, isFullOption: true,
        ),
      );
    }
    // else if (currentState is ConfirmedState){
    //   ConfirmedState? state = currentState as ConfirmedState?;
    //   if(state!.response.isConfirmed){
    //     Future.delayed(Duration.zero, () => _showDialog(context));
    //     return Column(
    //       children: [
    //         // SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
    //         // Text('Thanks the shipme'),
    //       ],
    //     );
    //   }else{
    //     return Column(
    //       children: [
    //         SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
    //         ErrorScreen(retry: (){},error: 'error',isEmptyData: false,),
    //       ],
    //     );
    //   }
    // }
    else {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
          ErrorScreen(retry: (){},error: 'error',isEmptyData: false,),
        ],
      );
    }
  }
  //
  void _showDialog(BuildContext context) {
    // flutter defined function
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      // title: S.of(context).success,
      backgroundColor:AppThemeDataService.PrimaryColor,
      confirmBtnColor:AppThemeDataService.AccentColor,
      onConfirmBtnTap: (){
        deleteShipment();
        Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.Home, (route) => false);
      },
      text: 'Your Shipment Added Successfully',
    );
  }
}
