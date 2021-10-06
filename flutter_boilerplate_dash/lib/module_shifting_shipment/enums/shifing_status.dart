enum ShiftingStatus { STARTED, ACCEPTED, DONE,REFUSED }

const Map<ShiftingStatus, String> TravelStatusName = {
  ShiftingStatus.STARTED: 'started',
  ShiftingStatus.ACCEPTED: 'accepted',
  ShiftingStatus.DONE: 'done',
  ShiftingStatus.REFUSED: 'refused',
};