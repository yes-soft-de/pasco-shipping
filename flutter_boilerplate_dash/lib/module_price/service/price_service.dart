
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_price/manager/price_manager.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';

@injectable
class PriceService{
  final PriceManager _manager;
  PriceService(this._manager);

  Future<ConfirmResponse?> updatePrice(PriceRequest request) {
    return _manager.updatePrice(request);
  }
  Future<PriceModel?> getPrice() {
    return _manager.getPrice();
  }
}