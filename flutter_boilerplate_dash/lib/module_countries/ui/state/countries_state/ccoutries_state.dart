import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';

class CountriesState{}


class LoadingCountriesState extends CountriesState{}

class SuccessfullyFetchCountriesState extends CountriesState{
  List<CountryModel> countries;

  SuccessfullyFetchCountriesState(this.countries);
}

class SuccessfullyModifyState extends CountriesState{
  ConfirmResponse response;
  List<CountryModel> countries;

  SuccessfullyModifyState(this.response, this.countries);
}

class ErrorState extends CountriesState{
  String error;

  ErrorState(this.error);
}