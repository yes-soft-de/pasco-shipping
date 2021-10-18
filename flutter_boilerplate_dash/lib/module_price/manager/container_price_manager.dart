import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_price/repository/container_price_repository.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/container_price_response.dart';

@injectable
class ContainerPriceManager{
  final ContainerPriceRepository _repository;
  ContainerPriceManager(this._repository);

  Future<List<ContainerPriceModel>?> getContainerPrice() => _repository.getContainerPrice();
  Future<ConfirmResponse?> updateContainerPrice(ContainerPriceRequest request) => _repository.updateContainerPrice(request);
  Future<ConfirmResponse?> createContainerPrice(ContainerPriceRequest request) => _repository.createContainerPrice(request);
}