// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i95;
import '../module_auth/authoriazation_module.dart' as _i75;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i20;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i31;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i37;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i52;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i65;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i76;
import '../module_chat/chat_module.dart' as _i43;
import '../module_chat/manager/chat/chat_manager.dart' as _i42;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i44;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i4;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_edit_shipment/edit_shipment_module.dart' as _i77;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i45;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i28;
import '../module_edit_shipment/service/editshipment_service.dart' as _i46;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i47;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i48;
import '../module_home/home_module.dart' as _i87;
import '../module_home/ui/screen/home_screen.dart' as _i78;
import '../module_home/ui/screen/mainNavigation.dart' as _i79;
import '../module_intro/intro_module.dart' as _i21;
import '../module_intro/ui/intro_screen/intro_screen.dart' as _i5;
import '../module_intro/ui/welcome_screen/welcome_screen.dart' as _i17;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i7;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i8;
import '../module_mark/manager/mark_manager.dart' as _i53;
import '../module_mark/mark_module.dart' as _i88;
import '../module_mark/repository/mark_repository.dart' as _i32;
import '../module_mark/service/mark_service.dart' as _i54;
import '../module_mark/state_manager/mark_state_manager.dart' as _i55;
import '../module_mark/ui/mark_screen.dart' as _i80;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i56;
import '../module_my_shipment/my_shipment_module.dart' as _i89;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i33;
import '../module_my_shipment/service/my_shipment_service.dart' as _i57;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i58;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i14;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i81;
import '../module_network/http_client/http_client.dart' as _i18;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i11;
import '../module_notifications/repository/notification_repo.dart' as _i34;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i49;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_notifications/ui/notification_screen.dart' as _i10;
import '../module_profile/manager/profile_manager.dart' as _i59;
import '../module_profile/profile_module.dart' as _i92;
import '../module_profile/repository/profile_repository.dart' as _i35;
import '../module_profile/service/profile_service.dart' as _i60;
import '../module_profile/state_manager/profile_state_manager.dart' as _i61;
import '../module_profile/ui/profile_screen.dart' as _i82;
import '../module_receiver/manager/receiver_manager.dart' as _i62;
import '../module_receiver/receiver_module.dart' as _i93;
import '../module_receiver/repository/receiver_repository.dart' as _i36;
import '../module_receiver/service/receiver_service.dart' as _i63;
import '../module_receiver/state_manager/receiver_state_manager.dart' as _i64;
import '../module_receiver/ui/receiver_screen.dart' as _i83;
import '../module_report/manager/report_manager.dart' as _i66;
import '../module_report/presistance/report_prefs_helper.dart' as _i13;
import '../module_report/repository/report_repository.dart' as _i38;
import '../module_report/service/report_service.dart' as _i67;
import '../module_settings/settings_module.dart' as _i85;
import '../module_settings/ui/settings_page/settings_page.dart' as _i68;
import '../module_shipment_previous/shipment_previous_module.dart' as _i12;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i50;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i29;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i51;
import '../module_shipment_request/shipment_request_module.dart' as _i91;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i84;
import '../module_shipment_request/ui/screen/new_shipment_request.dart' as _i90;
import '../module_shipment_track/manager/tracking_manager.dart' as _i70;
import '../module_shipment_track/repository/tracking_repository.dart' as _i40;
import '../module_shipment_track/service/tracking_service.dart' as _i71;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i72;
import '../module_shipment_track/tracking_module.dart' as _i94;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i86;
import '../module_splash/splash_module.dart' as _i69;
import '../module_splash/ui/screen/splash_screen.dart' as _i39;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i15;
import '../module_theme/service/theme_service/theme_service.dart' as _i19;
import '../module_unit/manager/unit_manager.dart' as _i73;
import '../module_unit/repository/unit_repository.dart' as _i41;
import '../module_unit/service/unit_service.dart' as _i74;
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
  gh.factory<_i36.ReceiverRepository>(() =>
      _i36.ReceiverRepository(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i37.RegisterStateManager>(
      () => _i37.RegisterStateManager(get<_i25.AuthService>()));
  gh.factory<_i38.ReportRepository>(() => _i38.ReportRepository(
      get<_i18.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i13.ReportPrefsHelper>()));
  gh.factory<_i39.SplashScreen>(
      () => _i39.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i40.TrackingRepository>(() =>
      _i40.TrackingRepository(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i41.UnitRepository>(() =>
      _i41.UnitRepository(get<_i18.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i42.ChatManager>(
      () => _i42.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i43.ChatModule>(() => _i43.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i4.ChatScreen>()));
  gh.factory<_i44.ChatService>(() => _i44.ChatService(get<_i42.ChatManager>()));
  gh.factory<_i45.EditShipmentManager>(
      () => _i45.EditShipmentManager(get<_i28.EditShipmentRepository>()));
  gh.factory<_i46.EditShipmentService>(
      () => _i46.EditShipmentService(get<_i45.EditShipmentManager>()));
  gh.factory<_i47.EditShipmentStateManager>(() => _i47.EditShipmentStateManager(
      get<_i46.EditShipmentService>(), get<_i30.ImageUploadService>()));
  gh.factory<_i48.EditedShipmentScreen>(
      () => _i48.EditedShipmentScreen(get<_i47.EditShipmentStateManager>()));
  gh.factory<_i49.FireNotificationService>(() => _i49.FireNotificationService(
      get<_i11.NotificationsPrefsHelper>(), get<_i34.NotificationRepo>()));
  gh.factory<_i50.FirstOptionManager>(
      () => _i50.FirstOptionManager(get<_i29.FirstOptionRepository>()));
  gh.factory<_i51.FirstOptionService>(
      () => _i51.FirstOptionService(get<_i50.FirstOptionManager>()));
  gh.factory<_i52.LoginScreen>(
      () => _i52.LoginScreen(get<_i31.LoginStateManager>()));
  gh.factory<_i53.MarkManager>(
      () => _i53.MarkManager(get<_i32.MarkRepository>()));
  gh.factory<_i54.MarkService>(() => _i54.MarkService(get<_i53.MarkManager>()));
  gh.factory<_i55.MarkStateManager>(
      () => _i55.MarkStateManager(get<_i54.MarkService>()));
  gh.factory<_i56.MyShipmentManager>(
      () => _i56.MyShipmentManager(get<_i33.MyShipmentRepository>()));
  gh.factory<_i57.MyShipmentService>(
      () => _i57.MyShipmentService(get<_i56.MyShipmentManager>()));
  gh.factory<_i58.MyShipmentStateManger>(
      () => _i58.MyShipmentStateManger(get<_i57.MyShipmentService>()));
  gh.factory<_i59.ProfileManager>(
      () => _i59.ProfileManager(get<_i35.ProfileRepository>()));
  gh.factory<_i60.ProfileService>(
      () => _i60.ProfileService(get<_i59.ProfileManager>()));
  gh.factory<_i61.ProfileStateManager>(() => _i61.ProfileStateManager(
      get<_i60.ProfileService>(), get<_i30.ImageUploadService>()));
  gh.factory<_i62.ReceiverManager>(
      () => _i62.ReceiverManager(get<_i36.ReceiverRepository>()));
  gh.factory<_i63.ReceiverService>(
      () => _i63.ReceiverService(get<_i62.ReceiverManager>()));
  gh.factory<_i64.ReceiverStateManager>(
      () => _i64.ReceiverStateManager(get<_i63.ReceiverService>()));
  gh.factory<_i65.RegisterScreen>(
      () => _i65.RegisterScreen(get<_i37.RegisterStateManager>()));
  gh.factory<_i66.ReportManager>(
      () => _i66.ReportManager(get<_i38.ReportRepository>()));
  gh.factory<_i67.ReportService>(
      () => _i67.ReportService(get<_i66.ReportManager>()));
  gh.factory<_i68.SettingsScreen>(() => _i68.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i8.LocalizationService>(),
      get<_i19.AppThemeDataService>(),
      get<_i49.FireNotificationService>()));
  gh.factory<_i69.SplashModule>(
      () => _i69.SplashModule(get<_i39.SplashScreen>()));
  gh.factory<_i70.TrackingManager>(
      () => _i70.TrackingManager(get<_i40.TrackingRepository>()));
  gh.factory<_i71.TrackingService>(
      () => _i71.TrackingService(get<_i70.TrackingManager>()));
  gh.factory<_i72.TrackingStateManager>(
      () => _i72.TrackingStateManager(get<_i71.TrackingService>()));
  gh.factory<_i73.UnitManager>(
      () => _i73.UnitManager(get<_i41.UnitRepository>()));
  gh.factory<_i74.UnitService>(() => _i74.UnitService(get<_i73.UnitManager>()));
  gh.factory<_i75.AuthorizationModule>(() => _i75.AuthorizationModule(
      get<_i52.LoginScreen>(), get<_i65.RegisterScreen>()));
  gh.factory<_i76.ChatPageBloc>(
      () => _i76.ChatPageBloc(get<_i44.ChatService>()));
  gh.factory<_i77.EditShipmentModule>(
      () => _i77.EditShipmentModule(get<_i48.EditedShipmentScreen>()));
  gh.factory<_i78.HomeScreen>(
      () => _i78.HomeScreen(get<_i60.ProfileService>()));
  gh.factory<_i79.MainNavigationScreen>(
      () => _i79.MainNavigationScreen(get<_i60.ProfileService>()));
  gh.factory<_i80.MarkScreen>(
      () => _i80.MarkScreen(get<_i55.MarkStateManager>()));
  gh.factory<_i81.MyShipmentScreen>(
      () => _i81.MyShipmentScreen(get<_i58.MyShipmentStateManger>()));
  gh.factory<_i82.ProfileScreen>(
      () => _i82.ProfileScreen(get<_i61.ProfileStateManager>()));
  gh.factory<_i83.ReceiverScreen>(
      () => _i83.ReceiverScreen(get<_i64.ReceiverStateManager>()));
  gh.factory<_i84.RequestShipmentStateManger>(() =>
      _i84.RequestShipmentStateManger(
          get<_i51.FirstOptionService>(),
          get<_i54.MarkService>(),
          get<_i63.ReceiverService>(),
          get<_i74.UnitService>()));
  gh.factory<_i85.SettingsModule>(
      () => _i85.SettingsModule(get<_i68.SettingsScreen>()));
  gh.factory<_i86.TrackingScreen>(
      () => _i86.TrackingScreen(get<_i72.TrackingStateManager>()));
  gh.factory<_i87.HomeModule>(() => _i87.HomeModule(get<_i78.HomeScreen>()));
  gh.factory<_i88.MarkModule>(() => _i88.MarkModule(get<_i80.MarkScreen>()));
  gh.factory<_i89.MyShipmentModule>(() => _i89.MyShipmentModule(
      get<_i81.MyShipmentScreen>(), get<_i14.ReviewShipmentScreen>()));
  gh.factory<_i90.NewShipment>(
      () => _i90.NewShipment(get<_i84.RequestShipmentStateManger>()));
  gh.factory<_i91.NewShipmentsModule>(
      () => _i91.NewShipmentsModule(get<_i90.NewShipment>()));
  gh.factory<_i92.ProfileModule>(
      () => _i92.ProfileModule(get<_i82.ProfileScreen>()));
  gh.factory<_i93.ReceiverModule>(
      () => _i93.ReceiverModule(get<_i83.ReceiverScreen>()));
  gh.factory<_i94.TrackingModule>(
      () => _i94.TrackingModule(get<_i86.TrackingScreen>()));
  gh.factory<_i95.MyApp>(() => _i95.MyApp(
      get<_i19.AppThemeDataService>(),
      get<_i8.LocalizationService>(),
      get<_i49.FireNotificationService>(),
      get<_i6.LocalNotificationService>(),
      get<_i21.IntroModule>(),
      get<_i75.AuthorizationModule>(),
      get<_i43.ChatModule>(),
      get<_i85.SettingsModule>(),
      get<_i87.HomeModule>(),
      get<_i92.ProfileModule>(),
      get<_i88.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i91.NewShipmentsModule>(),
      get<_i94.TrackingModule>(),
      get<_i89.MyShipmentModule>(),
      get<_i77.EditShipmentModule>(),
      get<_i69.SplashModule>(),
      get<_i93.ReceiverModule>()));
  return get;
}
