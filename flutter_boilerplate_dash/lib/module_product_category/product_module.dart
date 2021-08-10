import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_product_category/product_routes.dart';
import 'package:pasco_shipping/module_product_category/ui/screen/product_new_screen.dart';
import 'package:pasco_shipping/module_product_category/ui/screen/products_screen.dart';
import 'package:pasco_shipping/module_subcontract_services/ui/screen/sub_contract_service_screen.dart';
@injectable
class ProductModule extends YesModule {
  final ProductScreen _screen;
  final AddNewProduct _addNewProduct;

  ProductModule(this._screen, this._addNewProduct) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProductRoutes.VIEW_ALL: (context) => _screen,
      ProductRoutes.ADD_NEW: (context) => _addNewProduct,
    };
  }
}
