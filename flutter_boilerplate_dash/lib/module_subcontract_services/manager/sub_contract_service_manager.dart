import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_subcontract_services/repository/sub_contract_service_repository.dart';
import 'package:pasco_shipping/module_subcontract_services/request/sub_contract_service_request.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';

@injectable
class SubContractServiceManager{
  final SubContractServiceRepository _repository;
  SubContractServiceManager(this._repository);

  Future<ConfirmResponse?> createSubContractService(SubContractServiceRequest request) => _repository.createSubContractService(request);
  Future<ConfirmResponse?> deleteSubContractService(String id) => _repository.deleteSubContractService(id);
  Future<List<SubContractServiceModel>?> getSubContractServices() => _repository.getSubContractServices();
  Future<ConfirmResponse?> updateSubContractService(SubContractServiceRequest request) => _repository.updateSubContractService(request);


}