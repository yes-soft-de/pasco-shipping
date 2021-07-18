// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i143;
import '../module_auth/authoriazation_module.dart' as _i111;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i21;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i18;
import '../module_auth/service/auth_service/auth_service.dart' as _i22;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i23;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i32;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i38;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i66;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i79;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i112;
import '../module_chat/chat_module.dart' as _i47;
import '../module_chat/manager/chat/chat_manager.dart' as _i46;
import '../module_chat/repository/chat/chat_repository.dart' as _i24;
import '../module_chat/service/chat/char_service.dart' as _i48;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i4;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i25;
import '../module_countries/country_module.dart' as _i114;
import '../module_countries/manager/country_manager.dart' as _i49;
import '../module_countries/repository/country_repository.dart' as _i26;
import '../module_countries/service/country_service.dart' as _i50;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i51;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i102;
import '../module_countries/ui/screen/countries_screen.dart' as _i113;
import '../module_countries/ui/screen/country_new_screen.dart' as _i104;
import '../module_distributors/distributors_module.dart' as _i115;
import '../module_distributors/manager/distributors_manager.dart' as _i52;
import '../module_distributors/repository/distributors_repository.dart' as _i27;
import '../module_distributors/service/distributors_service.dart' as _i53;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i54;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i103;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i105;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i55;
import '../module_edit_shipment/edit_shipment_module.dart' as _i116;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i56;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i28;
import '../module_edit_shipment/service/editshipment_service.dart' as _i57;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i58;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i59;
import '../module_home/home_module.dart' as _i133;
import '../module_home/manager/home_manager.dart' as _i63;
import '../module_home/repository/home_repository.dart' as _i30;
import '../module_home/service/home_service.dart' as _i64;
import '../module_home/state_manager/state_manager_home.dart' as _i65;
import '../module_home/ui/screen/home_screen.dart' as _i117;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_mark/manager/mark_manager.dart' as _i67;
import '../module_mark/mark_module.dart' as _i134;
import '../module_mark/repository/mark_repository.dart' as _i33;
import '../module_mark/service/mark_service.dart' as _i68;
import '../module_mark/state_manager/mark_state_manager.dart' as _i69;
import '../module_mark/ui/mark_screen.dart' as _i118;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i70;
import '../module_my_shipment/my_shipment_module.dart' as _i135;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i34;
import '../module_my_shipment/service/my_shipment_service.dart' as _i71;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i72;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i13;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i119;
import '../module_network/http_client/http_client.dart' as _i16;
import '../module_notifications/notification_module.dart' as _i19;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i10;
import '../module_notifications/repository/notification_repo.dart' as _i35;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i60;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_notifications/ui/notification_screen.dart' as _i9;
import '../module_profile/manager/profile_manager.dart' as _i73;
import '../module_profile/profile_module.dart' as _i136;
import '../module_profile/repository/profile_repository.dart' as _i36;
import '../module_profile/service/profile_service.dart' as _i74;
import '../module_profile/state_manager/profile_state_manager.dart' as _i75;
import '../module_profile/ui/profile_screen.dart' as _i122;
import '../module_proxies/manager/proxies_manager.dart' as _i76;
import '../module_proxies/proxies_module.dart' as _i137;
import '../module_proxies/repository/proxies_repository.dart' as _i37;
import '../module_proxies/service/proixes_service.dart' as _i77;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i106;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i78;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i123;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i128;
import '../module_report/manager/report_manager.dart' as _i80;
import '../module_report/presistance/report_prefs_helper.dart' as _i12;
import '../module_report/repository/report_repository.dart' as _i39;
import '../module_report/service/report_service.dart' as _i81;
import '../module_settings/settings_module.dart' as _i124;
import '../module_settings/ui/settings_page/settings_page.dart' as _i83;
import '../module_shipment_previous/shipment_previous_module.dart' as _i11;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i61;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i29;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i62;
import '../module_shipment_request/shipment_request_module.dart' as _i121;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i82;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i120;
import '../module_shipment_track/manager/tracking_manager.dart' as _i95;
import '../module_shipment_track/repository/tracking_repository.dart' as _i44;
import '../module_shipment_track/service/tracking_service.dart' as _i96;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i97;
import '../module_shipment_track/tracking_module.dart' as _i141;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i127;
import '../module_splash/splash_module.dart' as _i84;
import '../module_splash/ui/screen/splash_screen.dart' as _i40;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i88;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i42;
import '../module_sub_contract/service/subcontract_service.dart' as _i89;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i108;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i90;
import '../module_sub_contract/subcontract_module.dart' as _i139;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i130;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i126;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i85;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i41;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i86;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i107;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i87;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i138;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i129;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i125;
import '../module_suppliers/manager/suppliers_manager.dart' as _i91;
import '../module_suppliers/repository/suppliers_repository.dart' as _i43;
import '../module_suppliers/service/suppliers_service.dart' as _i92;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i109;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i93;
import '../module_suppliers/supplier_module.dart' as _i140;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i131;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i94;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i14;
import '../module_theme/service/theme_service/theme_service.dart' as _i17;
import '../module_unit/manager/unit_manager.dart' as _i98;
import '../module_unit/repository/unit_repository.dart' as _i45;
import '../module_unit/service/unit_service.dart' as _i99;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i110;
import '../module_unit/state_manger/units_state_manager.dart' as _i100;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i132;
import '../module_unit/ui/screen/units_screen.dart' as _i101;
import '../module_unit/unit_module.dart' as _i142;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i20;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i15;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i31;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.ChatScreen>(() => _i4.ChatScreen());
  gh.factory<_i5.LocalNotificationService>(
      () => _i5.LocalNotificationService());
  gh.factory<_i6.LocalizationPreferencesHelper>(
      () => _i6.LocalizationPreferencesHelper());
  gh.factory<_i7.LocalizationService>(
      () => _i7.LocalizationService(get<_i6.LocalizationPreferencesHelper>()));
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.NotificationScreen>(() => _i9.NotificationScreen());
  gh.factory<_i10.NotificationsPrefsHelper>(
      () => _i10.NotificationsPrefsHelper());
  gh.factory<_i11.PreviousShipmentsModule>(
      () => _i11.PreviousShipmentsModule());
  gh.factory<_i12.ReportPrefsHelper>(() => _i12.ReportPrefsHelper());
  gh.factory<_i13.ReviewShipmentScreen>(() => _i13.ReviewShipmentScreen());
  gh.factory<_i14.ThemePreferencesHelper>(() => _i14.ThemePreferencesHelper());
  gh.factory<_i15.UploadRepository>(() => _i15.UploadRepository());
  gh.factory<_i16.ApiClient>(() => _i16.ApiClient(get<_i8.Logger>()));
  gh.factory<_i17.AppThemeDataService>(
      () => _i17.AppThemeDataService(get<_i14.ThemePreferencesHelper>()));
  gh.factory<_i18.AuthRepository>(
      () => _i18.AuthRepository(get<_i16.ApiClient>()));
  gh.factory<_i19.NotificationModule>(
      () => _i19.NotificationModule(get<_i9.NotificationScreen>()));
  gh.factory<_i20.UploadManager>(
      () => _i20.UploadManager(get<_i15.UploadRepository>()));
  gh.factory<_i21.AuthManager>(
      () => _i21.AuthManager(get<_i18.AuthRepository>()));
  gh.factory<_i22.AuthService>(() =>
      _i22.AuthService(get<_i3.AuthPrefsHelper>(), get<_i21.AuthManager>()));
  gh.factory<_i23.AuthServiceApi>(() =>
      _i23.AuthServiceApi(get<_i3.AuthPrefsHelper>(), get<_i21.AuthManager>()));
  gh.factory<_i24.ChatRepository>(() =>
      _i24.ChatRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i25.ChatsListScreen>(
      () => _i25.ChatsListScreen(get<_i22.AuthService>()));
  gh.factory<_i26.CountryRepository>(() =>
      _i26.CountryRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i27.DistributorRepository>(() => _i27.DistributorRepository(
      get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i28.EditShipmentRepository>(() => _i28.EditShipmentRepository(
      get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i29.FirstOptionRepository>(() => _i29.FirstOptionRepository(
      get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i30.HomeRepository>(() =>
      _i30.HomeRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i31.ImageUploadService>(
      () => _i31.ImageUploadService(get<_i20.UploadManager>()));
  gh.factory<_i32.LoginStateManager>(
      () => _i32.LoginStateManager(get<_i22.AuthService>()));
  gh.factory<_i33.MarkRepository>(() =>
      _i33.MarkRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i34.MyShipmentRepository>(() => _i34.MyShipmentRepository(
      get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i35.NotificationRepo>(() =>
      _i35.NotificationRepo(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i36.ProfileRepository>(() =>
      _i36.ProfileRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i37.ProxyRepository>(() =>
      _i37.ProxyRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i38.RegisterStateManager>(
      () => _i38.RegisterStateManager(get<_i22.AuthService>()));
  gh.factory<_i39.ReportRepository>(() => _i39.ReportRepository(
      get<_i16.ApiClient>(),
      get<_i22.AuthService>(),
      get<_i12.ReportPrefsHelper>()));
  gh.factory<_i40.SplashScreen>(
      () => _i40.SplashScreen(get<_i22.AuthService>()));
  gh.factory<_i41.SubContractServiceRepository>(() =>
      _i41.SubContractServiceRepository(
          get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i42.SubcontractRepository>(() => _i42.SubcontractRepository(
      get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i43.SupplierRepository>(() =>
      _i43.SupplierRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i44.TrackingRepository>(() =>
      _i44.TrackingRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i45.UnitRepository>(() =>
      _i45.UnitRepository(get<_i16.ApiClient>(), get<_i22.AuthService>()));
  gh.factory<_i46.ChatManager>(
      () => _i46.ChatManager(get<_i24.ChatRepository>()));
  gh.factory<_i47.ChatModule>(() => _i47.ChatModule(get<_i25.ChatsListScreen>(),
      get<_i22.AuthService>(), get<_i4.ChatScreen>()));
  gh.factory<_i48.ChatService>(() => _i48.ChatService(get<_i46.ChatManager>()));
  gh.factory<_i49.CountryManager>(
      () => _i49.CountryManager(get<_i26.CountryRepository>()));
  gh.factory<_i50.CountryService>(
      () => _i50.CountryService(get<_i49.CountryManager>()));
  gh.factory<_i51.CountryStateManager>(
      () => _i51.CountryStateManager(get<_i50.CountryService>()));
  gh.factory<_i52.DistributorManager>(
      () => _i52.DistributorManager(get<_i27.DistributorRepository>()));
  gh.factory<_i53.DistributorService>(
      () => _i53.DistributorService(get<_i52.DistributorManager>()));
  gh.factory<_i54.DistributorStateManager>(
      () => _i54.DistributorStateManager(get<_i53.DistributorService>()));
  gh.factory<_i55.DistributorsScreen>(
      () => _i55.DistributorsScreen(get<_i54.DistributorStateManager>()));
  gh.factory<_i56.EditShipmentManager>(
      () => _i56.EditShipmentManager(get<_i28.EditShipmentRepository>()));
  gh.factory<_i57.EditShipmentService>(
      () => _i57.EditShipmentService(get<_i56.EditShipmentManager>()));
  gh.factory<_i58.EditShipmentStateManager>(() => _i58.EditShipmentStateManager(
      get<_i57.EditShipmentService>(), get<_i31.ImageUploadService>()));
  gh.factory<_i59.EditedShipmentScreen>(
      () => _i59.EditedShipmentScreen(get<_i58.EditShipmentStateManager>()));
  gh.factory<_i60.FireNotificationService>(() => _i60.FireNotificationService(
      get<_i10.NotificationsPrefsHelper>(), get<_i35.NotificationRepo>()));
  gh.factory<_i61.FirstOptionManager>(
      () => _i61.FirstOptionManager(get<_i29.FirstOptionRepository>()));
  gh.factory<_i62.FirstOptionService>(
      () => _i62.FirstOptionService(get<_i61.FirstOptionManager>()));
  gh.factory<_i63.HomeManager>(
      () => _i63.HomeManager(get<_i30.HomeRepository>()));
  gh.factory<_i64.HomeService>(() => _i64.HomeService(get<_i63.HomeManager>()));
  gh.factory<_i65.HomeStateManager>(
      () => _i65.HomeStateManager(get<_i64.HomeService>()));
  gh.factory<_i66.LoginScreen>(
      () => _i66.LoginScreen(get<_i32.LoginStateManager>()));
  gh.factory<_i67.MarkManager>(
      () => _i67.MarkManager(get<_i33.MarkRepository>()));
  gh.factory<_i68.MarkService>(() => _i68.MarkService(get<_i67.MarkManager>()));
  gh.factory<_i69.MarkStateManager>(
      () => _i69.MarkStateManager(get<_i68.MarkService>()));
  gh.factory<_i70.MyShipmentManager>(
      () => _i70.MyShipmentManager(get<_i34.MyShipmentRepository>()));
  gh.factory<_i71.MyShipmentService>(
      () => _i71.MyShipmentService(get<_i70.MyShipmentManager>()));
  gh.factory<_i72.MyShipmentStateManger>(
      () => _i72.MyShipmentStateManger(get<_i71.MyShipmentService>()));
  gh.factory<_i73.ProfileManager>(
      () => _i73.ProfileManager(get<_i36.ProfileRepository>()));
  gh.factory<_i74.ProfileService>(
      () => _i74.ProfileService(get<_i73.ProfileManager>()));
  gh.factory<_i75.ProfileStateManager>(
      () => _i75.ProfileStateManager(get<_i74.ProfileService>()));
  gh.factory<_i76.ProxyManager>(
      () => _i76.ProxyManager(get<_i37.ProxyRepository>()));
  gh.factory<_i77.ProxyService>(
      () => _i77.ProxyService(get<_i76.ProxyManager>()));
  gh.factory<_i78.ProxyStateManager>(
      () => _i78.ProxyStateManager(get<_i77.ProxyService>()));
  gh.factory<_i79.RegisterScreen>(
      () => _i79.RegisterScreen(get<_i38.RegisterStateManager>()));
  gh.factory<_i80.ReportManager>(
      () => _i80.ReportManager(get<_i39.ReportRepository>()));
  gh.factory<_i81.ReportService>(
      () => _i81.ReportService(get<_i80.ReportManager>()));
  gh.factory<_i82.RequestShipmentStateManger>(() =>
      _i82.RequestShipmentStateManger(
          get<_i62.FirstOptionService>(), get<_i68.MarkService>()));
  gh.factory<_i83.SettingsScreen>(() => _i83.SettingsScreen(
      get<_i22.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i17.AppThemeDataService>(),
      get<_i60.FireNotificationService>()));
  gh.factory<_i84.SplashModule>(
      () => _i84.SplashModule(get<_i40.SplashScreen>()));
  gh.factory<_i85.SubContractServiceManager>(() =>
      _i85.SubContractServiceManager(get<_i41.SubContractServiceRepository>()));
  gh.factory<_i86.SubContractServiceService>(() =>
      _i86.SubContractServiceService(get<_i85.SubContractServiceManager>()));
  gh.factory<_i87.SubContractServiceStateManager>(() =>
      _i87.SubContractServiceStateManager(
          get<_i86.SubContractServiceService>()));
  gh.factory<_i88.SubcontractManager>(
      () => _i88.SubcontractManager(get<_i42.SubcontractRepository>()));
  gh.factory<_i89.SubcontractService>(
      () => _i89.SubcontractService(get<_i88.SubcontractManager>()));
  gh.factory<_i90.SubcontractStateManager>(
      () => _i90.SubcontractStateManager(get<_i89.SubcontractService>()));
  gh.factory<_i91.SupplierManager>(
      () => _i91.SupplierManager(get<_i43.SupplierRepository>()));
  gh.factory<_i92.SupplierService>(
      () => _i92.SupplierService(get<_i91.SupplierManager>()));
  gh.factory<_i93.SupplierStateManager>(
      () => _i93.SupplierStateManager(get<_i92.SupplierService>()));
  gh.factory<_i94.SuppliersScreen>(
      () => _i94.SuppliersScreen(get<_i93.SupplierStateManager>()));
  gh.factory<_i95.TrackingManager>(
      () => _i95.TrackingManager(get<_i44.TrackingRepository>()));
  gh.factory<_i96.TrackingService>(
      () => _i96.TrackingService(get<_i95.TrackingManager>()));
  gh.factory<_i97.TrackingStateManager>(
      () => _i97.TrackingStateManager(get<_i96.TrackingService>()));
  gh.factory<_i98.UnitManager>(
      () => _i98.UnitManager(get<_i45.UnitRepository>()));
  gh.factory<_i99.UnitService>(() => _i99.UnitService(get<_i98.UnitManager>()));
  gh.factory<_i100.UnitStateManager>(
      () => _i100.UnitStateManager(get<_i99.UnitService>()));
  gh.factory<_i101.UnitsScreen>(
      () => _i101.UnitsScreen(get<_i100.UnitStateManager>()));
  gh.factory<_i102.AddCountryStateManager>(
      () => _i102.AddCountryStateManager(get<_i50.CountryService>()));
  gh.factory<_i103.AddDistributorStateManager>(
      () => _i103.AddDistributorStateManager(get<_i53.DistributorService>()));
  gh.factory<_i104.AddNewCountry>(
      () => _i104.AddNewCountry(get<_i102.AddCountryStateManager>()));
  gh.factory<_i105.AddNewDistributor>(
      () => _i105.AddNewDistributor(get<_i103.AddDistributorStateManager>()));
  gh.factory<_i106.AddProxyStateManager>(
      () => _i106.AddProxyStateManager(get<_i77.ProxyService>()));
  gh.factory<_i107.AddSubContractServiceStateManager>(() =>
      _i107.AddSubContractServiceStateManager(
          get<_i86.SubContractServiceService>()));
  gh.factory<_i108.AddSubcontractStateManager>(() =>
      _i108.AddSubcontractStateManager(get<_i86.SubContractServiceService>(),
          get<_i89.SubcontractService>()));
  gh.factory<_i109.AddSupplierStateManager>(
      () => _i109.AddSupplierStateManager(get<_i92.SupplierService>()));
  gh.factory<_i110.AddUnitStateManager>(
      () => _i110.AddUnitStateManager(get<_i99.UnitService>()));
  gh.factory<_i111.AuthorizationModule>(() => _i111.AuthorizationModule(
      get<_i66.LoginScreen>(), get<_i79.RegisterScreen>()));
  gh.factory<_i112.ChatPageBloc>(
      () => _i112.ChatPageBloc(get<_i48.ChatService>()));
  gh.factory<_i113.CountriesScreen>(
      () => _i113.CountriesScreen(get<_i51.CountryStateManager>()));
  gh.factory<_i114.CountryModule>(() => _i114.CountryModule(
      get<_i113.CountriesScreen>(), get<_i104.AddNewCountry>()));
  gh.factory<_i115.DistributorsModule>(() => _i115.DistributorsModule(
      get<_i55.DistributorsScreen>(), get<_i105.AddNewDistributor>()));
  gh.factory<_i116.EditShipmentModule>(
      () => _i116.EditShipmentModule(get<_i59.EditedShipmentScreen>()));
  gh.factory<_i117.HomeScreen>(
      () => _i117.HomeScreen(get<_i65.HomeStateManager>()));
  gh.factory<_i118.MarkScreen>(
      () => _i118.MarkScreen(get<_i69.MarkStateManager>()));
  gh.factory<_i119.MyShipmentScreen>(
      () => _i119.MyShipmentScreen(get<_i72.MyShipmentStateManger>()));
  gh.factory<_i120.NewShipment>(
      () => _i120.NewShipment(get<_i82.RequestShipmentStateManger>()));
  gh.factory<_i121.NewShipmentsModule>(
      () => _i121.NewShipmentsModule(get<_i120.NewShipment>()));
  gh.factory<_i122.ProfileScreen>(
      () => _i122.ProfileScreen(get<_i75.ProfileStateManager>()));
  gh.factory<_i123.ProxiesScreen>(
      () => _i123.ProxiesScreen(get<_i78.ProxyStateManager>()));
  gh.factory<_i124.SettingsModule>(
      () => _i124.SettingsModule(get<_i83.SettingsScreen>()));
  gh.factory<_i125.SubContractServiceScreen>(() =>
      _i125.SubContractServiceScreen(
          get<_i87.SubContractServiceStateManager>()));
  gh.factory<_i126.SubcontractScreen>(
      () => _i126.SubcontractScreen(get<_i90.SubcontractStateManager>()));
  gh.factory<_i127.TrackingScreen>(
      () => _i127.TrackingScreen(get<_i97.TrackingStateManager>()));
  gh.factory<_i128.AddNewProxy>(
      () => _i128.AddNewProxy(get<_i106.AddProxyStateManager>()));
  gh.factory<_i129.AddNewSubContractService>(() =>
      _i129.AddNewSubContractService(
          get<_i107.AddSubContractServiceStateManager>()));
  gh.factory<_i130.AddNewSubcontract>(
      () => _i130.AddNewSubcontract(get<_i108.AddSubcontractStateManager>()));
  gh.factory<_i131.AddNewSupplier>(
      () => _i131.AddNewSupplier(get<_i109.AddSupplierStateManager>()));
  gh.factory<_i132.AddNewUnit>(
      () => _i132.AddNewUnit(get<_i110.AddUnitStateManager>()));
  gh.factory<_i133.HomeModule>(() => _i133.HomeModule(get<_i117.HomeScreen>()));
  gh.factory<_i134.MarkModule>(() => _i134.MarkModule(get<_i118.MarkScreen>()));
  gh.factory<_i135.MyShipmentModule>(() => _i135.MyShipmentModule(
      get<_i119.MyShipmentScreen>(), get<_i13.ReviewShipmentScreen>()));
  gh.factory<_i136.ProfileModule>(
      () => _i136.ProfileModule(get<_i122.ProfileScreen>()));
  gh.factory<_i137.ProxiesModule>(() => _i137.ProxiesModule(
      get<_i123.ProxiesScreen>(), get<_i128.AddNewProxy>()));
  gh.factory<_i138.SubContractServiceModule>(() =>
      _i138.SubContractServiceModule(get<_i125.SubContractServiceScreen>(),
          get<_i129.AddNewSubContractService>()));
  gh.factory<_i139.SubcontractModule>(() => _i139.SubcontractModule(
      get<_i126.SubcontractScreen>(), get<_i130.AddNewSubcontract>()));
  gh.factory<_i140.SupplierModule>(() => _i140.SupplierModule(
      get<_i94.SuppliersScreen>(), get<_i131.AddNewSupplier>()));
  gh.factory<_i141.TrackingModule>(
      () => _i141.TrackingModule(get<_i127.TrackingScreen>()));
  gh.factory<_i142.UnitModule>(() =>
      _i142.UnitModule(get<_i101.UnitsScreen>(), get<_i132.AddNewUnit>()));
  gh.factory<_i143.MyApp>(() => _i143.MyApp(
      get<_i17.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i60.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i111.AuthorizationModule>(),
      get<_i47.ChatModule>(),
      get<_i124.SettingsModule>(),
      get<_i133.HomeModule>(),
      get<_i136.ProfileModule>(),
      get<_i134.MarkModule>(),
      get<_i19.NotificationModule>(),
      get<_i121.NewShipmentsModule>(),
      get<_i141.TrackingModule>(),
      get<_i135.MyShipmentModule>(),
      get<_i116.EditShipmentModule>(),
      get<_i114.CountryModule>(),
      get<_i115.DistributorsModule>(),
      get<_i137.ProxiesModule>(),
      get<_i140.SupplierModule>(),
      get<_i138.SubContractServiceModule>(),
      get<_i139.SubcontractModule>(),
      get<_i142.UnitModule>()));
  return get;
}
