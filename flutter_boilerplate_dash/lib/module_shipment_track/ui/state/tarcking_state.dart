import 'package:pasco_shipping/module_shipment_track/response/tracking_response.dart';

class TrackingState{}

class TrackingInitState extends TrackingState{}

class LoadingTrackingState extends TrackingState{}

class FetchedTrackingSuccessfullyState extends TrackingState{
  TrackModel model;
  FetchedTrackingSuccessfullyState(this.model);
}
class ErrorTrackState extends TrackingState{
  String message;

  ErrorTrackState(this.message);
}