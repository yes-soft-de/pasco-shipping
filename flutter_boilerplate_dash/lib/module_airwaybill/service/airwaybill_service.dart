import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/manager/airwaybill_manager.dart';
import 'package:pasco_shipping/module_airwaybill/request/add_airwaybill_to_travel_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_add_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_change_state_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_details_response.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_finance_response.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
  class AirwaybillService {
  final AirwaybillManager _manager;
  AirwaybillService(this._manager);

  Future<ConfirmResponse?> requestAirwaybill(AirwaybillRequest request) {
    return _manager.requestAirwaybill(request);
  }
  Future<ConfirmResponse?> updateAirwaybill(AirwaybillRequest request) {
    return _manager.updateAirwaybill(request);
  }
  Future<ConfirmResponse?> deleteAirwaybill(String id) {
    return _manager.deleteAirwaybill(id);
  }
  Future<AirwaybillDetailsModel?> getAirwaybillDetails(String id) {
    return _manager.getAirwaybillDetails(id);
  }

  Future<List<AirwaybillModel>?> getAirwaybillWithFilter(AirwaybillFilterRequest request) {
    return _manager.getAirwaybillsWithFilter(request);
  }

  Future<ConfirmResponse?> updateAirwaybillStatus(AirwaybillChangeStateRequest request) {
    return _manager.updateAirwaybillStatus(request);
  }
  Future<ConfirmResponse?> uploadedAirwaybillToTravel(AddAirwaybillToTravelRequest request) {
    return _manager.uploadedAirwaybillToTravel(request);
  }
  Future<ConfirmResponse?> createAirwaybillFinance(AirwaybillAddFinanceRequest request) {
    return _manager.createAirwaybillFinance(request);
  }

  Future<Data?> getAirwaybillFinance(AirwaybillFilterFinanceRequest request) {
    return _manager.getAirwaybillFinance(request);
  }
}