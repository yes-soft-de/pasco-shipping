import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_proxies/proxies_routes.dart';
import 'package:pasco_shipping/module_proxies/ui/screen/proxies_screen.dart';
import 'package:pasco_shipping/module_proxies/ui/screen/proxy_new_screen.dart';
// import 'package:pasco_shipping/module_proxies/.;
@injectable
class ProxiesModule extends YesModule {
  final ProxiesScreen _proxiesScreen;
  final AddNewProxy _addNewProxy;

  ProxiesModule(this._proxiesScreen, this._addNewProxy) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProxyRoutes.VIEW_ALL: (context) => _proxiesScreen,
      ProxyRoutes.ADD_NEW: (context) => _addNewProxy,
    };
  }
}
