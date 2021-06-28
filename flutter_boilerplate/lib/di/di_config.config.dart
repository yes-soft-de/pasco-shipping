// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i69;
import '../module_auth/authoriazation_module.dart' as _i61;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i32;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i25;
import '../module_auth/service/auth_service/auth_service.dart' as _i33;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i34;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i39;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i42;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i51;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i55;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i62;
import '../module_chat/chat_module.dart' as _i46;
import '../module_chat/manager/chat/chat_manager.dart' as _i45;
import '../module_chat/repository/chat/chat_repository.dart' as _i35;
import '../module_chat/service/chat/char_service.dart' as _i47;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i4;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i36;
import '../module_home/home_module.dart' as _i26;
import '../module_home/ui/screen/home_screen.dart' as _i5;
import '../module_home/ui/screen/mainNavigation.dart' as _i11;
import '../module_intro/intro_module.dart' as _i27;
import '../module_intro/ui/intro_screen/intro_screen.dart' as _i6;
import '../module_intro/ui/welcome_screen/welcome_screen.dart' as _i22;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i52;
import '../module_mark/mark_module.dart' as _i68;
import '../module_mark/repository/mark_repository.dart' as _i40;
import '../module_mark/service/mark_service.dart' as _i53;
import '../module_mark/state_manager/mark_state_manager.dart' as _i54;
import '../module_mark/ui/mark_screen.dart' as _i64;
import '../module_network/http_client/http_client.dart' as _i23;
import '../module_notifications/notification_module.dart' as _i28;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i41;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i48;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_profile/profile_module.dart' as _i30;
import '../module_profile/ui/profile_screen.dart' as _i14;
import '../module_report/manager/report_manager.dart' as _i56;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i43;
import '../module_report/service/report_service.dart' as _i57;
import '../module_settings/settings_module.dart' as _i67;
import '../module_settings/ui/settings_page/settings_page.dart' as _i59;
import '../module_shipment_previous/shipment_previous_module.dart' as _i29;
import '../module_shipment_previous/ui/screen/result_tarcking_screen.dart'
    as _i16;
import '../module_shipment_previous/ui/screen/review_request_shipp.dart'
    as _i17;
import '../module_shipment_previous/ui/screen/shipment_previous_screen.dart'
    as _i18;
import '../module_shipment_previous/ui/screen/shipment_tracking_screen.dart'
    as _i19;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i49;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i37;
import '../module_shipment_request/service/product_category_service/product_category_service.dart'
    as _i50;
