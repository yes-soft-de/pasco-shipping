import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_harbor/ui/screen/harbors_new_screen.dart';
import 'package:pasco_shipping/module_harbor/ui/screen/harbors_screen.dart';

import 'harbor_routes.dart';
import 'ui/screen/harbor_update_screen.dart';
@injectable
class HarborModule extends YesModule {
  final HarborsScreen _screen;
  final AddNewHarbor _addNewHarbor;
  final UpdateHarbor _updateHarbor;

  HarborModule(this._screen, this._addNewHarbor, this._updateHarbor) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      HarborRoutes.VIEW_ALL: (context) => _screen,
      HarborRoutes.ADD_NEW: (context) => _addNewHarbor,
      HarborRoutes.UPDATE: (context) => _updateHarbor,
    };
  }
}
