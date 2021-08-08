// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i195;
import '../module_auth/authoriazation_module.dart' as _i143;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i23;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i20;
import '../module_auth/service/auth_service/auth_service.dart' as _i24;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i36;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i42;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i80;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i93;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i144;
import '../module_chat/chat_module.dart' as _i54;
import '../module_chat/manager/chat/chat_manager.dart' as _i53;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i55;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_container/container_module.dart' as _i180;
import '../module_container/manager/container_manager.dart' as _i56;
import '../module_container/repository/container_repository.dart' as _i28;
import '../module_container/service/container_service.dart' as _i57;
import '../module_container/state_manger/container_state_manager.dart' as _i62;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i145;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i152;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i130;
import '../module_container/ui/screen/container_details_screen.dart' as _i178;
import '../module_container/ui/screen/container_filter_screen.dart' as _i179;
import '../module_container/ui/screen/container_new_screen.dart' as _i133;
import '../module_container/ui/screen/container_screen.dart' as _i146;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container_specification/container_specification_module.dart'
    as _i147;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i58;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i29;
import '../module_container_specification/service/container_specification_service.dart'
    as _i59;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i60;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i129;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i134;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i61;
import '../module_countries/country_module.dart' as _i149;
import '../module_countries/manager/country_manager.dart' as _i63;
import '../module_countries/repository/country_repository.dart' as _i30;
import '../module_countries/service/country_service.dart' as _i64;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i65;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i131;
import '../module_countries/ui/screen/countries_screen.dart' as _i148;
import '../module_countries/ui/screen/country_new_screen.dart' as _i135;
import '../module_distributors/distributors_module.dart' as _i150;
import '../module_distributors/manager/distributors_manager.dart' as _i66;
import '../module_distributors/repository/distributors_repository.dart' as _i31;
import '../module_distributors/service/distributors_service.dart' as _i67;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i68;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i132;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i136;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i69;
import '../module_edit_shipment/edit_shipment_module.dart' as _i151;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i70;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i32;
import '../module_edit_shipment/service/editshipment_service.dart' as _i71;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i72;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i73;
import '../module_home/home_module.dart' as _i181;
import '../module_home/manager/home_manager.dart' as _i77;
import '../module_home/repository/home_repository.dart' as _i34;
import '../module_home/service/home_service.dart' as _i78;
import '../module_home/state_manager/state_manager_home.dart' as _i79;
import '../module_home/ui/screen/home_screen.dart' as _i154;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i81;
import '../module_mark/mark_module.dart' as _i182;
import '../module_mark/repository/mark_repository.dart' as _i37;
import '../module_mark/service/mark_service.dart' as _i82;
import '../module_mark/state_manager/mark_state_manager.dart' as _i83;
import '../module_mark/ui/mark_screen.dart' as _i155;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i84;
import '../module_my_shipment/my_shipment_module.dart' as _i183;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i38;
import '../module_my_shipment/service/my_shipment_service.dart' as _i85;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i86;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i15;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i156;
import '../module_network/http_client/http_client.dart' as _i18;
import '../module_notifications/notification_module.dart' as _i21;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i12;
import '../module_notifications/repository/notification_repo.dart' as _i39;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i74;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i11;
import '../module_profile/manager/profile_manager.dart' as _i87;
import '../module_profile/profile_module.dart' as _i184;
import '../module_profile/repository/profile_repository.dart' as _i40;
import '../module_profile/service/profile_service.dart' as _i88;
import '../module_profile/state_manager/profile_state_manager.dart' as _i89;
import '../module_profile/ui/profile_screen.dart' as _i159;
import '../module_proxies/manager/proxies_manager.dart' as _i90;
import '../module_proxies/proxies_module.dart' as _i185;
import '../module_proxies/repository/proxies_repository.dart' as _i41;
import '../module_proxies/service/proixes_service.dart' as _i91;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i137;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i92;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i160;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i172;
import '../module_report/manager/report_manager.dart' as _i94;
import '../module_report/presistance/report_prefs_helper.dart' as _i14;
import '../module_report/repository/report_repository.dart' as _i43;
import '../module_report/service/report_service.dart' as _i95;
import '../module_settings/settings_module.dart' as _i161;
import '../module_settings/ui/settings_page/settings_page.dart' as _i97;
import '../module_shipment_previous/shipment_previous_module.dart' as _i13;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i75;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i33;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i76;
import '../module_shipment_request/shipment_request_module.dart' as _i158;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i96;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i157;
import '../module_shipment_track/manager/tracking_manager.dart' as _i109;
import '../module_shipment_track/repository/tracking_repository.dart' as _i48;
import '../module_shipment_track/service/tracking_service.dart' as _i110;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i111;
import '../module_shipment_track/tracking_module.dart' as _i189;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i164;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i194;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i124;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i52;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i125;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i126;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i127;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i128;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i169;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i170;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i171;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i3;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i119;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i51;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i120;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i121;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i122;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i123;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i168;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i193;
import '../module_splash/splash_module.dart' as _i98;
import '../module_splash/ui/screen/splash_screen.dart' as _i44;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i102;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i46;
import '../module_sub_contract/service/subcontract_service.dart' as _i103;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i139;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i104;
import '../module_sub_contract/subcontract_module.dart' as _i187;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i174;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i163;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i99;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i45;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i100;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i138;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i101;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i186;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i173;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i162;
import '../module_suppliers/manager/suppliers_manager.dart' as _i105;
import '../module_suppliers/repository/suppliers_repository.dart' as _i47;
import '../module_suppliers/service/suppliers_service.dart' as _i106;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i140;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i107;
import '../module_suppliers/supplier_module.dart' as _i188;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i175;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i108;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i16;
import '../module_theme/service/theme_service/theme_service.dart' as _i19;
import '../module_travel/manager/travel_manager.dart' as _i112;
import '../module_travel/repository/travel_repository.dart' as _i49;
import '../module_travel/service/travel_service.dart' as _i113;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i165;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i153;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i141;
import '../module_travel/state_manger/travels_state_manager.dart' as _i114;
import '../module_travel/travel_module.dart' as _i191;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i190;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i166;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i176;
import '../module_travel/ui/screen/travel_screen.dart' as _i167;
import '../module_unit/manager/unit_manager.dart' as _i115;
import '../module_unit/repository/unit_repository.dart' as _i50;
import '../module_unit/service/unit_service.dart' as _i116;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i142;
import '../module_unit/state_manger/units_state_manager.dart' as _i117;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i177;
import '../module_unit/ui/screen/units_screen.dart' as _i118;
import '../module_unit/unit_module.dart' as _i192;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i22;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i17;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i35;
import '../utils/logger/logger.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AcceptedShipmentFilterScreen>(
      () => _i3.AcceptedShipmentFilterScreen());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i5.ChatScreen>(() => _i5.ChatScreen());
  gh.factory<_i6.ContainerShipmentReview>(() => _i6.ContainerShipmentReview());
  gh.factory<_i7.LocalNotificationService>(
      () => _i7.LocalNotificationService());
  gh.factory<_i8.LocalizationPreferencesHelper>(
      () => _i8.LocalizationPreferencesHelper());
  gh.factory<_i9.LocalizationService>(
      () => _i9.LocalizationService(get<_i8.LocalizationPreferencesHelper>()));
  gh.factory<_i10.Logger>(() => _i10.Logger());
  gh.factory<_i11.NotificationScreen>(() => _i11.NotificationScreen());
  gh.factory<_i12.NotificationsPrefsHelper>(
      () => _i12.NotificationsPrefsHelper());
  gh.factory<_i13.PreviousShipmentsModule>(
      () => _i13.PreviousShipmentsModule());
  gh.factory<_i14.ReportPrefsHelper>(() => _i14.ReportPrefsHelper());
  gh.factory<_i15.ReviewShipmentScreen>(() => _i15.ReviewShipmentScreen());
  gh.factory<_i16.ThemePreferencesHelper>(() => _i16.ThemePreferencesHelper());
  gh.factory<_i17.UploadRepository>(() => _i17.UploadRepository());
  gh.factory<_i18.ApiClient>(() => _i18.ApiClient(get<_i10.Logger>()));
  gh.factory<_i19.AppThemeDataService>(
      () => _i19.AppThemeDataService(get<_i16.ThemePreferencesHelper>()));
  gh.factory<_i20.AuthRepository>(
      () => _i20.AuthRepository(get<_i18.ApiClient>()));
  gh.factory<_i21.NotificationModule>(
      () => _i21.NotificationModule(get<_i11.NotificationScreen>()));
  gh.factory<_i22.UploadManager>(
      () => _i22.UploadManager(get<_i17.UploadRepository>()));
  gh.factory<_i23.AuthManager>(
      () => _i23.AuthManager(get<_i20.AuthRepository>()));
  gh.factory<_i24.AuthService>(() =>
      _i24.AuthService(get<_i4.AuthPrefsHelper>(), get<_i23.AuthManager>()));
  gh.factory<_i25.AuthServiceApi>(() =>
      _i25.AuthServiceApi(get<_i4.AuthPrefsHelper>(), get<_i23.AuthManager>()));
  gh.factory<_i26.ChatRepository>(() =>
      _i26.ChatRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i27.ChatsListScreen>(
      () => _i27.ChatsListScreen(get<_i24.AuthService>()));
  gh.factory<_i28.ContainerRepository>(() =>
      _i28.ContainerRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i29.ContainerSpecificationRepository>(() =>
      _i29.ContainerSpecificationRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i30.CountryRepository>(() =>
      _i30.CountryRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i31.DistributorRepository>(() => _i31.DistributorRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i32.EditShipmentRepository>(() => _i32.EditShipmentRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i33.FirstOptionRepository>(() => _i33.FirstOptionRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i34.HomeRepository>(() =>
      _i34.HomeRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i35.ImageUploadService>(
      () => _i35.ImageUploadService(get<_i22.UploadManager>()));
  gh.factory<_i36.LoginStateManager>(
      () => _i36.LoginStateManager(get<_i24.AuthService>()));
  gh.factory<_i37.MarkRepository>(() =>
      _i37.MarkRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i38.MyShipmentRepository>(() => _i38.MyShipmentRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i39.NotificationRepo>(() =>
      _i39.NotificationRepo(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i40.ProfileRepository>(() =>
      _i40.ProfileRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i41.ProxyRepository>(() =>
      _i41.ProxyRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i42.RegisterStateManager>(
      () => _i42.RegisterStateManager(get<_i24.AuthService>()));
  gh.factory<_i43.ReportRepository>(() => _i43.ReportRepository(
      get<_i18.ApiClient>(),
      get<_i24.AuthService>(),
      get<_i14.ReportPrefsHelper>()));
  gh.factory<_i44.SplashScreen>(
      () => _i44.SplashScreen(get<_i24.AuthService>()));
  gh.factory<_i45.SubContractServiceRepository>(() =>
      _i45.SubContractServiceRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i46.SubcontractRepository>(() => _i46.SubcontractRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i47.SupplierRepository>(() =>
      _i47.SupplierRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i48.TrackingRepository>(() =>
      _i48.TrackingRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i49.TravelRepository>(() =>
      _i49.TravelRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i50.UnitRepository>(() =>
      _i50.UnitRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i51.WaitingShipmentRepository>(() =>
      _i51.WaitingShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i52.AcceptedShipmentRepository>(() =>
      _i52.AcceptedShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i53.ChatManager>(
      () => _i53.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i54.ChatModule>(() => _i54.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i24.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i55.ChatService>(() => _i55.ChatService(get<_i53.ChatManager>()));
  gh.factory<_i56.ContainerManager>(
      () => _i56.ContainerManager(get<_i28.ContainerRepository>()));
  gh.factory<_i57.ContainerService>(
      () => _i57.ContainerService(get<_i56.ContainerManager>()));
  gh.factory<_i58.ContainerSpecificationManager>(() =>
      _i58.ContainerSpecificationManager(
          get<_i29.ContainerSpecificationRepository>()));
  gh.factory<_i59.ContainerSpecificationService>(() =>
      _i59.ContainerSpecificationService(
          get<_i58.ContainerSpecificationManager>()));
  gh.factory<_i60.ContainerSpecificationStateManager>(() =>
      _i60.ContainerSpecificationStateManager(
          get<_i59.ContainerSpecificationService>()));
  gh.factory<_i61.ContainerSpecificationsScreen>(() =>
      _i61.ContainerSpecificationsScreen(
          get<_i60.ContainerSpecificationStateManager>()));
  gh.factory<_i62.ContainerStateManager>(
      () => _i62.ContainerStateManager(get<_i57.ContainerService>()));
  gh.factory<_i63.CountryManager>(
      () => _i63.CountryManager(get<_i30.CountryRepository>()));
  gh.factory<_i64.CountryService>(
      () => _i64.CountryService(get<_i63.CountryManager>()));
  gh.factory<_i65.CountryStateManager>(
      () => _i65.CountryStateManager(get<_i64.CountryService>()));
  gh.factory<_i66.DistributorManager>(
      () => _i66.DistributorManager(get<_i31.DistributorRepository>()));
  gh.factory<_i67.DistributorService>(
      () => _i67.DistributorService(get<_i66.DistributorManager>()));
  gh.factory<_i68.DistributorStateManager>(
      () => _i68.DistributorStateManager(get<_i67.DistributorService>()));
  gh.factory<_i69.DistributorsScreen>(
      () => _i69.DistributorsScreen(get<_i68.DistributorStateManager>()));
  gh.factory<_i70.EditShipmentManager>(
      () => _i70.EditShipmentManager(get<_i32.EditShipmentRepository>()));
  gh.factory<_i71.EditShipmentService>(
      () => _i71.EditShipmentService(get<_i70.EditShipmentManager>()));
  gh.factory<_i72.EditShipmentStateManager>(() => _i72.EditShipmentStateManager(
      get<_i71.EditShipmentService>(), get<_i35.ImageUploadService>()));
  gh.factory<_i73.EditedShipmentScreen>(
      () => _i73.EditedShipmentScreen(get<_i72.EditShipmentStateManager>()));
  gh.factory<_i74.FireNotificationService>(() => _i74.FireNotificationService(
      get<_i12.NotificationsPrefsHelper>(), get<_i39.NotificationRepo>()));
  gh.factory<_i75.FirstOptionManager>(
      () => _i75.FirstOptionManager(get<_i33.FirstOptionRepository>()));
  gh.factory<_i76.FirstOptionService>(
      () => _i76.FirstOptionService(get<_i75.FirstOptionManager>()));
  gh.factory<_i77.HomeManager>(
      () => _i77.HomeManager(get<_i34.HomeRepository>()));
  gh.factory<_i78.HomeService>(() => _i78.HomeService(get<_i77.HomeManager>()));
  gh.factory<_i79.HomeStateManager>(
      () => _i79.HomeStateManager(get<_i78.HomeService>()));
  gh.factory<_i80.LoginScreen>(
      () => _i80.LoginScreen(get<_i36.LoginStateManager>()));
  gh.factory<_i81.MarkManager>(
      () => _i81.MarkManager(get<_i37.MarkRepository>()));
  gh.factory<_i82.MarkService>(() => _i82.MarkService(get<_i81.MarkManager>()));
  gh.factory<_i83.MarkStateManager>(
      () => _i83.MarkStateManager(get<_i82.MarkService>()));
  gh.factory<_i84.MyShipmentManager>(
      () => _i84.MyShipmentManager(get<_i38.MyShipmentRepository>()));
  gh.factory<_i85.MyShipmentService>(
      () => _i85.MyShipmentService(get<_i84.MyShipmentManager>()));
  gh.factory<_i86.MyShipmentStateManger>(
      () => _i86.MyShipmentStateManger(get<_i85.MyShipmentService>()));
  gh.factory<_i87.ProfileManager>(
      () => _i87.ProfileManager(get<_i40.ProfileRepository>()));
  gh.factory<_i88.ProfileService>(
      () => _i88.ProfileService(get<_i87.ProfileManager>()));
  gh.factory<_i89.ProfileStateManager>(
      () => _i89.ProfileStateManager(get<_i88.ProfileService>()));
  gh.factory<_i90.ProxyManager>(
      () => _i90.ProxyManager(get<_i41.ProxyRepository>()));
  gh.factory<_i91.ProxyService>(
      () => _i91.ProxyService(get<_i90.ProxyManager>()));
  gh.factory<_i92.ProxyStateManager>(
      () => _i92.ProxyStateManager(get<_i91.ProxyService>()));
  gh.factory<_i93.RegisterScreen>(
      () => _i93.RegisterScreen(get<_i42.RegisterStateManager>()));
  gh.factory<_i94.ReportManager>(
      () => _i94.ReportManager(get<_i43.ReportRepository>()));
  gh.factory<_i95.ReportService>(
      () => _i95.ReportService(get<_i94.ReportManager>()));
  gh.factory<_i96.RequestShipmentStateManger>(() =>
      _i96.RequestShipmentStateManger(
          get<_i76.FirstOptionService>(), get<_i82.MarkService>()));
  gh.factory<_i97.SettingsScreen>(() => _i97.SettingsScreen(
      get<_i24.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i19.AppThemeDataService>(),
      get<_i74.FireNotificationService>()));
  gh.factory<_i98.SplashModule>(
      () => _i98.SplashModule(get<_i44.SplashScreen>()));
  gh.factory<_i99.SubContractServiceManager>(() =>
      _i99.SubContractServiceManager(get<_i45.SubContractServiceRepository>()));
  gh.factory<_i100.SubContractServiceService>(() =>
      _i100.SubContractServiceService(get<_i99.SubContractServiceManager>()));
  gh.factory<_i101.SubContractServiceStateManager>(() =>
      _i101.SubContractServiceStateManager(
          get<_i100.SubContractServiceService>()));
  gh.factory<_i102.SubcontractManager>(
      () => _i102.SubcontractManager(get<_i46.SubcontractRepository>()));
  gh.factory<_i103.SubcontractService>(
      () => _i103.SubcontractService(get<_i102.SubcontractManager>()));
  gh.factory<_i104.SubcontractStateManager>(
      () => _i104.SubcontractStateManager(get<_i103.SubcontractService>()));
  gh.factory<_i105.SupplierManager>(
      () => _i105.SupplierManager(get<_i47.SupplierRepository>()));
  gh.factory<_i106.SupplierService>(
      () => _i106.SupplierService(get<_i105.SupplierManager>()));
  gh.factory<_i107.SupplierStateManager>(
      () => _i107.SupplierStateManager(get<_i106.SupplierService>()));
  gh.factory<_i108.SuppliersScreen>(
      () => _i108.SuppliersScreen(get<_i107.SupplierStateManager>()));
  gh.factory<_i109.TrackingManager>(
      () => _i109.TrackingManager(get<_i48.TrackingRepository>()));
  gh.factory<_i110.TrackingService>(
      () => _i110.TrackingService(get<_i109.TrackingManager>()));
  gh.factory<_i111.TrackingStateManager>(
      () => _i111.TrackingStateManager(get<_i110.TrackingService>()));
  gh.factory<_i112.TravelManager>(
      () => _i112.TravelManager(get<_i49.TravelRepository>()));
  gh.factory<_i113.TravelService>(
      () => _i113.TravelService(get<_i112.TravelManager>()));
  gh.factory<_i114.TravelStateManager>(
      () => _i114.TravelStateManager(get<_i113.TravelService>()));
  gh.factory<_i115.UnitManager>(
      () => _i115.UnitManager(get<_i50.UnitRepository>()));
  gh.factory<_i116.UnitService>(
      () => _i116.UnitService(get<_i115.UnitManager>()));
  gh.factory<_i117.UnitStateManager>(
      () => _i117.UnitStateManager(get<_i116.UnitService>()));
  gh.factory<_i118.UnitsScreen>(
      () => _i118.UnitsScreen(get<_i117.UnitStateManager>()));
  gh.factory<_i119.WaitingShipmentManager>(() =>
      _i119.WaitingShipmentManager(get<_i51.WaitingShipmentRepository>()));
  gh.factory<_i120.WaitingShipmentService>(
      () => _i120.WaitingShipmentService(get<_i119.WaitingShipmentManager>()));
  gh.factory<_i121.WaitingShipmentsDetailsStateManager>(() =>
      _i121.WaitingShipmentsDetailsStateManager(
          get<_i120.WaitingShipmentService>()));
  gh.factory<_i122.WaitingShipmentsStateManager>(() =>
      _i122.WaitingShipmentsStateManager(get<_i120.WaitingShipmentService>()));
  gh.factory<_i123.WantingShipmentDetailsScreen>(() =>
      _i123.WantingShipmentDetailsScreen(
          get<_i121.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i124.AcceptedShipmentManager>(() =>
      _i124.AcceptedShipmentManager(get<_i52.AcceptedShipmentRepository>()));
  gh.factory<_i125.AcceptedShipmentService>(() =>
      _i125.AcceptedShipmentService(get<_i124.AcceptedShipmentManager>()));
  gh.factory<_i126.AcceptedShipmentsDetailsStateManager>(() =>
      _i126.AcceptedShipmentsDetailsStateManager(
          get<_i125.AcceptedShipmentService>(), get<_i57.ContainerService>()));
  gh.factory<_i127.AcceptedShipmentsStateManager>(() =>
      _i127.AcceptedShipmentsStateManager(
          get<_i125.AcceptedShipmentService>()));
  gh.factory<_i128.AcceptedShipmentsStatusStateManager>(() =>
      _i128.AcceptedShipmentsStatusStateManager(
          get<_i125.AcceptedShipmentService>(),
          get<_i103.SubcontractService>(),
          get<_i57.ContainerService>()));
  gh.factory<_i129.AddContainerSpecificationStateManager>(() =>
      _i129.AddContainerSpecificationStateManager(
          get<_i59.ContainerSpecificationService>()));
  gh.factory<_i130.AddContainerStateManager>(() =>
      _i130.AddContainerStateManager(
          get<_i57.ContainerService>(),
          get<_i103.SubcontractService>(),
          get<_i59.ContainerSpecificationService>()));
  gh.factory<_i131.AddCountryStateManager>(
      () => _i131.AddCountryStateManager(get<_i64.CountryService>()));
  gh.factory<_i132.AddDistributorStateManager>(
      () => _i132.AddDistributorStateManager(get<_i67.DistributorService>()));
  gh.factory<_i133.AddNewContainer>(
      () => _i133.AddNewContainer(get<_i130.AddContainerStateManager>()));
  gh.factory<_i134.AddNewContainerSpecification>(() =>
      _i134.AddNewContainerSpecification(
          get<_i129.AddContainerSpecificationStateManager>()));
  gh.factory<_i135.AddNewCountry>(
      () => _i135.AddNewCountry(get<_i131.AddCountryStateManager>()));
  gh.factory<_i136.AddNewDistributor>(
      () => _i136.AddNewDistributor(get<_i132.AddDistributorStateManager>()));
  gh.factory<_i137.AddProxyStateManager>(
      () => _i137.AddProxyStateManager(get<_i91.ProxyService>()));
  gh.factory<_i138.AddSubContractServiceStateManager>(() =>
      _i138.AddSubContractServiceStateManager(
          get<_i100.SubContractServiceService>()));
  gh.factory<_i139.AddSubcontractStateManager>(() =>
      _i139.AddSubcontractStateManager(get<_i100.SubContractServiceService>(),
          get<_i103.SubcontractService>()));
  gh.factory<_i140.AddSupplierStateManager>(
      () => _i140.AddSupplierStateManager(get<_i106.SupplierService>()));
  gh.factory<_i141.AddTravelStateManager>(() => _i141.AddTravelStateManager(
      get<_i113.TravelService>(),
      get<_i64.CountryService>(),
      get<_i103.SubcontractService>()));
  gh.factory<_i142.AddUnitStateManager>(
      () => _i142.AddUnitStateManager(get<_i116.UnitService>()));
  gh.factory<_i143.AuthorizationModule>(() => _i143.AuthorizationModule(
      get<_i80.LoginScreen>(), get<_i93.RegisterScreen>()));
  gh.factory<_i144.ChatPageBloc>(
      () => _i144.ChatPageBloc(get<_i55.ChatService>()));
  gh.factory<_i145.ContainerDetailsStateManager>(() =>
      _i145.ContainerDetailsStateManager(
          get<_i57.ContainerService>(), get<_i113.TravelService>()));
  gh.factory<_i146.ContainerScreen>(
      () => _i146.ContainerScreen(get<_i62.ContainerStateManager>()));
  gh.factory<_i147.ContainerSpecificationModule>(() =>
      _i147.ContainerSpecificationModule(
          get<_i61.ContainerSpecificationsScreen>(),
          get<_i134.AddNewContainerSpecification>()));
  gh.factory<_i148.CountriesScreen>(
      () => _i148.CountriesScreen(get<_i65.CountryStateManager>()));
  gh.factory<_i149.CountryModule>(() => _i149.CountryModule(
      get<_i148.CountriesScreen>(), get<_i135.AddNewCountry>()));
  gh.factory<_i150.DistributorsModule>(() => _i150.DistributorsModule(
      get<_i69.DistributorsScreen>(), get<_i136.AddNewDistributor>()));
  gh.factory<_i151.EditShipmentModule>(
      () => _i151.EditShipmentModule(get<_i73.EditedShipmentScreen>()));
  gh.factory<_i152.FilterContainerStateManager>(
      () => _i152.FilterContainerStateManager(get<_i103.SubcontractService>()));
  gh.factory<_i153.FilterTravelStateManager>(() =>
      _i153.FilterTravelStateManager(get<_i113.TravelService>(),
          get<_i64.CountryService>(), get<_i103.SubcontractService>()));
  gh.factory<_i154.HomeScreen>(
      () => _i154.HomeScreen(get<_i79.HomeStateManager>()));
  gh.factory<_i155.MarkScreen>(
      () => _i155.MarkScreen(get<_i83.MarkStateManager>()));
  gh.factory<_i156.MyShipmentScreen>(
      () => _i156.MyShipmentScreen(get<_i86.MyShipmentStateManger>()));
  gh.factory<_i157.NewShipment>(
      () => _i157.NewShipment(get<_i96.RequestShipmentStateManger>()));
  gh.factory<_i158.NewShipmentsModule>(
      () => _i158.NewShipmentsModule(get<_i157.NewShipment>()));
  gh.factory<_i159.ProfileScreen>(
      () => _i159.ProfileScreen(get<_i89.ProfileStateManager>()));
  gh.factory<_i160.ProxiesScreen>(
      () => _i160.ProxiesScreen(get<_i92.ProxyStateManager>()));
  gh.factory<_i161.SettingsModule>(
      () => _i161.SettingsModule(get<_i97.SettingsScreen>()));
  gh.factory<_i162.SubContractServiceScreen>(() =>
      _i162.SubContractServiceScreen(
          get<_i101.SubContractServiceStateManager>()));
  gh.factory<_i163.SubcontractScreen>(
      () => _i163.SubcontractScreen(get<_i104.SubcontractStateManager>()));
  gh.factory<_i164.TrackingScreen>(
      () => _i164.TrackingScreen(get<_i111.TrackingStateManager>()));
  gh.factory<_i165.TravelDetailsStateManager>(
      () => _i165.TravelDetailsStateManager(get<_i113.TravelService>()));
  gh.factory<_i166.TravelFilterScreen>(
      () => _i166.TravelFilterScreen(get<_i153.FilterTravelStateManager>()));
  gh.factory<_i167.TravelScreen>(
      () => _i167.TravelScreen(get<_i114.TravelStateManager>()));
  gh.factory<_i168.WaitingShipmentScreen>(() =>
      _i168.WaitingShipmentScreen(get<_i122.WaitingShipmentsStateManager>()));
  gh.factory<_i169.AcceptedShipmentDetailsScreen>(() =>
      _i169.AcceptedShipmentDetailsScreen(
          get<_i126.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i170.AcceptedShipmentScreen>(() =>
      _i170.AcceptedShipmentScreen(get<_i127.AcceptedShipmentsStateManager>()));
  gh.factory<_i171.AcceptedShipmentStatusScreen>(() =>
      _i171.AcceptedShipmentStatusScreen(
          get<_i128.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i172.AddNewProxy>(
      () => _i172.AddNewProxy(get<_i137.AddProxyStateManager>()));
  gh.factory<_i173.AddNewSubContractService>(() =>
      _i173.AddNewSubContractService(
          get<_i138.AddSubContractServiceStateManager>()));
  gh.factory<_i174.AddNewSubcontract>(
      () => _i174.AddNewSubcontract(get<_i139.AddSubcontractStateManager>()));
  gh.factory<_i175.AddNewSupplier>(
      () => _i175.AddNewSupplier(get<_i140.AddSupplierStateManager>()));
  gh.factory<_i176.AddNewTravel>(
      () => _i176.AddNewTravel(get<_i141.AddTravelStateManager>()));
  gh.factory<_i177.AddNewUnit>(
      () => _i177.AddNewUnit(get<_i142.AddUnitStateManager>()));
  gh.factory<_i178.ContainerDetailsScreen>(() =>
      _i178.ContainerDetailsScreen(get<_i145.ContainerDetailsStateManager>()));
  gh.factory<_i179.ContainerFilterScreen>(() =>
      _i179.ContainerFilterScreen(get<_i152.FilterContainerStateManager>()));
  gh.factory<_i180.ContainerModule>(() => _i180.ContainerModule(
      get<_i146.ContainerScreen>(),
      get<_i133.AddNewContainer>(),
      get<_i179.ContainerFilterScreen>(),
      get<_i178.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>()));
  gh.factory<_i181.HomeModule>(() => _i181.HomeModule(get<_i154.HomeScreen>()));
  gh.factory<_i182.MarkModule>(() => _i182.MarkModule(get<_i155.MarkScreen>()));
  gh.factory<_i183.MyShipmentModule>(() => _i183.MyShipmentModule(
      get<_i156.MyShipmentScreen>(), get<_i15.ReviewShipmentScreen>()));
  gh.factory<_i184.ProfileModule>(
      () => _i184.ProfileModule(get<_i159.ProfileScreen>()));
  gh.factory<_i185.ProxiesModule>(() => _i185.ProxiesModule(
      get<_i160.ProxiesScreen>(), get<_i172.AddNewProxy>()));
  gh.factory<_i186.SubContractServiceModule>(() =>
      _i186.SubContractServiceModule(get<_i162.SubContractServiceScreen>(),
          get<_i173.AddNewSubContractService>()));
  gh.factory<_i187.SubcontractModule>(() => _i187.SubcontractModule(
      get<_i163.SubcontractScreen>(), get<_i174.AddNewSubcontract>()));
  gh.factory<_i188.SupplierModule>(() => _i188.SupplierModule(
      get<_i108.SuppliersScreen>(), get<_i175.AddNewSupplier>()));
  gh.factory<_i189.TrackingModule>(
      () => _i189.TrackingModule(get<_i164.TrackingScreen>()));
  gh.factory<_i190.TravelDetailsScreen>(
      () => _i190.TravelDetailsScreen(get<_i165.TravelDetailsStateManager>()));
  gh.factory<_i191.TravelModule>(() => _i191.TravelModule(
      get<_i167.TravelScreen>(),
      get<_i176.AddNewTravel>(),
      get<_i166.TravelFilterScreen>(),
      get<_i190.TravelDetailsScreen>()));
  gh.factory<_i192.UnitModule>(() =>
      _i192.UnitModule(get<_i118.UnitsScreen>(), get<_i177.AddNewUnit>()));
  gh.factory<_i193.WaitingShipmentModule>(() => _i193.WaitingShipmentModule(
      get<_i168.WaitingShipmentScreen>(),
      get<_i123.WantingShipmentDetailsScreen>()));
  gh.factory<_i194.AcceptedShipmentModule>(() => _i194.AcceptedShipmentModule(
      get<_i170.AcceptedShipmentScreen>(),
      get<_i169.AcceptedShipmentDetailsScreen>(),
      get<_i3.AcceptedShipmentFilterScreen>(),
      get<_i171.AcceptedShipmentStatusScreen>()));
  gh.factory<_i195.MyApp>(() => _i195.MyApp(
      get<_i19.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i74.FireNotificationService>(),
      get<_i143.AuthorizationModule>(),
      get<_i54.ChatModule>(),
      get<_i161.SettingsModule>(),
      get<_i181.HomeModule>(),
      get<_i184.ProfileModule>(),
      get<_i182.MarkModule>(),
      get<_i21.NotificationModule>(),
      get<_i158.NewShipmentsModule>(),
      get<_i189.TrackingModule>(),
      get<_i183.MyShipmentModule>(),
      get<_i151.EditShipmentModule>(),
      get<_i149.CountryModule>(),
      get<_i150.DistributorsModule>(),
      get<_i185.ProxiesModule>(),
      get<_i188.SupplierModule>(),
      get<_i186.SubContractServiceModule>(),
      get<_i187.SubcontractModule>(),
      get<_i192.UnitModule>(),
      get<_i191.TravelModule>(),
      get<_i180.ContainerModule>(),
      get<_i147.ContainerSpecificationModule>(),
      get<_i193.WaitingShipmentModule>(),
      get<_i194.AcceptedShipmentModule>()));
  return get;
}
