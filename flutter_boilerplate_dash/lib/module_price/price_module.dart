import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_price/price_routes.dart';
import 'package:pasco_shipping/module_price/ui/screen/container_price/add_container_price_screen.dart';
import 'package:pasco_shipping/module_price/ui/screen/shipline-price/add_new_line_price_screen.dart';
import 'package:pasco_shipping/module_price/ui/screen/shipline-price/price_screen.dart';

import 'ui/screen/container_price/container_price_screen.dart';
import 'ui/screen/container_price/update_container_price_screen.dart';
import 'ui/screen/shipline-price/update_line_price_screen.dart';

@injectable
class PriceModule extends YesModule {
  final PriceScreen _priceScreen;
  final AddNewLinesPrice _addNewLinesPrice;
  final UpdateLinesPrice _updateLinesPrice;
  final ContainerPriceScreen _containerPriceScreen;
  final AddNewContainerPrice _addNewContainerPrice;
  final UpdateContainerPrice _updateContainerPrice;


  PriceModule(this._priceScreen, this._addNewLinesPrice, this._updateLinesPrice, this._containerPriceScreen, this._addNewContainerPrice, this._updateContainerPrice) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      PriceRoutes.PRICE_SCREEN: (context) => _priceScreen,
      PriceRoutes.ADD_LINE_PRICE_SCREEN: (context) => _addNewLinesPrice,
      PriceRoutes.Update_LINE_PRICE_SCREEN: (context) => _updateLinesPrice,
      PriceRoutes.CONTAINER_PRICE_SCREEN: (context) => _containerPriceScreen,
      PriceRoutes.ADD_CONTAINER_PRICE_SCREEN: (context) => _addNewContainerPrice,
      PriceRoutes.UPDATE_CONTAINER_PRICE_SCREEN: (context) => _updateContainerPrice,
    };
  }
}