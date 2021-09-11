import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_receiver/receiver_routes.dart';
import 'package:pasco_shipping/module_receiver/ui/receiver_screen.dart';


@injectable
class ReceiverModule extends YesModule {
  ReceiverModule(ReceiverScreen receiverScreen) {
    YesModule.RoutesMap.addAll({
      ReceiverRoutes.Receiver: (context) => receiverScreen
    });
  }
}