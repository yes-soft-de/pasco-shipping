import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/manager/subcontract_manager.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';


@injectable
  class SubcontractService {
  final SubcontractManager _manager;
  SubcontractService(this._manager);

  Future<ConfirmResponse?> createSubcontract(SubcontractRequest request) {
    return _manager.createSubcontract(request);
  }
  Future<ConfirmResponse?> updateSubcontract(SubcontractRequest request) {
    return _manager.updateSubcontract(request);
  }
  Future<ConfirmResponse?> deleteSubcontract(String id) {
    return _manager.deleteSubcontract(id);
  }
  Future<List<SubcontractModel>?> getSubcontracts() {
    return _manager.getSubcontracts();
  }
}