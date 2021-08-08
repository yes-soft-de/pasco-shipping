import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/repository/country_repository.dart';
import 'package:pasco_shipping/module_countries/request/country_request.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class CountryManager{
  final CountryRepository _repository;
  CountryManager(this._repository);

  Future<ConfirmResponse?> createCountry(CountryRequest request) => _repository.createCountry(request);
  Future<ConfirmResponse?> deleteCountry(String id) => _repository.deleteCountry(id);
  Future<List<CountryModel>?> getCountries() => _repository.getCountries();
  Future<ConfirmResponse?> updateCountry(CountryRequest request) => _repository.updateCountry(request);


}