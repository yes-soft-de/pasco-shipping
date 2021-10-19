import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_price/manager/container_price_manager.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/container_price_response.dart';

@injectable
class ContainerPriceService{
  final ContainerPriceManager _manager;
  ContainerPriceService(this._manager);

  Future<ConfirmResponse?> updateContainerPrice(ContainerPriceRequest request) {
    return _manager.updateContainerPrice(request);
  }
  Future<ConfirmResponse?> createContainerPrice(ContainerPriceRequest request) {
    return _manager.createContainerPrice(request);
  }

  Future<List<ContainerPriceModel>?> getContainerPrice() {
    return _manager.getContainerPrice();
  }
}