import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';

class PriceState{}

class PriceInitState extends PriceState{}

class LoadingPriceState extends PriceState{}

class FetchedPriceSuccessfullyState extends PriceState{
  PriceModel model;
  List<ContainerSpecificationModel> specifications;

  FetchedPriceSuccessfullyState(this.model ,this.specifications);
}
class ErrorPriceState extends PriceState{
  String message;

  ErrorPriceState(this.message);
}