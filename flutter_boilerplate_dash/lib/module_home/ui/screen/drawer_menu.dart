import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_chat/chat_routes.dart';
import 'package:pasco_shipping/module_client/client_routes.dart';
import 'package:pasco_shipping/module_container/container_routes.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container_specification/container_specification_routes.dart';
import 'package:pasco_shipping/module_countries/country_routes.dart';
import 'package:pasco_shipping/module_distributors/distributors_routes.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_home/model/drawer_model.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_product_category/product_routes.dart';
import 'package:pasco_shipping/module_product_sub_category/sub_product_routes.dart';
import 'package:pasco_shipping/module_proxies/proxies_routes.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/accepted_shipment_routes.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/waiting_shipment_routes.dart';
import 'package:pasco_shipping/module_sub_contract/subcontract_routes.dart';
import 'package:pasco_shipping/module_subcontract_services/sub_contract_service_routes.dart';
import 'package:pasco_shipping/module_suppliers/supplier_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/travel_routes.dart';
import 'package:pasco_shipping/module_unit/unit_routes.dart';
import 'package:pasco_shipping/module_warehouses/warehoue_routes.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
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
            accountName: Text('Sami'),
            accountEmail: Text('0955461489'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: white,
              child: Image.asset(
                StaticImage.userIcon2,
                height: 58,
              ),
            ),
          ),

          //shipment
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Shipment' ,style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text('Waiting Shipment'),
            leading: Icon(Icons.local_shipping_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: new Text('Sea shipment'),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text('in External Warehouse'),
                                  onTap: () {
                                    // AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',);
                                    Navigator.pushNamed(
                                        context, WaitingShipmentRoutes.VIEW_ALL  ,arguments: {'transportationType' : 'sea','isExternalWarehouse':true});
                                  }),
                              ListTile(
                                  title: new Text('in Local Warehouse'),
                                  onTap: () {
                                    // AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',);
                                    Navigator.pushNamed(
                                        context, WaitingShipmentRoutes.VIEW_ALL  ,arguments: {'transportationType' : 'air','isExternalWarehouse':false});
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: new Text('Air shipment'),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text('in External Warehouse'),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re});
                                  }),
                              ListTile(
                                  title: new Text('in Local Warehouse'),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re});
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text('Accepted Shipment'),
            leading: Icon(Icons.local_shipping_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text('Sea shipment'),
                        onTap: () {
                          AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',);
                          Navigator.pushNamed(
                              context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re});
                        }),
                    ListTile(
                        title: new Text('Air shipment'),
                        onTap: () {
                          AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',);
                          Navigator.pushNamed(
                              context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re});
                        }),
                  ],
                ),
              ),
            ],
          ),

          ExpansionTile(
            title: new Text('Arrived Shipment'),
            leading: Icon(Icons.local_shipping_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text('Sea shipment'),
                        onTap: () {
                          AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',status: 'arrived');
                          Navigator.pushNamed(
                              context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re});
                        }),
                    ListTile(
                        title: new Text('Air shipment'),
                        onTap: () {
                          AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',status: 'arrived');
                          Navigator.pushNamed(
                              context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re});
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text('Request shipment'),
            leading: Icon(Icons.add),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          Navigator.pushNamed(
                              context, NewShipmentRoutes.NEW_SHIPMENTS);
                        }),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),

          //holder
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Holder' ,style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text('Containers'),
            leading: Icon(Icons.inbox_outlined),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          ContainerFilterRequest re = ContainerFilterRequest(type: 'public');
                          Navigator.pushNamed(
                              context, ContainerRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ContainerRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text('Container Specification'),
            leading: Icon(Icons.filter_list),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ContainerSpecificationRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ContainerSpecificationRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),

          //travels
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Travels' ,style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text(S.of(context).travels),
            leading: Icon(Icons.travel_explore),
            children: <Widget>[
              ListTile(
                  title:Text('Sea Travel'),
                  onTap: () {
                    TravelFilterRequest re = TravelFilterRequest(type:'cruise');
                    Navigator.pushNamed(context, TravelRoutes.VIEW_ALL,
                        arguments: {'travelFilter': re});
                  }),
              ListTile(
                  title:Text(
                      'Air Travel'
                  ),
                  onTap: () {
                    TravelFilterRequest re = TravelFilterRequest(type:'flight');
                    Navigator.pushNamed(context, TravelRoutes.VIEW_ALL,
                        arguments: {'travelFilter': re});
                  }),
              ListTile(
                  title: new Text(
                      S.of(context).add
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, TravelRoutes.ADD_NEW,);
                  }),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),

          // /BasicInfo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Basic Info',style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text(S.of(context).countries),
            leading: Icon(Icons.location_city),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, CountryRoutes.All_COUNTRY);
                        }),
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          Navigator.pushNamed(
                              context, CountryRoutes.ADD_NEW_COUNTRY);
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
            title: new Text('Product Category'),
            leading: Icon(Icons.closed_caption_off),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text('Sub Product Category'),
            leading: Icon(Icons.closed_caption_off),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, SubProductRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          Navigator.pushNamed(
                              context, SubProductRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),

          //extensional
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Extensional Info',style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text(S.of(context).proxies),
            leading: Icon(Icons.portrait_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
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
            title: new Text(S.of(context).warehouses),
            leading: Icon(Icons.business),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(context, WarehouseRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, WarehouseRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(S.of(context).subcontractService),
            leading: Icon(Icons.design_services),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, SubContractServiceRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, SubContractServiceRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(S.of(context).subcontracts),
            leading: Icon(Icons.subtitles_outlined),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, SubcontractRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, SubcontractRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),

          //otherData
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Other Data',style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text(S.of(context).distributors),
            leading: Icon(Icons.support_agent),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, DistributorRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(
                          S.of(context).add,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, DistributorRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(S.of(context).suppliers),
            leading: Icon(Icons.present_to_all),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
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
          Divider(
            color: Colors.grey,
          ),

          //User
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Users',style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text('Clients'),
            leading: Icon(Icons.supervised_user_circle),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ClientRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ClientRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text('Employees'),
            leading: Icon(Icons.person),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, ClientRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, ClientRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text('Marks'),
            leading: Icon(Icons.note),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          Navigator.pushNamed(
                              context, MarkRoutes.mark);
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
              Navigator.pushNamedAndRemoveUntil(context, HomeRoutes.Home, (route) => false);
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
