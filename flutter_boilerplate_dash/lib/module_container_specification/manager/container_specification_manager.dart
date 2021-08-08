import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/repository/container_specification_repository.dart';
import 'package:pasco_shipping/module_container_specification/request/container_specification_request.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class ContainerSpecificationManager{
  final ContainerSpecificationRepository _repository;
  ContainerSpecificationManager(this._repository);

  Future<ConfirmResponse?> createContainerSpecification(ContainerSpecificationRequest request) => _repository.createContainerSpecification(request);
  // Future<ConfirmResponse?> deleteSupplier(String id) => _repository.deleteSupplier(id);
  Future<List<ContainerSpecificationModel>?> getContainerSpecifications() => _repository.getContainerSpecification();
  // Future<ConfirmResponse?> updateSupplier(SupplierRequest request) => _repository.updateSupplier(request);


}