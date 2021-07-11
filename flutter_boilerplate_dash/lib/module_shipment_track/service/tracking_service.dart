import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_track/manager/tracking_manager.dart';
import 'package:pasco_shipping/module_shipment_track/response/tracking_response.dart';

@injectable
class TrackingService {
  final TrackingManager _manager;
  TrackingService(this._manager);

  Future<TrackModel?> getTrackDetails(String trackNumber) {
    return _manager.getTrackDetails(trackNumber);
  }
}