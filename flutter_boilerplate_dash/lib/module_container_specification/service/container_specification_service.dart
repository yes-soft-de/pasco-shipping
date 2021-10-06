import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/manager/container_specification_manager.dart';
import 'package:pasco_shipping/module_container_specification/request/container_specification_request.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
  class ContainerSpecificationService {
  final ContainerSpecificationManager _manager;
  ContainerSpecificationService(this._manager);

  Future<ConfirmResponse?> createContainerSpecification(ContainerSpecificationRequest request) {
    return _manager.createContainerSpecification(request);
  }
  Future<ConfirmResponse?> updateSpecification(ContainerSpecificationRequest request) {
    return _manager.updateSpecification(request);
  }
  Future<ConfirmResponse?> deleteSpecification(String id) {
    return _manager.deleteSpecification(id);
  }
  Future<List<ContainerSpecificationModel>?> getContainerSpecification() {
    return _manager.getContainerSpecifications();
  }
}