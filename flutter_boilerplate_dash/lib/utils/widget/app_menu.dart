import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_home/ui/screen/home_screen.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_unit/unit_module.dart';
import 'package:pasco_shipping/module_unit/unit_routes.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/airwaybill_module.dart';
import 'package:pasco_shipping/module_airwaybill/airwaybill_routes.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_airwaybill_specification/airwaybill_specification_routes.dart';
import 'package:pasco_shipping/module_chat/chat_routes.dart';
import 'package:pasco_shipping/module_client/client_routes.dart';
import 'package:pasco_shipping/module_container/container_routes.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container_specification/container_specification_routes.dart';
import 'package:pasco_shipping/module_countries/country_routes.dart';
import 'package:pasco_shipping/module_distributors/distributors_routes.dart';
import 'package:pasco_shipping/module_employees/employee_routes.dart';
import 'package:pasco_shipping/module_employees/enums/employee_role.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_home/model/drawer_model.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_product_category/product_routes.dart';
import 'package:pasco_shipping/module_product_sub_category/sub_product_routes.dart';
import 'package:pasco_shipping/module_proxies/proxies_routes.dart';
import 'package:pasco_shipping/module_receiver/receiver_routes.dart';
import 'package:pasco_shipping/module_settings/setting_routes.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/accepted_shipment_routes.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/waiting_shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/waiting_shipment_routes.dart';
import 'package:pasco_shipping/module_sub_contract/subcontract_routes.dart';
import 'package:pasco_shipping/module_subcontract_services/sub_contract_service_routes.dart';
import 'package:pasco_shipping/module_suppliers/supplier_routes.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/travel_routes.dart';
import 'package:pasco_shipping/module_unit/unit_routes.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/service/warehouse_service.dart';
import 'package:pasco_shipping/module_warehouses/warehoue_routes.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

//a map of ("page name", WidgetBuilder) pairs
final _availablePages =   YesModule.RoutesMap;
// <String, WidgetBuilder>{
  // UnitModule : (_) =>
  // 'First Page': (_) => FirstPage(),
  // 'Second Page': (_) => SecondPage(),
  // 'home':(_) => HomeScreen();

// };

// make this a `StateProvider` so we can change its value
final selectedPageNameProvider = StateProvider<String>((ref) {
  // default value
  return _availablePages.keys.first;
});

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  // watch for state changes inside selectedPageNameProvider
  final selectedPageKey = ref.watch(selectedPageNameProvider).state;
  // return the WidgetBuilder using the key as index
  return _availablePages[selectedPageKey]!;
});

