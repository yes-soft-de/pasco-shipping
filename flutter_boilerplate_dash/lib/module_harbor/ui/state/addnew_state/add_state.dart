import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddHarborState{}

class InitAddState extends AddHarborState{
  List<CountryModel> countries;

  InitAddState(this.countries);
}
class LoadingAddState extends AddHarborState{}

class SuccessfullyAddState extends AddHarborState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddHarborState{
  String error;

  ErrorAddState(this.error);
}