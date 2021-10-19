import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/attached_doc_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/create_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/invoice_filter_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/pay_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/response/invoice_response.dart';

@injectable
class InvoiceRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  InvoiceRepository(this._apiClient, this._authService);

  Future<List<InvoiceModel>?> getInvoices(InvoiceFilterRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_SHIPMENT_INVOICES,request.toJson()
        ,  headers: {'Authorization': 'Bearer $token'});
      InvoiceResponse invoiceResponse =  InvoiceResponse.fromJson(response!);
      List<InvoiceModel>? invoices = [];
      if(invoiceResponse.data != null) {
        invoices =
            InvoiceResponse.fromJson(response).data;
      }
      return invoices;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createInvoice(CreateInvoiceRequest  request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_SHIPMENT_INVOICES, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = InvoiceResponse.fromJson(response!).statusCode;
    String? msg = InvoiceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> attachedDoc(AttachedDocInvoiceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.ADD_SHIPMENT_INVOICES, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = InvoiceResponse.fromJson(response!).statusCode;
    String? msg = InvoiceResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<ConfirmResponse?> payBill(PayBillRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.UPDATE_SHIPMENT_INVOICES, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = InvoiceResponse.fromJson(response!).statusCode;
    String? msg = InvoiceResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

}