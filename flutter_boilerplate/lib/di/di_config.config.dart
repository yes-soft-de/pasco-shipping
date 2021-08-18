// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i86;
import '../module_auth/authoriazation_module.dart' as _i69;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i20;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i31;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i36;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i50;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i60;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i70;
import '../module_chat/chat_module.dart' as _i41;
import '../module_chat/manager/chat/chat_manager.dart' as _i40;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i42;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i4;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_edit_shipment/edit_shipment_module.dart' as _i71;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i43;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i28;
import '../module_edit_shipment/service/editshipment_service.dart' as _i44;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i45;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i46;
import '../module_home/home_module.dart' as _i81;
import '../module_home/ui/screen/home_screen.dart' as _i72;
import '../module_home/ui/screen/mainNavigation.dart' as _i73;
import '../module_intro/intro_module.dart' as _i21;
import '../module_intro/ui/intro_screen/intro_screen.dart' as _i5;
import '../module_intro/ui/welcome_screen/welcome_screen.dart' as _i17;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i7;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i8;
import '../module_mark/manager/mark_manager.dart' as _i51;
import '../module_mark/mark_module.dart' as _i82;
import '../module_mark/repository/mark_repository.dart' as _i32;
import '../module_mark/service/mark_service.dart' as _i52;
import '../module_mark/state_manager/mark_state_manager.dart' as _i53;
import '../module_mark/ui/mark_screen.dart' as _i74;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i54;
import '../module_my_shipment/my_shipment_module.dart' as _i83;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i33;
import '../module_my_shipment/service/my_shipment_service.dart' as _i55;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i56;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i14;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i75;
import '../module_network/http_client/http_client.dart' as _i18;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i11;
import '../module_notifications/repository/notification_repo.dart' as _i34;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i47;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_notifications/ui/notification_screen.dart' as _i10;
import '../module_profile/manager/profile_manager.dart' as _i57;
import '../module_profile/profile_module.dart' as _i84;
import '../module_profile/repository/profile_repository.dart' as _i35;
import '../module_profile/service/profile_service.dart' as _i58;
import '../module_profile/state_manager/profile_state_manager.dart' as _i59;
import '../module_profile/ui/profile_screen.dart' as _i78;
import '../module_report/manager/report_manager.dart' as _i61;
import '../module_report/presistance/report_prefs_helper.dart' as _i13;
import '../module_report/repository/report_repository.dart' as _i37;
import '../module_report/service/report_service.dart' as _i62;
import '../module_settings/settings_module.dart' as _i79;
import '../module_settings/ui/settings_page/settings_page.dart' as _i64;
import '../module_shipment_previous/shipment_previous_module.dart' as _i12;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i48;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i29;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i49;
import '../module_shipment_request/shipment_request_module.dart' as _i77;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i63;
import '../module_shipment_request/ui/screen/new_shipment_request.dart' as _i76;
import '../module_shipment_track/manager/tracking_manager.dart' as _i66;
import '../module_shipment_track/repository/tracking_repository.dart' as _i39;
import '../module_shipment_track/service/tracking_service.dart' as _i67;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i68;
import '../module_shipment_track/tracking_module.dart' as _i85;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i80;
import '../module_splash/splash_module.dart' as _i65;
import '../module_splash/ui/screen/splash_screen.dart' as _i38;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i15;
import '../module_theme/service/theme_service/theme_service.dart' as _i19;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i16;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i30;
import '../utils/logger/logger.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.ChatScreen>(() => _i4.ChatScreen());
  gh.factory<_i5.IntroScreen>(() => _i5.IntroScreen());
  gh.factory<_i6.LocalNotificationService>(
      () => _i6.LocalNotificationService());
  gh.factory<_i7.LocalizationPreferencesHelper>(
      () => _i7.LocalizationPreferencesHelper());
  gh.factory<_i8.LocalizationService>(
      () => _i8.LocalizationService(get<_i7.LocalizationPreferencesHelper>()));
  gh.factory<_i9.Logger>(() => _i9.Logger());
  gh.factory<_i10.NotificationScreen>(() => _i10.NotificationScreen());
  gh.factory<_i11.NotificationsPrefsHelper>(
      () => _i11.NotificationsPrefsHelper());
  gh.factory<_i12.PreviousShipmentsModule>(
      () => _i12.PreviousShipmentsModule());
  gh.factory<_i13.ReportPrefsHelper>(() => _i13.ReportPrefsHelper());
  gh.factory<_i14.ReviewShipmentScreen>(() => _i14.ReviewShipmentScreen());
  gh.factory<_i15.ThemePreferencesHelper>(() => _i15.ThemePreferencesHelper());
  gh.factory<_i16.UploadRepository>(() => _i16.UploadRepository());
  gh.factory<_i17.WelcomeScreen>(() => _i17.WelcomeScreen());
  gh.factory<_i18.ApiClient>(() => _i18.ApiClient(get<_i9.Logger>()));
  gh.factory<_i19.AppThemeDataService>(
      () => _i19.AppThemeDataService(get<_i15.ThemePreferencesHelper>()));
  gh.factory<_i20.AuthRepository>(
      () => _i20.AuthRepository(get<_i18.ApiClient>(), get<_i9.Logger>()));
  gh.factory<_i21.IntroModule>(() =>
      _i21.IntroModule(get<_i5.IntroScreen>(), get<_i17.WelcomeScreen>()));
  gh.factory<_i22.NotificationModule>(
      () => _i22.NotificationModule(get<_i10.NotificationScreen>()));
  gh.factory<_i23.UploadManager>(
      () => _i23.UploadManager(get<_i16.UploadRepository>()));
  gh.factory<_i24.AuthManager>(
      () => _i24.AuthManager(get<_i20.AuthRepository>()));
  gh.factory<_i25.AuthService>(() =>
      _i25.AuthService(get<_i3.AuthPrefsHelper>(), get<_i24.AuthManager>()));
  gh.factory<_i26.ChatRepository>(() =>
      _i26.ChatRepository(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i27.ChatsListScreen>(
      () => _i27.ChatsListScreen(get<_i25.AuthService>()));
  gh.factory<_i28.EditShipmentRepository>(() => _i28.EditShipmentRepository(
      get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i29.FirstOptionRepository>(() => _i29.FirstOptionRepository(
      get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i30.ImageUploadService>(
      () => _i30.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i31.LoginStateManager>(
      () => _i31.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i32.MarkRepository>(() =>
      _i32.MarkRepository(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i33.MyShipmentRepository>(() => _i33.MyShipmentRepository(
      get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i34.NotificationRepo>(() =>
      _i34.NotificationRepo(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i35.ProfileRepository>(() =>
      _i35.ProfileRepository(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i36.RegisterStateManager>(
      () => _i36.RegisterStateManager(get<_i25.AuthService>()));
  gh.factory<_i37.ReportRepository>(() => _i37.ReportRepository(
      get<_i18.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i13.ReportPrefsHelper>()));
  gh.factory<_i38.SplashScreen>(
      () => _i38.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i39.TrackingRepository>(() =>
      _i39.TrackingRepository(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i40.ChatManager>(
      () => _i40.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i41.ChatModule>(() => _i41.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i4.ChatScreen>()));
  gh.factory<_i42.ChatService>(() => _i42.ChatService(get<_i40.ChatManager>()));
  gh.factory<_i43.EditShipmentManager>(
      () => _i43.EditShipmentManager(get<_i28.EditShipmentRepository>()));
  gh.factory<_i44.EditShipmentService>(
      () => _i44.EditShipmentService(get<_i43.EditShipmentManager>()));
  gh.factory<_i45.EditShipmentStateManager>(() => _i45.EditShipmentStateManager(
      get<_i44.EditShipmentService>(), get<_i30.ImageUploadService>()));
  gh.factory<_i46.EditedShipmentScreen>(
      () => _i46.EditedShipmentScreen(get<_i45.EditShipmentStateManager>()));
  gh.factory<_i47.FireNotificationService>(() => _i47.FireNotificationService(
      get<_i11.NotificationsPrefsHelper>(), get<_i34.NotificationRepo>()));
  gh.factory<_i48.FirstOptionManager>(
      () => _i48.FirstOptionManager(get<_i29.FirstOptionRepository>()));
  gh.factory<_i49.FirstOptionService>(
      () => _i49.FirstOptionService(get<_i48.FirstOptionManager>()));
  gh.factory<_i50.LoginScreen>(
      () => _i50.LoginScreen(get<_i31.LoginStateManager>()));
  gh.factory<_i51.MarkManager>(
      () => _i51.MarkManager(get<_i32.MarkRepository>()));
  gh.factory<_i52.MarkService>(() => _i52.MarkService(get<_i51.MarkManager>()));
  gh.factory<_i53.MarkStateManager>(
      () => _i53.MarkStateManager(get<_i52.MarkService>()));
  gh.factory<_i54.MyShipmentManager>(
      () => _i54.MyShipmentManager(get<_i33.MyShipmentRepository>()));
  gh.factory<_i55.MyShipmentService>(
      () => _i55.MyShipmentService(get<_i54.MyShipmentManager>()));
  gh.factory<_i56.MyShipmentStateManger>(
      () => _i56.MyShipmentStateManger(get<_i55.MyShipmentService>()));
  gh.factory<_i57.ProfileManager>(
      () => _i57.ProfileManager(get<_i35.ProfileRepository>()));
  gh.factory<_i58.ProfileService>(
      () => _i58.ProfileService(get<_i57.ProfileManager>()));
  gh.factory<_i59.ProfileStateManager>(() => _i59.ProfileStateManager(
      get<_i58.ProfileService>(), get<_i30.ImageUploadService>()));
  gh.factory<_i60.RegisterScreen>(
      () => _i60.RegisterScreen(get<_i36.RegisterStateManager>()));
  gh.factory<_i61.ReportManager>(
      () => _i61.ReportManager(get<_i37.ReportRepository>()));
  gh.factory<_i62.ReportService>(
      () => _i62.ReportService(get<_i61.ReportManager>()));
  gh.factory<_i63.RequestShipmentStateManger>(() =>
      _i63.RequestShipmentStateManger(
          get<_i49.FirstOptionService>(), get<_i52.MarkService>()));
  gh.factory<_i64.SettingsScreen>(() => _i64.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i8.LocalizationService>(),
      get<_i19.AppThemeDataService>(),
      get<_i47.FireNotificationService>()));
  gh.factory<_i65.SplashModule>(
      () => _i65.SplashModule(get<_i38.SplashScreen>()));
  gh.factory<_i66.TrackingManager>(
      () => _i66.TrackingManager(get<_i39.TrackingRepository>()));
  gh.factory<_i67.TrackingService>(
      () => _i67.TrackingService(get<_i66.TrackingManager>()));
  gh.factory<_i68.TrackingStateManager>(
      () => _i68.TrackingStateManager(get<_i67.TrackingService>()));
  gh.factory<_i69.AuthorizationModule>(() => _i69.AuthorizationModule(
      get<_i50.LoginScreen>(), get<_i60.RegisterScreen>()));
  gh.factory<_i70.ChatPageBloc>(
      () => _i70.ChatPageBloc(get<_i42.ChatService>()));
  gh.factory<_i71.EditShipmentModule>(
      () => _i71.EditShipmentModule(get<_i46.EditedShipmentScreen>()));
  gh.factory<_i72.HomeScreen>(
      () => _i72.HomeScreen(get<_i58.ProfileService>()));
  gh.factory<_i73.MainNavigationScreen>(
      () => _i73.MainNavigationScreen(get<_i58.ProfileService>()));
  gh.factory<_i74.MarkScreen>(
      () => _i74.MarkScreen(get<_i53.MarkStateManager>()));
  gh.factory<_i75.MyShipmentScreen>(
      () => _i75.MyShipmentScreen(get<_i56.MyShipmentStateManger>()));
  gh.factory<_i76.NewShipment>(
      () => _i76.NewShipment(get<_i63.RequestShipmentStateManger>()));
  gh.factory<_i77.NewShipmentsModule>(
      () => _i77.NewShipmentsModule(get<_i76.NewShipment>()));
  gh.factory<_i78.ProfileScreen>(
      () => _i78.ProfileScreen(get<_i59.ProfileStateManager>()));
  gh.factory<_i79.SettingsModule>(
      () => _i79.SettingsModule(get<_i64.SettingsScreen>()));
  gh.factory<_i80.TrackingScreen>(
      () => _i80.TrackingScreen(get<_i68.TrackingStateManager>()));
  gh.factory<_i81.HomeModule>(() => _i81.HomeModule(get<_i72.HomeScreen>()));
  gh.factory<_i82.MarkModule>(() => _i82.MarkModule(get<_i74.MarkScreen>()));
  gh.factory<_i83.MyShipmentModule>(() => _i83.MyShipmentModule(
      get<_i75.MyShipmentScreen>(), get<_i14.ReviewShipmentScreen>()));
  gh.factory<_i84.ProfileModule>(
      () => _i84.ProfileModule(get<_i78.ProfileScreen>()));
  gh.factory<_i85.TrackingModule>(
      () => _i85.TrackingModule(get<_i80.TrackingScreen>()));
  gh.factory<_i86.MyApp>(() => _i86.MyApp(
      get<_i19.AppThemeDataService>(),
      get<_i8.LocalizationService>(),
      get<_i47.FireNotificationService>(),
      get<_i6.LocalNotificationService>(),
      get<_i21.IntroModule>(),
      get<_i69.AuthorizationModule>(),
      get<_i41.ChatModule>(),
      get<_i79.SettingsModule>(),
      get<_i81.HomeModule>(),
      get<_i84.ProfileModule>(),
      get<_i82.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i77.NewShipmentsModule>(),
      get<_i85.TrackingModule>(),
      get<_i83.MyShipmentModule>(),
      get<_i71.EditShipmentModule>(),
      get<_i65.SplashModule>()));
  return get;
}
