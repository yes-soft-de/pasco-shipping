
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/request/country_request.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_countries/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_countries/ui/state/countries_state/ccoutries_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class CountryStateManager{
  final CountryService _countryService;

  final PublishSubject<CountriesState> _stateSubject = PublishSubject();
  Stream<CountriesState> get stateStream => _stateSubject.stream;


  // final PublishSubject<AddCountriesState> _addStateSubject = PublishSubject();
  // Stream<AddCountriesState> get addStateStream => _addStateSubject.stream;

  CountryStateManager(this._countryService);

  void getCountries(){
    _stateSubject.add(LoadingCountriesState());
    _countryService.getCountries().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchCountriesState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteCountry(String id){
    _stateSubject.add(LoadingCountriesState());
    _countryService.deleteCountry(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _countryService.getCountries().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyFetchCountriesState(marks));
            }else {
              _stateSubject.add(ErrorState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });
  }

  void updateCountry(CountryRequest request){
    _stateSubject.add(LoadingCountriesState());
    _countryService.updateCountry(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _countryService.getCountries().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyFetchCountriesState(marks));
            }else {
              _stateSubject.add(ErrorState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });
  }
}