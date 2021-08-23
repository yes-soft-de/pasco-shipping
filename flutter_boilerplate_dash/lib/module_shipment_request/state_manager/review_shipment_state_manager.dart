import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/review_shipment_request.dart';
import 'package:pasco_shipping/module_upload/service/image_upload/image_upload_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ReviewShipmentStateManger {
  final FirstOptionService _firstOptionService;
  final ImageUploadService _uploadService;

  final PublishSubject<ReviewRequestShipmentState> _stateSubject =
      PublishSubject();
  Stream<ReviewRequestShipmentState> get stateStream => _stateSubject.stream;

  ReviewShipmentStateManger(this._firstOptionService, this._uploadService);

  void upp(ShipmentRequest request) {
    print("End for");
    _firstOptionService.addShipment(request).then((value) {
      if (value != null && value.isConfirmed) {
        _stateSubject.add(SuccessfullyAddedShipment());
      } else {
        _stateSubject.add(errorState('error'));
      }
    });
  }

  void addShipment(ShipmentRequest request) async {
    List<String> images = <String>[];
    _stateSubject.add(LoadingState());
    if (request.imageFilePath != null && request.imageFilePath!.isNotEmpty) {
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
