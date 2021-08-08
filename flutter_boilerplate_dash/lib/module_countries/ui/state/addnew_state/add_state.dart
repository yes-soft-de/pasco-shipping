import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddCountriesState{}

class InitAddCountriesState extends AddCountriesState{}
class LoadingAddCountriesState extends AddCountriesState{}

class SuccessfullyAddCountryState extends AddCountriesState{
  ConfirmResponse response;

  SuccessfullyAddCountryState(this.response);
}

class ErrorAddState extends AddCountriesState{
  String error;

  ErrorAddState(this.error);
}