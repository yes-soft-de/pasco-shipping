import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_distributors/service/distributors_service.dart';
import 'package:pasco_shipping/module_edit_shipment/request/update_shipment_request.dart';
import 'package:pasco_shipping/module_edit_shipment/service/editshipment_service.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/state/edit_shipment_state.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/service/mark_service.dart';
import 'package:pasco_shipping/module_product_category/service/product_service.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_filter_request.dart';
import 'package:pasco_shipping/module_receiver/service/receiver_service.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';
import 'package:pasco_shipping/module_unit/service/unit_service.dart';
import 'package:pasco_shipping/module_upload/service/image_upload/image_upload_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class EditShipmentStateManager {
  final EditShipmentService _editShipmentService;

  final ReceiverService _receiverService;
  final MarkService _markService;

  final ProductService _productService;
  final DistributorService _distributorService;
  final UnitService _unitService;

  final ImageUploadService _uploadService;

  final PublishSubject<EditShipmentState> _stateSubject = PublishSubject();
  Stream<EditShipmentState> get stateStream => _stateSubject.stream;

  EditShipmentStateManager(this._editShipmentService , this._uploadService, this._receiverService, this._markService, this._productService, this._distributorService, this._unitService);

  void getFirstPage(int userID){
    _stateSubject.add(LoadingFirstState());
    ReceiverFilterRequest receiverFilterRequest = ReceiverFilterRequest(userID);
    _receiverService.getUserReceiver(receiverFilterRequest).then((receivers) {
      if(receivers != null){
        _markService.getUserMark(userID.toString()).then((marks) {
          if(marks != null){
            _stateSubject.add(SuccessfullyFirstState(marks: marks ,receivers: receivers));
          }else{
            _stateSubject.add(ErrorState('error'));
          }
        });
      }else{
        _stateSubject.add(ErrorState('error'));
      }
    });

  }
  void getSecondPage(){
    _stateSubject.add(LoadingSecondState());
    _productService.getProduct().then((categories) {
      if(categories != null){
        _unitService.getUnits().then((units) {
          if(units != null){
            _distributorService.getDistributors().then((dists) {
              if(dists != null){
                _stateSubject.add(SuccessfullySecondState(distributors: dists, units: units, categories: categories));
              }else{
                _stateSubject.add(ErrorState('error'));

              }
            });
          }else{
            _stateSubject.add(ErrorState('error'));

          }
        });
      }else{
        _stateSubject.add(ErrorState('error'));

      }
    });

  }

  void updateShipment(UpdateShipmentRequest request){
    _stateSubject.add(LoadingFirstState());
    // if(request.imageFile == null  || request.imageFile!.isEmpty){
      _editShipmentService.updateShipment(request).then((model) {
        if(model.isConfirmed){
          _stateSubject.add(ConfirmedEditedState(model));
        }else{
          _stateSubject.add(ErrorState('error'));
        }
      });

    // else {
    //   _uploadService
    //       .uploadImage(request.imageFile!).then((value) {
    //     if (value != null) {
    //       request.imageFile =
    //       value.contains('http')
    //           ? value
    //           : Urls.IMAGES_ROOT + value;
    //       _editShipmentService.addNewShipment(request).then((model) {
    //         _stateSubject.add(ConfirmedState(model));
    //       });
    //     }else{
    //       ConfirmResponse response =ConfirmResponse(false, 'error Connation');
    //       _stateSubject.add(ConfirmedState(response));
    //     }
    //   });
    // }

  }
}