import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_notifications/ui/notification_screen.dart';
import 'package:pasco_shipping/module_splash/splash_routes.dart';
import 'package:pasco_shipping/module_splash/ui/screen/splash_screen.dart';

import 'notification_routes.dart';

@injectable
class NotificationModule extends YesModule {
  NotificationModule(NotificationScreen notificationScreen) {
    YesModule.RoutesMap.addAll({
      NotificationRoutes.NOTIFICATION_SCREEN: (context) => notificationScreen
    });
  }
}