// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i213;
import '../module_auth/authoriazation_module.dart' as _i155;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i23;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i20;
import '../module_auth/service/auth_service/auth_service.dart' as _i24;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i37;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i44;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i85;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i101;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i156;
import '../module_chat/chat_module.dart' as _i56;
import '../module_chat/manager/chat/chat_manager.dart' as _i55;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i57;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i193;
import '../module_client/manager/client_manager.dart' as _i58;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i59;
import '../module_client/state_manager/client_state_manager.dart' as _i60;
import '../module_client/state_manager/new_client_state_manger.dart' as _i138;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i143;
import '../module_client/ui/screen/client_screen.dart' as _i157;
import '../module_container/container_module.dart' as _i196;
import '../module_container/manager/container_manager.dart' as _i61;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i62;
import '../module_container/state_manger/container_state_manager.dart' as _i67;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i158;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i165;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i140;
import '../module_container/ui/screen/container_details_screen.dart' as _i194;
import '../module_container/ui/screen/container_filter_screen.dart' as _i195;
import '../module_container/ui/screen/container_new_screen.dart' as _i144;
import '../module_container/ui/screen/container_screen.dart' as _i159;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container_specification/container_specification_module.dart'
    as _i160;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i63;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i64;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i65;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i139;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i145;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i66;
import '../module_countries/country_module.dart' as _i162;
import '../module_countries/manager/country_manager.dart' as _i68;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i69;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i70;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i141;
import '../module_countries/ui/screen/countries_screen.dart' as _i161;
import '../module_countries/ui/screen/country_new_screen.dart' as _i146;
import '../module_distributors/distributors_module.dart' as _i163;
import '../module_distributors/manager/distributors_manager.dart' as _i71;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i72;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i73;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i142;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i147;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i74;
import '../module_edit_shipment/edit_shipment_module.dart' as _i164;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i75;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i76;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i77;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i78;
import '../module_home/home_module.dart' as _i197;
import '../module_home/manager/home_manager.dart' as _i82;
import '../module_home/repository/home_repository.dart' as _i35;
import '../module_home/service/home_service.dart' as _i83;
import '../module_home/state_manager/state_manager_home.dart' as _i84;
import '../module_home/ui/screen/home_screen.dart' as _i167;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i86;
import '../module_mark/mark_module.dart' as _i198;
import '../module_mark/repository/mark_repository.dart' as _i38;
import '../module_mark/service/mark_service.dart' as _i87;
import '../module_mark/state_manager/mark_state_manager.dart' as _i88;
import '../module_mark/ui/mark_screen.dart' as _i168;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i89;
import '../module_my_shipment/my_shipment_module.dart' as _i199;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i39;
import '../module_my_shipment/service/my_shipment_service.dart' as _i90;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i91;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i15;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i169;
import '../module_network/http_client/http_client.dart' as _i18;
import '../module_notifications/notification_module.dart' as _i21;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i12;
import '../module_notifications/repository/notification_repo.dart' as _i40;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i79;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i11;
import '../module_product_category/manager/product_category_manager.dart'
    as _i92;
import '../module_product_category/product_module.dart' as _i201;
import '../module_product_category/repository/product_category_repository.dart'
    as _i41;