// 1. extend from ConsumerWidget
class AppMenu extends ConsumerWidget {
  void selectPage(BuildContext context, WidgetRef ref, String pageName) {
    print(pageName);
    if(kIsWeb){
      if (ref.read(selectedPageNameProvider).state != pageName) {
        print(pageName);
        ref.read(selectedPageNameProvider).state = pageName;
        // dismiss the drawer of the ancestor Scaffold if we have one
        if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
          Navigator.of(context).pop();
        }
      }
    }else{
      Navigator.pushNamed(context, pageName);
    }

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. watch the provider's state
    // final selectedPageName = ref.watch(selectedPageNameProvider).;
   List<String> role =  ConstVar.Roles;
    return Scaffold(
      // appBar: AppBar(title: Text(selectedPageName)),
      body: ListView(
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
            child: Text(S.of(context).shipment ,style: AppTextStyle.mediumDeepGrayBold,),
          ),
          (  ListEquality().equals ( role , EmployeeRoleName['Receiving Employee']) ||  ListEquality().equals ( role , EmployeeRoleName['Super Admin']) || ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee']))?
          ExpansionTile(
            title: new Text(S.of(context).waitingShipment),
            leading: Icon(Icons.local_shipping_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: new Text(S.of(context).seaShipment),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text(S.of(context).inExternalWarehouse),
                                  onTap: () {
                                    WaitingShipmentFilterRequest re = WaitingShipmentFilterRequest(transportationType: 'sea',isExternalWarehouse: true);
                                    Navigator.pushNamed(
                                        context, WaitingShipmentRoutes.VIEW_ALL  ,arguments: {'waitingFilter' : re});
                                  }),
                              ListTile(
                                  title: new Text(S.of(context).inLocalWarehouse),
                                  onTap: () {
                                    WaitingShipmentFilterRequest re = WaitingShipmentFilterRequest(transportationType: 'sea',isExternalWarehouse: false);
                                    Navigator.pushNamed(
                                        context, WaitingShipmentRoutes.VIEW_ALL  ,arguments: {'waitingFilter' : re});
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
                      title: new Text(S.of(context).airShipment),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text(S.of(context).inExternalWarehouse),
                                  onTap: () {
                                    WaitingShipmentFilterRequest re = WaitingShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: true);
                                    Navigator.pushNamed(
                                        context, WaitingShipmentRoutes.VIEW_ALL  ,arguments: {'waitingFilter' : re});
                                  }),
                              ListTile(
                                  title: new Text(S.of(context).inLocalWarehouse),
                                  onTap: () {
                                    WaitingShipmentFilterRequest re = WaitingShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: false);
                                    Navigator.pushNamed(
                                        context, WaitingShipmentRoutes.VIEW_ALL  ,arguments: {'waitingFilter' : re});
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
          ) :Container(),

          ( ListEquality().equals ( role , EmployeeRoleName['Receiving Employee']) ||  ListEquality().equals ( role , EmployeeRoleName['Super Admin']) || ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee']))?
          ExpansionTile(
            title: new Text(S.of(context).acceptedShipment),
            leading: Icon(Icons.local_shipping_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: new Text(S.of(context).seaShipment),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text(S.of(context).inExternalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea' ,isExternalWarehouse: true,acceptedUntilCleared: true);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re,'withFilter':false});
                                  }),
                              ListTile(
                                  title: new Text(S.of(context).inLocalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',isExternalWarehouse: false,acceptedUntilCleared: true );
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.SELECT_WAREHOUSE  ,arguments: {'filterRequest' : re,'withFilter':false});
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
                      title: new Text(S.of(context).airShipment),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text(S.of(context).inExternalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: true,acceptedUntilCleared: true);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re,'withFilter':false});
                                  }),
                              ListTile(
                                  title: new Text(S.of(context).inLocalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: false,acceptedUntilCleared: true);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.SELECT_WAREHOUSE  ,arguments: {'filterRequest' : re,'withFilter':false});
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
          ):Container(),

          ( ListEquality().equals ( role , EmployeeRoleName['Arriving Employee']) ||  ListEquality().equals ( role , EmployeeRoleName['Super Admin'])|| ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee']))?
          ExpansionTile(
            title: new Text(S.of(context).arrivedShipment),
            leading: Icon(Icons.local_shipping_rounded),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: new Text(S.of(context).seaShipment),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text(S.of(context).inExternalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea' ,isExternalWarehouse: true ,status: AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!,acceptedUntilCleared: false);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re ,'withFilter':false});
                                  }),
                              ListTile(
                                  title: new Text(S.of(context).inLocalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',isExternalWarehouse: false,status: AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!,acceptedUntilCleared: false);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.SELECT_WAREHOUSE  ,arguments: {'filterRequest' : re,'withFilter':false,'typeOfCountry':'import'});
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
                      title: new Text(S.of(context).airShipment),
                      // leading: Icon(Icons.sea),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                  title: new Text(S.of(context).inExternalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: true,status: AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!,acceptedUntilCleared: false);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re ,'withFilter':false});
                                  }),
                              ListTile(
                                  title: new Text(S.of(context).inLocalWarehouse),
                                  onTap: () {
                                    AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: false,status: AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!,acceptedUntilCleared: false);
                                    Navigator.pushNamed(
                                        context, AcceptedShipmentRoutes.SELECT_WAREHOUSE  ,arguments: {'filterRequest' : re,'withFilter':false,'typeOfCountry':'import'});
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
          ) : Container(),



          (ListEquality().equals ( role , EmployeeRoleName['Receiving Employee']) || ListEquality().equals ( role , EmployeeRoleName['Super Admin'])|| ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee'])) ?
          ExpansionTile(
            title: new Text(S.of(context).requestShipment),
            leading: Icon(Icons.add),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          Navigator.pushNamed(context, NewShipmentRoutes.NEW_SHIPMENTS);
                          // selectPage(context, ref, NewShipmentRoutes.NEW_SHIPMENTS);
                        }),
                  ],
                ),
              ),
            ],
          ) :Container(),
          Divider(
            color: Colors.grey,
          ),

          //holder
          (ListEquality().equals ( role , EmployeeRoleName['Receiving Employee']) || ListEquality().equals ( role , EmployeeRoleName['Super Admin']) ||ListEquality().equals ( role , EmployeeRoleName['Admin SubContract']) || ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee'])) ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).holder ,style: AppTextStyle.mediumDeepGrayBold,),
              ),
              ExpansionTile(
                title: new Text(S.of(context).containers),
                leading: Icon(Icons.inbox_outlined),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ListTile(
                            title: new Text(S.of(context).inExternalWarehouse),
                            onTap: () {
                              Navigator.pushNamed(context, ContainerRoutes.VIEW_ALL ,arguments: {'isExternalWarehouse' : true});
                              // selectPage(context, ref, ContainerRoutes.VIEW_ALL ,ar);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).inLocalWarehouse,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, ContainerRoutes.VIEW_ALL ,arguments: {'isExternalWarehouse' : false});
                              // selectPage(context, ref, ContainerRoutes.VIEW_ALL);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: new Text(S.of(context).airWaybills),
                leading: Icon(Icons.inbox_outlined),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ListTile(
                            title: new Text(S.of(context).inExternalWarehouse),
                            onTap: () {
                              Navigator.pushNamed(context, AirwaybillRoutes.VIEW_ALL ,arguments: {'isExternalWarehouse':true});
                              // selectPage(context, ref, AirwaybillRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).inLocalWarehouse,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, AirwaybillRoutes.VIEW_ALL ,arguments: {'isExternalWarehouse' : false});
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ) :Container(),



          //Specification
          // (ListEquality().equals ( role , EmployeeRoleName['Admin Data Entry']) || ListEquality().equals ( role , EmployeeRoleName['Super Admin']))?
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     ExpansionTile(
          //       title: new Text(S.of(context).airwaybillSpecification),
          //       leading: Icon(Icons.filter_list),
          //       children: <Widget>[
          //         Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: Column(
          //             children: [
          //               ListTile(
          //                   title: new Text(S.of(context).view),
          //                   onTap: () {
          //                     selectPage(context, ref, AirwaybillSpecificationRoutes.VIEW_ALL);
          //
          //                   }),
          //               ListTile(
          //                   title: new Text(
          //                     S.of(context).add,
          //                   ),
          //                   onTap: () {
          //                     selectPage(context, ref, AirwaybillSpecificationRoutes.ADD_NEW);
          //                   }),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //     ExpansionTile(
          //       title: new Text(S.of(context).containerSpecification),
          //       leading: Icon(Icons.filter_list),
          //       children: <Widget>[
          //         Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: Column(
          //             children: [
          //               ListTile(
          //                   title: new Text(S.of(context).view),
          //                   onTap: () {
          //                     selectPage(context, ref, ContainerSpecificationRoutes.VIEW_ALL);
          //                   }),
          //               ListTile(
          //                   title: new Text(
          //                     S.of(context).add,
          //                   ),
          //                   onTap: () {
          //                     selectPage(context, ref, ContainerSpecificationRoutes.ADD_NEW);
          //                   }),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ) : Container(),


          Divider(
            color: Colors.grey,
          ),

          //travels
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(S.of(context).travels ,style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text(S.of(context).travels),
            leading: Icon(Icons.travel_explore),
            children: <Widget>[
              ListTile(
                  title:Text(S.of(context).seaTravel),
                  onTap: () {
                    TravelFilterRequest re = TravelFilterRequest(type:'cruise',status: TravelStatusName[TravelStatus.NotReleased]??'');
                    Navigator.pushNamed(context, TravelRoutes.VIEW_ALL,
                        arguments: {'travelFilter': re});
                  }),
              ListTile(
                  title:Text(
                      S.of(context).airTravel
                  ),
                  onTap: () {
                    TravelFilterRequest re = TravelFilterRequest(type:'flight',status: TravelStatusName[TravelStatus.NotReleased]??'');
                    Navigator.pushNamed(context, TravelRoutes.VIEW_ALL,
                        arguments: {'travelFilter': re});
                  }),

              (ListEquality().equals ( role , EmployeeRoleName['Admin Data Entry']) || ListEquality().equals ( role , EmployeeRoleName['Super Admin']) || ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee']) )?
              ListTile(
                  title: new Text(
                      S.of(context).add
                  ),
                  onTap: () {
                    selectPage(context, ref, TravelRoutes.ADD_NEW);
                  }) : Container(),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),

          //reports
          (ListEquality().equals ( role , EmployeeRoleName['Admin Report']) || ListEquality().equals ( role , EmployeeRoleName['Super Admin'])|| ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee']))?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).reports ,style: AppTextStyle.mediumDeepGrayBold,),
              ),
              ExpansionTile(
                title: new Text(S.of(context).localShipmentReport),
                leading: Icon(Icons.task_alt),
                children: <Widget>[
                  ListTile(
                      title:Text(S.of(context).seaShipment),
                      onTap: () {
                        AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',isExternalWarehouse: false,acceptedUntilCleared: false);
                        Navigator.pushNamed(
                            context, AcceptedShipmentRoutes.SELECT_WAREHOUSE  ,arguments: {'filterRequest' : re,'withFilter':true});
                      }),
                  ListTile(
                      title:Text(
                          S.of(context).airShipment
                      ),
                      onTap: () {
                        AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: false,acceptedUntilCleared: false);
                        Navigator.pushNamed(
                            context, AcceptedShipmentRoutes.SELECT_WAREHOUSE  ,arguments: {'filterRequest' : re,'withFilter':true});
                      }),
                ],
              ),

              ExpansionTile(
                title: new Text(S.of(context).externalShipmentReport),
                leading: Icon(Icons.task_sharp),
                children: <Widget>[
                  ListTile(
                      title:Text(S.of(context).seaShipment),
                      onTap: () {
                        AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'sea',isExternalWarehouse: true,acceptedUntilCleared: false);
                        Navigator.pushNamed(
                            context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re,'withFilter':true});
                      }),
                  ListTile(
                      title:Text(
                          S.of(context).airShipment
                      ),
                      onTap: () {
                        AcceptedShipmentFilterRequest re = AcceptedShipmentFilterRequest(transportationType: 'air',isExternalWarehouse: true,acceptedUntilCleared: false);
                        Navigator.pushNamed(
                            context, AcceptedShipmentRoutes.VIEW_ALL  ,arguments: {'filterRequest' : re,'withFilter':true});
                      }),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ) :Container(),


          // /BasicInfo
          (ListEquality().equals ( role , EmployeeRoleName['Admin Data Entry']) || ListEquality().equals ( role , EmployeeRoleName['Super Admin'])|| ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee']))?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).basicInfo,style: AppTextStyle.mediumDeepGrayBold,),
              ),
              ExpansionTile(
                title: new Text(S.of(context).airwaybillSpecification),
                leading: Icon(Icons.filter_list),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ListTile(
                            title: new Text(S.of(context).view),
                            onTap: () {
                              selectPage(context, ref, AirwaybillSpecificationRoutes.VIEW_ALL);

                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref, AirwaybillSpecificationRoutes.ADD_NEW);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: new Text(S.of(context).containerSpecification),
                leading: Icon(Icons.filter_list),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ListTile(
                            title: new Text(S.of(context).view),
                            onTap: () {
                              selectPage(context, ref, ContainerSpecificationRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref, ContainerSpecificationRoutes.ADD_NEW);
                            }),
                      ],
                    ),
                  ),
                ],
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
                              selectPage(context, ref, CountryRoutes.All_COUNTRY);

                            }),
                        ListTile(
                            title: new Text(S.of(context).add),
                            onTap: () {
                              selectPage(context, ref, CountryRoutes.ADD_NEW_COUNTRY);
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
                              selectPage(context, ref, UnitRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref, UnitRoutes.ADD_NEW);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: new Text(S.of(context).category),
                leading: Icon(Icons.closed_caption_off),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    child: Column(
                      children: [
                        ListTile(
                            title: new Text(S.of(context).view),
                            onTap: () {
                              selectPage(context, ref, ProductRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(S.of(context).add),
                            onTap: () {
                              selectPage(context, ref, ProductRoutes.ADD_NEW);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: new Text(S.of(context).subCategory),
                leading: Icon(Icons.closed_caption_off),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    child: Column(
                      children: [
                        ListTile(
                            title: new Text(S.of(context).view),
                            onTap: () {
                              selectPage(context, ref, SubProductRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(S.of(context).add),
                            onTap: () {
                              selectPage(context, ref, SubProductRoutes.ADD_NEW);
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
                child: Text(S.of(context).extensionalInfo,style: AppTextStyle.mediumDeepGrayBold,),
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
                              selectPage(context, ref,ProxyRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref,ProxyRoutes.ADD_NEW);
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
                              selectPage(context, ref, WarehouseRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref, WarehouseRoutes.ADD_NEW);
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
                              selectPage(context, ref, SubContractServiceRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref, SubContractServiceRoutes.ADD_NEW);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: new Text(S.of(context).subcontract),
                leading: Icon(Icons.subtitles_outlined),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ListTile(
                            title: new Text(S.of(context).view),
                            onTap: () {
                              selectPage(context, ref, SubcontractRoutes.VIEW_ALL);
                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref, SubcontractRoutes.ADD_NEW);

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
                child: Text(S.of(context).otherData,style: AppTextStyle.mediumDeepGrayBold,),
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
                              selectPage(context, ref, DistributorRoutes.VIEW_ALL);

                            }),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              selectPage(context, ref, DistributorRoutes.ADD_NEW);
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
                            onTap: () =>
                              selectPage(context, ref, SupplierRoutes.VIEW_ALL),
                              // Navigator.pushNamed(context, SupplierRoutes.VIEW_ALL);
                            ),
                        ListTile(
                            title: new Text(
                              S.of(context).add,
                            ),
                            onTap: () {
                              print('adddddddd');
                              selectPage(context, ref, SupplierRoutes.ADD_NEW);
                              // Navigator.pushNamed(context, SupplierRoutes.ADD_NEW);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
            ],) : Container(),


          //User
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(S.of(context).users,style: AppTextStyle.mediumDeepGrayBold,),
          ),
          ExpansionTile(
            title: new Text(S.of(context).clients),
            leading: Icon(Icons.supervised_user_circle),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          selectPage(context, ref, ClientRoutes.VIEW_ALL);
                        }),
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          selectPage(context, ref, ClientRoutes.ADD_NEW);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(S.of(context).employees),
            leading: Icon(Icons.person),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).view),
                        onTap: () {
                          selectPage(context, ref, EmployeeRoutes.VIEW_ALL);
                        }),
                    (ListEquality().equals ( role , EmployeeRoleName['HR employee']) ||ListEquality().equals ( role , EmployeeRoleName['Super Admin'])|| ListEquality().equals ( role , EmployeeRoleName['Admin']) || ListEquality().equals ( role , EmployeeRoleName['Super employee']) )?
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          selectPage(context, ref, EmployeeRoutes.ADD_NEW);
                        }) :Container(),
                  ],
                ),
              ),
            ],
          ),

          ExpansionTile(
            title: new Text(S.of(context).marks),
            leading: Icon(Icons.note),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          selectPage(context, ref, MarkRoutes.mark);
                        }),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: new Text(S.of(context).receiver),
            leading: Icon(Icons.note),
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  children: [
                    ListTile(
                        title: new Text(S.of(context).add),
                        onTap: () {
                          selectPage(context, ref, ReceiverRoutes.receiver);
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
              selectPage(context, ref, HomeRoutes.Home);
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
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              selectPage(context, ref, SettingRoutes.ROUTE_SETTINGS);
            },
            title: Text(S.of(context).setting),
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
    Key? key,
    this.selectedPageName,
    required this.pageName,
    this.onPressed,
  }) : super(key: key);
  final String? selectedPageName;
  final String pageName;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      leading: Opacity(
        opacity: selectedPageName == pageName ? 1.0 : 0.0,
        child: Icon(Icons.check),
      ),
      title: Text(pageName),
      onTap: onPressed,
    );
  }
}
