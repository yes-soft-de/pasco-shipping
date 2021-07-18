import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_distributors/ui/screen/distributors_new_screen.dart';
import 'package:pasco_shipping/module_distributors/ui/screen/distributors_screen.dart';

import 'distributors_routes.dart';

@injectable
class DistributorsModule extends YesModule {
  final DistributorsScreen _distributorsScreen;
  final AddNewDistributor _addNewDistributor;

  DistributorsModule(this._distributorsScreen, this._addNewDistributor) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      DistributorRoutes.VIEW_ALL: (context) => _distributorsScreen,
      DistributorRoutes.ADD_NEW: (context) => _addNewDistributor,
    };
  }
}
