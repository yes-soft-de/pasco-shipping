import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipment_invoices/repository/invoice_repository.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/attached_doc_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/create_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/invoice_filter_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/pay_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';

@injectable
class InvoiceShipmentManager{
  final InvoiceRepository _repository;
  InvoiceShipmentManager(this._repository);

  Future<List<InvoiceModel>?> getInvoices(InvoiceFilterRequest request) => _repository.getInvoices(request);
  Future<ConfirmResponse?> createInvoice(CreateInvoiceRequest request) => _repository.createInvoice(request);
  Future<ConfirmResponse?> attachedDoc(AttachedDocInvoiceRequest request) => _repository.attachedDoc(request);
  Future<ConfirmResponse?> payBill(PayBillRequest request) => _repository.payBill(request);

}