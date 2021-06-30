import 'dart:async';
import 'dart:io';
import 'package:analyzer_plugin/protocol/protocol.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/di/di_config.dart';
import 'package:pasco_shipping/module_auth/authoriazation_module.dart';
import 'package:pasco_shipping/module_chat/chat_module.dart';
import 'package:pasco_shipping/module_home/home_module.dart';
import 'package:pasco_shipping/module_intro/intro_module.dart';
import 'package:pasco_shipping/module_intro/ui/intro_screen/intro_screen.dart';
import 'package:pasco_shipping/module_localization/service/localization_service/localization_service.dart';
import 'package:pasco_shipping/module_mark/mark_module.dart';
import 'package:pasco_shipping/module_notifications/model/notification_model.dart';
import 'package:pasco_shipping/module_notifications/notification_module.dart';
import 'package:pasco_shipping/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:pasco_shipping/module_profile/profile_module.dart';
import 'package:pasco_shipping/module_settings/settings_module.dart';
import 'package:pasco_shipping/module_shipment_track/tracking_module.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/logger/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'module_intro/intro_routes.dart';
import 'module_notifications/service/local_notification_service/local_notification_service.dart';
import 'module_shipment_previous/shipment_previous_module.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'module_shipment_request/shipment_request_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = (FlutterErrorDetails details) {
    FirebaseCrashlytics.instance.recordFlutterError(details);
  };

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZoned<Future<void>>(() async {
      configureDependencies();
      // Your App Here
      runApp(getIt<MyApp>());
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
  final LocalNotificationService _localNotificationService;
  // final SplashModule _splashModule;
  final AuthorizationModule _authorizationModule;
  final SettingsModule _settingsModule;
  final ChatModule _chatModule;
  final HomeModule _homeModule;
  final IntroModule _introModule;
  final PreviousShipmentsModule _previousShipmentsModule;
  final ProfileModule _profileModule;
  final MarkModule _markModule;
  final NotificationModule _notificationModule;
  final NewShipmentsModule _newShipmentsModule;
  final TrackingModule _trackingModule;

  MyApp(
      this._themeDataService,
      this._localizationService,
      this._fireNotificationService,
      this._localNotificationService,
      this._introModule,
      this._authorizationModule,
      this._chatModule,
      this._settingsModule,
      this._homeModule,
      this._previousShipmentsModule,
      this._profileModule,
      this._markModule,
      this._notificationModule,
      this._newShipmentsModule,
      this._trackingModule
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
  @override
  void initState() {
    super.initState();
    widget._fireNotificationService.init();
    widget._localNotificationService.init();
    widget._localizationService.localizationStream.listen((event) {
      timeago.setDefaultLocale(event);
      setState(() {});
    });
    widget._fireNotificationService.onNotificationStream.listen((event) {
      widget._localNotificationService.showNotification(event);
    });
    widget._localNotificationService.onLocalNotificationStream
        .listen((event) {});

    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: Scaffold(),
      future: getConfiguratedApp(YesModule.RoutesMap),
      builder: (BuildContext context, AsyncSnapshot<Widget> scaffoldSnapshot) {
        return scaffoldSnapshot.data!;
      },
    );
  }

  Future<Widget> getConfiguratedApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) async {
    var activeLanguage = await widget._localizationService.getLanguage();
    var theme = await widget._themeDataService.getActiveTheme();
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
      title: 'pasco-shipping',
      routes: fullRoutesList,
      initialRoute: IntroRoutes.INTRO_SCREEN,
    );
  }
}
