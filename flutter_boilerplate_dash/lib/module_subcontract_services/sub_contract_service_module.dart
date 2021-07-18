import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_subcontract_services/sub_contract_service_routes.dart';
import 'package:pasco_shipping/module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart';
import 'package:pasco_shipping/module_subcontract_services/ui/screen/sub_contract_service_screen.dart';
@injectable
class SubContractServiceModule extends YesModule {
  final SubContractServiceScreen _screen;
  final AddNewSubContractService _addNewSubContractService;

  SubContractServiceModule(this._screen, this._addNewSubContractService) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SubContractServiceRoutes.VIEW_ALL: (context) => _screen,
      SubContractServiceRoutes.ADD_NEW: (context) => _addNewSubContractService,
    };
  }
}
