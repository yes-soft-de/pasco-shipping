import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_chat/chat_routes.dart';
import 'package:pasco_shipping/module_home/presistance/profile_prefs_helper.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';
import 'package:pasco_shipping/module_profile/service/profile_service.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/loding_indecator.dart';

class DrawerMenu extends StatefulWidget {
   DrawerMenu();

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
    late  ProfileModel model;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
        color: greyWhite,
         child: ListView(
         padding: EdgeInsets.all(0.0),
         shrinkWrap: true,
         children: <Widget>[
           UserAccountsDrawerHeader(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage(StaticImage.intro),
                 fit: BoxFit.cover,
               ),
               color: Colors.grey[700]!.withOpacity(0.9),
             ),
             arrowColor: AppThemeDataService.AccentColor,
             accountName: Text(model.userName??''),
             accountEmail:  Text(model.country??''),
             // currentAccountPicture: CircleAvatar(
             //   backgroundColor: white,
             //   child: Image.network(model.image! , height: 58,),
             // ),
           ),
           ListTile(
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
             },
             title: Text(S.of(context).home),
             leading: Icon(Icons.home),
           ),
           Divider(
             color: Colors.grey,
           ),
           ListTile(
             onTap: () {
               Navigator.pushNamedAndRemoveUntil(context, ChatRoutes.chatRoute, (route) => false);
             },
             title: Text(S.of(context).directSupport),
             leading: Icon(Icons.phone_in_talk),
           ),
           ListTile(
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
             },
             title: Text(S.of(context).contactInfo),
             leading: Icon(Icons.phone_android_outlined),
           ),
           ListTile(
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
             },
             title: Text(S.of(context).aboutUs),
             leading: Icon(Icons.info_outlined),
           ),
           ListTile(
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
             },
             title: Text(S.of(context).privacy),
             leading: Icon(Icons.local_police_outlined),
           ),
           ListTile(
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
             },
             title: Text(S.of(context).termOfService),
             leading: Icon(Icons.policy_outlined),
           ),
           Divider(
             color: Colors.grey,
           ),
           ListTile(
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
             },
             title: Text(S.of(context).setting),
             leading: Icon(Icons.settings),
           ),
           ListTile(
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
             },
             title: Text(S.of(context).logout),
             leading: Icon(Icons.logout),
           ),

         ],
          ),
    ));
  }

  @override
  void initState() {
    super.initState();
    model = ProfileModel();
    getPro();
  }

  void getPro()async{
   await getProfile().then((value){
     model = value!;
    });
  }
}