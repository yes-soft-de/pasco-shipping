import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_home/ui/screen/home_screen.dart';
import 'package:pasco_shipping/module_home/ui/screen/mainNavigation.dart';
import 'package:pasco_shipping/module_splash/splash_routes.dart';
import 'package:pasco_shipping/module_splash/ui/screen/splash_screen.dart';

@injectable
class HomeModule extends YesModule {
  final HomeScreen _homeScreen;
  // final MainNavigationScreen _mainNavigationScreen;


  HomeModule( this._homeScreen) {
    YesModule.RoutesMap.addAll({
      HomeRoutes.Home: (context) => _homeScreen,
      // HomeRoutes.MAIN_NAVIGATION: (context) => _mainNavigationScreen,
      // HomeRoutes.PREVIOUS_SHIPMENTS: (context) => homeScreen,
      // HomeRoutes.SHIPMENTS_DETAILS: (context) => homeScreen,
      // HomeRoutes.SHIPMENTS_TRACKING: (context) => homeScreen,
    });
  }
}