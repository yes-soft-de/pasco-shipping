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

  void upp(AddShipmentRequest request) {
    print("End for");
    _editShipmentService.addNewShipment(request).then((model) {
      if(model.isConfirmed){
        _stateSubject.add(ConfirmedState(model));
      }else{

      }
    });
  }
  void addShipment(AddShipmentRequest request) async{
    List<String> images = <String>[];
    _stateSubject.add(LoadingState());
    if(request.imageFilePath != null  && request.imageFilePath!.isNotEmpty){
      for (String imagePath in request.imageFilePath!) {
        print("INfOR");
        await _uploadService.uploadImage(imagePath).then((value) {
          if (value != null) {
            print("IMAGEURL" + value);
            images.add(value);
          }
        });
      }
  }
    request.imageFilePath = images;
    upp(request);
  }
}