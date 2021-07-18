
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/request/country_request.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_countries/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_countries/ui/state/countries_state/ccoutries_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddCountryStateManager{
  final CountryService _countryService;

  final PublishSubject<AddCountriesState> _addStateSubject = PublishSubject();
  Stream<AddCountriesState> get stateStream => _addStateSubject.stream;

  AddCountryStateManager(this._countryService);

  void createCountry(CountryRequest request){
    _addStateSubject.add(LoadingAddCountriesState());
    _countryService.createCountry(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _addStateSubject.add(SuccessfullyAddCountryState(value));
        }
        else{
          _addStateSubject.add(ErrorAddState('error'));
        }
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}