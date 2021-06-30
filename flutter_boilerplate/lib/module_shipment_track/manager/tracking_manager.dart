import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_track/repository/tracking_repository.dart';
import 'package:pasco_shipping/module_shipment_track/response/tracking_response.dart';

@injectable
class TrackingManager{
  final TrackingRepository _repository;
  TrackingManager(this._repository);

  Future<TrackModel?> getTrackDetails(String  trackNumber) => _repository.getTrackDetails(trackNumber);


}