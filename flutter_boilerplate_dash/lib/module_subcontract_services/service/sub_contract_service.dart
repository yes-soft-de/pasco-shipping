import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_subcontract_services/manager/sub_contract_service_manager.dart';
import 'package:pasco_shipping/module_subcontract_services/request/sub_contract_service_request.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';


@injectable
  class SubContractServiceService {
  final SubContractServiceManager _manager;
  SubContractServiceService(this._manager);

  Future<ConfirmResponse?> createSubContractService(SubContractServiceRequest request) {
    return _manager.createSubContractService(request);
  }
  Future<ConfirmResponse?> updateSubContractService(SubContractServiceRequest request) {
    return _manager.updateSubContractService(request);
  }
  Future<ConfirmResponse?> deleteSubContractService(String id) {
    return _manager.deleteSubContractService(id);
  }
  Future<List<SubContractServiceModel>?> getSubContractServices() {
    return _manager.getSubContractServices();
  }
}