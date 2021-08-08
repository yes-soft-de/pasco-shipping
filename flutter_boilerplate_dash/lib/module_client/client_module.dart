import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_client/client_routes.dart';
import 'package:pasco_shipping/module_client/ui/screen/add_new_client_screen.dart';
import 'package:pasco_shipping/module_client/ui/screen/client_screen.dart';
@injectable
class ClientModule extends YesModule {
  final ClientsScreen _screen;
  final AddNewClient _addNewClient;

  ClientModule(this._screen, this._addNewClient) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ClientRoutes.VIEW_ALL: (context) => _screen,
      ClientRoutes.ADD_NEW: (context) => _addNewClient,
    };
  }
}
