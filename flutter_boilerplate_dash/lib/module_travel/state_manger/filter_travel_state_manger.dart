import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:pasco_shipping/module_travel/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_travel/ui/state/filter_travel_state/filter_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class FilterTravelStateManager {
  final TravelService _service;
  final CountryService _countryService;
  final SubcontractService _subcontractService;

  final PublishSubject<FilterTravelState> _addStateSubject = PublishSubject();
  Stream<FilterTravelState> get stateStream => _addStateSubject.stream;

  FilterTravelStateManager(
      this._service, this._countryService, this._subcontractService);


  void getCountriesAndSubContract() {
    _addStateSubject.add(LoadingFilterState());
    _countryService.getCountries().then((countries) {
      if (countries != null) {
        _subcontractService.getSubcontracts().then((subs) {
          if (subs != null) {
            _addStateSubject
                .add(InitFilterState(countries: countries, subcontracts: subs));
          } else {
            _addStateSubject.add(ErrorFilterState('error'));
          }
        });
      } else {
        _addStateSubject.add(ErrorFilterState('error'));
      }
    });
  }
}
