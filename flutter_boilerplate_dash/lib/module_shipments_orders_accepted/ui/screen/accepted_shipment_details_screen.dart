import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shifting_shipment/shifting_routes.dart';
import 'package:pasco_shipping/module_shipment_invoices/invoice_shipment_routes.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/create_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/invoice_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_details_state/accepted_shipment_details_state.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_details_state/accepted_shipment_details_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';

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

        child:Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child:  Screen()),
          ),
        ),
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
     shipment: detailsModel, onShowStatus: (id , trackNumber, cityName,holderType,status , transportationType,isExternalWarehouse,clientUserID,remainedQuantity){
          Navigator.pushNamed(context,AcceptedShipmentRoutes.STATUS , arguments: {'id' : id ,'trackNumber': trackNumber ,'cityName':cityName , 'holderType':holderType,'status':status , 'transportation':transportationType,'isExternalWarehouse':isExternalWarehouse,'clientUserID':clientUserID , 'quantity':detailsModel.quantity,'remainedQuantity':remainedQuantity} ).then((value){
            widget._stateManager.getDetailsShipment(id.toString());
          });
      }, onShowFinance: (id , trackNumber,holderType){
        Navigator.pushNamed(context,AcceptedShipmentRoutes.FINANCE , arguments: {'id' : id ,'trackNumber': trackNumber,'holderType':holderType} ).then((value){
          widget._stateManager.getDetailsShipment(id.toString());
        });
      },onRequestShift: (id , trackNumber){
        Navigator.pushNamed(context,ShiftingRoutes.ADD , arguments: {'id' : id ,'trackNumber': trackNumber} ).then((value){
          widget._stateManager.getDetailsShipment(id.toString());
        });
      }, onCreateInvoice: (id){
       CreateInvoiceRequest request =  CreateInvoiceRequest(shipmentID: id);
       showDialog(
           context: context,
           builder: (context) {
             return StatefulBuilder(
                 builder: (context, setState) {
                   return AlertDialog(
                       title: Text('Create Invoice'),
                       content: SingleChildScrollView(
                         child: Container(
                           width: double.maxFinite,
                           child: Column(
                             children: [
                               TextEdit(title: '', hint: S
                                   .of(context)
                                   .importantNote, onChange: (notes) {
                                 request.notes = notes;
                               }),
                               TextEdit(title: '', hint: 'Discount', onChange: (notes) {
                                 request.discount = int.parse(notes);
                               }),
                               RoundedButton(lable: S
                                   .of(context)
                                   .save,
                                   icon: '',
                                   color: blue,
                                   style: AppTextStyle.mediumWhite,
                                   go: () {
                                 Navigator.pop(context);
                                 _showConfirm(request,detailsModel);
                                   },
                                   radius: 12)
                             ],
                           ),
                         ),
                       ));
                 });
           });
      },onShowInvoice: (id){
        InvoiceFilterRequest request =InvoiceFilterRequest(shipmentID: id);
       Navigator.pushNamed(context, InvoiceShipmentRoutes.VIEW_ALL,arguments: {'filterRequest' : request});
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
  _showConfirm(request,detailsModel){
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
        widget._stateManager.createInvoice(request, detailsModel);
      },
      text: 'Do you really want to create the bill',
    );
  }
}
