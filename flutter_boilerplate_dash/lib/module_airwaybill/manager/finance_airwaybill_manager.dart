import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/repository/finance_airwaybill_repository.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_add_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_finance_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class FinanceAirwaybillManager{
  final FinanceAirwaybillRepository _repository;
  FinanceAirwaybillManager(this._repository);

  Future<Data?> getAirwaybillFCLFinance(AirwaybillFilterFinanceRequest request) => _repository.getAirwaybillFCLFinance(request);
  Future<Data?> getAirwaybillLCLFinance(AirwaybillFilterFinanceRequest request) => _repository.getAirwaybillLCLFinance(request);
  Future<ConfirmResponse?> createAirwaybillFCLFinance(AirwaybillAddFinanceRequest request) => _repository.createAirwaybillFCLFinance(request);
  Future<ConfirmResponse?> createAirwaybillLCLFinance(AirwaybillAddFinanceRequest request) => _repository.createAirwaybillLCLFinance(request);

}