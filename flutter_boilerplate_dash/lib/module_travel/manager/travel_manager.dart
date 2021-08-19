import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_travel/repository/travel_repository.dart';
import 'package:pasco_shipping/module_travel/request/travel_add_finance_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_change_state_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_finance_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_finance_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

@injectable
class TravelManager{
  final TravelRepository _repository;
  TravelManager(this._repository);

  Future<ConfirmResponse?> createTravel(TravelRequest request) => _repository.createTravel(request);
  Future<ConfirmResponse?> deleteTravel(String id) => _repository.deleteTravel(id);
  Future<ConfirmResponse?> updateTravelStatus(TravelChangeStateRequest request) => _repository.updateTravelStatus(request);
  Future<TravelDetailsModel?> getTravelDetails(String id) => _repository.getTravelDetails(id);
  Future<List<TravelModel>?> getTravelsByTypeAndStatus(String type ,String status) => _repository.getTravelsByTypeAndStatus(type, status);
  Future<List<TravelModel>?> getTravelsWithFilter(TravelFilterRequest request) => _repository.getTravelsWithFilter(request);



  Future<Data?> getTravelFinance(TravelFilterFinanceRequest request) => _repository.getTravelFinance(request);
  Future<ConfirmResponse?> createTravelFinance(TravelAddFinanceRequest request) => _repository.createTravelFinance(request);

// Future<ConfirmResponse?> updateSupplier(SupplierRequest request) => _repository.updateSupplier(request);


}