import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/manager/country_manager.dart';
import 'package:pasco_shipping/module_countries/request/country_request.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/manager/mark_manager.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';

@injectable
  class CountryService {
  final CountryManager _manager;
  CountryService(this._manager);

  Future<ConfirmResponse?> createCountry(CountryRequest request) {
    return _manager.createCountry(request);
  }
  Future<ConfirmResponse?> updateCountry(CountryRequest request) {
    return _manager.updateCountry(request);
  }
  Future<ConfirmResponse?> deleteCountry(String id) {
    return _manager.deleteCountry(id);
  }
  Future<List<CountryModel>?> getCountries() {
    return _manager.getCountries();
  }
}