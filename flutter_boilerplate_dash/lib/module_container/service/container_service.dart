import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/manager/container_manager.dart';
import 'package:pasco_shipping/module_container/request/add_container_to_travel_request.dart';
import 'package:pasco_shipping/module_container/request/container_change_state_request.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/request/container_request.dart';
import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
  class ContainerService {
  final ContainerManager _manager;
  ContainerService(this._manager);

  Future<ConfirmResponse?> requestContainer(ContainerRequest request) {
    return _manager.requestContainer(request);
  }
  // Future<ConfirmResponse?> updateSupplier(SupplierRequest request) {
  //   return _manager.updateSupplier(request);
  // }
  Future<ConfirmResponse?> deleteContainer(String id) {
    return _manager.deleteContainer(id);
  }
  Future<ContainerDetailsModel?> getContainerDetails(String id) {
    return _manager.getContainerDetails(id);
  }

  Future<List<ContainerModel>?> getContainersWithFilter(ContainerFilterRequest request) {
    return _manager.getContainersWithFilter(request);
  }

  Future<ConfirmResponse?> updateContainerStatus(ContainerChangeStateRequest request) {
    return _manager.updateContainerStatus(request);
  }
  Future<ConfirmResponse?> uploadedContainerToTravelRequest(AddContainerToTravelRequest request) {
    return _manager.uploadedContainerToTravel(request);
  }

}