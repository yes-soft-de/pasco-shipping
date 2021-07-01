// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i84;
import '../module_auth/authoriazation_module.dart' as _i69;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i28;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i23;
import '../module_auth/service/auth_service/auth_service.dart' as _i29;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i30;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i35;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i40;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i50;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i60;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i70;
import '../module_chat/chat_module.dart' as _i45;
import '../module_chat/manager/chat/chat_manager.dart' as _i44;
import '../module_chat/repository/chat/chat_repository.dart' as _i31;
import '../module_chat/service/chat/char_service.dart' as _i46;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i4;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i32;
import '../module_home/home_module.dart' as _i24;
import '../module_home/ui/screen/home_screen.dart' as _i5;
import '../module_home/ui/screen/mainNavigation.dart' as _i11;
import '../module_intro/intro_module.dart' as _i25;
import '../module_intro/ui/intro_screen/intro_screen.dart' as _i6;
import '../module_intro/ui/welcome_screen/welcome_screen.dart' as _i20;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i51;
import '../module_mark/mark_module.dart' as _i80;
import '../module_mark/repository/mark_repository.dart' as _i36;
import '../module_mark/service/mark_service.dart' as _i52;
import '../module_mark/state_manager/mark_state_manager.dart' as _i53;
import '../module_mark/ui/mark_screen.dart' as _i73;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i54;
import '../module_my_shipment/my_shipment_module.dart' as _i81;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i37;
import '../module_my_shipment/service/my_shipment_service.dart' as _i55;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i56;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i17;
import '../module_my_shipment/ui/screen/my_shipment_review_edited.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i74;
import '../module_network/http_client/http_client.dart' as _i21;
import '../module_notifications/notification_module.dart' as _i26;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i38;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i47;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_profile/manager/profile_manager.dart' as _i57;
import '../module_profile/profile_module.dart' as _i82;
import '../module_profile/repository/profile_repository.dart' as _i39;
import '../module_profile/service/profile_service.dart' as _i58;
import '../module_profile/state_manager/profile_state_manager.dart' as _i59;
import '../module_profile/ui/profile_screen.dart' as _i77;
import '../module_report/manager/report_manager.dart' as _i61;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i41;
import '../module_report/service/report_service.dart' as _i62;
import '../module_settings/settings_module.dart' as _i78;
import '../module_settings/ui/settings_page/settings_page.dart' as _i64;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i48;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i33;
import '../module_shipment_request/request/shipment_request.dart' as _i72;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i49;
import '../module_shipment_request/shipment_request_module.dart' as _i76;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i63;
import '../module_shipment_request/ui/screen/first_option.dart' as _i71;
import '../module_shipment_request/ui/screen/new_shipment_request.dart' as _i75;
import '../module_shipment_track/manager/tracking_manager.dart' as _i66;
import '../module_shipment_track/repository/tracking_repository.dart' as _i43;
import '../module_shipment_track/service/tracking_service.dart' as _i67;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i68;
import '../module_shipment_track/tracking_module.dart' as _i83;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i79;
import '../module_splash/splash_module.dart' as _i65;
import '../module_splash/ui/screen/splash_screen.dart' as _i42;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i18;
import '../module_theme/service/theme_service/theme_service.dart' as _i22;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i27;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i19;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i34;
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
  gh.factory<_i14.PreviousShipmentsModule>(
      () => _i14.PreviousShipmentsModule());
  gh.factory<_i15.ReportPrefsHelper>(() => _i15.ReportPrefsHelper());
  gh.factory<_i16.ReviewShipmentEditedScreen>(
      () => _i16.ReviewShipmentEditedScreen());
  gh.factory<_i17.ReviewShipmentScreen>(() => _i17.ReviewShipmentScreen());
  gh.factory<_i18.ThemePreferencesHelper>(() => _i18.ThemePreferencesHelper());
  gh.factory<_i19.UploadRepository>(() => _i19.UploadRepository());
  gh.factory<_i20.WelcomeScreen>(() => _i20.WelcomeScreen());
  gh.factory<_i21.ApiClient>(() => _i21.ApiClient(get<_i10.Logger>()));
  gh.factory<_i22.AppThemeDataService>(
      () => _i22.AppThemeDataService(get<_i18.ThemePreferencesHelper>()));
  gh.factory<_i23.AuthRepository>(
      () => _i23.AuthRepository(get<_i21.ApiClient>()));
  gh.factory<_i24.HomeModule>(() => _i24.HomeModule(get<_i5.HomeScreen>()));
  gh.factory<_i25.IntroModule>(() =>
      _i25.IntroModule(get<_i6.IntroScreen>(), get<_i20.WelcomeScreen>()));
  gh.factory<_i26.NotificationModule>(
      () => _i26.NotificationModule(get<_i12.NotificationScreen>()));
  gh.factory<_i27.UploadManager>(
      () => _i27.UploadManager(get<_i19.UploadRepository>()));
  gh.factory<_i28.AuthManager>(
      () => _i28.AuthManager(get<_i23.AuthRepository>()));
  gh.factory<_i29.AuthService>(() =>
      _i29.AuthService(get<_i3.AuthPrefsHelper>(), get<_i28.AuthManager>()));
  gh.factory<_i30.AuthServiceApi>(() =>
      _i30.AuthServiceApi(get<_i3.AuthPrefsHelper>(), get<_i28.AuthManager>()));
  gh.factory<_i31.ChatRepository>(() =>
      _i31.ChatRepository(get<_i21.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i32.ChatsListScreen>(
      () => _i32.ChatsListScreen(get<_i29.AuthService>()));
  gh.factory<_i33.FirstOptionRepository>(() => _i33.FirstOptionRepository(
      get<_i21.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i34.ImageUploadService>(
      () => _i34.ImageUploadService(get<_i27.UploadManager>()));
  gh.factory<_i35.LoginStateManager>(
      () => _i35.LoginStateManager(get<_i29.AuthService>()));
  gh.factory<_i36.MarkRepository>(() =>
      _i36.MarkRepository(get<_i21.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i37.MyShipmentRepository>(() => _i37.MyShipmentRepository(
      get<_i21.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i38.NotificationRepo>(() =>
      _i38.NotificationRepo(get<_i21.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i39.ProfileRepository>(() =>
      _i39.ProfileRepository(get<_i21.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i40.RegisterStateManager>(
      () => _i40.RegisterStateManager(get<_i29.AuthService>()));
  gh.factory<_i41.ReportRepository>(() => _i41.ReportRepository(
      get<_i21.ApiClient>(),
      get<_i29.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i42.SplashScreen>(
      () => _i42.SplashScreen(get<_i29.AuthService>()));
  gh.factory<_i43.TrackingRepository>(() =>
      _i43.TrackingRepository(get<_i21.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i44.ChatManager>(
      () => _i44.ChatManager(get<_i31.ChatRepository>()));
  gh.factory<_i45.ChatModule>(() => _i45.ChatModule(get<_i32.ChatsListScreen>(),
      get<_i29.AuthService>(), get<_i4.ChatScreen>()));
  gh.factory<_i46.ChatService>(() => _i46.ChatService(get<_i44.ChatManager>()));
  gh.factory<_i47.FireNotificationService>(() => _i47.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i38.NotificationRepo>()));
  gh.factory<_i48.FirstOptionManager>(
      () => _i48.FirstOptionManager(get<_i33.FirstOptionRepository>()));
  gh.factory<_i49.FirstOptionService>(
      () => _i49.FirstOptionService(get<_i48.FirstOptionManager>()));
  gh.factory<_i50.LoginScreen>(
      () => _i50.LoginScreen(get<_i35.LoginStateManager>()));
  gh.factory<_i51.MarkManager>(
      () => _i51.MarkManager(get<_i36.MarkRepository>()));
  gh.factory<_i52.MarkService>(() => _i52.MarkService(get<_i51.MarkManager>()));
  gh.factory<_i53.MarkStateManager>(
      () => _i53.MarkStateManager(get<_i52.MarkService>()));
  gh.factory<_i54.MyShipmentManager>(
      () => _i54.MyShipmentManager(get<_i37.MyShipmentRepository>()));
  gh.factory<_i55.MyShipmentService>(
      () => _i55.MyShipmentService(get<_i54.MyShipmentManager>()));
  gh.factory<_i56.MyShipmentStateManger>(
      () => _i56.MyShipmentStateManger(get<_i55.MyShipmentService>()));
  gh.factory<_i57.ProfileManager>(
      () => _i57.ProfileManager(get<_i39.ProfileRepository>()));
  gh.factory<_i58.ProfileService>(
      () => _i58.ProfileService(get<_i57.ProfileManager>()));
  gh.factory<_i59.ProfileStateManager>(
      () => _i59.ProfileStateManager(get<_i58.ProfileService>()));
  gh.factory<_i60.RegisterScreen>(
      () => _i60.RegisterScreen(get<_i40.RegisterStateManager>()));
  gh.factory<_i61.ReportManager>(
      () => _i61.ReportManager(get<_i41.ReportRepository>()));
  gh.factory<_i62.ReportService>(
      () => _i62.ReportService(get<_i61.ReportManager>()));
  gh.factory<_i63.RequestShipmentStateManger>(() =>
      _i63.RequestShipmentStateManger(
          get<_i49.FirstOptionService>(), get<_i52.MarkService>()));
  gh.factory<_i64.SettingsScreen>(() => _i64.SettingsScreen(
      get<_i29.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i22.AppThemeDataService>(),
      get<_i47.FireNotificationService>()));
  gh.factory<_i65.SplashModule>(
      () => _i65.SplashModule(get<_i42.SplashScreen>()));
  gh.factory<_i66.TrackingManager>(
      () => _i66.TrackingManager(get<_i43.TrackingRepository>()));
  gh.factory<_i67.TrackingService>(
      () => _i67.TrackingService(get<_i66.TrackingManager>()));
  gh.factory<_i68.TrackingStateManager>(
      () => _i68.TrackingStateManager(get<_i67.TrackingService>()));
  gh.factory<_i69.AuthorizationModule>(() => _i69.AuthorizationModule(
      get<_i50.LoginScreen>(), get<_i60.RegisterScreen>()));
  gh.factory<_i70.ChatPageBloc>(
      () => _i70.ChatPageBloc(get<_i46.ChatService>()));
  gh.factory<_i71.FirstOptions>(() => _i71.FirstOptions(
      get<_i63.RequestShipmentStateManger>(),
      get<_i72.ShipmentRequest>(),
      get<Function>()));
  gh.factory<_i73.MarkScreen>(
      () => _i73.MarkScreen(get<_i53.MarkStateManager>()));
  gh.factory<_i74.MyShipmentScreen>(
      () => _i74.MyShipmentScreen(get<_i56.MyShipmentStateManger>()));
  gh.factory<_i75.NewShipment>(
      () => _i75.NewShipment(get<_i63.RequestShipmentStateManger>()));
  gh.factory<_i76.NewShipmentsModule>(
      () => _i76.NewShipmentsModule(get<_i75.NewShipment>()));
  gh.factory<_i77.ProfileScreen>(
      () => _i77.ProfileScreen(get<_i59.ProfileStateManager>()));
  gh.factory<_i78.SettingsModule>(
      () => _i78.SettingsModule(get<_i64.SettingsScreen>()));
  gh.factory<_i79.TrackingScreen>(
      () => _i79.TrackingScreen(get<_i68.TrackingStateManager>()));
  gh.factory<_i80.MarkModule>(() => _i80.MarkModule(get<_i73.MarkScreen>()));
  gh.factory<_i81.MyShipmentModule>(() => _i81.MyShipmentModule(
      get<_i74.MyShipmentScreen>(),
      get<_i17.ReviewShipmentScreen>(),
      get<_i16.ReviewShipmentEditedScreen>()));
  gh.factory<_i82.ProfileModule>(
      () => _i82.ProfileModule(get<_i77.ProfileScreen>()));
  gh.factory<_i83.TrackingModule>(
      () => _i83.TrackingModule(get<_i79.TrackingScreen>()));
  gh.factory<_i84.MyApp>(() => _i84.MyApp(
      get<_i22.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i47.FireNotificationService>(),
      get<_i7.LocalNotificationService>(),
      get<_i25.IntroModule>(),
      get<_i69.AuthorizationModule>(),
      get<_i45.ChatModule>(),
      get<_i78.SettingsModule>(),
      get<_i24.HomeModule>(),
      get<_i82.ProfileModule>(),
      get<_i80.MarkModule>(),
      get<_i26.NotificationModule>(),
      get<_i76.NewShipmentsModule>(),
      get<_i83.TrackingModule>(),
      get<_i81.MyShipmentModule>()));
  return get;
}
