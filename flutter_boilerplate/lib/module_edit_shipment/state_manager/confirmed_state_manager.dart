import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_edit_shipment/request/add_shipment_request.dart';
import 'package:pasco_shipping/module_edit_shipment/service/editshipment_service.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/state/confirmedshipment_state.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_upload/service/image_upload/image_upload_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class EditShipmentStateManager {
  final EditShipmentService _editShipmentService;
  final ImageUploadService _uploadService;
  final PublishSubject<ConfirmedShipmentState> _stateSubject = PublishSubject();
  Stream<ConfirmedShipmentState> get stateStream => _stateSubject.stream;

  EditShipmentStateManager(this._editShipmentService , this._uploadService);

  void addShipment(AddShipmentRequest request){
    _stateSubject.add(LoadingState());
    if(request.imageFile == null  || request.imageFile!.isEmpty){
      _editShipmentService.addNewShipment(request).then((model) {
        _stateSubject.add(ConfirmedState(model));
      });
    }else {
      _uploadService
          .uploadImage(request.imageFile!).then((value) {
        if (value != null) {
          request.imageFile = value;
          _editShipmentService.addNewShipment(request).then((model) {
            _stateSubject.add(ConfirmedState(model));
          });
        }else{
          ConfirmResponse response =ConfirmResponse(false, 'error Connation');
          _stateSubject.add(ConfirmedState(response));
        }
      });
    }

  }
}