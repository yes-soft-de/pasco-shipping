enum ContainerStatus { NOTFULL, FULL}
enum ContainerType { PUBLIC, PRIVATE}

const Map<ContainerType, String> ContainerTypeName = {
  ContainerType.PRIVATE: 'FCL',
  ContainerType.PUBLIC: 'LCL',
};
const Map<ContainerStatus, String> ContainerStatusName = {
  ContainerStatus.NOTFULL: 'notfull',
  ContainerStatus.FULL: 'full',
};