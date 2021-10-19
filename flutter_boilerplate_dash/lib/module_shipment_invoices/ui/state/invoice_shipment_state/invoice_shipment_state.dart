import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';

class InvoiceShipmentsState{}


class LoadingState extends InvoiceShipmentsState{}

class SuccessfullyFetchState extends InvoiceShipmentsState{
  List<InvoiceModel> invoices;

  SuccessfullyFetchState(this.invoices);
}

class ErrorState extends InvoiceShipmentsState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}