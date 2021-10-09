import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/repository/container_repository.dart';
import 'package:pasco_shipping/module_container/request/add_container_to_travel_request.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_change_state_request.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/request/container_request.dart';
import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class ContainerManager{
  final ContainerRepository _repository;
  ContainerManager(this._repository);

  Future<ConfirmResponse?> requestContainer(ContainerRequest request) => _repository.requestContainer(request);
  Future<ConfirmResponse?> updateContainer(ContainerRequest request) => _repository.updateContainer(request);
  Future<ConfirmResponse?> deleteContainer(String id) => _repository.deleteContainer(id);
  Future<ConfirmResponse?> updateContainerStatus(ContainerChangeStateRequest request) => _repository.updateContainerStatus(request);
  Future<ConfirmResponse?> updateContainerStatusClearedOrArrived(ContainerClearedOrArrivedRequest request) => _repository.updateContainerStatusClearedOrArrived(request);
  Future<ConfirmResponse?> uploadedContainerToTravel(AddContainerToTravelRequest request) => _repository.uploadedContainerToTravel(request);
  Future<ContainerDetailsModel?> getContainerDetails(String id) => _repository.getContainerDetails(id);
  Future<List<ContainerModel>?> getContainersWithFilter(ContainerFilterRequest request) => _repository.getContainerWithFilter(request);

}