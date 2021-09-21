enum TravelStatus { CURRENT, STARTED, RELEASED, NotReleased }
enum TravelType { SEA, AIR}

const Map<TravelType, String> TravelTypeName = {
  TravelType.SEA: 'cruise',
  TravelType.AIR: 'flight',
};
const Map<TravelStatus, String> TravelStatusName = {
  TravelStatus.CURRENT: 'current',
  TravelStatus.STARTED: 'started',
  TravelStatus.RELEASED: 'released',
  TravelStatus.NotReleased: 'notReleased',
};