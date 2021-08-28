import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_travel/travel_routes.dart';
import 'package:pasco_shipping/module_travel/ui/screen/travel_details_screen.dart';
import 'package:pasco_shipping/module_travel/ui/screen/travel_filter_screen.dart';
import 'package:pasco_shipping/module_travel/ui/screen/travel_finance_screen.dart';
import 'package:pasco_shipping/module_travel/ui/screen/travel_new_screen.dart';
import 'package:pasco_shipping/module_travel/ui/screen/travel_screen.dart';
import 'package:pasco_shipping/module_travel/ui/screen/travel_update_screen.dart';
@injectable
class TravelModule extends YesModule {
  final TravelScreen _screen;
  final AddNewTravel _addNewTravel;
  final TravelFilterScreen _filterScreen;
  final TravelDetailsScreen _detailsScreen;
  final TravelFinanceScreen _financeScreen;
  final UpdateTravel _updateTravel;

  TravelModule(this._screen, this._addNewTravel, this._filterScreen, this._detailsScreen, this._financeScreen, this._updateTravel) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      TravelRoutes.VIEW_ALL: (context) => _screen,
      TravelRoutes.ADD_NEW: (context) => _addNewTravel,
      TravelRoutes.FILTER: (context) => _filterScreen,
      TravelRoutes.DETAILS: (context) => _detailsScreen,
      TravelRoutes.FINANCE: (context) => _financeScreen,
      TravelRoutes.UPDATE: (context) => _updateTravel,
    };
  }
}
