enum TravelStatus { CURRENT, STARTED, RELEASED}
enum TravelType { SEA, AIR}

const Map<TravelType, String> TravelTypeName = {
  TravelType.SEA: 'cruise',
  TravelType.AIR: 'flight',
};
const Map<TravelStatus, String> TravelStatusName = {
  TravelStatus.CURRENT: 'current',
  TravelStatus.STARTED: 'started',
  TravelStatus.RELEASED: 'released',
};