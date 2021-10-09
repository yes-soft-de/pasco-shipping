import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/invoice_filter_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/pay_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/service/invoice_service.dart';
import 'package:pasco_shipping/module_shipment_invoices/ui/state/invoice_shipment_state/invoice_shipment_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class InvoicesStateManager {
  final InvoiceService _service;

  final PublishSubject<InvoiceShipmentsState> _stateSubject = PublishSubject();
  Stream<InvoiceShipmentsState> get stateStream => _stateSubject.stream;

  InvoicesStateManager(this._service);

  void getInvoices(InvoiceFilterRequest type) {
    _stateSubject.add(LoadingState());
    _service.getInvoices(type).then((value) {
      print(value);
      if (value != null ) {
        _stateSubject.add(SuccessfullyFetchState(value));
      }else {
        _stateSubject.add(ErrorState('Error' , false));
      }
    });
  }

  void payBill(PayBillRequest request,InvoiceFilterRequest filterRequest){
    _stateSubject.add(LoadingState());
    _service.payBill(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getInvoices(filterRequest).then((invoices) {
            print(value);
            if (invoices != null ) {
              _stateSubject.add(SuccessfullyFetchState(invoices));
            }else {
              _stateSubject.add(ErrorState('Error' , false));
            }
          });
        }
      }
    });
  }
}