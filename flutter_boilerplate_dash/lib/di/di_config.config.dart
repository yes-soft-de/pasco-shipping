// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i260;
import '../module_airwaybill/airwaybill_module.dart' as _i258;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i166;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i55;
import '../module_airwaybill/service/airwaybill_service.dart' as _i167;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i227;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i172;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i225;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i184;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i213;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i256;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i226;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i257;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i214;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i228;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i229;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i168;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i56;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i169;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i170;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i212;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i215;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i171;
import '../module_auth/authoriazation_module.dart' as _i173;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i23;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i20;
import '../module_auth/service/auth_service/auth_service.dart' as _i24;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i36;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i87;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i174;
import '../module_chat/chat_module.dart' as _i58;
import '../module_chat/manager/chat/chat_manager.dart' as _i57;
import '../module_chat/repository/chat/chat_repository.dart' as _i25;
import '../module_chat/service/chat/char_service.dart' as _i59;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i26;
import '../module_client/client_module.dart' as _i230;
import '../module_client/manager/client_manager.dart' as _i60;
import '../module_client/repository/client_repository.dart' as _i27;
import '../module_client/service/client_service.dart' as _i61;
import '../module_client/state_manager/client_state_manager.dart' as _i62;
import '../module_client/state_manager/new_client_state_manger.dart' as _i147;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i152;
import '../module_client/ui/screen/client_screen.dart' as _i175;
import '../module_container/container_module.dart' as _i234;
import '../module_container/manager/container_manager.dart' as _i63;
import '../module_container/repository/container_repository.dart' as _i28;
import '../module_container/service/container_service.dart' as _i64;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i177;
import '../module_container/state_manger/container_state_manager.dart' as _i69;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i176;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i185;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i149;
import '../module_container/ui/screen/container_details_screen.dart' as _i231;
import '../module_container/ui/screen/container_filter_screen.dart' as _i232;
import '../module_container/ui/screen/container_finance_screen.dart' as _i233;
import '../module_container/ui/screen/container_new_screen.dart' as _i153;
import '../module_container/ui/screen/container_screen.dart' as _i178;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container_specification/container_specification_module.dart'
    as _i179;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i65;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i29;
import '../module_container_specification/service/container_specification_service.dart'
    as _i66;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i67;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i148;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i154;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i68;
import '../module_countries/country_module.dart' as _i181;
import '../module_countries/manager/country_manager.dart' as _i70;
import '../module_countries/repository/country_repository.dart' as _i30;
import '../module_countries/service/country_service.dart' as _i71;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i72;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i150;
import '../module_countries/ui/screen/countries_screen.dart' as _i180;
import '../module_countries/ui/screen/country_new_screen.dart' as _i155;
import '../module_distributors/distributors_module.dart' as _i182;
import '../module_distributors/manager/distributors_manager.dart' as _i73;
import '../module_distributors/repository/distributors_repository.dart' as _i31;
import '../module_distributors/service/distributors_service.dart' as _i74;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i75;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i151;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i156;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i76;
import '../module_edit_shipment/edit_shipment_module.dart' as _i183;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i77;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i32;
import '../module_edit_shipment/service/editshipment_service.dart' as _i78;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i79;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i80;
import '../module_home/home_module.dart' as _i259;
import '../module_home/manager/home_manager.dart' as _i85;
import '../module_home/repository/home_repository.dart' as _i34;
import '../module_home/service/home_service.dart' as _i86;
import '../module_home/state_manager/state_manager_home.dart' as _i187;
import '../module_home/ui/screen/home_screen.dart' as _i235;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i88;
import '../module_mark/mark_module.dart' as _i236;
import '../module_mark/repository/mark_repository.dart' as _i37;
import '../module_mark/service/mark_service.dart' as _i89;
import '../module_mark/state_manager/mark_state_manager.dart' as _i90;
import '../module_mark/ui/mark_screen.dart' as _i188;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i91;
import '../module_my_shipment/my_shipment_module.dart' as _i237;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i38;
import '../module_my_shipment/service/my_shipment_service.dart' as _i92;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i93;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i15;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i189;
import '../module_network/http_client/http_client.dart' as _i18;
import '../module_notifications/notification_module.dart' as _i21;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i12;
import '../module_notifications/repository/notification_repo.dart' as _i39;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i82;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i11;
import '../module_product_category/manager/product_category_manager.dart'
    as _i94;
import '../module_product_category/product_module.dart' as _i239;
import '../module_product_category/repository/product_category_repository.dart'
    as _i40;
