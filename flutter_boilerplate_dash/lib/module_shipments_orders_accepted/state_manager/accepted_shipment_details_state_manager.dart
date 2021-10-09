import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/create_invoice_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/service/invoice_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/accepted_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_details_state/accepted_shipment_details_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AcceptedShipmentsDetailsStateManager {
  final AcceptedShipmentService _service;
  final InvoiceService _invoiceService;

  final PublishSubject<AcceptedShipmentDetailsState> _stateSubject = PublishSubject();
  Stream<AcceptedShipmentDetailsState> get stateStream => _stateSubject.stream;

  AcceptedShipmentsDetailsStateManager(this._service, this._invoiceService,);

  void getDetailsShipment(String id) {
    _stateSubject.add(LoadingState());
    _service.getShipmentDetails(id).then((value) {
      if (value != null) {
        _stateSubject.add(initDetailsState(value));
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }

  void createInvoice(CreateInvoiceRequest request , AcceptedShipmentDetailsModel model){
    _stateSubject.add(LoadingState());
    _invoiceService.createInvoice(request).then((value) {
      if (value != null && value.isConfirmed) {
        _stateSubject.add(initDetailsState(model));
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });

  }
}