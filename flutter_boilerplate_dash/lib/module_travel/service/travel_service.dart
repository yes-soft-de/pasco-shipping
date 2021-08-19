import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_travel/manager/travel_manager.dart';
import 'package:pasco_shipping/module_travel/request/travel_add_finance_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_change_state_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_finance_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_finance_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';


@injectable
  class TravelService {
  final TravelManager _manager;
  TravelService(this._manager);

  Future<ConfirmResponse?> createTravel(TravelRequest request) {
    return _manager.createTravel(request);
  }
  // Future<ConfirmResponse?> updateSupplier(SupplierRequest request) {
  //   return _manager.updateSupplier(request);
  // }
  Future<ConfirmResponse?> deleteTravel(String id) {
    return _manager.deleteTravel(id);
  }
  Future<TravelDetailsModel?> getTravelDetails(String id) {
    return _manager.getTravelDetails(id);
  }
  Future<List<TravelModel>?> getTravelsByTypeAndStatus(String type ,String status) {
    return _manager.getTravelsByTypeAndStatus(type, status);
  }
  Future<List<TravelModel>?> getTravelsWithFilter(TravelFilterRequest request) {
    return _manager.getTravelsWithFilter(request);
  }

  Future<ConfirmResponse?> updateTravelStatus(TravelChangeStateRequest request) {
    return _manager.updateTravelStatus(request);
  }


  Future<ConfirmResponse?> createTravelFinance(TravelAddFinanceRequest request) {
    return _manager.createTravelFinance(request);
  }

  Future<Data?> getTravelFinance(TravelFilterFinanceRequest request) {
    return _manager.getTravelFinance(request);
  }

}