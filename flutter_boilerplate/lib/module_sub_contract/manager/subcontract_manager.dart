import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/repository/subcontract_repository.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

@injectable
class SubcontractManager{
  final SubcontractRepository _repository;
  SubcontractManager(this._repository);

  Future<List<SubcontractModel>?> getSubcontracts() => _repository.getSubContracts();
}