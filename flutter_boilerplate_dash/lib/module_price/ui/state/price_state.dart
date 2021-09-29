import 'package:pasco_shipping/module_price/response/price_response.dart';

class PriceState{}

class PriceInitState extends PriceState{}

class LoadingPriceState extends PriceState{}

class FetchedPriceSuccessfullyState extends PriceState{
  PriceModel model;

  FetchedPriceSuccessfullyState(this.model);
}
class ErrorPriceState extends PriceState{
  String message;

  ErrorPriceState(this.message);
}