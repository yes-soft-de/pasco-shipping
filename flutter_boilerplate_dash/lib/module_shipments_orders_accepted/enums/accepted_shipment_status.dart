enum AcceptedShipmentStatus {WAITING, ACCEPTED, RECEIVED,MEASURED,STORED,UPLOADED,STARTED ,RELEASED ,CLEARED,ARRIVED,DELIVERED,REFUSED}
const Map<AcceptedShipmentStatus, String> AcceptedShipmentStatusName = {
  AcceptedShipmentStatus.WAITING: 'waiting',
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
  AcceptedShipmentStatus.REFUSED: 'refused',

};