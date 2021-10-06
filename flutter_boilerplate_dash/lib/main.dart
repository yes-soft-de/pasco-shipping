import 'dart:async';
import 'dart:io';
import 'package:analyzer_plugin/protocol/protocol.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/di/di_config.dart';
import 'package:pasco_shipping/module_airwaybill_specification/airwaybill_specification_module.dart';
import 'package:pasco_shipping/module_auth/authoriazation_module.dart';
import 'package:pasco_shipping/module_chat/chat_module.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_edit_shipment/edit_shipment_module.dart';
import 'package:pasco_shipping/module_harbor/harbor_module.dart';
import 'package:pasco_shipping/module_home/home_module.dart';
import 'package:pasco_shipping/module_localization/service/localization_service/localization_service.dart';
import 'package:pasco_shipping/module_mark/mark_module.dart';
import 'package:pasco_shipping/module_my_shipment/my_shipment_module.dart';
import 'package:pasco_shipping/module_notifications/model/notification_model.dart';
import 'package:pasco_shipping/module_notifications/notification_module.dart';
import 'package:pasco_shipping/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:pasco_shipping/module_profile/profile_module.dart';
import 'package:pasco_shipping/module_settings/settings_module.dart';
import 'package:pasco_shipping/module_shipment_track/tracking_module.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/accepted_shipment_module.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/waiting_shipment_module.dart';
import 'package:pasco_shipping/module_shipper/shipper_module.dart';
import 'package:pasco_shipping/module_splash/splash_routes.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_subcontract_services/sub_contract_service_module.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/travel_module.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/warehouse_module.dart';
import 'package:pasco_shipping/utils/logger/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'hive/hive_init.dart';
import 'module_airwaybill/airwaybill_module.dart';
import 'module_auth/authorization_routes.dart';
import 'module_client/client_module.dart';
import 'module_container/container_module.dart';
import 'module_container_specification/container_specification_module.dart';
import 'module_countries/country_module.dart';
import 'module_distributors/distributors_module.dart';
import 'module_employees/employe_module.dart';
import 'module_notifications/service/local_notification_service/local_notification_service.dart';
import 'module_price/price_module.dart';
import 'module_product_category/product_module.dart';
import 'module_product_sub_category/sub_product_module.dart';
import 'module_proxies/proxies_module.dart';
import 'module_receiver/recevier_module.dart';
import 'module_shifting_shipment/shifting_module.dart';
import 'module_shipment_previous/shipment_previous_module.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'module_shipment_request/shipment_request_module.dart';
import 'module_splash/splash_module.dart';
import 'module_sub_contract/subcontract_module.dart';
import 'module_suppliers/supplier_module.dart';
import 'module_unit/unit_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  await Firebase.initializeApp();
  await HiveSetUp.init();

  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FirebaseCrashlytics.instance.recordFlutterError(details);
  // };

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZoned<Future<void>>(() async {
      configureDependencies();
      // Your App Here
      runApp(ProviderScope(child: getIt<MyApp>()));
    }, onError: (error, stackTrace) {
      new Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  final FireNotificationService _fireNotificationService;
  // final LocalNotificationService _localNotificationService;
  final HomeModule _homeModule;
  final SplashModule _splashModule;
  final AuthorizationModule _authorizationModule;
  final SettingsModule _settingsModule;
  final ChatModule _chatModule;

  // final PreviousShipmentsModule _previousShipmentsModule;
  final ProfileModule _profileModule;
  final MarkModule _markModule;
  final NotificationModule _notificationModule;
  final NewShipmentsModule _newShipmentsModule;
  final TrackingModule _trackingModule;
  // final MyShipmentModule _myShipmentModule;
  final EditShipmentModule _editShipmentModule;

  final CountryModule _countryModule;
  final DistributorsModule _distributorsModule;
  final ProxiesModule _proxiesModule;
  final SupplierModule _supplierModule;
  final SubcontractModule _subcontractModule;
  final SubContractServiceModule _contractServiceModule;
  final UnitModule _unitModule;
  final TravelModule _travelModule;

  final ContainerModule _containerModule;
  final AirwaybillModule _airwaybillModule;
  final ContainerSpecificationModule _containerSpecificationModule;
  final AirwaybillSpecificationModule _airwaybillSpecificationModule;

  final WaitingShipmentModule _waitingShipmentModule;
  final AcceptedShipmentModule _acceptedShipmentModule;

  final ClientModule _clientModule;
  final ProductModule _productModule;
  final SubProductModule _subProductModule;

  final WarehouseModule _warehouseModule;

  final ReceiverModule _receiverModule;
  final EmployeeModule _employeeModule;

  final HarborModule _harborModule;
  final ShipperModule _shipperModule;
  final PriceModule _priceModule;

  final ShiftingModule _shiftingModule;


  MyApp(
      this._themeDataService,
      this._localizationService,
      this._fireNotificationService,
      // this._localNotificationService,
      this._homeModule,
      this._splashModule,
      this._authorizationModule,
      this._chatModule,
      this._settingsModule,

      // this._previousShipmentsModule,
      this._profileModule,
      this._markModule,
      this._notificationModule,
      this._newShipmentsModule,
      this._trackingModule,
      // this._myShipmentModule,
      this._editShipmentModule,

      this._countryModule,
      this._distributorsModule,
      this._proxiesModule,
      this._supplierModule,
      this._contractServiceModule,
      this._subcontractModule,
      this._unitModule,
      this._travelModule,
      this._containerModule,
      this._airwaybillModule,
      this._containerSpecificationModule,
      this._airwaybillSpecificationModule,

      this._waitingShipmentModule,
      this._acceptedShipmentModule,
      this._clientModule,
      this._productModule,
      this._subProductModule,
      this._warehouseModule,
      this._receiverModule,
      this._employeeModule,

      this._harborModule,
      this._shipperModule,
      this._priceModule,
      this._shiftingModule
      );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  //Initialisation of local notification

  //end
  late String lang;
  late ThemeData activeTheme;
  bool authorized = false;
  late StreamSubscription streamSubscription;
  var activeLanguage;
  var theme;
  @override
  void initState() {
    super.initState();
    widget._fireNotificationService.init();
    // widget._localNotificationService.init();
    widget._localizationService.localizationStream.listen((event) {
      timeago.setDefaultLocale(event);
      setState(() {});
    });
    // widget._fireNotificationService.onNotificationStream.listen((event) {
    //   widget._localNotificationService.showNotification(event);
    // });
    // widget._localNotificationService.onLocalNotificationStream
    //     .listen((event) {});

    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
    // initS();
  }

  // initS()async {
  //    activeLanguage = await widget._localizationService.getLanguage();
  //    theme = await widget._themeDataService.getActiveTheme();
  // }
  @override
  Widget build(BuildContext context) {
    return getConfiguratedApp(YesModule.RoutesMap);
  }

  Widget getConfiguratedApp(
      Map<String, WidgetBuilder> fullRoutesList,
      ) {
    var activeLanguage = widget._localizationService.getLanguage();
    var theme = widget._themeDataService.getActiveTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      locale: Locale.fromSubtags(
        languageCode: activeLanguage,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,

        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Pasco-Dash',
      routes: fullRoutesList,
      initialRoute: SplashRoutes.SPLASH_SCREEN,
    );
  }
}
