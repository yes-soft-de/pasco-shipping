import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_notifications/model/notification_model.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel model;
  const NotificationCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.notifications_active_outlined ,color: white,),
                title: Text('2020.05.01', style: white18text,),
                subtitle: Text(model.body.toString() , style: White14text,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
