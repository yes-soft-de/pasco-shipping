import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_mark/ui/mark_screen.dart';
import 'package:pasco_shipping/module_splash/splash_routes.dart';
import 'package:pasco_shipping/module_splash/ui/screen/splash_screen.dart';

import 'mark_routes.dart';

@injectable
class MarkModule extends YesModule {
  MarkModule(MarkScreen markScreen) {
    YesModule.RoutesMap.addAll({
      MarkRoutes.mark: (context) => markScreen
    });
  }
}