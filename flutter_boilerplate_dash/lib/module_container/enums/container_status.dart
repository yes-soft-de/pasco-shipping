enum ContainerStatus { NOTFULL, FULL}
enum ContainerType { PUBLIC, PRIVATE}

const Map<ContainerType, String> ContainerTypeName = {
  ContainerType.PRIVATE: 'private',
  ContainerType.PUBLIC: 'public',
};
const Map<ContainerStatus, String> ContainerStatusName = {
  ContainerStatus.NOTFULL: 'notfull',
  ContainerStatus.FULL: 'full',
};