import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_price/price_routes.dart';
import 'package:pasco_shipping/module_price/ui/screen/add_new_line_price_screen.dart';
import 'package:pasco_shipping/module_price/ui/screen/price_screen.dart';

import 'ui/screen/update_line_price_screen.dart';

@injectable
class PriceModule extends YesModule {
  final PriceScreen _priceScreen;
  final AddNewLinesPrice _addNewLinesPrice;
  final UpdateLinesPrice _updateLinesPrice;


  PriceModule(this._priceScreen, this._addNewLinesPrice, this._updateLinesPrice) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      PriceRoutes.PRICE_SCREEN: (context) => _priceScreen,
      PriceRoutes.ADD_LINE_PRICE_SCREEN: (context) => _addNewLinesPrice,
      PriceRoutes.Update_LINE_PRICE_SCREEN: (context) => _updateLinesPrice,
    };
  }
}