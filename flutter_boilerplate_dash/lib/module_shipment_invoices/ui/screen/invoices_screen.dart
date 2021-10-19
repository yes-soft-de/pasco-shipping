import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_general/ui/screen/connection_error_screen.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/invoice_filter_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/pay_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';
import 'package:pasco_shipping/module_shipment_invoices/state_manager/invoice_state_manger.dart';
import 'package:pasco_shipping/module_shipment_invoices/ui/state/invoice_shipment_state/invoice_shipment_state.dart';
import 'package:pasco_shipping/module_shipment_invoices/ui/state/invoice_shipment_state/invoice_shipments_successfully.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';

import '../../invoice_shipment_routes.dart';

@injectable
class InvoicesScreen extends StatefulWidget {
  final InvoicesStateManager _stateManager;

  InvoicesScreen(this._stateManager);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<InvoicesScreen> {
  late InvoiceShipmentsState currentState;
  late List<InvoiceModel> items;
  late InvoiceFilterRequest invoiceFilterRequest;
  late bool sameClient;
  @override
  Widget build(BuildContext context) {
    return Background(
        showFilter: false,
        goBack: ()  {
        },
        child: Container(
          width: double.maxFinite,
          child: Center(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: 600
                ),
                child: Screen()),
          ),
        ),
        title: 'Invoices'
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    invoiceFilterRequest = arguments['filterRequest'];
    widget._stateManager.getInvoices(invoiceFilterRequest);

  }

  @override
  void initState() {
    super.initState();
    sameClient = false;
    currentState = LoadingState();
    widget._stateManager.stateStream.listen((event) {
      print("newEvent"+event.toString());
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
    else if (currentState is SuccessfullyFetchState){
      SuccessfullyFetchState? state = currentState as SuccessfullyFetchState?;
      items = state!.invoices;
      return InvoiceShipmentSuccessfully(items: items, addAttached: (model){
        Navigator.pushNamed(context, InvoiceShipmentRoutes.UPDATE_DOC ,arguments: {'model':model}).then((value) {
          widget._stateManager.getInvoices(invoiceFilterRequest);
        });
      }, payBill: (model){
        PayBillRequest request =PayBillRequest(id: model.id,paidOnBehalfBy: '');
        showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                        title: Text('Pay bill'),
                        content: SingleChildScrollView(
                          child: Container(
                            width: double.maxFinite,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Payed By Same Client' ,style: AppTextStyle.mediumBlack,),
                                    Checkbox(onChanged: (bool? value) {
                                      setState(() {
                                        sameClient = value!;
                                      });
                                    }, value: sameClient,
                                    ),
                                  ],
                                ),
                                Center(child: Text('OR',style: AppTextStyle.mediumBlackBold,)),
                                TextEdit(title: '', hint:'Paid On Behalf By', onChange: (notes) {
                                  request.paidOnBehalfBy = notes;
                                }),

                                RoundedButton(lable: 'Pay',
                                    icon: '',
                                    color: blue,
                                    style: AppTextStyle.mediumWhite,
                                    go: () {
                                  request.paymentStatus='paid';
                                  request.paymentDate = DateTime.now().toUtc().toString();
                                  if(request.paidOnBehalfBy.isEmpty){
                                    request.paidBy=int.parse(model.clientUserID);
                                  }
                                  Navigator.pop(context);
                                  _showConfrim(request);
                                    },
                                    radius: 12)
                              ],
                            ),
                          ),
                        ));
                  });
            });
      }, onSearch: (shipmentID){
        invoiceFilterRequest.shipmentID = int.parse(shipmentID);
        widget._stateManager.getInvoices(invoiceFilterRequest);
      } ,
      );
    }
    else if(currentState is ErrorState) {
      ErrorState? state = currentState as ErrorState?;
      bool   empty = state!.isEmptyData;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ErrorScreen(retry: (){},error: state.error,isEmptyData: empty,),
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

  _showConfrim(PayBillRequest request){
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
        widget._stateManager.payBill(request, invoiceFilterRequest);
      },
      text: 'Do you really want to pay the bill',
    );
  }
}