enum AirwaybillStatus { NOTFULL, FULL}
enum AirwaybillType { PUBLIC, PRIVATE}

const Map<AirwaybillType, String> AirwaybillTypeName = {
  AirwaybillType.PRIVATE: 'FCL',
  AirwaybillType.PUBLIC: 'LCL',
};
const Map<AirwaybillStatus, String> AirwaybillStatusName = {
  AirwaybillStatus.NOTFULL: 'notfull',
  AirwaybillStatus.FULL: 'full',
};