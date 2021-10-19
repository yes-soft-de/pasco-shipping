import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/manager/finance_airwaybill_manager.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_add_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_finance_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class FinanceAirwaybillService {
  final FinanceAirwaybillManager _manager;
  FinanceAirwaybillService(this._manager);


  Future<ConfirmResponse?> createAirwaybillFCLFinance(AirwaybillAddFinanceRequest request) {
    return _manager.createAirwaybillFCLFinance(request);
  }
  Future<ConfirmResponse?> createAirwaybillLCLFinance(AirwaybillAddFinanceRequest request) {
    return _manager.createAirwaybillLCLFinance(request);
  }
  Future<Data?> getAirwaybillLCLFinance(AirwaybillFilterFinanceRequest request) {
    return _manager.getAirwaybillLCLFinance(request);
  }
  Future<Data?> getAirwaybillFCLFinance(AirwaybillFilterFinanceRequest request) {
    return _manager.getAirwaybillFCLFinance(request);
  }
}