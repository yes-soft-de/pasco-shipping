
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_request.dart';
import 'package:pasco_shipping/module_harbor/service/harbor_service.dart';
import 'package:pasco_shipping/module_harbor/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddHarborStateManager{
  final HarborService _service;
  final CountryService _countryService;

  final PublishSubject<AddHarborState> _addStateSubject = PublishSubject();
  Stream<AddHarborState> get stateStream => _addStateSubject.stream;

  AddHarborStateManager(this._service, this._countryService);

  void createHarbor(HarborRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createHarbor(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _addStateSubject.add(SuccessfullyAddState(value));
        }
        else{
          _addStateSubject.add(ErrorAddState('error'));
        }
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void updateHarbor(HarborRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.updateHarbor(request).then((value) {
      if(value != null){
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void getCountries() {
    _addStateSubject.add(LoadingAddState());
    _countryService.getCountries().then((countries) {
      if (countries != null) {
        _addStateSubject.add(InitAddState(countries));
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}