import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_countries/ui/screen/countries_screen.dart';
import 'package:pasco_shipping/module_countries/ui/screen/country_new_screen.dart';

import 'country_routes.dart';

@injectable
class CountryModule extends YesModule {
  final CountriesScreen _countriesScreen;
  final AddNewCountry _addNewCountry;

  CountryModule(this._countriesScreen, this._addNewCountry) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CountryRoutes.All_COUNTRY: (context) => _countriesScreen,
      CountryRoutes.ADD_NEW_COUNTRY: (context) => _addNewCountry,
    };
  }
}
