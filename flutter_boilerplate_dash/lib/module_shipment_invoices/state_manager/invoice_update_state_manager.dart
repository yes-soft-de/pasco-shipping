import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_invoices/request/attached_doc_request.dart';
import 'package:pasco_shipping/module_shipment_invoices/service/invoice_service.dart';
import 'package:pasco_shipping/module_shipment_invoices/ui/state/update_invoice_state/update_state.dart';
import 'package:pasco_shipping/module_upload/service/image_upload/image_upload_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class UpdateInvoicesStateManager {
  final InvoiceService _service;
  final ImageUploadService _uploadService;

  final PublishSubject<UpdateInvoiceState> _stateSubject = PublishSubject();
  Stream<UpdateInvoiceState> get stateStream => _stateSubject.stream;

  UpdateInvoicesStateManager(this._service, this._uploadService);

  void updateAttachedFile(AttachedDocInvoiceRequest request) async {
    _stateSubject.add(LoadingUpdateState());
    await _uploadService.uploadImage(request.invoiceImage).then((value) {
      if (value != null) {
        print("IMAGEURL" + value);
       request.invoiceImage= value;
        _uploadService.uploadImage(request.receiptImage).then((value) {
          if (value != null) {
            print("IMAGEURL" + value);
            request.receiptImage= value;
            attachedFile(request);
          }
        });
      }
    });
  }
  void attachedFile(AttachedDocInvoiceRequest request){
    _service.attachedDoc(request).then((value) {
      print(value);
      if (value != null ) {
        _stateSubject.add(SuccessfullyAddState(value));
      }else {
        _stateSubject.add(ErrorAddState('Error'));
      }
    });
  }
}