import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_chat/chat_routes.dart';
import 'package:pasco_shipping/module_employees/enums/employee_role.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_home/presistance/profile_prefs_helper.dart';
import 'package:pasco_shipping/module_home/ui/screen/drawer_menu.dart';
import 'package:pasco_shipping/module_home/ui/screen/home_screen.dart';
import 'package:pasco_shipping/module_notifications/notification_module.dart';
import 'package:pasco_shipping/module_notifications/notification_routes.dart';
import 'package:pasco_shipping/module_profile/service/profile_service.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/split_view.dart';

import 'app_menu.dart';
//
// class Background extends StatefulWidget {
//   final Widget child;
//   final String title;
//   final bool showFilter;
//   //  int currentIndex;
//   //  final bool isResultScreen;
//   //  final bool isHome;
//   //  ScrollController controller;
//   final Function goBack;
//   Background(
//       {
//         required this.child,
//       required this.title,
//       required this.goBack,
//       required this.showFilter,
//       });
//
//   @override
//   _BackgroundState createState() => _BackgroundState();
// }
//
// class _BackgroundState extends State<Background> {
//   // GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//     // key: globalKey,
//     appBar: AppBar(title: Text(widget.title)),
//     drawer: DrawerMenu(ConstVar.Roles),
//     floatingActionButton:widget.showFilter ? FloatingActionButton(onPressed: () { widget.goBack(); },child: Icon(Icons.filter_list_alt ,color: Colors.white,),) :Container(),
//     body: SafeArea(
//      child:widget.child
//     ),
//    );
//   }
//
//   @override
//   void initState() {
//   super.initState();
//  }
// }



class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.title,
    // this.actions = const [],
    this.child,
   required this.showFilter,
   required this.goBack,
    // this.floatingActionButton,
  }) : super(key: key);
  final String title;
  final bool showFilter;
  final Function goBack;
  // final List<Widget> actions;
  final Widget? child;
  // final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    // 1. look for an ancestor Scaffold
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return  Scaffold(
        appBar: AppBar(
          // 3. add a non-null leading argument if we have a drawer
          leading: hasDrawer
              ? IconButton(
            icon: Icon(Icons.menu),
            // 4. open the drawer if we have one
            onPressed:
            hasDrawer ? () => ancestorScaffold!.openDrawer() : null,
          )
              : null,
          actions: [
            InkWell(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.controller, (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10,start: 10),
                  child: Icon(Icons.home),
                ))
          ],
          title: Text(title),
          // actions: actions,
        ),
        body: child,
      floatingActionButton:showFilter ? FloatingActionButton(onPressed: () { goBack(); },child: Icon(Icons.filter_list_alt ,color: Colors.white,),) :Container() );
  }
}
