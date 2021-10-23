import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/manager/subcontract_manager.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';


@injectable
  class SubcontractService {
  final SubcontractManager _manager;
  SubcontractService(this._manager);

  Future<List<SubcontractModel>?> getSubcontracts() {
    return _manager.getSubcontracts();
  }
}