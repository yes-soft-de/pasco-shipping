import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:pasco_shipping/module_travel/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddTravelStateManager {
  final TravelService _service;
  final CountryService _countryService;
  final SubcontractService _subcontractService;

  final PublishSubject<AddTravelState> _addStateSubject = PublishSubject();
  Stream<AddTravelState> get stateStream => _addStateSubject.stream;

  AddTravelStateManager(
      this._service, this._countryService, this._subcontractService);

  void createTravel(TravelRequest request) {
    _addStateSubject.add(LoadingAddState());
    _service.createTravel(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void getCountriesAndSubContract() {
    _addStateSubject.add(LoadingAddState());
    _countryService.getCountries().then((countries) {
      if (countries != null) {
        _addStateSubject
            .add(InitAddState(countries: countries, subcontracts: []));
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void updateTravelInfo(TravelRequest request) {
    _addStateSubject.add(LoadingAddState());
    _service.updateTravelInfo(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}
