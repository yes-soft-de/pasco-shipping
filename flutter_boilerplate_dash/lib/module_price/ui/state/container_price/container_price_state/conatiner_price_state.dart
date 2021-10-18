import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_price/response/container_price_response.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';

class ContainerPriceState{}

class PriceInitState extends ContainerPriceState{}

class LoadingPriceState extends ContainerPriceState{}

class FetchedContainerPriceSuccessfullyState extends ContainerPriceState{
  List<ContainerPriceModel> model;
  // List<ContainerSpecificationModel> specifications;

  FetchedContainerPriceSuccessfullyState(this.model);
}
class ErrorPriceState extends ContainerPriceState{
  String message;

  ErrorPriceState(this.message);
}