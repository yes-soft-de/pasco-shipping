import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_product_sub_category/sub_product_routes.dart';
import 'package:pasco_shipping/module_product_sub_category/ui/screen/sub_product_new_screen.dart';
import 'package:pasco_shipping/module_product_sub_category/ui/screen/sub_product_update_screen.dart';
import 'package:pasco_shipping/module_product_sub_category/ui/screen/sub_products_screen.dart';
@injectable
class SubProductModule extends YesModule {
  final SubProductScreen _screen;
  final AddNewSubProduct _addNewProduct;
  final UpdateSubProduct _updateSubProduct;

  SubProductModule(this._screen, this._addNewProduct, this._updateSubProduct) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SubProductRoutes.VIEW_ALL: (context) => _screen,
      SubProductRoutes.ADD_NEW: (context) => _addNewProduct,
      SubProductRoutes.UPDATE: (context) => _updateSubProduct,
    };
  }
}
