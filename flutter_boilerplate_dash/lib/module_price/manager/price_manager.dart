

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_price/repository/price_repository.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';

@injectable
class PriceManager{
  final PriceRepository _repository;
  PriceManager(this._repository);

  Future<PriceModel?> getPrice() => _repository.getPrice();
  Future<ConfirmResponse?> updateContainerPrice(ContainerPriceRequest request) => _repository.updateContainerPrice(request);
  Future<ConfirmResponse?> createShippingLinePrice(ShippingLinePriceRequest request) => _repository.createShippingLinePrice(request);
  Future<ConfirmResponse?> updateShippingLinePrice(ShippingLinePriceRequest request) => _repository.updateShippingLinePrice(request);
}