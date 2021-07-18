import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_chat/chat_routes.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_home/ui/screen/drawer_menu.dart';
import 'package:pasco_shipping/module_home/ui/screen/home_screen.dart';
import 'package:pasco_shipping/module_notifications/notification_module.dart';
import 'package:pasco_shipping/module_notifications/notification_routes.dart';
import 'package:pasco_shipping/module_profile/service/profile_service.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
class Background extends StatefulWidget {
 final Widget child;
 final String title;
 //  int currentIndex;
 //  final bool isResultScreen;
 //  final bool isHome;
 //  ScrollController controller;
  final Function goBack;
  Background({required this.child, required this.title, required this.goBack});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
 GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

 @override
  Widget build(BuildContext context) {
   return Scaffold(
    key: globalKey,
    appBar: AppBar(title: Text(widget.title)),
    drawer: DrawerMenu(),
    body: SafeArea(
     child:widget.child
    ),
   );
  }

 @override
  void initState() {
  super.initState();

 }
}
