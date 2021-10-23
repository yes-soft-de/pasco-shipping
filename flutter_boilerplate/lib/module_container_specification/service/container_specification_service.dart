import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/manager/container_specification_manager.dart';
import 'package:pasco_shipping/module_container_specification/request/container_specification_request.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
  class ContainerSpecificationService {
  final ContainerSpecificationManager _manager;
  ContainerSpecificationService(this._manager);

  Future<List<ContainerSpecificationModel>?> getContainerSpecification() {
    return _manager.getContainerSpecifications();
  }
}