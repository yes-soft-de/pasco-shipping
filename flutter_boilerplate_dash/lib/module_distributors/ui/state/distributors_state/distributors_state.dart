import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class DistributorsState{}


class LoadingState extends DistributorsState{}

class SuccessfullyFetchState extends DistributorsState{
  List<DistributorModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends DistributorsState{
  ConfirmResponse response;
  List<DistributorModel> countries;

  SuccessfullyModifyState(this.response, this.countries);
}

class ErrorState extends DistributorsState{
  String error;

  ErrorState(this.error);
}