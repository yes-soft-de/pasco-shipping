enum AcceptedShipmentStatus { ACCEPTED, RECEIVED,MEASURED,STORED,UPLOADED,STARTED ,RELEASED ,CLEARED,ARRIVED,DELIVERED}
const Map<AcceptedShipmentStatus, String> AcceptedShipmentStatusName = {
  AcceptedShipmentStatus.ACCEPTED: 'accepted',
  AcceptedShipmentStatus.RECEIVED: 'received',
  AcceptedShipmentStatus.MEASURED: 'measured',
  AcceptedShipmentStatus.STORED: 'stored',
  AcceptedShipmentStatus.UPLOADED: 'uploaded',
  AcceptedShipmentStatus.STARTED: 'started',
  AcceptedShipmentStatus.RELEASED: 'released',
  AcceptedShipmentStatus.CLEARED: 'cleared',
  AcceptedShipmentStatus.ARRIVED: 'arrived',
  AcceptedShipmentStatus.DELIVERED: 'delivered',

};