import '../module_shipment_request/shipment_request_module.dart' as _i66;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i58;
import '../module_shipment_request/ui/screen/first_option.dart' as _i63;
import '../module_shipment_request/ui/screen/new_shipment_request.dart' as _i65;
import '../module_splash/splash_module.dart' as _i60;
import '../module_splash/ui/screen/splash_screen.dart' as _i44;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i20;
import '../module_theme/service/theme_service/theme_service.dart' as _i24;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i31;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i21;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i38;
import '../utils/logger/logger.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.ChatScreen>(() => _i4.ChatScreen());
  gh.factory<_i5.HomeScreen>(() => _i5.HomeScreen());
  gh.factory<_i6.IntroScreen>(() => _i6.IntroScreen());
  gh.factory<_i7.LocalNotificationService>(
      () => _i7.LocalNotificationService());
  gh.factory<_i8.LocalizationPreferencesHelper>(
      () => _i8.LocalizationPreferencesHelper());
  gh.factory<_i9.LocalizationService>(
      () => _i9.LocalizationService(get<_i8.LocalizationPreferencesHelper>()));
  gh.factory<_i10.Logger>(() => _i10.Logger());
  gh.factory<_i11.MainNavigationScreen>(() => _i11.MainNavigationScreen());
  gh.factory<_i12.NotificationScreen>(() => _i12.NotificationScreen());
  gh.factory<_i13.NotificationsPrefsHelper>(
      () => _i13.NotificationsPrefsHelper());
  gh.factory<_i14.ProfileScreen>(() => _i14.ProfileScreen());
  gh.factory<_i15.ReportPrefsHelper>(() => _i15.ReportPrefsHelper());
  gh.factory<_i16.ResultTrackingScreen>(() => _i16.ResultTrackingScreen());
  gh.factory<_i17.ReviewShipmentScreen>(() => _i17.ReviewShipmentScreen());
  gh.factory<_i18.ShipmentPreviousScreen>(() => _i18.ShipmentPreviousScreen());
  gh.factory<_i19.ShipmentTrackingScreen>(() => _i19.ShipmentTrackingScreen());
  gh.factory<_i20.ThemePreferencesHelper>(() => _i20.ThemePreferencesHelper());
  gh.factory<_i21.UploadRepository>(() => _i21.UploadRepository());
  gh.factory<_i22.WelcomeScreen>(() => _i22.WelcomeScreen());
  gh.factory<_i23.ApiClient>(() => _i23.ApiClient(get<_i10.Logger>()));
  gh.factory<_i24.AppThemeDataService>(
      () => _i24.AppThemeDataService(get<_i20.ThemePreferencesHelper>()));
  gh.factory<_i25.AuthRepository>(
      () => _i25.AuthRepository(get<_i23.ApiClient>()));
  gh.factory<_i26.HomeModule>(() => _i26.HomeModule(get<_i5.HomeScreen>()));
  gh.factory<_i27.IntroModule>(() =>
      _i27.IntroModule(get<_i6.IntroScreen>(), get<_i22.WelcomeScreen>()));
  gh.factory<_i28.NotificationModule>(
      () => _i28.NotificationModule(get<_i12.NotificationScreen>()));
  gh.factory<_i29.PreviousShipmentsModule>(() => _i29.PreviousShipmentsModule(
      get<_i18.ShipmentPreviousScreen>(),
      get<_i19.ShipmentTrackingScreen>(),
      get<_i16.ResultTrackingScreen>(),
      get<_i17.ReviewShipmentScreen>()));
  gh.factory<_i30.ProfileModule>(
      () => _i30.ProfileModule(get<_i14.ProfileScreen>()));
  gh.factory<_i31.UploadManager>(
      () => _i31.UploadManager(get<_i21.UploadRepository>()));
  gh.factory<_i32.AuthManager>(
      () => _i32.AuthManager(get<_i25.AuthRepository>()));
  gh.factory<_i33.AuthService>(() =>
      _i33.AuthService(get<_i3.AuthPrefsHelper>(), get<_i32.AuthManager>()));
  gh.factory<_i34.AuthServiceApi>(() =>
      _i34.AuthServiceApi(get<_i3.AuthPrefsHelper>(), get<_i32.AuthManager>()));
  gh.factory<_i35.ChatRepository>(() =>
      _i35.ChatRepository(get<_i23.ApiClient>(), get<_i33.AuthService>()));
  gh.factory<_i36.ChatsListScreen>(
      () => _i36.ChatsListScreen(get<_i33.AuthService>()));
  gh.factory<_i37.FirstOptionRepository>(() => _i37.FirstOptionRepository(
      get<_i23.ApiClient>(), get<_i33.AuthService>()));
  gh.factory<_i38.ImageUploadService>(
      () => _i38.ImageUploadService(get<_i31.UploadManager>()));
  gh.factory<_i39.LoginStateManager>(
      () => _i39.LoginStateManager(get<_i33.AuthService>()));
  gh.factory<_i40.MarkRepository>(() =>
      _i40.MarkRepository(get<_i23.ApiClient>(), get<_i33.AuthService>()));
  gh.factory<_i41.NotificationRepo>(() =>
      _i41.NotificationRepo(get<_i23.ApiClient>(), get<_i33.AuthService>()));
  gh.factory<_i42.RegisterStateManager>(
      () => _i42.RegisterStateManager(get<_i33.AuthService>()));
  gh.factory<_i43.ReportRepository>(() => _i43.ReportRepository(
      get<_i23.ApiClient>(),
      get<_i33.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i44.SplashScreen>(
      () => _i44.SplashScreen(get<_i33.AuthService>()));
  gh.factory<_i45.ChatManager>(
      () => _i45.ChatManager(get<_i35.ChatRepository>()));
  gh.factory<_i46.ChatModule>(() => _i46.ChatModule(get<_i36.ChatsListScreen>(),
      get<_i33.AuthService>(), get<_i4.ChatScreen>()));
  gh.factory<_i47.ChatService>(() => _i47.ChatService(get<_i45.ChatManager>()));
  gh.factory<_i48.FireNotificationService>(() => _i48.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i41.NotificationRepo>()));
  gh.factory<_i49.FirstOptionManager>(
      () => _i49.FirstOptionManager(get<_i37.FirstOptionRepository>()));
  gh.factory<_i50.FirstOptionService>(
      () => _i50.FirstOptionService(get<_i49.FirstOptionManager>()));
  gh.factory<_i51.LoginScreen>(
      () => _i51.LoginScreen(get<_i39.LoginStateManager>()));
  gh.factory<_i52.MarkManager>(
      () => _i52.MarkManager(get<_i40.MarkRepository>()));
  gh.factory<_i53.MarkService>(() => _i53.MarkService(get<_i52.MarkManager>()));
  gh.factory<_i54.MarkStateManager>(
      () => _i54.MarkStateManager(get<_i53.MarkService>()));
  gh.factory<_i55.RegisterScreen>(
      () => _i55.RegisterScreen(get<_i42.RegisterStateManager>()));
  gh.factory<_i56.ReportManager>(
      () => _i56.ReportManager(get<_i43.ReportRepository>()));
  gh.factory<_i57.ReportService>(
      () => _i57.ReportService(get<_i56.ReportManager>()));
  gh.factory<_i58.RequestShipmentStateManger>(
      () => _i58.RequestShipmentStateManger(get<_i50.FirstOptionService>()));
  gh.factory<_i59.SettingsScreen>(() => _i59.SettingsScreen(
      get<_i33.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i24.AppThemeDataService>(),
      get<_i48.FireNotificationService>()));
  gh.factory<_i60.SplashModule>(
      () => _i60.SplashModule(get<_i44.SplashScreen>()));
  gh.factory<_i61.AuthorizationModule>(() => _i61.AuthorizationModule(
      get<_i51.LoginScreen>(), get<_i55.RegisterScreen>()));
  gh.factory<_i62.ChatPageBloc>(
      () => _i62.ChatPageBloc(get<_i47.ChatService>()));
  gh.factory<_i63.FirstOptions>(
      () => _i63.FirstOptions(get<_i58.RequestShipmentStateManger>()));
  gh.factory<_i64.MarkScreen>(
      () => _i64.MarkScreen(get<_i54.MarkStateManager>()));
  gh.factory<_i65.NewShipment>(
      () => _i65.NewShipment(get<_i58.RequestShipmentStateManger>()));
  gh.factory<_i66.NewShipmentsModule>(
      () => _i66.NewShipmentsModule(get<_i65.NewShipment>()));
  gh.factory<_i67.SettingsModule>(
      () => _i67.SettingsModule(get<_i59.SettingsScreen>()));
  gh.factory<_i68.MarkModule>(() => _i68.MarkModule(get<_i64.MarkScreen>()));
  gh.factory<_i69.MyApp>(() => _i69.MyApp(
      get<_i24.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i48.FireNotificationService>(),
      get<_i7.LocalNotificationService>(),
      get<_i27.IntroModule>(),
      get<_i61.AuthorizationModule>(),
      get<_i46.ChatModule>(),
      get<_i67.SettingsModule>(),
      get<_i26.HomeModule>(),
      get<_i29.PreviousShipmentsModule>(),
      get<_i30.ProfileModule>(),
      get<_i68.MarkModule>(),
      get<_i28.NotificationModule>(),
      get<_i66.NewShipmentsModule>()));
  return get;
}
