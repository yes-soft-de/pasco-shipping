import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_sub_contract/subcontract_routes.dart';
import 'package:pasco_shipping/module_sub_contract/ui/screen/subcontract_new_screen.dart';
import 'package:pasco_shipping/module_sub_contract/ui/screen/subcontracts_screen.dart';
@injectable
class SubcontractModule extends YesModule {
  final SubcontractScreen _screen;
  final AddNewSubcontract _addNewSubcontract;

  SubcontractModule(this._screen, this._addNewSubcontract) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SubcontractRoutes.VIEW_ALL: (context) => _screen,
      SubcontractRoutes.ADD_NEW: (context) => _addNewSubcontract,
    };
  }
}
