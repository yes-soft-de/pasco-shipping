import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:pasco_shipping/module_auth/ui/screen/register_screen/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_intro/ui/welcome_screen/welcome_screen.dart';
import 'intro_routes.dart';
import 'ui/intro_screen/intro_screen.dart';

@injectable
class IntroModule extends YesModule {
  final IntroScreen _introScreen;
  final WelcomeScreen _welcomeScreen;

  IntroModule(this._introScreen, this._welcomeScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      IntroRoutes.INTRO_SCREEN: (context) => _introScreen,
      IntroRoutes.WELCOME_SCREEN: (context) => _welcomeScreen,
    };
  }
}
