
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';

class UpdateInvoiceState{}

class InitUpdateState extends UpdateInvoiceState{
  InitUpdateState();
}
class LoadingUpdateState extends UpdateInvoiceState{}

class SuccessfullyAddState extends UpdateInvoiceState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends UpdateInvoiceState{
  String error;

  ErrorAddState(this.error);
}