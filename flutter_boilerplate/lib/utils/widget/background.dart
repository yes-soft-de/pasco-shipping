import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
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
  int currentIndex;
  final bool isResultScreen;
  final bool isHome;
  ScrollController controller;
  final Function goBack;
  Background({required this.child,required this.title,  required this.currentIndex, required this.isResultScreen,required this.isHome ,required this.controller,required this.goBack});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
 GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

 @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: greyWithMoreOptic,
    key: globalKey,
    drawer: DrawerMenu(),
    body: SafeArea(
     child:widget.isResultScreen ? widget.child :
     SingleChildScrollView(
       child: Column(
         children: [
         Stack(
           children: [
             Container(
               height: MediaQuery.of(context).size.height * 0.08,
               color: greyWithOptic,
               child:  Padding(
                 padding: const EdgeInsetsDirectional.only(start: 20 ,end: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     IconButton(
                         icon: Icon(
                           Icons.menu,
                           color: white,
                         ),
                         onPressed: () {
                           globalKey.currentState!.openDrawer();
                         }),
                     Text(
                       widget.title,
                       style: white18text,
                     ),
                     widget.isHome ?Container(): InkWell(
                         onTap: (){
                          widget.goBack();
                         },
                         child: Icon(Icons.arrow_forward_ios , color: white,))
                   ],
                 ),
               ),
             ),

           ],
         ),
         SizedBox(
           height: 10,
         ),
         Image.asset(
           StaticImage.divider,
           width: MediaQuery.of(context).size.width,
         ),
         widget.child,
       ],),
     ),
    ),
    bottomNavigationBar: FloatingNavbar(
     selectedBackgroundColor: AppThemeDataService.AccentColor,
     onTap: (int val) {
     setState(() {
      if(val ==0 ){
       widget.currentIndex = val;
       Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.Home, (route) => false);
      }
      else if(val == 1){
       widget.currentIndex = val;
       Navigator.pushNamedAndRemoveUntil(context, NotificationRoutes.NOTIFICATION_SCREEN, (route) => false);
      }
      else if(val == 2){
        widget.currentIndex = val;
        Navigator.pushNamedAndRemoveUntil(context, ChatRoutes.chatRoute, (route) => false);
      }

     });
     },
     currentIndex: widget.currentIndex,

     items: [
      FloatingNavbarItem(icon: Icons.home, title: S.of(context).home),
      FloatingNavbarItem(icon: Icons.notifications_active_outlined, title: S.of(context).notification),
      FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: S.of(context).directSupport),
      // FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
     ],
    ),

    // extendBody: true,

   );
  }

 @override
  void initState() {
  super.initState();

 }
}
