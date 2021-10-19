import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipment_invoices/manager/invoice_manager.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/attached_doc_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/create_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/invoice_filter_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/pay_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';

@injectable
class InvoiceService{
  InvoiceShipmentManager _manager;
  InvoiceService(this._manager);

  Future<List<InvoiceModel>?> getInvoices(InvoiceFilterRequest type) {
    return _manager.getInvoices(type);
  }
  Future<ConfirmResponse?> createInvoice(CreateInvoiceRequest request) {
    return _manager.createInvoice(request);
  }
  Future<ConfirmResponse?> attachedDoc(AttachedDocInvoiceRequest request) {
    return _manager.attachedDoc(request);
  }
  Future<ConfirmResponse?> payBill(PayBillRequest request) {
    return _manager.payBill(request);
  }

}