import '../module_product_category/service/product_service.dart' as _i95;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i157;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i96;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i216;
import '../module_product_category/ui/screen/products_screen.dart' as _i191;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i112;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i46;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i113;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i160;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i114;
import '../module_product_sub_category/sub_product_module.dart' as _i243;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i219;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i197;
import '../module_profile/manager/profile_manager.dart' as _i97;
import '../module_profile/profile_module.dart' as _i240;
import '../module_profile/repository/profile_repository.dart' as _i41;
import '../module_profile/service/profile_service.dart' as _i98;
import '../module_profile/state_manager/profile_state_manager.dart' as _i99;
import '../module_profile/ui/profile_screen.dart' as _i192;
import '../module_proxies/manager/proxies_manager.dart' as _i100;
import '../module_proxies/proxies_module.dart' as _i241;
import '../module_proxies/repository/proxies_repository.dart' as _i42;
import '../module_proxies/service/proixes_service.dart' as _i101;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i158;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i102;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i193;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i217;
import '../module_report/manager/report_manager.dart' as _i103;
import '../module_report/presistance/report_prefs_helper.dart' as _i14;
import '../module_report/repository/report_repository.dart' as _i43;
import '../module_report/service/report_service.dart' as _i104;
import '../module_settings/settings_module.dart' as _i195;
import '../module_settings/ui/settings_page/settings_page.dart' as _i107;
import '../module_shipment_previous/shipment_previous_module.dart' as _i13;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i83;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i33;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i84;
import '../module_shipment_request/shipment_request_module.dart' as _i238;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i105;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i106;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i190;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i194;
import '../module_shipment_track/manager/tracking_manager.dart' as _i122;
import '../module_shipment_track/repository/tracking_repository.dart' as _i49;
import '../module_shipment_track/service/tracking_service.dart' as _i123;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i124;
import '../module_shipment_track/tracking_module.dart' as _i246;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i199;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i255;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i141;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i54;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i142;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i143;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i144;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i145;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i146;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i81;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i204;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i208;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i209;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i210;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i211;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i140;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i251;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i132;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i52;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i133;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i134;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i135;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i136;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i205;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i252;
import '../module_splash/splash_module.dart' as _i108;
import '../module_splash/ui/screen/splash_screen.dart' as _i44;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i115;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i47;
import '../module_sub_contract/service/subcontract_service.dart' as _i116;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i161;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i117;
import '../module_sub_contract/subcontract_module.dart' as _i244;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i220;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i198;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i109;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i45;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i110;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i159;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i111;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i242;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i218;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i196;
import '../module_suppliers/manager/suppliers_manager.dart' as _i118;
import '../module_suppliers/repository/suppliers_repository.dart' as _i48;
import '../module_suppliers/service/suppliers_service.dart' as _i119;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i162;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i120;
import '../module_suppliers/supplier_module.dart' as _i245;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i221;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i121;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i16;
import '../module_theme/service/theme_service/theme_service.dart' as _i19;
import '../module_travel/manager/travel_manager.dart' as _i125;
import '../module_travel/repository/travel_repository.dart' as _i50;
import '../module_travel/service/travel_service.dart' as _i126;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i200;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i186;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i163;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i202;
import '../module_travel/state_manger/travels_state_manager.dart' as _i127;
import '../module_travel/travel_module.dart' as _i249;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i247;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i201;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i248;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i222;
import '../module_travel/ui/screen/travel_screen.dart' as _i203;
import '../module_unit/manager/unit_manager.dart' as _i128;
import '../module_unit/repository/unit_repository.dart' as _i51;
import '../module_unit/service/unit_service.dart' as _i129;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i164;
import '../module_unit/state_manger/units_state_manager.dart' as _i130;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i223;
import '../module_unit/ui/screen/units_screen.dart' as _i131;
import '../module_unit/unit_module.dart' as _i250;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i22;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i17;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i35;
import '../module_warehouses/manager/warehouses_manager.dart' as _i137;
import '../module_warehouses/repository/warehouse_repository.dart' as _i53;
import '../module_warehouses/service/warehouse_service.dart' as _i138;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i165;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i206;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i139;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i253;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i224;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i207;
import '../module_warehouses/warehouse_module.dart' as _i254;
import '../utils/logger/logger.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AirwaybillShipmentReview>(
      () => _i3.AirwaybillShipmentReview());
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
      () => _i20.AuthRepository(get<_i18.ApiClient>(), get<_i10.Logger>()));
  gh.factory<_i21.NotificationModule>(
      () => _i21.NotificationModule(get<_i11.NotificationScreen>()));
  gh.factory<_i22.UploadManager>(
      () => _i22.UploadManager(get<_i17.UploadRepository>()));
  gh.factory<_i23.AuthManager>(
      () => _i23.AuthManager(get<_i20.AuthRepository>()));
  gh.factory<_i24.AuthService>(() =>
      _i24.AuthService(get<_i4.AuthPrefsHelper>(), get<_i23.AuthManager>()));
  gh.factory<_i25.ChatRepository>(() =>
      _i25.ChatRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i26.ChatsListScreen>(
      () => _i26.ChatsListScreen(get<_i24.AuthService>()));
  gh.factory<_i27.ClientRepository>(() =>
      _i27.ClientRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
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
  gh.factory<_i40.ProductRepository>(() =>
      _i40.ProductRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i41.ProfileRepository>(() =>
      _i41.ProfileRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i42.ProxyRepository>(() =>
      _i42.ProxyRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i43.ReportRepository>(() => _i43.ReportRepository(
      get<_i18.ApiClient>(),
      get<_i24.AuthService>(),
      get<_i14.ReportPrefsHelper>()));
  gh.factory<_i44.SplashScreen>(
      () => _i44.SplashScreen(get<_i24.AuthService>()));
  gh.factory<_i45.SubContractServiceRepository>(() =>
      _i45.SubContractServiceRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i46.SubProductRepository>(() => _i46.SubProductRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i47.SubcontractRepository>(() => _i47.SubcontractRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i48.SupplierRepository>(() =>
      _i48.SupplierRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i49.TrackingRepository>(() =>
      _i49.TrackingRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i50.TravelRepository>(() =>
      _i50.TravelRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i51.UnitRepository>(() =>
      _i51.UnitRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i52.WaitingShipmentRepository>(() =>
      _i52.WaitingShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i53.WarehousesRepository>(() => _i53.WarehousesRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i54.AcceptedShipmentRepository>(() =>
      _i54.AcceptedShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i55.AirwaybillRepository>(() => _i55.AirwaybillRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i56.AirwaybillSpecificationRepository>(() =>
      _i56.AirwaybillSpecificationRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i57.ChatManager>(
      () => _i57.ChatManager(get<_i25.ChatRepository>()));
  gh.factory<_i58.ChatModule>(() => _i58.ChatModule(get<_i26.ChatsListScreen>(),
      get<_i24.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i59.ChatService>(() => _i59.ChatService(get<_i57.ChatManager>()));
  gh.factory<_i60.ClientManager>(
      () => _i60.ClientManager(get<_i27.ClientRepository>()));
  gh.factory<_i61.ClientService>(
      () => _i61.ClientService(get<_i60.ClientManager>()));
  gh.factory<_i62.ClientsStateManager>(
      () => _i62.ClientsStateManager(get<_i61.ClientService>()));
  gh.factory<_i63.ContainerManager>(
      () => _i63.ContainerManager(get<_i28.ContainerRepository>()));
  gh.factory<_i64.ContainerService>(
      () => _i64.ContainerService(get<_i63.ContainerManager>()));
  gh.factory<_i65.ContainerSpecificationManager>(() =>
      _i65.ContainerSpecificationManager(
          get<_i29.ContainerSpecificationRepository>()));
  gh.factory<_i66.ContainerSpecificationService>(() =>
      _i66.ContainerSpecificationService(
          get<_i65.ContainerSpecificationManager>()));
  gh.factory<_i67.ContainerSpecificationStateManager>(() =>
      _i67.ContainerSpecificationStateManager(
          get<_i66.ContainerSpecificationService>()));
  gh.factory<_i68.ContainerSpecificationsScreen>(() =>
      _i68.ContainerSpecificationsScreen(
          get<_i67.ContainerSpecificationStateManager>()));
  gh.factory<_i69.ContainerStateManager>(
      () => _i69.ContainerStateManager(get<_i64.ContainerService>()));
  gh.factory<_i70.CountryManager>(
      () => _i70.CountryManager(get<_i30.CountryRepository>()));
  gh.factory<_i71.CountryService>(
      () => _i71.CountryService(get<_i70.CountryManager>()));
  gh.factory<_i72.CountryStateManager>(
      () => _i72.CountryStateManager(get<_i71.CountryService>()));
  gh.factory<_i73.DistributorManager>(
      () => _i73.DistributorManager(get<_i31.DistributorRepository>()));
  gh.factory<_i74.DistributorService>(
      () => _i74.DistributorService(get<_i73.DistributorManager>()));
  gh.factory<_i75.DistributorStateManager>(
      () => _i75.DistributorStateManager(get<_i74.DistributorService>()));
  gh.factory<_i76.DistributorsScreen>(
      () => _i76.DistributorsScreen(get<_i75.DistributorStateManager>()));
  gh.factory<_i77.EditShipmentManager>(
      () => _i77.EditShipmentManager(get<_i32.EditShipmentRepository>()));
  gh.factory<_i78.EditShipmentService>(
      () => _i78.EditShipmentService(get<_i77.EditShipmentManager>()));
  gh.factory<_i79.EditShipmentStateManager>(() => _i79.EditShipmentStateManager(
      get<_i78.EditShipmentService>(), get<_i35.ImageUploadService>()));
  gh.factory<_i80.EditedShipmentScreen>(
      () => _i80.EditedShipmentScreen(get<_i79.EditShipmentStateManager>()));
  gh.factory<_i81.FilterAcceptedShipmentStateManager>(() =>
      _i81.FilterAcceptedShipmentStateManager(get<_i71.CountryService>()));
  gh.factory<_i82.FireNotificationService>(() => _i82.FireNotificationService(
      get<_i12.NotificationsPrefsHelper>(), get<_i39.NotificationRepo>()));
  gh.factory<_i83.FirstOptionManager>(
      () => _i83.FirstOptionManager(get<_i33.FirstOptionRepository>()));
  gh.factory<_i84.FirstOptionService>(
      () => _i84.FirstOptionService(get<_i83.FirstOptionManager>()));
  gh.factory<_i85.HomeManager>(
      () => _i85.HomeManager(get<_i34.HomeRepository>()));
  gh.factory<_i86.HomeService>(() => _i86.HomeService(get<_i85.HomeManager>()));
  gh.factory<_i87.LoginScreen>(
      () => _i87.LoginScreen(get<_i36.LoginStateManager>()));
  gh.factory<_i88.MarkManager>(
      () => _i88.MarkManager(get<_i37.MarkRepository>()));
  gh.factory<_i89.MarkService>(() => _i89.MarkService(get<_i88.MarkManager>()));
  gh.factory<_i90.MarkStateManager>(() => _i90.MarkStateManager(
      get<_i89.MarkService>(), get<_i61.ClientService>()));
  gh.factory<_i91.MyShipmentManager>(
      () => _i91.MyShipmentManager(get<_i38.MyShipmentRepository>()));
  gh.factory<_i92.MyShipmentService>(
      () => _i92.MyShipmentService(get<_i91.MyShipmentManager>()));
  gh.factory<_i93.MyShipmentStateManger>(
      () => _i93.MyShipmentStateManger(get<_i92.MyShipmentService>()));
  gh.factory<_i94.ProductManager>(
      () => _i94.ProductManager(get<_i40.ProductRepository>()));
  gh.factory<_i95.ProductService>(
      () => _i95.ProductService(get<_i94.ProductManager>()));
  gh.factory<_i96.ProductStateManager>(
      () => _i96.ProductStateManager(get<_i95.ProductService>()));
  gh.factory<_i97.ProfileManager>(
      () => _i97.ProfileManager(get<_i41.ProfileRepository>()));
  gh.factory<_i98.ProfileService>(
      () => _i98.ProfileService(get<_i97.ProfileManager>()));
  gh.factory<_i99.ProfileStateManager>(
      () => _i99.ProfileStateManager(get<_i98.ProfileService>()));
  gh.factory<_i100.ProxyManager>(
      () => _i100.ProxyManager(get<_i42.ProxyRepository>()));
  gh.factory<_i101.ProxyService>(
      () => _i101.ProxyService(get<_i100.ProxyManager>()));
  gh.factory<_i102.ProxyStateManager>(
      () => _i102.ProxyStateManager(get<_i101.ProxyService>()));
  gh.factory<_i103.ReportManager>(
      () => _i103.ReportManager(get<_i43.ReportRepository>()));
  gh.factory<_i104.ReportService>(
      () => _i104.ReportService(get<_i103.ReportManager>()));
  gh.factory<_i105.RequestShipmentStateManger>(() =>
      _i105.RequestShipmentStateManger(
          get<_i84.FirstOptionService>(),
          get<_i89.MarkService>(),
          get<_i61.ClientService>(),
          get<_i74.DistributorService>()));
  gh.factory<_i106.ReviewShipmentStateManger>(() =>
      _i106.ReviewShipmentStateManger(
          get<_i84.FirstOptionService>(), get<_i35.ImageUploadService>()));
  gh.factory<_i107.SettingsScreen>(() => _i107.SettingsScreen(
      get<_i24.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i19.AppThemeDataService>(),
      get<_i82.FireNotificationService>()));
  gh.factory<_i108.SplashModule>(
      () => _i108.SplashModule(get<_i44.SplashScreen>()));
  gh.factory<_i109.SubContractServiceManager>(() =>
      _i109.SubContractServiceManager(
          get<_i45.SubContractServiceRepository>()));
  gh.factory<_i110.SubContractServiceService>(() =>
      _i110.SubContractServiceService(get<_i109.SubContractServiceManager>()));
  gh.factory<_i111.SubContractServiceStateManager>(() =>
      _i111.SubContractServiceStateManager(
          get<_i110.SubContractServiceService>()));
  gh.factory<_i112.SubProductManager>(
      () => _i112.SubProductManager(get<_i46.SubProductRepository>()));
  gh.factory<_i113.SubProductService>(
      () => _i113.SubProductService(get<_i112.SubProductManager>()));
  gh.factory<_i114.SubProductStateManager>(
      () => _i114.SubProductStateManager(get<_i113.SubProductService>()));
  gh.factory<_i115.SubcontractManager>(
      () => _i115.SubcontractManager(get<_i47.SubcontractRepository>()));
  gh.factory<_i116.SubcontractService>(
      () => _i116.SubcontractService(get<_i115.SubcontractManager>()));
  gh.factory<_i117.SubcontractStateManager>(
      () => _i117.SubcontractStateManager(get<_i116.SubcontractService>()));
  gh.factory<_i118.SupplierManager>(
      () => _i118.SupplierManager(get<_i48.SupplierRepository>()));
  gh.factory<_i119.SupplierService>(
      () => _i119.SupplierService(get<_i118.SupplierManager>()));
  gh.factory<_i120.SupplierStateManager>(
      () => _i120.SupplierStateManager(get<_i119.SupplierService>()));
  gh.factory<_i121.SuppliersScreen>(
      () => _i121.SuppliersScreen(get<_i120.SupplierStateManager>()));
  gh.factory<_i122.TrackingManager>(
      () => _i122.TrackingManager(get<_i49.TrackingRepository>()));
  gh.factory<_i123.TrackingService>(
      () => _i123.TrackingService(get<_i122.TrackingManager>()));
  gh.factory<_i124.TrackingStateManager>(
      () => _i124.TrackingStateManager(get<_i123.TrackingService>()));
  gh.factory<_i125.TravelManager>(
      () => _i125.TravelManager(get<_i50.TravelRepository>()));
  gh.factory<_i126.TravelService>(
      () => _i126.TravelService(get<_i125.TravelManager>()));
  gh.factory<_i127.TravelStateManager>(
      () => _i127.TravelStateManager(get<_i126.TravelService>()));
  gh.factory<_i128.UnitManager>(
      () => _i128.UnitManager(get<_i51.UnitRepository>()));
  gh.factory<_i129.UnitService>(
      () => _i129.UnitService(get<_i128.UnitManager>()));
  gh.factory<_i130.UnitStateManager>(
      () => _i130.UnitStateManager(get<_i129.UnitService>()));
  gh.factory<_i131.UnitsScreen>(
      () => _i131.UnitsScreen(get<_i130.UnitStateManager>()));
  gh.factory<_i132.WaitingShipmentManager>(() =>
      _i132.WaitingShipmentManager(get<_i52.WaitingShipmentRepository>()));
  gh.factory<_i133.WaitingShipmentService>(
      () => _i133.WaitingShipmentService(get<_i132.WaitingShipmentManager>()));
  gh.factory<_i134.WaitingShipmentsDetailsStateManager>(() =>
      _i134.WaitingShipmentsDetailsStateManager(
          get<_i133.WaitingShipmentService>()));
  gh.factory<_i135.WaitingShipmentsStateManager>(() =>
      _i135.WaitingShipmentsStateManager(get<_i133.WaitingShipmentService>()));
  gh.factory<_i136.WantingShipmentDetailsScreen>(() =>
      _i136.WantingShipmentDetailsScreen(
          get<_i134.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i137.WarehouseManager>(
      () => _i137.WarehouseManager(get<_i53.WarehousesRepository>()));
  gh.factory<_i138.WarehouseService>(
      () => _i138.WarehouseService(get<_i137.WarehouseManager>()));
  gh.factory<_i139.WarehouseStateManager>(
      () => _i139.WarehouseStateManager(get<_i138.WarehouseService>()));
  gh.factory<_i140.AcceptedShipmentFilterScreen>(() =>
      _i140.AcceptedShipmentFilterScreen(
          get<_i81.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i141.AcceptedShipmentManager>(() =>
      _i141.AcceptedShipmentManager(get<_i54.AcceptedShipmentRepository>()));
  gh.factory<_i142.AcceptedShipmentService>(() =>
      _i142.AcceptedShipmentService(get<_i141.AcceptedShipmentManager>()));
  gh.factory<_i143.AcceptedShipmentsDetailsStateManager>(() =>
      _i143.AcceptedShipmentsDetailsStateManager(
          get<_i142.AcceptedShipmentService>(), get<_i64.ContainerService>()));
  gh.factory<_i144.AcceptedShipmentsFinanceStateManager>(() =>
      _i144.AcceptedShipmentsFinanceStateManager(
          get<_i142.AcceptedShipmentService>()));
  gh.factory<_i145.AcceptedShipmentsStateManager>(() =>
      _i145.AcceptedShipmentsStateManager(
          get<_i142.AcceptedShipmentService>()));
  gh.factory<_i146.AcceptedShipmentsStatusStateManager>(() =>
      _i146.AcceptedShipmentsStatusStateManager(
          get<_i142.AcceptedShipmentService>(),
          get<_i116.SubcontractService>(),
          get<_i64.ContainerService>(),
          get<_i126.TravelService>(),
          get<_i138.WarehouseService>()));
  gh.factory<_i147.AddClientStateManager>(
      () => _i147.AddClientStateManager(get<_i61.ClientService>()));
  gh.factory<_i148.AddContainerSpecificationStateManager>(() =>
      _i148.AddContainerSpecificationStateManager(
          get<_i66.ContainerSpecificationService>()));
  gh.factory<_i149.AddContainerStateManager>(() =>
      _i149.AddContainerStateManager(
          get<_i64.ContainerService>(),
          get<_i116.SubcontractService>(),
          get<_i66.ContainerSpecificationService>()));
  gh.factory<_i150.AddCountryStateManager>(
      () => _i150.AddCountryStateManager(get<_i71.CountryService>()));
  gh.factory<_i151.AddDistributorStateManager>(
      () => _i151.AddDistributorStateManager(get<_i74.DistributorService>()));
  gh.factory<_i152.AddNewClient>(
      () => _i152.AddNewClient(get<_i147.AddClientStateManager>()));
  gh.factory<_i153.AddNewContainer>(
      () => _i153.AddNewContainer(get<_i149.AddContainerStateManager>()));
  gh.factory<_i154.AddNewContainerSpecification>(() =>
      _i154.AddNewContainerSpecification(
          get<_i148.AddContainerSpecificationStateManager>()));
  gh.factory<_i155.AddNewCountry>(
      () => _i155.AddNewCountry(get<_i150.AddCountryStateManager>()));
  gh.factory<_i156.AddNewDistributor>(
      () => _i156.AddNewDistributor(get<_i151.AddDistributorStateManager>()));
  gh.factory<_i157.AddProductStateManager>(
      () => _i157.AddProductStateManager(get<_i95.ProductService>()));
  gh.factory<_i158.AddProxyStateManager>(
      () => _i158.AddProxyStateManager(get<_i101.ProxyService>()));
  gh.factory<_i159.AddSubContractServiceStateManager>(() =>
      _i159.AddSubContractServiceStateManager(
          get<_i110.SubContractServiceService>()));
  gh.factory<_i160.AddSubProductStateManager>(() =>
      _i160.AddSubProductStateManager(
          get<_i113.SubProductService>(), get<_i95.ProductService>()));
  gh.factory<_i161.AddSubcontractStateManager>(() =>
      _i161.AddSubcontractStateManager(get<_i110.SubContractServiceService>(),
          get<_i116.SubcontractService>()));
  gh.factory<_i162.AddSupplierStateManager>(
      () => _i162.AddSupplierStateManager(get<_i119.SupplierService>()));
  gh.factory<_i163.AddTravelStateManager>(() => _i163.AddTravelStateManager(
      get<_i126.TravelService>(),
      get<_i71.CountryService>(),
      get<_i116.SubcontractService>()));
  gh.factory<_i164.AddUnitStateManager>(
      () => _i164.AddUnitStateManager(get<_i129.UnitService>()));
  gh.factory<_i165.AddWarehouseStateManager>(() =>
      _i165.AddWarehouseStateManager(
          get<_i138.WarehouseService>(),
          get<_i116.SubcontractService>(),
          get<_i101.ProxyService>(),
          get<_i71.CountryService>()));
  gh.factory<_i166.AirwaybillManager>(
      () => _i166.AirwaybillManager(get<_i55.AirwaybillRepository>()));
  gh.factory<_i167.AirwaybillService>(
      () => _i167.AirwaybillService(get<_i166.AirwaybillManager>()));
  gh.factory<_i168.AirwaybillSpecificationManager>(() =>
      _i168.AirwaybillSpecificationManager(
          get<_i56.AirwaybillSpecificationRepository>()));
  gh.factory<_i169.AirwaybillSpecificationService>(() =>
      _i169.AirwaybillSpecificationService(
          get<_i168.AirwaybillSpecificationManager>()));
  gh.factory<_i170.AirwaybillSpecificationStateManager>(() =>
      _i170.AirwaybillSpecificationStateManager(
          get<_i169.AirwaybillSpecificationService>()));
  gh.factory<_i171.AirwaybillSpecificationsScreen>(() =>
      _i171.AirwaybillSpecificationsScreen(
          get<_i170.AirwaybillSpecificationStateManager>()));
  gh.factory<_i172.AirwaybillStateManager>(
      () => _i172.AirwaybillStateManager(get<_i167.AirwaybillService>()));
  gh.factory<_i173.AuthorizationModule>(
      () => _i173.AuthorizationModule(get<_i87.LoginScreen>()));
  gh.factory<_i174.ChatPageBloc>(
      () => _i174.ChatPageBloc(get<_i59.ChatService>()));
  gh.factory<_i175.ClientsScreen>(
      () => _i175.ClientsScreen(get<_i62.ClientsStateManager>()));
  gh.factory<_i176.ContainerDetailsStateManager>(() =>
      _i176.ContainerDetailsStateManager(
          get<_i64.ContainerService>(), get<_i126.TravelService>()));
  gh.factory<_i177.ContainerFinanceStateManager>(
      () => _i177.ContainerFinanceStateManager(get<_i64.ContainerService>()));
  gh.factory<_i178.ContainerScreen>(
      () => _i178.ContainerScreen(get<_i69.ContainerStateManager>()));
  gh.factory<_i179.ContainerSpecificationModule>(() =>
      _i179.ContainerSpecificationModule(
          get<_i68.ContainerSpecificationsScreen>(),
          get<_i154.AddNewContainerSpecification>()));
  gh.factory<_i180.CountriesScreen>(
      () => _i180.CountriesScreen(get<_i72.CountryStateManager>()));
  gh.factory<_i181.CountryModule>(() => _i181.CountryModule(
      get<_i180.CountriesScreen>(), get<_i155.AddNewCountry>()));
  gh.factory<_i182.DistributorsModule>(() => _i182.DistributorsModule(
      get<_i76.DistributorsScreen>(), get<_i156.AddNewDistributor>()));
  gh.factory<_i183.EditShipmentModule>(
      () => _i183.EditShipmentModule(get<_i80.EditedShipmentScreen>()));
  gh.factory<_i184.FilterAirwaybillStateManager>(() =>
      _i184.FilterAirwaybillStateManager(get<_i116.SubcontractService>()));
  gh.factory<_i185.FilterContainerStateManager>(
      () => _i185.FilterContainerStateManager(get<_i116.SubcontractService>()));
  gh.factory<_i186.FilterTravelStateManager>(() =>
      _i186.FilterTravelStateManager(get<_i126.TravelService>(),
          get<_i71.CountryService>(), get<_i116.SubcontractService>()));
  gh.factory<_i187.HomeStateManager>(() => _i187.HomeStateManager(
      get<_i86.HomeService>(), get<_i138.WarehouseService>()));
  gh.factory<_i188.MarkScreen>(
      () => _i188.MarkScreen(get<_i90.MarkStateManager>()));
  gh.factory<_i189.MyShipmentScreen>(
      () => _i189.MyShipmentScreen(get<_i93.MyShipmentStateManger>()));
  gh.factory<_i190.NewShipment>(
      () => _i190.NewShipment(get<_i105.RequestShipmentStateManger>()));
  gh.factory<_i191.ProductScreen>(
      () => _i191.ProductScreen(get<_i96.ProductStateManager>()));
  gh.factory<_i192.ProfileScreen>(
      () => _i192.ProfileScreen(get<_i99.ProfileStateManager>()));
  gh.factory<_i193.ProxiesScreen>(
      () => _i193.ProxiesScreen(get<_i102.ProxyStateManager>()));
  gh.factory<_i194.RequestShipmentReview>(() =>
      _i194.RequestShipmentReview(get<_i106.ReviewShipmentStateManger>()));
  gh.factory<_i195.SettingsModule>(
      () => _i195.SettingsModule(get<_i107.SettingsScreen>()));
  gh.factory<_i196.SubContractServiceScreen>(() =>
      _i196.SubContractServiceScreen(
          get<_i111.SubContractServiceStateManager>()));
  gh.factory<_i197.SubProductScreen>(
      () => _i197.SubProductScreen(get<_i114.SubProductStateManager>()));
  gh.factory<_i198.SubcontractScreen>(
      () => _i198.SubcontractScreen(get<_i117.SubcontractStateManager>()));
  gh.factory<_i199.TrackingScreen>(
      () => _i199.TrackingScreen(get<_i124.TrackingStateManager>()));
  gh.factory<_i200.TravelDetailsStateManager>(
      () => _i200.TravelDetailsStateManager(get<_i126.TravelService>()));
  gh.factory<_i201.TravelFilterScreen>(
      () => _i201.TravelFilterScreen(get<_i186.FilterTravelStateManager>()));
  gh.factory<_i202.TravelFinanceStateManager>(
      () => _i202.TravelFinanceStateManager(get<_i126.TravelService>()));
  gh.factory<_i203.TravelScreen>(
      () => _i203.TravelScreen(get<_i127.TravelStateManager>()));
  gh.factory<_i204.ViewWarehousesStateManager>(
      () => _i204.ViewWarehousesStateManager(get<_i138.WarehouseService>()));
  gh.factory<_i205.WaitingShipmentScreen>(() =>
      _i205.WaitingShipmentScreen(get<_i135.WaitingShipmentsStateManager>()));
  gh.factory<_i206.WarehouseFinanceStateManager>(
      () => _i206.WarehouseFinanceStateManager(get<_i138.WarehouseService>()));
  gh.factory<_i207.WarehouseScreen>(
      () => _i207.WarehouseScreen(get<_i139.WarehouseStateManager>()));
  gh.factory<_i208.AcceptedShipmentDetailsScreen>(() =>
      _i208.AcceptedShipmentDetailsScreen(
          get<_i143.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i209.AcceptedShipmentFinanceScreen>(() =>
      _i209.AcceptedShipmentFinanceScreen(
          get<_i144.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i210.AcceptedShipmentScreen>(() =>
      _i210.AcceptedShipmentScreen(get<_i145.AcceptedShipmentsStateManager>()));
  gh.factory<_i211.AcceptedShipmentStatusScreen>(() =>
      _i211.AcceptedShipmentStatusScreen(
          get<_i146.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i212.AddAirwaybillSpecificationStateManager>(() =>
      _i212.AddAirwaybillSpecificationStateManager(
          get<_i169.AirwaybillSpecificationService>()));
  gh.factory<_i213.AddAirwaybillStateManager>(() =>
      _i213.AddAirwaybillStateManager(
          get<_i167.AirwaybillService>(),
          get<_i116.SubcontractService>(),
          get<_i169.AirwaybillSpecificationService>()));
  gh.factory<_i214.AddNewAirwaybill>(
      () => _i214.AddNewAirwaybill(get<_i213.AddAirwaybillStateManager>()));
  gh.factory<_i215.AddNewAirwaybillSpecification>(() =>
      _i215.AddNewAirwaybillSpecification(
          get<_i212.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i216.AddNewProduct>(
      () => _i216.AddNewProduct(get<_i157.AddProductStateManager>()));
  gh.factory<_i217.AddNewProxy>(
      () => _i217.AddNewProxy(get<_i158.AddProxyStateManager>()));
  gh.factory<_i218.AddNewSubContractService>(() =>
      _i218.AddNewSubContractService(
          get<_i159.AddSubContractServiceStateManager>()));
  gh.factory<_i219.AddNewSubProduct>(
      () => _i219.AddNewSubProduct(get<_i160.AddSubProductStateManager>()));
  gh.factory<_i220.AddNewSubcontract>(
      () => _i220.AddNewSubcontract(get<_i161.AddSubcontractStateManager>()));
  gh.factory<_i221.AddNewSupplier>(
      () => _i221.AddNewSupplier(get<_i162.AddSupplierStateManager>()));
  gh.factory<_i222.AddNewTravel>(
      () => _i222.AddNewTravel(get<_i163.AddTravelStateManager>()));
  gh.factory<_i223.AddNewUnit>(
      () => _i223.AddNewUnit(get<_i164.AddUnitStateManager>()));
  gh.factory<_i224.AddNewWarehouse>(
      () => _i224.AddNewWarehouse(get<_i165.AddWarehouseStateManager>()));
  gh.factory<_i225.AirwaybillDetailsStateManager>(() =>
      _i225.AirwaybillDetailsStateManager(
          get<_i167.AirwaybillService>(), get<_i126.TravelService>()));
  gh.factory<_i226.AirwaybillFilterScreen>(() =>
      _i226.AirwaybillFilterScreen(get<_i184.FilterAirwaybillStateManager>()));
  gh.factory<_i227.AirwaybillFinanceStateManager>(() =>
      _i227.AirwaybillFinanceStateManager(get<_i167.AirwaybillService>()));
  gh.factory<_i228.AirwaybillScreen>(
      () => _i228.AirwaybillScreen(get<_i172.AirwaybillStateManager>()));
  gh.factory<_i229.AirwaybillSpecificationModule>(() =>
      _i229.AirwaybillSpecificationModule(
          get<_i171.AirwaybillSpecificationsScreen>(),
          get<_i215.AddNewAirwaybillSpecification>()));
  gh.factory<_i230.ClientModule>(() => _i230.ClientModule(
      get<_i175.ClientsScreen>(), get<_i152.AddNewClient>()));
  gh.factory<_i231.ContainerDetailsScreen>(() =>
      _i231.ContainerDetailsScreen(get<_i176.ContainerDetailsStateManager>()));
  gh.factory<_i232.ContainerFilterScreen>(() =>
      _i232.ContainerFilterScreen(get<_i185.FilterContainerStateManager>()));
  gh.factory<_i233.ContainerFinanceScreen>(() =>
      _i233.ContainerFinanceScreen(get<_i177.ContainerFinanceStateManager>()));
  gh.factory<_i234.ContainerModule>(() => _i234.ContainerModule(
      get<_i178.ContainerScreen>(),
      get<_i153.AddNewContainer>(),
      get<_i232.ContainerFilterScreen>(),
      get<_i231.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i233.ContainerFinanceScreen>()));
  gh.factory<_i235.HomeScreen>(
      () => _i235.HomeScreen(get<_i187.HomeStateManager>()));
  gh.factory<_i236.MarkModule>(() => _i236.MarkModule(get<_i188.MarkScreen>()));
  gh.factory<_i237.MyShipmentModule>(() => _i237.MyShipmentModule(
      get<_i189.MyShipmentScreen>(), get<_i15.ReviewShipmentScreen>()));
  gh.factory<_i238.NewShipmentsModule>(() => _i238.NewShipmentsModule(
      get<_i190.NewShipment>(), get<_i194.RequestShipmentReview>()));
  gh.factory<_i239.ProductModule>(() => _i239.ProductModule(
      get<_i191.ProductScreen>(), get<_i216.AddNewProduct>()));
  gh.factory<_i240.ProfileModule>(
      () => _i240.ProfileModule(get<_i192.ProfileScreen>()));
  gh.factory<_i241.ProxiesModule>(() => _i241.ProxiesModule(
      get<_i193.ProxiesScreen>(), get<_i217.AddNewProxy>()));
  gh.factory<_i242.SubContractServiceModule>(() =>
      _i242.SubContractServiceModule(get<_i196.SubContractServiceScreen>(),
          get<_i218.AddNewSubContractService>()));
  gh.factory<_i243.SubProductModule>(() => _i243.SubProductModule(
      get<_i197.SubProductScreen>(), get<_i219.AddNewSubProduct>()));
  gh.factory<_i244.SubcontractModule>(() => _i244.SubcontractModule(
      get<_i198.SubcontractScreen>(), get<_i220.AddNewSubcontract>()));
  gh.factory<_i245.SupplierModule>(() => _i245.SupplierModule(
      get<_i121.SuppliersScreen>(), get<_i221.AddNewSupplier>()));
  gh.factory<_i246.TrackingModule>(
      () => _i246.TrackingModule(get<_i199.TrackingScreen>()));
  gh.factory<_i247.TravelDetailsScreen>(
      () => _i247.TravelDetailsScreen(get<_i200.TravelDetailsStateManager>()));
  gh.factory<_i248.TravelFinanceScreen>(
      () => _i248.TravelFinanceScreen(get<_i202.TravelFinanceStateManager>()));
  gh.factory<_i249.TravelModule>(() => _i249.TravelModule(
      get<_i203.TravelScreen>(),
      get<_i222.AddNewTravel>(),
      get<_i201.TravelFilterScreen>(),
      get<_i247.TravelDetailsScreen>(),
      get<_i248.TravelFinanceScreen>()));
  gh.factory<_i250.UnitModule>(() =>
      _i250.UnitModule(get<_i131.UnitsScreen>(), get<_i223.AddNewUnit>()));
  gh.factory<_i251.ViewWarehouseScreen>(
      () => _i251.ViewWarehouseScreen(get<_i204.ViewWarehousesStateManager>()));
  gh.factory<_i252.WaitingShipmentModule>(() => _i252.WaitingShipmentModule(
      get<_i205.WaitingShipmentScreen>(),
      get<_i136.WantingShipmentDetailsScreen>()));
  gh.factory<_i253.WarehouseFinanceScreen>(() =>
      _i253.WarehouseFinanceScreen(get<_i206.WarehouseFinanceStateManager>()));
  gh.factory<_i254.WarehouseModule>(() => _i254.WarehouseModule(
      get<_i207.WarehouseScreen>(),
      get<_i224.AddNewWarehouse>(),
      get<_i253.WarehouseFinanceScreen>()));
  gh.factory<_i255.AcceptedShipmentModule>(() => _i255.AcceptedShipmentModule(
      get<_i210.AcceptedShipmentScreen>(),
      get<_i208.AcceptedShipmentDetailsScreen>(),
      get<_i140.AcceptedShipmentFilterScreen>(),
      get<_i211.AcceptedShipmentStatusScreen>(),
      get<_i209.AcceptedShipmentFinanceScreen>(),
      get<_i251.ViewWarehouseScreen>()));
  gh.factory<_i256.AirwaybillDetailsScreen>(() => _i256.AirwaybillDetailsScreen(
      get<_i225.AirwaybillDetailsStateManager>()));
  gh.factory<_i257.AirwaybillFinanceScreen>(() => _i257.AirwaybillFinanceScreen(
      get<_i227.AirwaybillFinanceStateManager>()));
  gh.factory<_i258.AirwaybillModule>(() => _i258.AirwaybillModule(
      get<_i228.AirwaybillScreen>(),
      get<_i214.AddNewAirwaybill>(),
      get<_i226.AirwaybillFilterScreen>(),
      get<_i256.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i257.AirwaybillFinanceScreen>()));
  gh.factory<_i259.HomeModule>(() => _i259.HomeModule(get<_i235.HomeScreen>()));
  gh.factory<_i260.MyApp>(() => _i260.MyApp(
      get<_i19.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i82.FireNotificationService>(),
      get<_i108.SplashModule>(),
      get<_i173.AuthorizationModule>(),
      get<_i58.ChatModule>(),
      get<_i195.SettingsModule>(),
      get<_i259.HomeModule>(),
      get<_i240.ProfileModule>(),
      get<_i236.MarkModule>(),
      get<_i21.NotificationModule>(),
      get<_i238.NewShipmentsModule>(),
      get<_i246.TrackingModule>(),
      get<_i183.EditShipmentModule>(),
      get<_i181.CountryModule>(),
      get<_i182.DistributorsModule>(),
      get<_i241.ProxiesModule>(),
      get<_i245.SupplierModule>(),
      get<_i242.SubContractServiceModule>(),
      get<_i244.SubcontractModule>(),
      get<_i250.UnitModule>(),
      get<_i249.TravelModule>(),
      get<_i234.ContainerModule>(),
      get<_i258.AirwaybillModule>(),
      get<_i179.ContainerSpecificationModule>(),
      get<_i229.AirwaybillSpecificationModule>(),
      get<_i252.WaitingShipmentModule>(),
      get<_i255.AcceptedShipmentModule>(),
      get<_i230.ClientModule>(),
      get<_i239.ProductModule>(),
      get<_i243.SubProductModule>(),
      get<_i254.WarehouseModule>()));
  return get;
}
