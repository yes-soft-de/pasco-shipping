import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_chat/chat_routes.dart';
import 'package:pasco_shipping/module_countries/country_routes.dart';
import 'package:pasco_shipping/module_distributors/distributors_routes.dart';
import 'package:pasco_shipping/module_home/model/drawer_model.dart';
import 'package:pasco_shipping/module_proxies/proxies_routes.dart';
import 'package:pasco_shipping/module_sub_contract/subcontract_routes.dart';
import 'package:pasco_shipping/module_subcontract_services/sub_contract_service_routes.dart';
import 'package:pasco_shipping/module_suppliers/supplier_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_unit/unit_routes.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';

class DrawerMenu extends StatelessWidget {
  // final ProfileModel model;
  const DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.white,
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
              color: Colors.grey.withOpacity(0.9),
            ),
            arrowColor: AppThemeDataService.AccentColor,
            accountName: Text('Rahaf'),
            accountEmail: Text('0955461'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: white,
              child: Image.asset(
                StaticImage.userIcon2,
                height: 58,
              ),
            ),
          ),

          ExpansionTile(
            title: new Text(
              S.of(context).countries
            ),
            leading: Icon(Icons.location_city),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                         S.of(context).view
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, CountryRoutes.All_COUNTRY);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, CountryRoutes.ADD_NEW_COUNTRY);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(
             S.of(context).distributors
            ),
            leading: Icon(Icons.support_agent),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                          S.of(context).view
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, DistributorRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, DistributorRoutes.ADD_NEW);

                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(
             S.of(context).proxies
            ),
            leading: Icon(Icons.portrait_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                          S.of(context).view
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, ProxyRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, ProxyRoutes.ADD_NEW);

                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(
                S.of(context).suppliers
            ),
            leading:  Icon(Icons.present_to_all),

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                            S.of(context).view
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SupplierRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SupplierRoutes.ADD_NEW);

                        }),
                  ],
                ),
              ),
            ],
          ),


          ExpansionTile(
            title: new Text(
                S.of(context).subcontracts
            ),
            leading:  Icon(Icons.subtitles_outlined),

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                            S.of(context).view
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SubcontractRoutes.VIEW_ALL)        ;
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SubcontractRoutes.ADD_NEW)        ;

                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(
                S.of(context).subcontractService
            ),
            leading:  Icon(Icons.design_services),

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                            S.of(context).view
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SubContractServiceRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, SubContractServiceRoutes.ADD_NEW);

                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(
                S.of(context).units
            ),
            leading:  Icon(Icons.category),

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                            S.of(context).view
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, UnitRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, UnitRoutes.ADD_NEW);

                        }),
                  ],
                ),
              ),
            ],
          ),

          ExpansionTile(
            title: new Text(
             S.of(context).warehouses
            ),
            leading:  Icon(Icons.business),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(
                          S.of(context).view
                        ),
                        onTap: () {
                          // _openWebUrl(Websites.endpoints[content], content);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          // _openWebUrl(Websites.endpoints[content], content);
                        }),
                  ],
                ),
              ),
            ],
          ),




          Divider(
            color: Colors.grey,
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
              Navigator.pushNamedAndRemoveUntil(
                  context, ChatRoutes.chatRoute, (route) => false);
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
}
