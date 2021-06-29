import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_profile/profile_routes.dart';
import 'package:pasco_shipping/module_profile/ui/profile_screen.dart';
import 'package:pasco_shipping/module_shipment_previous/previous_routes.dart';

@injectable
class ProfileModule extends YesModule {
  final ProfileScreen _profileScreen;


  ProfileModule(this._profileScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.PROFILE_SCREEN: (context) => _profileScreen,
    };
  }
}