import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_request/manager/product_category_manager/product_category_manager.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

@injectable
class FirstOptionService {
  final FirstOptionManager _manager;
  FirstOptionService(this._manager);

  Future<List<Category>?> getCategories() {
    return _manager.getCategories();
  }
  Future<List<Countries>?> getWarehouse() {
    return _manager.getWarehouses();
  }
  Future<ConfirmResponse?> addShipment(ShipmentRequest request) {
    return _manager.addShipment(request);
  }
}
