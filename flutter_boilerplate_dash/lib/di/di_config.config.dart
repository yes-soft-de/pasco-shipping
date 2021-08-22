// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i257;
import '../module_airwaybill/airwaybill_module.dart' as _i256;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i166;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i56;
import '../module_airwaybill/service/airwaybill_service.dart' as _i167;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i226;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i172;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i224;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i184;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i212;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i254;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i225;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i255;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i213;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i227;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i4;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i228;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i168;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i57;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i169;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i170;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i211;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i214;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i171;
import '../module_auth/authoriazation_module.dart' as _i173;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i5;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i37;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i88;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i174;
import '../module_chat/chat_module.dart' as _i59;
import '../module_chat/manager/chat/chat_manager.dart' as _i58;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i60;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i6;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i229;
import '../module_client/manager/client_manager.dart' as _i61;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i62;
import '../module_client/state_manager/client_state_manager.dart' as _i63;
import '../module_client/state_manager/new_client_state_manger.dart' as _i147;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i152;
import '../module_client/ui/screen/client_screen.dart' as _i175;
import '../module_container/container_module.dart' as _i233;
import '../module_container/manager/container_manager.dart' as _i64;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i65;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i177;
import '../module_container/state_manger/container_state_manager.dart' as _i70;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i176;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i185;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i149;
import '../module_container/ui/screen/container_details_screen.dart' as _i230;
import '../module_container/ui/screen/container_filter_screen.dart' as _i231;
import '../module_container/ui/screen/container_finance_screen.dart' as _i232;
import '../module_container/ui/screen/container_new_screen.dart' as _i153;
import '../module_container/ui/screen/container_screen.dart' as _i178;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i7;
import '../module_container_specification/container_specification_module.dart'
    as _i179;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i66;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i67;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i68;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i148;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i154;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i69;
import '../module_countries/country_module.dart' as _i181;
import '../module_countries/manager/country_manager.dart' as _i71;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i72;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i73;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i150;
import '../module_countries/ui/screen/countries_screen.dart' as _i180;
import '../module_countries/ui/screen/country_new_screen.dart' as _i155;
import '../module_distributors/distributors_module.dart' as _i182;
import '../module_distributors/manager/distributors_manager.dart' as _i74;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i75;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i76;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i151;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i156;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i77;
import '../module_edit_shipment/edit_shipment_module.dart' as _i183;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i78;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i79;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i80;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i81;
import '../module_home/home_module.dart' as _i234;
import '../module_home/manager/home_manager.dart' as _i85;
import '../module_home/repository/home_repository.dart' as _i35;
import '../module_home/service/home_service.dart' as _i86;
import '../module_home/state_manager/state_manager_home.dart' as _i87;
import '../module_home/ui/screen/home_screen.dart' as _i187;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i9;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i10;
import '../module_mark/manager/mark_manager.dart' as _i89;
import '../module_mark/mark_module.dart' as _i235;
import '../module_mark/repository/mark_repository.dart' as _i38;
import '../module_mark/service/mark_service.dart' as _i90;
import '../module_mark/state_manager/mark_state_manager.dart' as _i91;
import '../module_mark/ui/mark_screen.dart' as _i188;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i92;
import '../module_my_shipment/my_shipment_module.dart' as _i236;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i39;
import '../module_my_shipment/service/my_shipment_service.dart' as _i93;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i94;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i189;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i40;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i82;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i8;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_product_category/manager/product_category_manager.dart'
    as _i95;
import '../module_product_category/product_module.dart' as _i238;
import '../module_product_category/repository/product_category_repository.dart'
    as _i41;
