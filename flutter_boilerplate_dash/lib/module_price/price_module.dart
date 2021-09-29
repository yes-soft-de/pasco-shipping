import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_price/price_routes.dart';
import 'package:pasco_shipping/module_price/ui/price_screen.dart';

@injectable
class PriceModule extends YesModule {
  final PriceScreen _priceScreen;


  PriceModule(this._priceScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      PriceRoutes.PRICE_SCREEN: (context) => _priceScreen,
    };
  }
}