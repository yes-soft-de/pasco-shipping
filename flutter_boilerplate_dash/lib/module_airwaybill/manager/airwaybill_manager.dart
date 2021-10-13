import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/repository/airwaybill_repository.dart';
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
class AirwaybillManager{
  final AirwaybillRepository _repository;
  AirwaybillManager(this._repository);

  Future<ConfirmResponse?> requestAirwaybill(AirwaybillRequest request) => _repository.requestAirwaybill(request);
  Future<ConfirmResponse?> updateAirwaybill(AirwaybillRequest request) => _repository.updateAirwaybill(request);
  Future<ConfirmResponse?> deleteAirwaybill(String id) => _repository.deleteAirwaybill(id);
  Future<ConfirmResponse?> updateAirwaybillStatus(AirwaybillChangeStateRequest request) => _repository.updateAirwaybillStatus(request);
  Future<ConfirmResponse?> updateAirwaybillStatusClearedOrArrived(AirwaybillClearedOrArrivedRequest request) => _repository.updateAirwaybillStatusClearedOrArrived(request);
  Future<ConfirmResponse?> uploadedAirwaybillToTravel(AddAirwaybillToTravelRequest request) => _repository.uploadedAirwaybillToTravel(request);
  Future<AirwaybillDetailsModel?> getAirwaybillDetails(String id) => _repository.getAirwaybillDetails(id);
  Future<List<AirwaybillModel>?> getAirwaybillsWithFilter(AirwaybillFilterRequest request) => _repository.getAirwaybillWithFilter(request);

  // Future<Data?> getAirwaybillFinance(AirwaybillFilterFinanceRequest request) => _repository.getAirwaybillFinance(request);
  // Future<ConfirmResponse?> createAirwaybillFinance(AirwaybillAddFinanceRequest request) => _repository.createAirwaybillFinance(request);

}