import '../module_product_category/service/product_service.dart' as _i96;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i157;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i97;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i215;
import '../module_product_category/ui/screen/products_screen.dart' as _i191;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i113;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i47;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i114;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i160;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i115;
import '../module_product_sub_category/sub_product_module.dart' as _i242;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i218;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i197;
import '../module_profile/manager/profile_manager.dart' as _i98;
import '../module_profile/profile_module.dart' as _i239;
import '../module_profile/repository/profile_repository.dart' as _i42;
import '../module_profile/service/profile_service.dart' as _i99;
import '../module_profile/state_manager/profile_state_manager.dart' as _i100;
import '../module_profile/ui/profile_screen.dart' as _i192;
import '../module_proxies/manager/proxies_manager.dart' as _i101;
import '../module_proxies/proxies_module.dart' as _i240;
import '../module_proxies/repository/proxies_repository.dart' as _i43;
import '../module_proxies/service/proixes_service.dart' as _i102;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i158;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i103;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i193;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i216;
import '../module_report/manager/report_manager.dart' as _i104;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i44;
import '../module_report/service/report_service.dart' as _i105;
import '../module_settings/settings_module.dart' as _i195;
import '../module_settings/ui/settings_page/settings_page.dart' as _i108;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i83;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i34;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i84;
import '../module_shipment_request/shipment_request_module.dart' as _i237;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i106;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i107;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i190;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i194;
import '../module_shipment_track/manager/tracking_manager.dart' as _i123;
import '../module_shipment_track/repository/tracking_repository.dart' as _i50;
import '../module_shipment_track/service/tracking_service.dart' as _i124;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i125;
import '../module_shipment_track/tracking_module.dart' as _i245;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i199;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i253;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i141;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i55;
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
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i207;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i208;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i209;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i210;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i3;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i133;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i53;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i134;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i135;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i136;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i137;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i204;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i250;
import '../module_splash/splash_module.dart' as _i109;
import '../module_splash/ui/screen/splash_screen.dart' as _i45;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i116;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i48;
import '../module_sub_contract/service/subcontract_service.dart' as _i117;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i161;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i118;
import '../module_sub_contract/subcontract_module.dart' as _i243;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i219;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i198;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i110;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i46;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i111;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i159;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i112;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i241;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i217;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i196;
import '../module_suppliers/manager/suppliers_manager.dart' as _i119;
import '../module_suppliers/repository/suppliers_repository.dart' as _i49;
import '../module_suppliers/service/suppliers_service.dart' as _i120;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i162;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i121;
import '../module_suppliers/supplier_module.dart' as _i244;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i220;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i122;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i126;
import '../module_travel/repository/travel_repository.dart' as _i51;
import '../module_travel/service/travel_service.dart' as _i127;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i200;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i186;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i163;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i202;
import '../module_travel/state_manger/travels_state_manager.dart' as _i128;
import '../module_travel/travel_module.dart' as _i248;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i246;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i201;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i247;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i221;
import '../module_travel/ui/screen/travel_screen.dart' as _i203;
import '../module_unit/manager/unit_manager.dart' as _i129;
import '../module_unit/repository/unit_repository.dart' as _i52;
import '../module_unit/service/unit_service.dart' as _i130;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i164;
import '../module_unit/state_manger/units_state_manager.dart' as _i131;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i222;
import '../module_unit/ui/screen/units_screen.dart' as _i132;
import '../module_unit/unit_module.dart' as _i249;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i36;
import '../module_warehouses/manager/warehouses_manager.dart' as _i138;
import '../module_warehouses/repository/warehouse_repository.dart' as _i54;
import '../module_warehouses/service/warehouse_service.dart' as _i139;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i165;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i205;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i140;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i251;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i223;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i206;
import '../module_warehouses/warehouse_module.dart' as _i252;
import '../utils/logger/logger.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AcceptedShipmentFilterScreen>(
      () => _i3.AcceptedShipmentFilterScreen());
  gh.factory<_i4.AirwaybillShipmentReview>(
      () => _i4.AirwaybillShipmentReview());
  gh.factory<_i5.AuthPrefsHelper>(() => _i5.AuthPrefsHelper());
  gh.factory<_i6.ChatScreen>(() => _i6.ChatScreen());
  gh.factory<_i7.ContainerShipmentReview>(() => _i7.ContainerShipmentReview());
  gh.factory<_i8.LocalNotificationService>(
      () => _i8.LocalNotificationService());
  gh.factory<_i9.LocalizationPreferencesHelper>(
      () => _i9.LocalizationPreferencesHelper());
  gh.factory<_i10.LocalizationService>(
      () => _i10.LocalizationService(get<_i9.LocalizationPreferencesHelper>()));
  gh.factory<_i11.Logger>(() => _i11.Logger());
  gh.factory<_i12.NotificationScreen>(() => _i12.NotificationScreen());
  gh.factory<_i13.NotificationsPrefsHelper>(
      () => _i13.NotificationsPrefsHelper());
  gh.factory<_i14.PreviousShipmentsModule>(
      () => _i14.PreviousShipmentsModule());
  gh.factory<_i15.ReportPrefsHelper>(() => _i15.ReportPrefsHelper());
  gh.factory<_i16.ReviewShipmentScreen>(() => _i16.ReviewShipmentScreen());
  gh.factory<_i17.ThemePreferencesHelper>(() => _i17.ThemePreferencesHelper());
  gh.factory<_i18.UploadRepository>(() => _i18.UploadRepository());
  gh.factory<_i19.ApiClient>(() => _i19.ApiClient(get<_i11.Logger>()));
  gh.factory<_i20.AppThemeDataService>(
      () => _i20.AppThemeDataService(get<_i17.ThemePreferencesHelper>()));
  gh.factory<_i21.AuthRepository>(
      () => _i21.AuthRepository(get<_i19.ApiClient>(), get<_i11.Logger>()));
  gh.factory<_i22.NotificationModule>(
      () => _i22.NotificationModule(get<_i12.NotificationScreen>()));
  gh.factory<_i23.UploadManager>(
      () => _i23.UploadManager(get<_i18.UploadRepository>()));
  gh.factory<_i24.AuthManager>(
      () => _i24.AuthManager(get<_i21.AuthRepository>()));
  gh.factory<_i25.AuthService>(() =>
      _i25.AuthService(get<_i5.AuthPrefsHelper>(), get<_i24.AuthManager>()));
  gh.factory<_i26.ChatRepository>(() =>
      _i26.ChatRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i27.ChatsListScreen>(
      () => _i27.ChatsListScreen(get<_i25.AuthService>()));
  gh.factory<_i28.ClientRepository>(() =>
      _i28.ClientRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i29.ContainerRepository>(() =>
      _i29.ContainerRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i30.ContainerSpecificationRepository>(() =>
      _i30.ContainerSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i31.CountryRepository>(() =>
      _i31.CountryRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i32.DistributorRepository>(() => _i32.DistributorRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i33.EditShipmentRepository>(() => _i33.EditShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i34.FirstOptionRepository>(() => _i34.FirstOptionRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i35.HomeRepository>(() =>
      _i35.HomeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i36.ImageUploadService>(
      () => _i36.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i37.LoginStateManager>(
      () => _i37.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i38.MarkRepository>(() =>
      _i38.MarkRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i39.MyShipmentRepository>(() => _i39.MyShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i40.NotificationRepo>(() =>
      _i40.NotificationRepo(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i41.ProductRepository>(() =>
      _i41.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i42.ProfileRepository>(() =>
      _i42.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i43.ProxyRepository>(() =>
      _i43.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i44.ReportRepository>(() => _i44.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i45.SplashScreen>(
      () => _i45.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i46.SubContractServiceRepository>(() =>
      _i46.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i47.SubProductRepository>(() => _i47.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i48.SubcontractRepository>(() => _i48.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i49.SupplierRepository>(() =>
      _i49.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i50.TrackingRepository>(() =>
      _i50.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.TravelRepository>(() =>
      _i51.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.UnitRepository>(() =>
      _i52.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.WaitingShipmentRepository>(() =>
      _i53.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.WarehousesRepository>(() => _i54.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.AcceptedShipmentRepository>(() =>
      _i55.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.AirwaybillRepository>(() => _i56.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.AirwaybillSpecificationRepository>(() =>
      _i57.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.ChatManager>(
      () => _i58.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i59.ChatModule>(() => _i59.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i6.ChatScreen>()));
  gh.factory<_i60.ChatService>(() => _i60.ChatService(get<_i58.ChatManager>()));
  gh.factory<_i61.ClientManager>(
      () => _i61.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i62.ClientService>(
      () => _i62.ClientService(get<_i61.ClientManager>()));
  gh.factory<_i63.ClientsStateManager>(
      () => _i63.ClientsStateManager(get<_i62.ClientService>()));
  gh.factory<_i64.ContainerManager>(
      () => _i64.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i65.ContainerService>(
      () => _i65.ContainerService(get<_i64.ContainerManager>()));
  gh.factory<_i66.ContainerSpecificationManager>(() =>
      _i66.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i67.ContainerSpecificationService>(() =>
      _i67.ContainerSpecificationService(
          get<_i66.ContainerSpecificationManager>()));
  gh.factory<_i68.ContainerSpecificationStateManager>(() =>
      _i68.ContainerSpecificationStateManager(
          get<_i67.ContainerSpecificationService>()));
  gh.factory<_i69.ContainerSpecificationsScreen>(() =>
      _i69.ContainerSpecificationsScreen(
          get<_i68.ContainerSpecificationStateManager>()));
  gh.factory<_i70.ContainerStateManager>(
      () => _i70.ContainerStateManager(get<_i65.ContainerService>()));
  gh.factory<_i71.CountryManager>(
      () => _i71.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i72.CountryService>(
      () => _i72.CountryService(get<_i71.CountryManager>()));
  gh.factory<_i73.CountryStateManager>(
      () => _i73.CountryStateManager(get<_i72.CountryService>()));
  gh.factory<_i74.DistributorManager>(
      () => _i74.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i75.DistributorService>(
      () => _i75.DistributorService(get<_i74.DistributorManager>()));
  gh.factory<_i76.DistributorStateManager>(
      () => _i76.DistributorStateManager(get<_i75.DistributorService>()));
  gh.factory<_i77.DistributorsScreen>(
      () => _i77.DistributorsScreen(get<_i76.DistributorStateManager>()));
  gh.factory<_i78.EditShipmentManager>(
      () => _i78.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i79.EditShipmentService>(
      () => _i79.EditShipmentService(get<_i78.EditShipmentManager>()));
  gh.factory<_i80.EditShipmentStateManager>(() => _i80.EditShipmentStateManager(
      get<_i79.EditShipmentService>(), get<_i36.ImageUploadService>()));
  gh.factory<_i81.EditedShipmentScreen>(
      () => _i81.EditedShipmentScreen(get<_i80.EditShipmentStateManager>()));
  gh.factory<_i82.FireNotificationService>(() => _i82.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i40.NotificationRepo>()));
  gh.factory<_i83.FirstOptionManager>(
      () => _i83.FirstOptionManager(get<_i34.FirstOptionRepository>()));
  gh.factory<_i84.FirstOptionService>(
      () => _i84.FirstOptionService(get<_i83.FirstOptionManager>()));
  gh.factory<_i85.HomeManager>(
      () => _i85.HomeManager(get<_i35.HomeRepository>()));
  gh.factory<_i86.HomeService>(() => _i86.HomeService(get<_i85.HomeManager>()));
  gh.factory<_i87.HomeStateManager>(
      () => _i87.HomeStateManager(get<_i86.HomeService>()));
  gh.factory<_i88.LoginScreen>(
      () => _i88.LoginScreen(get<_i37.LoginStateManager>()));
  gh.factory<_i89.MarkManager>(
      () => _i89.MarkManager(get<_i38.MarkRepository>()));
  gh.factory<_i90.MarkService>(() => _i90.MarkService(get<_i89.MarkManager>()));
  gh.factory<_i91.MarkStateManager>(() => _i91.MarkStateManager(
      get<_i90.MarkService>(), get<_i62.ClientService>()));
  gh.factory<_i92.MyShipmentManager>(
      () => _i92.MyShipmentManager(get<_i39.MyShipmentRepository>()));
  gh.factory<_i93.MyShipmentService>(
      () => _i93.MyShipmentService(get<_i92.MyShipmentManager>()));
  gh.factory<_i94.MyShipmentStateManger>(
      () => _i94.MyShipmentStateManger(get<_i93.MyShipmentService>()));
  gh.factory<_i95.ProductManager>(
      () => _i95.ProductManager(get<_i41.ProductRepository>()));
  gh.factory<_i96.ProductService>(
      () => _i96.ProductService(get<_i95.ProductManager>()));
  gh.factory<_i97.ProductStateManager>(
      () => _i97.ProductStateManager(get<_i96.ProductService>()));
  gh.factory<_i98.ProfileManager>(
      () => _i98.ProfileManager(get<_i42.ProfileRepository>()));
  gh.factory<_i99.ProfileService>(
      () => _i99.ProfileService(get<_i98.ProfileManager>()));
  gh.factory<_i100.ProfileStateManager>(
      () => _i100.ProfileStateManager(get<_i99.ProfileService>()));
  gh.factory<_i101.ProxyManager>(
      () => _i101.ProxyManager(get<_i43.ProxyRepository>()));
  gh.factory<_i102.ProxyService>(
      () => _i102.ProxyService(get<_i101.ProxyManager>()));
  gh.factory<_i103.ProxyStateManager>(
      () => _i103.ProxyStateManager(get<_i102.ProxyService>()));
  gh.factory<_i104.ReportManager>(
      () => _i104.ReportManager(get<_i44.ReportRepository>()));
  gh.factory<_i105.ReportService>(
      () => _i105.ReportService(get<_i104.ReportManager>()));
  gh.factory<_i106.RequestShipmentStateManger>(() =>
      _i106.RequestShipmentStateManger(
          get<_i84.FirstOptionService>(),
          get<_i90.MarkService>(),
          get<_i62.ClientService>(),
          get<_i75.DistributorService>()));
  gh.factory<_i107.ReviewShipmentStateManger>(
      () => _i107.ReviewShipmentStateManger(get<_i84.FirstOptionService>()));
  gh.factory<_i108.SettingsScreen>(() => _i108.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i10.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i82.FireNotificationService>()));
  gh.factory<_i109.SplashModule>(
      () => _i109.SplashModule(get<_i45.SplashScreen>()));
  gh.factory<_i110.SubContractServiceManager>(() =>
      _i110.SubContractServiceManager(
          get<_i46.SubContractServiceRepository>()));
  gh.factory<_i111.SubContractServiceService>(() =>
      _i111.SubContractServiceService(get<_i110.SubContractServiceManager>()));
  gh.factory<_i112.SubContractServiceStateManager>(() =>
      _i112.SubContractServiceStateManager(
          get<_i111.SubContractServiceService>()));
  gh.factory<_i113.SubProductManager>(
      () => _i113.SubProductManager(get<_i47.SubProductRepository>()));
  gh.factory<_i114.SubProductService>(
      () => _i114.SubProductService(get<_i113.SubProductManager>()));
  gh.factory<_i115.SubProductStateManager>(
      () => _i115.SubProductStateManager(get<_i114.SubProductService>()));
  gh.factory<_i116.SubcontractManager>(
      () => _i116.SubcontractManager(get<_i48.SubcontractRepository>()));
  gh.factory<_i117.SubcontractService>(
      () => _i117.SubcontractService(get<_i116.SubcontractManager>()));
  gh.factory<_i118.SubcontractStateManager>(
      () => _i118.SubcontractStateManager(get<_i117.SubcontractService>()));
  gh.factory<_i119.SupplierManager>(
      () => _i119.SupplierManager(get<_i49.SupplierRepository>()));
  gh.factory<_i120.SupplierService>(
      () => _i120.SupplierService(get<_i119.SupplierManager>()));
  gh.factory<_i121.SupplierStateManager>(
      () => _i121.SupplierStateManager(get<_i120.SupplierService>()));
  gh.factory<_i122.SuppliersScreen>(
      () => _i122.SuppliersScreen(get<_i121.SupplierStateManager>()));
  gh.factory<_i123.TrackingManager>(
      () => _i123.TrackingManager(get<_i50.TrackingRepository>()));
  gh.factory<_i124.TrackingService>(
      () => _i124.TrackingService(get<_i123.TrackingManager>()));
  gh.factory<_i125.TrackingStateManager>(
      () => _i125.TrackingStateManager(get<_i124.TrackingService>()));
  gh.factory<_i126.TravelManager>(
      () => _i126.TravelManager(get<_i51.TravelRepository>()));
  gh.factory<_i127.TravelService>(
      () => _i127.TravelService(get<_i126.TravelManager>()));
  gh.factory<_i128.TravelStateManager>(
      () => _i128.TravelStateManager(get<_i127.TravelService>()));
  gh.factory<_i129.UnitManager>(
      () => _i129.UnitManager(get<_i52.UnitRepository>()));
  gh.factory<_i130.UnitService>(
      () => _i130.UnitService(get<_i129.UnitManager>()));
  gh.factory<_i131.UnitStateManager>(
      () => _i131.UnitStateManager(get<_i130.UnitService>()));
  gh.factory<_i132.UnitsScreen>(
      () => _i132.UnitsScreen(get<_i131.UnitStateManager>()));
  gh.factory<_i133.WaitingShipmentManager>(() =>
      _i133.WaitingShipmentManager(get<_i53.WaitingShipmentRepository>()));
  gh.factory<_i134.WaitingShipmentService>(
      () => _i134.WaitingShipmentService(get<_i133.WaitingShipmentManager>()));
  gh.factory<_i135.WaitingShipmentsDetailsStateManager>(() =>
      _i135.WaitingShipmentsDetailsStateManager(
          get<_i134.WaitingShipmentService>()));
  gh.factory<_i136.WaitingShipmentsStateManager>(() =>
      _i136.WaitingShipmentsStateManager(get<_i134.WaitingShipmentService>()));
  gh.factory<_i137.WantingShipmentDetailsScreen>(() =>
      _i137.WantingShipmentDetailsScreen(
          get<_i135.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i138.WarehouseManager>(
      () => _i138.WarehouseManager(get<_i54.WarehousesRepository>()));
  gh.factory<_i139.WarehouseService>(
      () => _i139.WarehouseService(get<_i138.WarehouseManager>()));
  gh.factory<_i140.WarehouseStateManager>(
      () => _i140.WarehouseStateManager(get<_i139.WarehouseService>()));
  gh.factory<_i141.AcceptedShipmentManager>(() =>
      _i141.AcceptedShipmentManager(get<_i55.AcceptedShipmentRepository>()));
  gh.factory<_i142.AcceptedShipmentService>(() =>
      _i142.AcceptedShipmentService(get<_i141.AcceptedShipmentManager>()));
  gh.factory<_i143.AcceptedShipmentsDetailsStateManager>(() =>
      _i143.AcceptedShipmentsDetailsStateManager(
          get<_i142.AcceptedShipmentService>(), get<_i65.ContainerService>()));
  gh.factory<_i144.AcceptedShipmentsFinanceStateManager>(() =>
      _i144.AcceptedShipmentsFinanceStateManager(
          get<_i142.AcceptedShipmentService>()));
  gh.factory<_i145.AcceptedShipmentsStateManager>(() =>
      _i145.AcceptedShipmentsStateManager(
          get<_i142.AcceptedShipmentService>()));
  gh.factory<_i146.AcceptedShipmentsStatusStateManager>(() =>
      _i146.AcceptedShipmentsStatusStateManager(
          get<_i142.AcceptedShipmentService>(),
          get<_i117.SubcontractService>(),
          get<_i65.ContainerService>(),
          get<_i127.TravelService>()));
  gh.factory<_i147.AddClientStateManager>(
      () => _i147.AddClientStateManager(get<_i62.ClientService>()));
  gh.factory<_i148.AddContainerSpecificationStateManager>(() =>
      _i148.AddContainerSpecificationStateManager(
          get<_i67.ContainerSpecificationService>()));
  gh.factory<_i149.AddContainerStateManager>(() =>
      _i149.AddContainerStateManager(
          get<_i65.ContainerService>(),
          get<_i117.SubcontractService>(),
          get<_i67.ContainerSpecificationService>()));
  gh.factory<_i150.AddCountryStateManager>(
      () => _i150.AddCountryStateManager(get<_i72.CountryService>()));
  gh.factory<_i151.AddDistributorStateManager>(
      () => _i151.AddDistributorStateManager(get<_i75.DistributorService>()));
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
      () => _i157.AddProductStateManager(get<_i96.ProductService>()));
  gh.factory<_i158.AddProxyStateManager>(
      () => _i158.AddProxyStateManager(get<_i102.ProxyService>()));
  gh.factory<_i159.AddSubContractServiceStateManager>(() =>
      _i159.AddSubContractServiceStateManager(
          get<_i111.SubContractServiceService>()));
  gh.factory<_i160.AddSubProductStateManager>(() =>
      _i160.AddSubProductStateManager(
          get<_i114.SubProductService>(), get<_i96.ProductService>()));
  gh.factory<_i161.AddSubcontractStateManager>(() =>
      _i161.AddSubcontractStateManager(get<_i111.SubContractServiceService>(),
          get<_i117.SubcontractService>()));
  gh.factory<_i162.AddSupplierStateManager>(
      () => _i162.AddSupplierStateManager(get<_i120.SupplierService>()));
  gh.factory<_i163.AddTravelStateManager>(() => _i163.AddTravelStateManager(
      get<_i127.TravelService>(),
      get<_i72.CountryService>(),
      get<_i117.SubcontractService>()));
  gh.factory<_i164.AddUnitStateManager>(
      () => _i164.AddUnitStateManager(get<_i130.UnitService>()));
  gh.factory<_i165.AddWarehouseStateManager>(() =>
      _i165.AddWarehouseStateManager(
          get<_i139.WarehouseService>(),
          get<_i117.SubcontractService>(),
          get<_i102.ProxyService>(),
          get<_i72.CountryService>()));
  gh.factory<_i166.AirwaybillManager>(
      () => _i166.AirwaybillManager(get<_i56.AirwaybillRepository>()));
  gh.factory<_i167.AirwaybillService>(
      () => _i167.AirwaybillService(get<_i166.AirwaybillManager>()));
  gh.factory<_i168.AirwaybillSpecificationManager>(() =>
      _i168.AirwaybillSpecificationManager(
          get<_i57.AirwaybillSpecificationRepository>()));
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
      () => _i173.AuthorizationModule(get<_i88.LoginScreen>()));
  gh.factory<_i174.ChatPageBloc>(
      () => _i174.ChatPageBloc(get<_i60.ChatService>()));
  gh.factory<_i175.ClientsScreen>(
      () => _i175.ClientsScreen(get<_i63.ClientsStateManager>()));
  gh.factory<_i176.ContainerDetailsStateManager>(() =>
      _i176.ContainerDetailsStateManager(
          get<_i65.ContainerService>(), get<_i127.TravelService>()));
  gh.factory<_i177.ContainerFinanceStateManager>(
      () => _i177.ContainerFinanceStateManager(get<_i65.ContainerService>()));
  gh.factory<_i178.ContainerScreen>(
      () => _i178.ContainerScreen(get<_i70.ContainerStateManager>()));
  gh.factory<_i179.ContainerSpecificationModule>(() =>
      _i179.ContainerSpecificationModule(
          get<_i69.ContainerSpecificationsScreen>(),
          get<_i154.AddNewContainerSpecification>()));
  gh.factory<_i180.CountriesScreen>(
      () => _i180.CountriesScreen(get<_i73.CountryStateManager>()));
  gh.factory<_i181.CountryModule>(() => _i181.CountryModule(
      get<_i180.CountriesScreen>(), get<_i155.AddNewCountry>()));
  gh.factory<_i182.DistributorsModule>(() => _i182.DistributorsModule(
      get<_i77.DistributorsScreen>(), get<_i156.AddNewDistributor>()));
  gh.factory<_i183.EditShipmentModule>(
      () => _i183.EditShipmentModule(get<_i81.EditedShipmentScreen>()));
  gh.factory<_i184.FilterAirwaybillStateManager>(() =>
      _i184.FilterAirwaybillStateManager(get<_i117.SubcontractService>()));
  gh.factory<_i185.FilterContainerStateManager>(
      () => _i185.FilterContainerStateManager(get<_i117.SubcontractService>()));
  gh.factory<_i186.FilterTravelStateManager>(() =>
      _i186.FilterTravelStateManager(get<_i127.TravelService>(),
          get<_i72.CountryService>(), get<_i117.SubcontractService>()));
  gh.factory<_i187.HomeScreen>(
      () => _i187.HomeScreen(get<_i87.HomeStateManager>()));
  gh.factory<_i188.MarkScreen>(
      () => _i188.MarkScreen(get<_i91.MarkStateManager>()));
  gh.factory<_i189.MyShipmentScreen>(
      () => _i189.MyShipmentScreen(get<_i94.MyShipmentStateManger>()));
  gh.factory<_i190.NewShipment>(
      () => _i190.NewShipment(get<_i106.RequestShipmentStateManger>()));
  gh.factory<_i191.ProductScreen>(
      () => _i191.ProductScreen(get<_i97.ProductStateManager>()));
  gh.factory<_i192.ProfileScreen>(
      () => _i192.ProfileScreen(get<_i100.ProfileStateManager>()));
  gh.factory<_i193.ProxiesScreen>(
      () => _i193.ProxiesScreen(get<_i103.ProxyStateManager>()));
  gh.factory<_i194.RequestShipmentReview>(() =>
      _i194.RequestShipmentReview(get<_i107.ReviewShipmentStateManger>()));
  gh.factory<_i195.SettingsModule>(
      () => _i195.SettingsModule(get<_i108.SettingsScreen>()));
  gh.factory<_i196.SubContractServiceScreen>(() =>
      _i196.SubContractServiceScreen(
          get<_i112.SubContractServiceStateManager>()));
  gh.factory<_i197.SubProductScreen>(
      () => _i197.SubProductScreen(get<_i115.SubProductStateManager>()));
  gh.factory<_i198.SubcontractScreen>(
      () => _i198.SubcontractScreen(get<_i118.SubcontractStateManager>()));
  gh.factory<_i199.TrackingScreen>(
      () => _i199.TrackingScreen(get<_i125.TrackingStateManager>()));
  gh.factory<_i200.TravelDetailsStateManager>(
      () => _i200.TravelDetailsStateManager(get<_i127.TravelService>()));
  gh.factory<_i201.TravelFilterScreen>(
      () => _i201.TravelFilterScreen(get<_i186.FilterTravelStateManager>()));
  gh.factory<_i202.TravelFinanceStateManager>(
      () => _i202.TravelFinanceStateManager(get<_i127.TravelService>()));
  gh.factory<_i203.TravelScreen>(
      () => _i203.TravelScreen(get<_i128.TravelStateManager>()));
  gh.factory<_i204.WaitingShipmentScreen>(() =>
      _i204.WaitingShipmentScreen(get<_i136.WaitingShipmentsStateManager>()));
  gh.factory<_i205.WarehouseFinanceStateManager>(
      () => _i205.WarehouseFinanceStateManager(get<_i139.WarehouseService>()));
  gh.factory<_i206.WarehouseScreen>(
      () => _i206.WarehouseScreen(get<_i140.WarehouseStateManager>()));
  gh.factory<_i207.AcceptedShipmentDetailsScreen>(() =>
      _i207.AcceptedShipmentDetailsScreen(
          get<_i143.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i208.AcceptedShipmentFinanceScreen>(() =>
      _i208.AcceptedShipmentFinanceScreen(
          get<_i144.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i209.AcceptedShipmentScreen>(() =>
      _i209.AcceptedShipmentScreen(get<_i145.AcceptedShipmentsStateManager>()));
  gh.factory<_i210.AcceptedShipmentStatusScreen>(() =>
      _i210.AcceptedShipmentStatusScreen(
          get<_i146.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i211.AddAirwaybillSpecificationStateManager>(() =>
      _i211.AddAirwaybillSpecificationStateManager(
          get<_i169.AirwaybillSpecificationService>()));
  gh.factory<_i212.AddAirwaybillStateManager>(() =>
      _i212.AddAirwaybillStateManager(
          get<_i167.AirwaybillService>(),
          get<_i117.SubcontractService>(),
          get<_i169.AirwaybillSpecificationService>()));
  gh.factory<_i213.AddNewAirwaybill>(
      () => _i213.AddNewAirwaybill(get<_i212.AddAirwaybillStateManager>()));
  gh.factory<_i214.AddNewAirwaybillSpecification>(() =>
      _i214.AddNewAirwaybillSpecification(
          get<_i211.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i215.AddNewProduct>(
      () => _i215.AddNewProduct(get<_i157.AddProductStateManager>()));
  gh.factory<_i216.AddNewProxy>(
      () => _i216.AddNewProxy(get<_i158.AddProxyStateManager>()));
  gh.factory<_i217.AddNewSubContractService>(() =>
      _i217.AddNewSubContractService(
          get<_i159.AddSubContractServiceStateManager>()));
  gh.factory<_i218.AddNewSubProduct>(
      () => _i218.AddNewSubProduct(get<_i160.AddSubProductStateManager>()));
  gh.factory<_i219.AddNewSubcontract>(
      () => _i219.AddNewSubcontract(get<_i161.AddSubcontractStateManager>()));
  gh.factory<_i220.AddNewSupplier>(
      () => _i220.AddNewSupplier(get<_i162.AddSupplierStateManager>()));
  gh.factory<_i221.AddNewTravel>(
      () => _i221.AddNewTravel(get<_i163.AddTravelStateManager>()));
  gh.factory<_i222.AddNewUnit>(
      () => _i222.AddNewUnit(get<_i164.AddUnitStateManager>()));
  gh.factory<_i223.AddNewWarehouse>(
      () => _i223.AddNewWarehouse(get<_i165.AddWarehouseStateManager>()));
  gh.factory<_i224.AirwaybillDetailsStateManager>(() =>
      _i224.AirwaybillDetailsStateManager(
          get<_i167.AirwaybillService>(), get<_i127.TravelService>()));
  gh.factory<_i225.AirwaybillFilterScreen>(() =>
      _i225.AirwaybillFilterScreen(get<_i184.FilterAirwaybillStateManager>()));
  gh.factory<_i226.AirwaybillFinanceStateManager>(() =>
      _i226.AirwaybillFinanceStateManager(get<_i167.AirwaybillService>()));
  gh.factory<_i227.AirwaybillScreen>(
      () => _i227.AirwaybillScreen(get<_i172.AirwaybillStateManager>()));
  gh.factory<_i228.AirwaybillSpecificationModule>(() =>
      _i228.AirwaybillSpecificationModule(
          get<_i171.AirwaybillSpecificationsScreen>(),
          get<_i214.AddNewAirwaybillSpecification>()));
  gh.factory<_i229.ClientModule>(() => _i229.ClientModule(
      get<_i175.ClientsScreen>(), get<_i152.AddNewClient>()));
  gh.factory<_i230.ContainerDetailsScreen>(() =>
      _i230.ContainerDetailsScreen(get<_i176.ContainerDetailsStateManager>()));
  gh.factory<_i231.ContainerFilterScreen>(() =>
      _i231.ContainerFilterScreen(get<_i185.FilterContainerStateManager>()));
  gh.factory<_i232.ContainerFinanceScreen>(() =>
      _i232.ContainerFinanceScreen(get<_i177.ContainerFinanceStateManager>()));
  gh.factory<_i233.ContainerModule>(() => _i233.ContainerModule(
      get<_i178.ContainerScreen>(),
      get<_i153.AddNewContainer>(),
      get<_i231.ContainerFilterScreen>(),
      get<_i230.ContainerDetailsScreen>(),
      get<_i7.ContainerShipmentReview>(),
      get<_i232.ContainerFinanceScreen>()));
  gh.factory<_i234.HomeModule>(() => _i234.HomeModule(get<_i187.HomeScreen>()));
  gh.factory<_i235.MarkModule>(() => _i235.MarkModule(get<_i188.MarkScreen>()));
  gh.factory<_i236.MyShipmentModule>(() => _i236.MyShipmentModule(
      get<_i189.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i237.NewShipmentsModule>(() => _i237.NewShipmentsModule(
      get<_i190.NewShipment>(), get<_i194.RequestShipmentReview>()));
  gh.factory<_i238.ProductModule>(() => _i238.ProductModule(
      get<_i191.ProductScreen>(), get<_i215.AddNewProduct>()));
  gh.factory<_i239.ProfileModule>(
      () => _i239.ProfileModule(get<_i192.ProfileScreen>()));
  gh.factory<_i240.ProxiesModule>(() => _i240.ProxiesModule(
      get<_i193.ProxiesScreen>(), get<_i216.AddNewProxy>()));
  gh.factory<_i241.SubContractServiceModule>(() =>
      _i241.SubContractServiceModule(get<_i196.SubContractServiceScreen>(),
          get<_i217.AddNewSubContractService>()));
  gh.factory<_i242.SubProductModule>(() => _i242.SubProductModule(
      get<_i197.SubProductScreen>(), get<_i218.AddNewSubProduct>()));
  gh.factory<_i243.SubcontractModule>(() => _i243.SubcontractModule(
      get<_i198.SubcontractScreen>(), get<_i219.AddNewSubcontract>()));
  gh.factory<_i244.SupplierModule>(() => _i244.SupplierModule(
      get<_i122.SuppliersScreen>(), get<_i220.AddNewSupplier>()));
  gh.factory<_i245.TrackingModule>(
      () => _i245.TrackingModule(get<_i199.TrackingScreen>()));
  gh.factory<_i246.TravelDetailsScreen>(
      () => _i246.TravelDetailsScreen(get<_i200.TravelDetailsStateManager>()));
  gh.factory<_i247.TravelFinanceScreen>(
      () => _i247.TravelFinanceScreen(get<_i202.TravelFinanceStateManager>()));
  gh.factory<_i248.TravelModule>(() => _i248.TravelModule(
      get<_i203.TravelScreen>(),
      get<_i221.AddNewTravel>(),
      get<_i201.TravelFilterScreen>(),
      get<_i246.TravelDetailsScreen>(),
      get<_i247.TravelFinanceScreen>()));
  gh.factory<_i249.UnitModule>(() =>
      _i249.UnitModule(get<_i132.UnitsScreen>(), get<_i222.AddNewUnit>()));
  gh.factory<_i250.WaitingShipmentModule>(() => _i250.WaitingShipmentModule(
      get<_i204.WaitingShipmentScreen>(),
      get<_i137.WantingShipmentDetailsScreen>()));
  gh.factory<_i251.WarehouseFinanceScreen>(() =>
      _i251.WarehouseFinanceScreen(get<_i205.WarehouseFinanceStateManager>()));
  gh.factory<_i252.WarehouseModule>(() => _i252.WarehouseModule(
      get<_i206.WarehouseScreen>(),
      get<_i223.AddNewWarehouse>(),
      get<_i251.WarehouseFinanceScreen>()));
  gh.factory<_i253.AcceptedShipmentModule>(() => _i253.AcceptedShipmentModule(
      get<_i209.AcceptedShipmentScreen>(),
      get<_i207.AcceptedShipmentDetailsScreen>(),
      get<_i3.AcceptedShipmentFilterScreen>(),
      get<_i210.AcceptedShipmentStatusScreen>(),
      get<_i208.AcceptedShipmentFinanceScreen>()));
  gh.factory<_i254.AirwaybillDetailsScreen>(() => _i254.AirwaybillDetailsScreen(
      get<_i224.AirwaybillDetailsStateManager>()));
  gh.factory<_i255.AirwaybillFinanceScreen>(() => _i255.AirwaybillFinanceScreen(
      get<_i226.AirwaybillFinanceStateManager>()));
  gh.factory<_i256.AirwaybillModule>(() => _i256.AirwaybillModule(
      get<_i227.AirwaybillScreen>(),
      get<_i213.AddNewAirwaybill>(),
      get<_i225.AirwaybillFilterScreen>(),
      get<_i254.AirwaybillDetailsScreen>(),
      get<_i4.AirwaybillShipmentReview>(),
      get<_i255.AirwaybillFinanceScreen>()));
  gh.factory<_i257.MyApp>(() => _i257.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i10.LocalizationService>(),
      get<_i82.FireNotificationService>(),
      get<_i109.SplashModule>(),
      get<_i173.AuthorizationModule>(),
      get<_i59.ChatModule>(),
      get<_i195.SettingsModule>(),
      get<_i234.HomeModule>(),
      get<_i239.ProfileModule>(),
      get<_i235.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i237.NewShipmentsModule>(),
      get<_i245.TrackingModule>(),
      get<_i183.EditShipmentModule>(),
      get<_i181.CountryModule>(),
      get<_i182.DistributorsModule>(),
      get<_i240.ProxiesModule>(),
      get<_i244.SupplierModule>(),
      get<_i241.SubContractServiceModule>(),
      get<_i243.SubcontractModule>(),
      get<_i249.UnitModule>(),
      get<_i248.TravelModule>(),
      get<_i233.ContainerModule>(),
      get<_i256.AirwaybillModule>(),
      get<_i179.ContainerSpecificationModule>(),
      get<_i228.AirwaybillSpecificationModule>(),
      get<_i250.WaitingShipmentModule>(),
      get<_i253.AcceptedShipmentModule>(),
      get<_i229.ClientModule>(),
      get<_i238.ProductModule>(),
      get<_i242.SubProductModule>(),
      get<_i252.WarehouseModule>()));
  return get;
}