import '../module_product_category/service/product_service.dart' as _i93;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i148;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i94;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i186;
import '../module_product_category/ui/screen/products_screen.dart' as _i171;
import '../module_profile/manager/profile_manager.dart' as _i95;
import '../module_profile/profile_module.dart' as _i202;
import '../module_profile/repository/profile_repository.dart' as _i42;
import '../module_profile/service/profile_service.dart' as _i96;
import '../module_profile/state_manager/profile_state_manager.dart' as _i97;
import '../module_profile/ui/profile_screen.dart' as _i172;
import '../module_proxies/manager/proxies_manager.dart' as _i98;
import '../module_proxies/proxies_module.dart' as _i203;
import '../module_proxies/repository/proxies_repository.dart' as _i43;
import '../module_proxies/service/proixes_service.dart' as _i99;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i149;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i100;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i173;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i187;
import '../module_report/manager/report_manager.dart' as _i102;
import '../module_report/presistance/report_prefs_helper.dart' as _i14;
import '../module_report/repository/report_repository.dart' as _i45;
import '../module_report/service/report_service.dart' as _i103;
import '../module_settings/settings_module.dart' as _i175;
import '../module_settings/ui/settings_page/settings_page.dart' as _i106;
import '../module_shipment_previous/shipment_previous_module.dart' as _i13;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i80;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i34;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i81;
import '../module_shipment_request/shipment_request_module.dart' as _i200;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i104;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i105;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i170;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i174;
import '../module_shipment_track/manager/tracking_manager.dart' as _i118;
import '../module_shipment_track/repository/tracking_repository.dart' as _i50;
import '../module_shipment_track/service/tracking_service.dart' as _i119;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i120;
import '../module_shipment_track/tracking_module.dart' as _i207;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i178;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i212;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i133;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i54;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i134;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i135;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i136;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i137;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i183;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i184;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i185;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i3;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i128;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i53;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i129;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i130;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i131;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i132;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i182;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i211;
import '../module_splash/splash_module.dart' as _i107;
import '../module_splash/ui/screen/splash_screen.dart' as _i46;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i111;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i48;
import '../module_sub_contract/service/subcontract_service.dart' as _i112;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i151;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i113;
import '../module_sub_contract/subcontract_module.dart' as _i205;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i189;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i177;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i108;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i47;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i109;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i150;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i110;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i204;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i188;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i176;
import '../module_suppliers/manager/suppliers_manager.dart' as _i114;
import '../module_suppliers/repository/suppliers_repository.dart' as _i49;
import '../module_suppliers/service/suppliers_service.dart' as _i115;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i152;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i116;
import '../module_suppliers/supplier_module.dart' as _i206;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i190;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i117;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i16;
import '../module_theme/service/theme_service/theme_service.dart' as _i19;
import '../module_travel/manager/travel_manager.dart' as _i121;
import '../module_travel/repository/travel_repository.dart' as _i51;
import '../module_travel/service/travel_service.dart' as _i122;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i179;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i166;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i153;
import '../module_travel/state_manger/travels_state_manager.dart' as _i123;
import '../module_travel/travel_module.dart' as _i209;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i208;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i180;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i191;
import '../module_travel/ui/screen/travel_screen.dart' as _i181;
import '../module_unit/manager/unit_manager.dart' as _i124;
import '../module_unit/repository/unit_repository.dart' as _i52;
import '../module_unit/service/unit_service.dart' as _i125;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i154;
import '../module_unit/state_manger/units_state_manager.dart' as _i126;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i192;
import '../module_unit/ui/screen/units_screen.dart' as _i127;
import '../module_unit/unit_module.dart' as _i210;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i22;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i17;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i36;
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
  gh.factory<_i28.ClientRepository>(() =>
      _i28.ClientRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i29.ContainerRepository>(() =>
      _i29.ContainerRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i30.ContainerSpecificationRepository>(() =>
      _i30.ContainerSpecificationRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i31.CountryRepository>(() =>
      _i31.CountryRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i32.DistributorRepository>(() => _i32.DistributorRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i33.EditShipmentRepository>(() => _i33.EditShipmentRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i34.FirstOptionRepository>(() => _i34.FirstOptionRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i35.HomeRepository>(() =>
      _i35.HomeRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i36.ImageUploadService>(
      () => _i36.ImageUploadService(get<_i22.UploadManager>()));
  gh.factory<_i37.LoginStateManager>(
      () => _i37.LoginStateManager(get<_i24.AuthService>()));
  gh.factory<_i38.MarkRepository>(() =>
      _i38.MarkRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i39.MyShipmentRepository>(() => _i39.MyShipmentRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i40.NotificationRepo>(() =>
      _i40.NotificationRepo(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i41.ProductRepository>(() =>
      _i41.ProductRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i42.ProfileRepository>(() =>
      _i42.ProfileRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i43.ProxyRepository>(() =>
      _i43.ProxyRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i44.RegisterStateManager>(
      () => _i44.RegisterStateManager(get<_i24.AuthService>()));
  gh.factory<_i45.ReportRepository>(() => _i45.ReportRepository(
      get<_i18.ApiClient>(),
      get<_i24.AuthService>(),
      get<_i14.ReportPrefsHelper>()));
  gh.factory<_i46.SplashScreen>(
      () => _i46.SplashScreen(get<_i24.AuthService>()));
  gh.factory<_i47.SubContractServiceRepository>(() =>
      _i47.SubContractServiceRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i48.SubcontractRepository>(() => _i48.SubcontractRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i49.SupplierRepository>(() =>
      _i49.SupplierRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i50.TrackingRepository>(() =>
      _i50.TrackingRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i51.TravelRepository>(() =>
      _i51.TravelRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i52.UnitRepository>(() =>
      _i52.UnitRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i53.WaitingShipmentRepository>(() =>
      _i53.WaitingShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i54.AcceptedShipmentRepository>(() =>
      _i54.AcceptedShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i55.ChatManager>(
      () => _i55.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i56.ChatModule>(() => _i56.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i24.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i57.ChatService>(() => _i57.ChatService(get<_i55.ChatManager>()));
  gh.factory<_i58.ClientManager>(
      () => _i58.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i59.ClientService>(
      () => _i59.ClientService(get<_i58.ClientManager>()));
  gh.factory<_i60.ClientsStateManager>(
      () => _i60.ClientsStateManager(get<_i59.ClientService>()));
  gh.factory<_i61.ContainerManager>(
      () => _i61.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i62.ContainerService>(
      () => _i62.ContainerService(get<_i61.ContainerManager>()));
  gh.factory<_i63.ContainerSpecificationManager>(() =>
      _i63.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i64.ContainerSpecificationService>(() =>
      _i64.ContainerSpecificationService(
          get<_i63.ContainerSpecificationManager>()));
  gh.factory<_i65.ContainerSpecificationStateManager>(() =>
      _i65.ContainerSpecificationStateManager(
          get<_i64.ContainerSpecificationService>()));
  gh.factory<_i66.ContainerSpecificationsScreen>(() =>
      _i66.ContainerSpecificationsScreen(
          get<_i65.ContainerSpecificationStateManager>()));
  gh.factory<_i67.ContainerStateManager>(
      () => _i67.ContainerStateManager(get<_i62.ContainerService>()));
  gh.factory<_i68.CountryManager>(
      () => _i68.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i69.CountryService>(
      () => _i69.CountryService(get<_i68.CountryManager>()));
  gh.factory<_i70.CountryStateManager>(
      () => _i70.CountryStateManager(get<_i69.CountryService>()));
  gh.factory<_i71.DistributorManager>(
      () => _i71.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i72.DistributorService>(
      () => _i72.DistributorService(get<_i71.DistributorManager>()));
  gh.factory<_i73.DistributorStateManager>(
      () => _i73.DistributorStateManager(get<_i72.DistributorService>()));
  gh.factory<_i74.DistributorsScreen>(
      () => _i74.DistributorsScreen(get<_i73.DistributorStateManager>()));
  gh.factory<_i75.EditShipmentManager>(
      () => _i75.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i76.EditShipmentService>(
      () => _i76.EditShipmentService(get<_i75.EditShipmentManager>()));
  gh.factory<_i77.EditShipmentStateManager>(() => _i77.EditShipmentStateManager(
      get<_i76.EditShipmentService>(), get<_i36.ImageUploadService>()));
  gh.factory<_i78.EditedShipmentScreen>(
      () => _i78.EditedShipmentScreen(get<_i77.EditShipmentStateManager>()));
  gh.factory<_i79.FireNotificationService>(() => _i79.FireNotificationService(
      get<_i12.NotificationsPrefsHelper>(), get<_i40.NotificationRepo>()));
  gh.factory<_i80.FirstOptionManager>(
      () => _i80.FirstOptionManager(get<_i34.FirstOptionRepository>()));
  gh.factory<_i81.FirstOptionService>(
      () => _i81.FirstOptionService(get<_i80.FirstOptionManager>()));
  gh.factory<_i82.HomeManager>(
      () => _i82.HomeManager(get<_i35.HomeRepository>()));
  gh.factory<_i83.HomeService>(() => _i83.HomeService(get<_i82.HomeManager>()));
  gh.factory<_i84.HomeStateManager>(
      () => _i84.HomeStateManager(get<_i83.HomeService>()));
  gh.factory<_i85.LoginScreen>(
      () => _i85.LoginScreen(get<_i37.LoginStateManager>()));
  gh.factory<_i86.MarkManager>(
      () => _i86.MarkManager(get<_i38.MarkRepository>()));
  gh.factory<_i87.MarkService>(() => _i87.MarkService(get<_i86.MarkManager>()));
  gh.factory<_i88.MarkStateManager>(() => _i88.MarkStateManager(
      get<_i87.MarkService>(), get<_i59.ClientService>()));
  gh.factory<_i89.MyShipmentManager>(
      () => _i89.MyShipmentManager(get<_i39.MyShipmentRepository>()));
  gh.factory<_i90.MyShipmentService>(
      () => _i90.MyShipmentService(get<_i89.MyShipmentManager>()));
  gh.factory<_i91.MyShipmentStateManger>(
      () => _i91.MyShipmentStateManger(get<_i90.MyShipmentService>()));
  gh.factory<_i92.ProductManager>(
      () => _i92.ProductManager(get<_i41.ProductRepository>()));
  gh.factory<_i93.ProductService>(
      () => _i93.ProductService(get<_i92.ProductManager>()));
  gh.factory<_i94.ProductStateManager>(
      () => _i94.ProductStateManager(get<_i93.ProductService>()));
  gh.factory<_i95.ProfileManager>(
      () => _i95.ProfileManager(get<_i42.ProfileRepository>()));
  gh.factory<_i96.ProfileService>(
      () => _i96.ProfileService(get<_i95.ProfileManager>()));
  gh.factory<_i97.ProfileStateManager>(
      () => _i97.ProfileStateManager(get<_i96.ProfileService>()));
  gh.factory<_i98.ProxyManager>(
      () => _i98.ProxyManager(get<_i43.ProxyRepository>()));
  gh.factory<_i99.ProxyService>(
      () => _i99.ProxyService(get<_i98.ProxyManager>()));
  gh.factory<_i100.ProxyStateManager>(
      () => _i100.ProxyStateManager(get<_i99.ProxyService>()));
  gh.factory<_i101.RegisterScreen>(
      () => _i101.RegisterScreen(get<_i44.RegisterStateManager>()));
  gh.factory<_i102.ReportManager>(
      () => _i102.ReportManager(get<_i45.ReportRepository>()));
  gh.factory<_i103.ReportService>(
      () => _i103.ReportService(get<_i102.ReportManager>()));
  gh.factory<_i104.RequestShipmentStateManger>(() =>
      _i104.RequestShipmentStateManger(
          get<_i81.FirstOptionService>(),
          get<_i87.MarkService>(),
          get<_i59.ClientService>(),
          get<_i72.DistributorService>()));
  gh.factory<_i105.ReviewShipmentStateManger>(
      () => _i105.ReviewShipmentStateManger(get<_i81.FirstOptionService>()));
  gh.factory<_i106.SettingsScreen>(() => _i106.SettingsScreen(
      get<_i24.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i19.AppThemeDataService>(),
      get<_i79.FireNotificationService>()));
  gh.factory<_i107.SplashModule>(
      () => _i107.SplashModule(get<_i46.SplashScreen>()));
  gh.factory<_i108.SubContractServiceManager>(() =>
      _i108.SubContractServiceManager(
          get<_i47.SubContractServiceRepository>()));
  gh.factory<_i109.SubContractServiceService>(() =>
      _i109.SubContractServiceService(get<_i108.SubContractServiceManager>()));
  gh.factory<_i110.SubContractServiceStateManager>(() =>
      _i110.SubContractServiceStateManager(
          get<_i109.SubContractServiceService>()));
  gh.factory<_i111.SubcontractManager>(
      () => _i111.SubcontractManager(get<_i48.SubcontractRepository>()));
  gh.factory<_i112.SubcontractService>(
      () => _i112.SubcontractService(get<_i111.SubcontractManager>()));
  gh.factory<_i113.SubcontractStateManager>(
      () => _i113.SubcontractStateManager(get<_i112.SubcontractService>()));
  gh.factory<_i114.SupplierManager>(
      () => _i114.SupplierManager(get<_i49.SupplierRepository>()));
  gh.factory<_i115.SupplierService>(
      () => _i115.SupplierService(get<_i114.SupplierManager>()));
  gh.factory<_i116.SupplierStateManager>(
      () => _i116.SupplierStateManager(get<_i115.SupplierService>()));
  gh.factory<_i117.SuppliersScreen>(
      () => _i117.SuppliersScreen(get<_i116.SupplierStateManager>()));
  gh.factory<_i118.TrackingManager>(
      () => _i118.TrackingManager(get<_i50.TrackingRepository>()));
  gh.factory<_i119.TrackingService>(
      () => _i119.TrackingService(get<_i118.TrackingManager>()));
  gh.factory<_i120.TrackingStateManager>(
      () => _i120.TrackingStateManager(get<_i119.TrackingService>()));
  gh.factory<_i121.TravelManager>(
      () => _i121.TravelManager(get<_i51.TravelRepository>()));
  gh.factory<_i122.TravelService>(
      () => _i122.TravelService(get<_i121.TravelManager>()));
  gh.factory<_i123.TravelStateManager>(
      () => _i123.TravelStateManager(get<_i122.TravelService>()));
  gh.factory<_i124.UnitManager>(
      () => _i124.UnitManager(get<_i52.UnitRepository>()));
  gh.factory<_i125.UnitService>(
      () => _i125.UnitService(get<_i124.UnitManager>()));
  gh.factory<_i126.UnitStateManager>(
      () => _i126.UnitStateManager(get<_i125.UnitService>()));
  gh.factory<_i127.UnitsScreen>(
      () => _i127.UnitsScreen(get<_i126.UnitStateManager>()));
  gh.factory<_i128.WaitingShipmentManager>(() =>
      _i128.WaitingShipmentManager(get<_i53.WaitingShipmentRepository>()));
  gh.factory<_i129.WaitingShipmentService>(
      () => _i129.WaitingShipmentService(get<_i128.WaitingShipmentManager>()));
  gh.factory<_i130.WaitingShipmentsDetailsStateManager>(() =>
      _i130.WaitingShipmentsDetailsStateManager(
          get<_i129.WaitingShipmentService>()));
  gh.factory<_i131.WaitingShipmentsStateManager>(() =>
      _i131.WaitingShipmentsStateManager(get<_i129.WaitingShipmentService>()));
  gh.factory<_i132.WantingShipmentDetailsScreen>(() =>
      _i132.WantingShipmentDetailsScreen(
          get<_i130.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i133.AcceptedShipmentManager>(() =>
      _i133.AcceptedShipmentManager(get<_i54.AcceptedShipmentRepository>()));
  gh.factory<_i134.AcceptedShipmentService>(() =>
      _i134.AcceptedShipmentService(get<_i133.AcceptedShipmentManager>()));
  gh.factory<_i135.AcceptedShipmentsDetailsStateManager>(() =>
      _i135.AcceptedShipmentsDetailsStateManager(
          get<_i134.AcceptedShipmentService>(), get<_i62.ContainerService>()));
  gh.factory<_i136.AcceptedShipmentsStateManager>(() =>
      _i136.AcceptedShipmentsStateManager(
          get<_i134.AcceptedShipmentService>()));
  gh.factory<_i137.AcceptedShipmentsStatusStateManager>(() =>
      _i137.AcceptedShipmentsStatusStateManager(
          get<_i134.AcceptedShipmentService>(),
          get<_i112.SubcontractService>(),
          get<_i62.ContainerService>()));
  gh.factory<_i138.AddClientStateManager>(
      () => _i138.AddClientStateManager(get<_i59.ClientService>()));
  gh.factory<_i139.AddContainerSpecificationStateManager>(() =>
      _i139.AddContainerSpecificationStateManager(
          get<_i64.ContainerSpecificationService>()));
  gh.factory<_i140.AddContainerStateManager>(() =>
      _i140.AddContainerStateManager(
          get<_i62.ContainerService>(),
          get<_i112.SubcontractService>(),
          get<_i64.ContainerSpecificationService>()));
  gh.factory<_i141.AddCountryStateManager>(
      () => _i141.AddCountryStateManager(get<_i69.CountryService>()));
  gh.factory<_i142.AddDistributorStateManager>(
      () => _i142.AddDistributorStateManager(get<_i72.DistributorService>()));
  gh.factory<_i143.AddNewClient>(
      () => _i143.AddNewClient(get<_i138.AddClientStateManager>()));
  gh.factory<_i144.AddNewContainer>(
      () => _i144.AddNewContainer(get<_i140.AddContainerStateManager>()));
  gh.factory<_i145.AddNewContainerSpecification>(() =>
      _i145.AddNewContainerSpecification(
          get<_i139.AddContainerSpecificationStateManager>()));
  gh.factory<_i146.AddNewCountry>(
      () => _i146.AddNewCountry(get<_i141.AddCountryStateManager>()));
  gh.factory<_i147.AddNewDistributor>(
      () => _i147.AddNewDistributor(get<_i142.AddDistributorStateManager>()));
  gh.factory<_i148.AddProductStateManager>(
      () => _i148.AddProductStateManager(get<_i93.ProductService>()));
  gh.factory<_i149.AddProxyStateManager>(
      () => _i149.AddProxyStateManager(get<_i99.ProxyService>()));
  gh.factory<_i150.AddSubContractServiceStateManager>(() =>
      _i150.AddSubContractServiceStateManager(
          get<_i109.SubContractServiceService>()));
  gh.factory<_i151.AddSubcontractStateManager>(() =>
      _i151.AddSubcontractStateManager(get<_i109.SubContractServiceService>(),
          get<_i112.SubcontractService>()));
  gh.factory<_i152.AddSupplierStateManager>(
      () => _i152.AddSupplierStateManager(get<_i115.SupplierService>()));
  gh.factory<_i153.AddTravelStateManager>(() => _i153.AddTravelStateManager(
      get<_i122.TravelService>(),
      get<_i69.CountryService>(),
      get<_i112.SubcontractService>()));
  gh.factory<_i154.AddUnitStateManager>(
      () => _i154.AddUnitStateManager(get<_i125.UnitService>()));
  gh.factory<_i155.AuthorizationModule>(() => _i155.AuthorizationModule(
      get<_i85.LoginScreen>(), get<_i101.RegisterScreen>()));
  gh.factory<_i156.ChatPageBloc>(
      () => _i156.ChatPageBloc(get<_i57.ChatService>()));
  gh.factory<_i157.ClientsScreen>(
      () => _i157.ClientsScreen(get<_i60.ClientsStateManager>()));
  gh.factory<_i158.ContainerDetailsStateManager>(() =>
      _i158.ContainerDetailsStateManager(
          get<_i62.ContainerService>(), get<_i122.TravelService>()));
  gh.factory<_i159.ContainerScreen>(
      () => _i159.ContainerScreen(get<_i67.ContainerStateManager>()));
  gh.factory<_i160.ContainerSpecificationModule>(() =>
      _i160.ContainerSpecificationModule(
          get<_i66.ContainerSpecificationsScreen>(),
          get<_i145.AddNewContainerSpecification>()));
  gh.factory<_i161.CountriesScreen>(
      () => _i161.CountriesScreen(get<_i70.CountryStateManager>()));
  gh.factory<_i162.CountryModule>(() => _i162.CountryModule(
      get<_i161.CountriesScreen>(), get<_i146.AddNewCountry>()));
  gh.factory<_i163.DistributorsModule>(() => _i163.DistributorsModule(
      get<_i74.DistributorsScreen>(), get<_i147.AddNewDistributor>()));
  gh.factory<_i164.EditShipmentModule>(
      () => _i164.EditShipmentModule(get<_i78.EditedShipmentScreen>()));
  gh.factory<_i165.FilterContainerStateManager>(
      () => _i165.FilterContainerStateManager(get<_i112.SubcontractService>()));
  gh.factory<_i166.FilterTravelStateManager>(() =>
      _i166.FilterTravelStateManager(get<_i122.TravelService>(),
          get<_i69.CountryService>(), get<_i112.SubcontractService>()));
  gh.factory<_i167.HomeScreen>(
      () => _i167.HomeScreen(get<_i84.HomeStateManager>()));
  gh.factory<_i168.MarkScreen>(
      () => _i168.MarkScreen(get<_i88.MarkStateManager>()));
  gh.factory<_i169.MyShipmentScreen>(
      () => _i169.MyShipmentScreen(get<_i91.MyShipmentStateManger>()));
  gh.factory<_i170.NewShipment>(
      () => _i170.NewShipment(get<_i104.RequestShipmentStateManger>()));
  gh.factory<_i171.ProductScreen>(
      () => _i171.ProductScreen(get<_i94.ProductStateManager>()));
  gh.factory<_i172.ProfileScreen>(
      () => _i172.ProfileScreen(get<_i97.ProfileStateManager>()));
  gh.factory<_i173.ProxiesScreen>(
      () => _i173.ProxiesScreen(get<_i100.ProxyStateManager>()));
  gh.factory<_i174.RequestShipmentReview>(() =>
      _i174.RequestShipmentReview(get<_i105.ReviewShipmentStateManger>()));
  gh.factory<_i175.SettingsModule>(
      () => _i175.SettingsModule(get<_i106.SettingsScreen>()));
  gh.factory<_i176.SubContractServiceScreen>(() =>
      _i176.SubContractServiceScreen(
          get<_i110.SubContractServiceStateManager>()));
  gh.factory<_i177.SubcontractScreen>(
      () => _i177.SubcontractScreen(get<_i113.SubcontractStateManager>()));
  gh.factory<_i178.TrackingScreen>(
      () => _i178.TrackingScreen(get<_i120.TrackingStateManager>()));
  gh.factory<_i179.TravelDetailsStateManager>(
      () => _i179.TravelDetailsStateManager(get<_i122.TravelService>()));
  gh.factory<_i180.TravelFilterScreen>(
      () => _i180.TravelFilterScreen(get<_i166.FilterTravelStateManager>()));
  gh.factory<_i181.TravelScreen>(
      () => _i181.TravelScreen(get<_i123.TravelStateManager>()));
  gh.factory<_i182.WaitingShipmentScreen>(() =>
      _i182.WaitingShipmentScreen(get<_i131.WaitingShipmentsStateManager>()));
  gh.factory<_i183.AcceptedShipmentDetailsScreen>(() =>
      _i183.AcceptedShipmentDetailsScreen(
          get<_i135.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i184.AcceptedShipmentScreen>(() =>
      _i184.AcceptedShipmentScreen(get<_i136.AcceptedShipmentsStateManager>()));
  gh.factory<_i185.AcceptedShipmentStatusScreen>(() =>
      _i185.AcceptedShipmentStatusScreen(
          get<_i137.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i186.AddNewProduct>(
      () => _i186.AddNewProduct(get<_i148.AddProductStateManager>()));
  gh.factory<_i187.AddNewProxy>(
      () => _i187.AddNewProxy(get<_i149.AddProxyStateManager>()));
  gh.factory<_i188.AddNewSubContractService>(() =>
      _i188.AddNewSubContractService(
          get<_i150.AddSubContractServiceStateManager>()));
  gh.factory<_i189.AddNewSubcontract>(
      () => _i189.AddNewSubcontract(get<_i151.AddSubcontractStateManager>()));
  gh.factory<_i190.AddNewSupplier>(
      () => _i190.AddNewSupplier(get<_i152.AddSupplierStateManager>()));
  gh.factory<_i191.AddNewTravel>(
      () => _i191.AddNewTravel(get<_i153.AddTravelStateManager>()));
  gh.factory<_i192.AddNewUnit>(
      () => _i192.AddNewUnit(get<_i154.AddUnitStateManager>()));
  gh.factory<_i193.ClientModule>(() => _i193.ClientModule(
      get<_i157.ClientsScreen>(), get<_i143.AddNewClient>()));
  gh.factory<_i194.ContainerDetailsScreen>(() =>
      _i194.ContainerDetailsScreen(get<_i158.ContainerDetailsStateManager>()));
  gh.factory<_i195.ContainerFilterScreen>(() =>
      _i195.ContainerFilterScreen(get<_i165.FilterContainerStateManager>()));
  gh.factory<_i196.ContainerModule>(() => _i196.ContainerModule(
      get<_i159.ContainerScreen>(),
      get<_i144.AddNewContainer>(),
      get<_i195.ContainerFilterScreen>(),
      get<_i194.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>()));
  gh.factory<_i197.HomeModule>(() => _i197.HomeModule(get<_i167.HomeScreen>()));
  gh.factory<_i198.MarkModule>(() => _i198.MarkModule(get<_i168.MarkScreen>()));
  gh.factory<_i199.MyShipmentModule>(() => _i199.MyShipmentModule(
      get<_i169.MyShipmentScreen>(), get<_i15.ReviewShipmentScreen>()));
  gh.factory<_i200.NewShipmentsModule>(() => _i200.NewShipmentsModule(
      get<_i170.NewShipment>(), get<_i174.RequestShipmentReview>()));
  gh.factory<_i201.ProductModule>(() => _i201.ProductModule(
      get<_i171.ProductScreen>(), get<_i186.AddNewProduct>()));
  gh.factory<_i202.ProfileModule>(
      () => _i202.ProfileModule(get<_i172.ProfileScreen>()));
  gh.factory<_i203.ProxiesModule>(() => _i203.ProxiesModule(
      get<_i173.ProxiesScreen>(), get<_i187.AddNewProxy>()));
  gh.factory<_i204.SubContractServiceModule>(() =>
      _i204.SubContractServiceModule(get<_i176.SubContractServiceScreen>(),
          get<_i188.AddNewSubContractService>()));
  gh.factory<_i205.SubcontractModule>(() => _i205.SubcontractModule(
      get<_i177.SubcontractScreen>(), get<_i189.AddNewSubcontract>()));
  gh.factory<_i206.SupplierModule>(() => _i206.SupplierModule(
      get<_i117.SuppliersScreen>(), get<_i190.AddNewSupplier>()));
  gh.factory<_i207.TrackingModule>(
      () => _i207.TrackingModule(get<_i178.TrackingScreen>()));
  gh.factory<_i208.TravelDetailsScreen>(
      () => _i208.TravelDetailsScreen(get<_i179.TravelDetailsStateManager>()));
  gh.factory<_i209.TravelModule>(() => _i209.TravelModule(
      get<_i181.TravelScreen>(),
      get<_i191.AddNewTravel>(),
      get<_i180.TravelFilterScreen>(),
      get<_i208.TravelDetailsScreen>()));
  gh.factory<_i210.UnitModule>(() =>
      _i210.UnitModule(get<_i127.UnitsScreen>(), get<_i192.AddNewUnit>()));
  gh.factory<_i211.WaitingShipmentModule>(() => _i211.WaitingShipmentModule(
      get<_i182.WaitingShipmentScreen>(),
      get<_i132.WantingShipmentDetailsScreen>()));
  gh.factory<_i212.AcceptedShipmentModule>(() => _i212.AcceptedShipmentModule(
      get<_i184.AcceptedShipmentScreen>(),
      get<_i183.AcceptedShipmentDetailsScreen>(),
      get<_i3.AcceptedShipmentFilterScreen>(),
      get<_i185.AcceptedShipmentStatusScreen>()));
  gh.factory<_i213.MyApp>(() => _i213.MyApp(
      get<_i19.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i79.FireNotificationService>(),
      get<_i155.AuthorizationModule>(),
      get<_i56.ChatModule>(),
      get<_i175.SettingsModule>(),
      get<_i197.HomeModule>(),
      get<_i202.ProfileModule>(),
      get<_i198.MarkModule>(),
      get<_i21.NotificationModule>(),
      get<_i200.NewShipmentsModule>(),
      get<_i207.TrackingModule>(),
      get<_i164.EditShipmentModule>(),
      get<_i162.CountryModule>(),
      get<_i163.DistributorsModule>(),
      get<_i203.ProxiesModule>(),
      get<_i206.SupplierModule>(),
      get<_i204.SubContractServiceModule>(),
      get<_i205.SubcontractModule>(),
      get<_i210.UnitModule>(),
      get<_i209.TravelModule>(),
      get<_i196.ContainerModule>(),
      get<_i160.ContainerSpecificationModule>(),
      get<_i211.WaitingShipmentModule>(),
      get<_i212.AcceptedShipmentModule>(),
      get<_i193.ClientModule>(),
      get<_i201.ProductModule>()));
  return get;
}
