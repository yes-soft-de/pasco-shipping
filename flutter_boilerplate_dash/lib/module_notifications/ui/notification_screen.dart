import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_notifications/model/notification_model.dart';
import 'package:pasco_shipping/module_notifications/ui/widget/notif_card.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class NotificationScreen extends StatefulWidget {
  // const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController controller = ScrollController();

  List<NotificationModel> model= [
    NotificationModel(1, "Shipment Arrival", "The flight containing your shipment has arrived at the port of the target city", "payLoad"),
    NotificationModel(1, "Shipment Arrival", "Your order has been accepted", "payLoad"),
    NotificationModel(1, "Shipment Arrival", "Your query has been answered", "payLoad"),
  ];
  @override
  Widget build(BuildContext context) {
    return Background(
      showFilter: false,
      goBack: (){
        Navigator.pop(context);
      },
      // controller: controller,
      // isHome: true,
      child: Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context , index){
        return NotificationCard(model: model[index]);
      },
      itemCount: model.length,
      ),
    ), title:  S.of(context).notification
      // ,currentIndex: 1,      isResultScreen: false,
    );
  }
}
