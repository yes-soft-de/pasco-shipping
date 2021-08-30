
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';

class StatusCodeHelper {
  static String getStatusCodeMessages(var statusCode) {
    if (statusCode is int) {
      statusCode = statusCode.toString();
    }
    statusCode ??= '0';
    switch (statusCode) {
      case '200':
        return S.current.statusCodeOk;
      case '201':
        return S.current.statusCodeCreated;
      case '400':
        return S.current.statusCodeBadRequest;
      case '401':
        return S.current.statusCodeUnauthorized;
      case '404':
        return S.current.StatusCodeNotFound;
      case '500':
        return S.current.internalServerError;
      case '-1':
        return S.current.dataDecodeError;
      default:
        return S.current.errorHappened;
    }
  }

 static String addDesriptionToStatus(String status){
    if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!) {
      return S.current.shipmentAccepted;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]!){
      return S.current.shipmentReceivedS;}
    else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!){
      return S.current.shipmentMeasurement;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.STORED]!){
      return S.current.shipmentUploadedHolder;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.UPLOADED]!){
      return S.current.shipmentUploadedToTravel;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.STARTED]!){
      return S.current.travelStarted;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED]!){
      return S.current.travelArrived;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!){
      return S.current.containerCleared;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!){
      return S.current.shipmentArrived;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.DELIVERED]!){
      return S.current.shipmentDelivered;
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.WAITING]!){
      return S.current.shipmentWaiting;
    }
    else {
      return '';
    }
  }
}
