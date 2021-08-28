// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i277;
import '../module_airwaybill/airwaybill_module.dart' as _i276;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i178;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i57;
import '../module_airwaybill/service/airwaybill_service.dart' as _i179;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i244;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i184;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i242;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i197;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i230;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i274;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i243;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i275;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i231;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i245;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i246;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i180;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i58;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i181;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i182;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i229;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i232;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i183;
import '../module_auth/authoriazation_module.dart' as _i185;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i23;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i20;
import '../module_auth/service/auth_service/auth_service.dart' as _i24;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i37;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i94;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i186;
import '../module_chat/chat_module.dart' as _i60;
import '../module_chat/manager/chat/chat_manager.dart' as _i59;
import '../module_chat/repository/chat/chat_repository.dart' as _i25;
import '../module_chat/service/chat/char_service.dart' as _i61;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i26;
import '../module_client/client_module.dart' as _i247;
import '../module_client/manager/client_manager.dart' as _i62;
import '../module_client/repository/client_repository.dart' as _i27;
import '../module_client/service/client_service.dart' as _i63;
import '../module_client/state_manager/client_state_manager.dart' as _i64;
import '../module_client/state_manager/new_client_state_manger.dart' as _i157;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i163;
import '../module_client/ui/screen/client_screen.dart' as _i187;
import '../module_container/container_module.dart' as _i251;
import '../module_container/manager/container_manager.dart' as _i65;
import '../module_container/repository/container_repository.dart' as _i28;
import '../module_container/service/container_service.dart' as _i66;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i189;
import '../module_container/state_manger/container_state_manager.dart' as _i71;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i188;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i198;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i159;
import '../module_container/ui/screen/container_details_screen.dart' as _i248;
import '../module_container/ui/screen/container_filter_screen.dart' as _i249;
import '../module_container/ui/screen/container_finance_screen.dart' as _i250;
import '../module_container/ui/screen/container_new_screen.dart' as _i164;
import '../module_container/ui/screen/container_screen.dart' as _i190;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container_specification/container_specification_module.dart'
    as _i191;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i67;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i29;
import '../module_container_specification/service/container_specification_service.dart'
    as _i68;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i69;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i158;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i165;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i70;
import '../module_countries/country_module.dart' as _i193;
import '../module_countries/manager/country_manager.dart' as _i72;
import '../module_countries/repository/country_repository.dart' as _i30;
import '../module_countries/service/country_service.dart' as _i73;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i74;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i160;
import '../module_countries/ui/screen/countries_screen.dart' as _i192;
import '../module_countries/ui/screen/country_new_screen.dart' as _i166;
import '../module_distributors/distributors_module.dart' as _i194;
import '../module_distributors/manager/distributors_manager.dart' as _i75;
import '../module_distributors/repository/distributors_repository.dart' as _i31;
import '../module_distributors/service/distributors_service.dart' as _i76;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i77;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i161;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i167;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i78;
import '../module_edit_shipment/edit_shipment_module.dart' as _i195;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i79;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i32;
import '../module_edit_shipment/service/editshipment_service.dart' as _i80;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i81;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i82;
import '../module_employees/employe_module.dart' as _i196;
import '../module_employees/manager/employees_manager.dart' as _i83;
import '../module_employees/repository/employees_repository.dart' as _i33;
import '../module_employees/service/employees_service.dart' as _i84;
import '../module_employees/state_manger/employees_state_manager.dart' as _i85;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i162;
import '../module_employees/ui/screen/employees_screen.dart' as _i86;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i168;
import '../module_home/home_module.dart' as _i252;
import '../module_home/manager/home_manager.dart' as _i91;
import '../module_home/repository/home_repository.dart' as _i35;
import '../module_home/service/home_service.dart' as _i92;
import '../module_home/state_manager/state_manager_home.dart' as _i93;
import '../module_home/ui/screen/home_screen.dart' as _i200;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i95;
import '../module_mark/mark_module.dart' as _i253;
import '../module_mark/repository/mark_repository.dart' as _i38;
import '../module_mark/service/mark_service.dart' as _i96;
import '../module_mark/state_manager/mark_state_manager.dart' as _i97;
import '../module_mark/ui/mark_screen.dart' as _i201;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i98;
import '../module_my_shipment/my_shipment_module.dart' as _i254;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i39;
import '../module_my_shipment/service/my_shipment_service.dart' as _i99;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i100;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i15;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i202;
import '../module_network/http_client/http_client.dart' as _i18;
import '../module_notifications/notification_module.dart' as _i21;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i12;
import '../module_notifications/repository/notification_repo.dart' as _i40;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i88;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i11;
import '../module_product_category/manager/product_category_manager.dart'
    as _i101;
import '../module_product_category/product_module.dart' as _i256;
import '../module_product_category/repository/product_category_repository.dart'
    as _i41;
import '../module_product_category/service/product_service.dart' as _i102;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i169;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i103;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i233;
import '../module_product_category/ui/screen/products_screen.dart' as _i204;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i122;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i48;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i123;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i172;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i124;
import '../module_product_sub_category/sub_product_module.dart' as _i261;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i236;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i218;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i211;
import '../module_profile/manager/profile_manager.dart' as _i104;
import '../module_profile/profile_module.dart' as _i257;
import '../module_profile/repository/profile_repository.dart' as _i42;
import '../module_profile/service/profile_service.dart' as _i105;
import '../module_profile/state_manager/profile_state_manager.dart' as _i106;
import '../module_profile/ui/profile_screen.dart' as _i205;
import '../module_proxies/manager/proxies_manager.dart' as _i107;
import '../module_proxies/proxies_module.dart' as _i258;
import '../module_proxies/repository/proxies_repository.dart' as _i43;
import '../module_proxies/service/proixes_service.dart' as _i108;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i170;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i109;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i206;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i234;
import '../module_receiver/manager/receiver_manager.dart' as _i110;
import '../module_receiver/recevier_module.dart' as _i259;
import '../module_receiver/repository/recevier_repository.dart' as _i44;
import '../module_receiver/service/receiver_service.dart' as _i111;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i112;
import '../module_receiver/ui/receiver_screen.dart' as _i207;
import '../module_report/manager/report_manager.dart' as _i113;
import '../module_report/presistance/report_prefs_helper.dart' as _i14;
import '../module_report/repository/report_repository.dart' as _i45;
import '../module_report/service/report_service.dart' as _i114;
import '../module_settings/settings_module.dart' as _i209;
import '../module_settings/ui/settings_page/settings_page.dart' as _i117;
import '../module_shipment_previous/shipment_previous_module.dart' as _i13;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i89;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i34;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i90;
import '../module_shipment_request/shipment_request_module.dart' as _i255;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i115;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i116;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i203;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i208;
import '../module_shipment_track/manager/tracking_manager.dart' as _i132;
import '../module_shipment_track/repository/tracking_repository.dart' as _i51;
import '../module_shipment_track/service/tracking_service.dart' as _i133;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i134;
import '../module_shipment_track/tracking_module.dart' as _i264;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i213;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i273;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i151;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i56;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i152;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i153;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i154;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i155;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i156;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i87;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i221;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i225;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i226;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i227;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i228;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i150;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i269;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i142;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i54;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i143;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i144;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i145;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i146;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i222;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i270;
import '../module_splash/splash_module.dart' as _i118;
import '../module_splash/ui/screen/splash_screen.dart' as _i46;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i125;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i49;
import '../module_sub_contract/service/subcontract_service.dart' as _i126;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i173;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i127;
import '../module_sub_contract/subcontract_module.dart' as _i262;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i237;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i212;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i119;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i47;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i120;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i171;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i121;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i260;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i235;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i210;
import '../module_suppliers/manager/suppliers_manager.dart' as _i128;
import '../module_suppliers/repository/suppliers_repository.dart' as _i50;
import '../module_suppliers/service/suppliers_service.dart' as _i129;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i174;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i130;
import '../module_suppliers/supplier_module.dart' as _i263;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i238;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i131;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i16;
import '../module_theme/service/theme_service/theme_service.dart' as _i19;
import '../module_travel/manager/travel_manager.dart' as _i135;
import '../module_travel/repository/travel_repository.dart' as _i52;
import '../module_travel/service/travel_service.dart' as _i136;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i214;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i199;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i175;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i216;
import '../module_travel/state_manger/travels_state_manager.dart' as _i137;
import '../module_travel/travel_module.dart' as _i267;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i265;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i215;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i266;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i239;
import '../module_travel/ui/screen/travel_screen.dart' as _i217;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i219;
import '../module_unit/manager/unit_manager.dart' as _i138;
import '../module_unit/repository/unit_repository.dart' as _i53;
import '../module_unit/service/unit_service.dart' as _i139;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i176;
import '../module_unit/state_manger/units_state_manager.dart' as _i140;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i240;
import '../module_unit/ui/screen/units_screen.dart' as _i141;
import '../module_unit/unit_module.dart' as _i268;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i22;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i17;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i36;
import '../module_warehouses/manager/warehouses_manager.dart' as _i147;
import '../module_warehouses/repository/warehouse_repository.dart' as _i55;
import '../module_warehouses/service/warehouse_service.dart' as _i148;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i177;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i223;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i149;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i271;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i241;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i224;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i220;
import '../module_warehouses/warehouse_module.dart' as _i272;
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
  gh.factory<_i33.EmployeeRepository>(() =>
      _i33.EmployeeRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
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
  gh.factory<_i44.ReceiverRepository>(() =>
      _i44.ReceiverRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i45.ReportRepository>(() => _i45.ReportRepository(
      get<_i18.ApiClient>(),
      get<_i24.AuthService>(),
      get<_i14.ReportPrefsHelper>()));
  gh.factory<_i46.SplashScreen>(
      () => _i46.SplashScreen(get<_i24.AuthService>()));
  gh.factory<_i47.SubContractServiceRepository>(() =>
      _i47.SubContractServiceRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i48.SubProductRepository>(() => _i48.SubProductRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i49.SubcontractRepository>(() => _i49.SubcontractRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i50.SupplierRepository>(() =>
      _i50.SupplierRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i51.TrackingRepository>(() =>
      _i51.TrackingRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i52.TravelRepository>(() =>
      _i52.TravelRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i53.UnitRepository>(() =>
      _i53.UnitRepository(get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i54.WaitingShipmentRepository>(() =>
      _i54.WaitingShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i55.WarehousesRepository>(() => _i55.WarehousesRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i56.AcceptedShipmentRepository>(() =>
      _i56.AcceptedShipmentRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i57.AirwaybillRepository>(() => _i57.AirwaybillRepository(
      get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i58.AirwaybillSpecificationRepository>(() =>
      _i58.AirwaybillSpecificationRepository(
          get<_i18.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i59.ChatManager>(
      () => _i59.ChatManager(get<_i25.ChatRepository>()));
  gh.factory<_i60.ChatModule>(() => _i60.ChatModule(get<_i26.ChatsListScreen>(),
      get<_i24.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i61.ChatService>(() => _i61.ChatService(get<_i59.ChatManager>()));
  gh.factory<_i62.ClientManager>(
      () => _i62.ClientManager(get<_i27.ClientRepository>()));
  gh.factory<_i63.ClientService>(
      () => _i63.ClientService(get<_i62.ClientManager>()));
  gh.factory<_i64.ClientsStateManager>(
      () => _i64.ClientsStateManager(get<_i63.ClientService>()));
  gh.factory<_i65.ContainerManager>(
      () => _i65.ContainerManager(get<_i28.ContainerRepository>()));
  gh.factory<_i66.ContainerService>(
      () => _i66.ContainerService(get<_i65.ContainerManager>()));
  gh.factory<_i67.ContainerSpecificationManager>(() =>
      _i67.ContainerSpecificationManager(
          get<_i29.ContainerSpecificationRepository>()));
  gh.factory<_i68.ContainerSpecificationService>(() =>
      _i68.ContainerSpecificationService(
          get<_i67.ContainerSpecificationManager>()));
  gh.factory<_i69.ContainerSpecificationStateManager>(() =>
      _i69.ContainerSpecificationStateManager(
          get<_i68.ContainerSpecificationService>()));
  gh.factory<_i70.ContainerSpecificationsScreen>(() =>
      _i70.ContainerSpecificationsScreen(
          get<_i69.ContainerSpecificationStateManager>()));
  gh.factory<_i71.ContainerStateManager>(
      () => _i71.ContainerStateManager(get<_i66.ContainerService>()));
  gh.factory<_i72.CountryManager>(
      () => _i72.CountryManager(get<_i30.CountryRepository>()));
  gh.factory<_i73.CountryService>(
      () => _i73.CountryService(get<_i72.CountryManager>()));
  gh.factory<_i74.CountryStateManager>(
      () => _i74.CountryStateManager(get<_i73.CountryService>()));
  gh.factory<_i75.DistributorManager>(
      () => _i75.DistributorManager(get<_i31.DistributorRepository>()));
  gh.factory<_i76.DistributorService>(
      () => _i76.DistributorService(get<_i75.DistributorManager>()));
  gh.factory<_i77.DistributorStateManager>(
      () => _i77.DistributorStateManager(get<_i76.DistributorService>()));
  gh.factory<_i78.DistributorsScreen>(
      () => _i78.DistributorsScreen(get<_i77.DistributorStateManager>()));
  gh.factory<_i79.EditShipmentManager>(
      () => _i79.EditShipmentManager(get<_i32.EditShipmentRepository>()));
  gh.factory<_i80.EditShipmentService>(
      () => _i80.EditShipmentService(get<_i79.EditShipmentManager>()));
  gh.factory<_i81.EditShipmentStateManager>(() => _i81.EditShipmentStateManager(
      get<_i80.EditShipmentService>(), get<_i36.ImageUploadService>()));
  gh.factory<_i82.EditedShipmentScreen>(
      () => _i82.EditedShipmentScreen(get<_i81.EditShipmentStateManager>()));
  gh.factory<_i83.EmployeeManager>(
      () => _i83.EmployeeManager(get<_i33.EmployeeRepository>()));
  gh.factory<_i84.EmployeeService>(
      () => _i84.EmployeeService(get<_i83.EmployeeManager>()));
  gh.factory<_i85.EmployeeStateManager>(
      () => _i85.EmployeeStateManager(get<_i84.EmployeeService>()));
  gh.factory<_i86.EmployeesScreen>(
      () => _i86.EmployeesScreen(get<_i85.EmployeeStateManager>()));
  gh.factory<_i87.FilterAcceptedShipmentStateManager>(() =>
      _i87.FilterAcceptedShipmentStateManager(get<_i73.CountryService>()));
  gh.factory<_i88.FireNotificationService>(() => _i88.FireNotificationService(
      get<_i12.NotificationsPrefsHelper>(), get<_i40.NotificationRepo>()));
  gh.factory<_i89.FirstOptionManager>(
      () => _i89.FirstOptionManager(get<_i34.FirstOptionRepository>()));
  gh.factory<_i90.FirstOptionService>(
      () => _i90.FirstOptionService(get<_i89.FirstOptionManager>()));
  gh.factory<_i91.HomeManager>(
      () => _i91.HomeManager(get<_i35.HomeRepository>()));
  gh.factory<_i92.HomeService>(() => _i92.HomeService(get<_i91.HomeManager>()));
  gh.factory<_i93.HomeStateManager>(() => _i93.HomeStateManager(
      get<_i92.HomeService>(), get<_i84.EmployeeService>()));
  gh.factory<_i94.LoginScreen>(
      () => _i94.LoginScreen(get<_i37.LoginStateManager>()));
  gh.factory<_i95.MarkManager>(
      () => _i95.MarkManager(get<_i38.MarkRepository>()));
  gh.factory<_i96.MarkService>(() => _i96.MarkService(get<_i95.MarkManager>()));
  gh.factory<_i97.MarkStateManager>(() => _i97.MarkStateManager(
      get<_i96.MarkService>(), get<_i63.ClientService>()));
  gh.factory<_i98.MyShipmentManager>(
      () => _i98.MyShipmentManager(get<_i39.MyShipmentRepository>()));
  gh.factory<_i99.MyShipmentService>(
      () => _i99.MyShipmentService(get<_i98.MyShipmentManager>()));
  gh.factory<_i100.MyShipmentStateManger>(
      () => _i100.MyShipmentStateManger(get<_i99.MyShipmentService>()));
  gh.factory<_i101.ProductManager>(
      () => _i101.ProductManager(get<_i41.ProductRepository>()));
  gh.factory<_i102.ProductService>(
      () => _i102.ProductService(get<_i101.ProductManager>()));
  gh.factory<_i103.ProductStateManager>(
      () => _i103.ProductStateManager(get<_i102.ProductService>()));
  gh.factory<_i104.ProfileManager>(
      () => _i104.ProfileManager(get<_i42.ProfileRepository>()));
  gh.factory<_i105.ProfileService>(
      () => _i105.ProfileService(get<_i104.ProfileManager>()));
  gh.factory<_i106.ProfileStateManager>(
      () => _i106.ProfileStateManager(get<_i105.ProfileService>()));
  gh.factory<_i107.ProxyManager>(
      () => _i107.ProxyManager(get<_i43.ProxyRepository>()));
  gh.factory<_i108.ProxyService>(
      () => _i108.ProxyService(get<_i107.ProxyManager>()));
  gh.factory<_i109.ProxyStateManager>(
      () => _i109.ProxyStateManager(get<_i108.ProxyService>()));
  gh.factory<_i110.ReceiverManager>(
      () => _i110.ReceiverManager(get<_i44.ReceiverRepository>()));
  gh.factory<_i111.ReceiverService>(
      () => _i111.ReceiverService(get<_i110.ReceiverManager>()));
  gh.factory<_i112.ReceiverStateManager>(() => _i112.ReceiverStateManager(
      get<_i111.ReceiverService>(), get<_i63.ClientService>()));
  gh.factory<_i113.ReportManager>(
      () => _i113.ReportManager(get<_i45.ReportRepository>()));
  gh.factory<_i114.ReportService>(
      () => _i114.ReportService(get<_i113.ReportManager>()));
  gh.factory<_i115.RequestShipmentStateManger>(() =>
      _i115.RequestShipmentStateManger(
          get<_i90.FirstOptionService>(),
          get<_i96.MarkService>(),
          get<_i63.ClientService>(),
          get<_i76.DistributorService>(),
          get<_i111.ReceiverService>()));
  gh.factory<_i116.ReviewShipmentStateManger>(() =>
      _i116.ReviewShipmentStateManger(
          get<_i90.FirstOptionService>(), get<_i36.ImageUploadService>()));
  gh.factory<_i117.SettingsScreen>(() => _i117.SettingsScreen(
      get<_i24.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i19.AppThemeDataService>(),
      get<_i88.FireNotificationService>()));
  gh.factory<_i118.SplashModule>(
      () => _i118.SplashModule(get<_i46.SplashScreen>()));
  gh.factory<_i119.SubContractServiceManager>(() =>
      _i119.SubContractServiceManager(
          get<_i47.SubContractServiceRepository>()));
  gh.factory<_i120.SubContractServiceService>(() =>
      _i120.SubContractServiceService(get<_i119.SubContractServiceManager>()));
  gh.factory<_i121.SubContractServiceStateManager>(() =>
      _i121.SubContractServiceStateManager(
          get<_i120.SubContractServiceService>()));
  gh.factory<_i122.SubProductManager>(
      () => _i122.SubProductManager(get<_i48.SubProductRepository>()));
  gh.factory<_i123.SubProductService>(
      () => _i123.SubProductService(get<_i122.SubProductManager>()));
  gh.factory<_i124.SubProductStateManager>(
      () => _i124.SubProductStateManager(get<_i123.SubProductService>()));
  gh.factory<_i125.SubcontractManager>(
      () => _i125.SubcontractManager(get<_i49.SubcontractRepository>()));
  gh.factory<_i126.SubcontractService>(
      () => _i126.SubcontractService(get<_i125.SubcontractManager>()));
  gh.factory<_i127.SubcontractStateManager>(
      () => _i127.SubcontractStateManager(get<_i126.SubcontractService>()));
  gh.factory<_i128.SupplierManager>(
      () => _i128.SupplierManager(get<_i50.SupplierRepository>()));
  gh.factory<_i129.SupplierService>(
      () => _i129.SupplierService(get<_i128.SupplierManager>()));
  gh.factory<_i130.SupplierStateManager>(
      () => _i130.SupplierStateManager(get<_i129.SupplierService>()));
  gh.factory<_i131.SuppliersScreen>(
      () => _i131.SuppliersScreen(get<_i130.SupplierStateManager>()));
  gh.factory<_i132.TrackingManager>(
      () => _i132.TrackingManager(get<_i51.TrackingRepository>()));
  gh.factory<_i133.TrackingService>(
      () => _i133.TrackingService(get<_i132.TrackingManager>()));
  gh.factory<_i134.TrackingStateManager>(
      () => _i134.TrackingStateManager(get<_i133.TrackingService>()));
  gh.factory<_i135.TravelManager>(
      () => _i135.TravelManager(get<_i52.TravelRepository>()));
  gh.factory<_i136.TravelService>(
      () => _i136.TravelService(get<_i135.TravelManager>()));
  gh.factory<_i137.TravelStateManager>(
      () => _i137.TravelStateManager(get<_i136.TravelService>()));
  gh.factory<_i138.UnitManager>(
      () => _i138.UnitManager(get<_i53.UnitRepository>()));
  gh.factory<_i139.UnitService>(
      () => _i139.UnitService(get<_i138.UnitManager>()));
  gh.factory<_i140.UnitStateManager>(
      () => _i140.UnitStateManager(get<_i139.UnitService>()));
  gh.factory<_i141.UnitsScreen>(
      () => _i141.UnitsScreen(get<_i140.UnitStateManager>()));
  gh.factory<_i142.WaitingShipmentManager>(() =>
      _i142.WaitingShipmentManager(get<_i54.WaitingShipmentRepository>()));
  gh.factory<_i143.WaitingShipmentService>(
      () => _i143.WaitingShipmentService(get<_i142.WaitingShipmentManager>()));
  gh.factory<_i144.WaitingShipmentsDetailsStateManager>(() =>
      _i144.WaitingShipmentsDetailsStateManager(
          get<_i143.WaitingShipmentService>()));
  gh.factory<_i145.WaitingShipmentsStateManager>(() =>
      _i145.WaitingShipmentsStateManager(get<_i143.WaitingShipmentService>()));
  gh.factory<_i146.WantingShipmentDetailsScreen>(() =>
      _i146.WantingShipmentDetailsScreen(
          get<_i144.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i147.WarehouseManager>(
      () => _i147.WarehouseManager(get<_i55.WarehousesRepository>()));
  gh.factory<_i148.WarehouseService>(
      () => _i148.WarehouseService(get<_i147.WarehouseManager>()));
  gh.factory<_i149.WarehouseStateManager>(
      () => _i149.WarehouseStateManager(get<_i148.WarehouseService>()));
  gh.factory<_i150.AcceptedShipmentFilterScreen>(() =>
      _i150.AcceptedShipmentFilterScreen(
          get<_i87.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i151.AcceptedShipmentManager>(() =>
      _i151.AcceptedShipmentManager(get<_i56.AcceptedShipmentRepository>()));
  gh.factory<_i152.AcceptedShipmentService>(() =>
      _i152.AcceptedShipmentService(get<_i151.AcceptedShipmentManager>()));
  gh.factory<_i153.AcceptedShipmentsDetailsStateManager>(() =>
      _i153.AcceptedShipmentsDetailsStateManager(
          get<_i152.AcceptedShipmentService>(), get<_i66.ContainerService>()));
  gh.factory<_i154.AcceptedShipmentsFinanceStateManager>(() =>
      _i154.AcceptedShipmentsFinanceStateManager(
          get<_i152.AcceptedShipmentService>()));
  gh.factory<_i155.AcceptedShipmentsStateManager>(() =>
      _i155.AcceptedShipmentsStateManager(
          get<_i152.AcceptedShipmentService>()));
  gh.factory<_i156.AcceptedShipmentsStatusStateManager>(() =>
      _i156.AcceptedShipmentsStatusStateManager(
          get<_i152.AcceptedShipmentService>(),
          get<_i126.SubcontractService>(),
          get<_i66.ContainerService>(),
          get<_i136.TravelService>(),
          get<_i148.WarehouseService>()));
  gh.factory<_i157.AddClientStateManager>(
      () => _i157.AddClientStateManager(get<_i63.ClientService>()));
  gh.factory<_i158.AddContainerSpecificationStateManager>(() =>
      _i158.AddContainerSpecificationStateManager(
          get<_i68.ContainerSpecificationService>()));
  gh.factory<_i159.AddContainerStateManager>(() =>
      _i159.AddContainerStateManager(
          get<_i66.ContainerService>(),
          get<_i126.SubcontractService>(),
          get<_i68.ContainerSpecificationService>()));
  gh.factory<_i160.AddCountryStateManager>(
      () => _i160.AddCountryStateManager(get<_i73.CountryService>()));
  gh.factory<_i161.AddDistributorStateManager>(
      () => _i161.AddDistributorStateManager(get<_i76.DistributorService>()));
  gh.factory<_i162.AddEmployeeStateManager>(
      () => _i162.AddEmployeeStateManager(get<_i84.EmployeeService>()));
  gh.factory<_i163.AddNewClient>(
      () => _i163.AddNewClient(get<_i157.AddClientStateManager>()));
  gh.factory<_i164.AddNewContainer>(
      () => _i164.AddNewContainer(get<_i159.AddContainerStateManager>()));
  gh.factory<_i165.AddNewContainerSpecification>(() =>
      _i165.AddNewContainerSpecification(
          get<_i158.AddContainerSpecificationStateManager>()));
  gh.factory<_i166.AddNewCountry>(
      () => _i166.AddNewCountry(get<_i160.AddCountryStateManager>()));
  gh.factory<_i167.AddNewDistributor>(
      () => _i167.AddNewDistributor(get<_i161.AddDistributorStateManager>()));
  gh.factory<_i168.AddNewEmployee>(
      () => _i168.AddNewEmployee(get<_i162.AddEmployeeStateManager>()));
  gh.factory<_i169.AddProductStateManager>(
      () => _i169.AddProductStateManager(get<_i102.ProductService>()));
  gh.factory<_i170.AddProxyStateManager>(
      () => _i170.AddProxyStateManager(get<_i108.ProxyService>()));
  gh.factory<_i171.AddSubContractServiceStateManager>(() =>
      _i171.AddSubContractServiceStateManager(
          get<_i120.SubContractServiceService>()));
  gh.factory<_i172.AddSubProductStateManager>(() =>
      _i172.AddSubProductStateManager(
          get<_i123.SubProductService>(), get<_i102.ProductService>()));
  gh.factory<_i173.AddSubcontractStateManager>(() =>
      _i173.AddSubcontractStateManager(get<_i120.SubContractServiceService>(),
          get<_i126.SubcontractService>()));
  gh.factory<_i174.AddSupplierStateManager>(
      () => _i174.AddSupplierStateManager(get<_i129.SupplierService>()));
  gh.factory<_i175.AddTravelStateManager>(() => _i175.AddTravelStateManager(
      get<_i136.TravelService>(),
      get<_i73.CountryService>(),
      get<_i126.SubcontractService>()));
  gh.factory<_i176.AddUnitStateManager>(
      () => _i176.AddUnitStateManager(get<_i139.UnitService>()));
  gh.factory<_i177.AddWarehouseStateManager>(() =>
      _i177.AddWarehouseStateManager(
          get<_i148.WarehouseService>(),
          get<_i126.SubcontractService>(),
          get<_i108.ProxyService>(),
          get<_i73.CountryService>()));
  gh.factory<_i178.AirwaybillManager>(
      () => _i178.AirwaybillManager(get<_i57.AirwaybillRepository>()));
  gh.factory<_i179.AirwaybillService>(
      () => _i179.AirwaybillService(get<_i178.AirwaybillManager>()));
  gh.factory<_i180.AirwaybillSpecificationManager>(() =>
      _i180.AirwaybillSpecificationManager(
          get<_i58.AirwaybillSpecificationRepository>()));
  gh.factory<_i181.AirwaybillSpecificationService>(() =>
      _i181.AirwaybillSpecificationService(
          get<_i180.AirwaybillSpecificationManager>()));
  gh.factory<_i182.AirwaybillSpecificationStateManager>(() =>
      _i182.AirwaybillSpecificationStateManager(
          get<_i181.AirwaybillSpecificationService>()));
  gh.factory<_i183.AirwaybillSpecificationsScreen>(() =>
      _i183.AirwaybillSpecificationsScreen(
          get<_i182.AirwaybillSpecificationStateManager>()));
  gh.factory<_i184.AirwaybillStateManager>(
      () => _i184.AirwaybillStateManager(get<_i179.AirwaybillService>()));
  gh.factory<_i185.AuthorizationModule>(
      () => _i185.AuthorizationModule(get<_i94.LoginScreen>()));
  gh.factory<_i186.ChatPageBloc>(
      () => _i186.ChatPageBloc(get<_i61.ChatService>()));
  gh.factory<_i187.ClientsScreen>(
      () => _i187.ClientsScreen(get<_i64.ClientsStateManager>()));
  gh.factory<_i188.ContainerDetailsStateManager>(() =>
      _i188.ContainerDetailsStateManager(
          get<_i66.ContainerService>(), get<_i136.TravelService>()));
  gh.factory<_i189.ContainerFinanceStateManager>(
      () => _i189.ContainerFinanceStateManager(get<_i66.ContainerService>()));
  gh.factory<_i190.ContainerScreen>(
      () => _i190.ContainerScreen(get<_i71.ContainerStateManager>()));
  gh.factory<_i191.ContainerSpecificationModule>(() =>
      _i191.ContainerSpecificationModule(
          get<_i70.ContainerSpecificationsScreen>(),
          get<_i165.AddNewContainerSpecification>()));
  gh.factory<_i192.CountriesScreen>(
      () => _i192.CountriesScreen(get<_i74.CountryStateManager>()));
  gh.factory<_i193.CountryModule>(() => _i193.CountryModule(
      get<_i192.CountriesScreen>(), get<_i166.AddNewCountry>()));
  gh.factory<_i194.DistributorsModule>(() => _i194.DistributorsModule(
      get<_i78.DistributorsScreen>(), get<_i167.AddNewDistributor>()));
  gh.factory<_i195.EditShipmentModule>(
      () => _i195.EditShipmentModule(get<_i82.EditedShipmentScreen>()));
  gh.factory<_i196.EmployeeModule>(() => _i196.EmployeeModule(
      get<_i86.EmployeesScreen>(), get<_i168.AddNewEmployee>()));
  gh.factory<_i197.FilterAirwaybillStateManager>(() =>
      _i197.FilterAirwaybillStateManager(get<_i126.SubcontractService>()));
  gh.factory<_i198.FilterContainerStateManager>(
      () => _i198.FilterContainerStateManager(get<_i126.SubcontractService>()));
  gh.factory<_i199.FilterTravelStateManager>(() =>
      _i199.FilterTravelStateManager(get<_i136.TravelService>(),
          get<_i73.CountryService>(), get<_i126.SubcontractService>()));
  gh.factory<_i200.HomeScreen>(
      () => _i200.HomeScreen(get<_i93.HomeStateManager>()));
  gh.factory<_i201.MarkScreen>(
      () => _i201.MarkScreen(get<_i97.MarkStateManager>()));
  gh.factory<_i202.MyShipmentScreen>(
      () => _i202.MyShipmentScreen(get<_i100.MyShipmentStateManger>()));
  gh.factory<_i203.NewShipment>(
      () => _i203.NewShipment(get<_i115.RequestShipmentStateManger>()));
  gh.factory<_i204.ProductScreen>(
      () => _i204.ProductScreen(get<_i103.ProductStateManager>()));
  gh.factory<_i205.ProfileScreen>(
      () => _i205.ProfileScreen(get<_i106.ProfileStateManager>()));
  gh.factory<_i206.ProxiesScreen>(
      () => _i206.ProxiesScreen(get<_i109.ProxyStateManager>()));
  gh.factory<_i207.ReceiverScreen>(
      () => _i207.ReceiverScreen(get<_i112.ReceiverStateManager>()));
  gh.factory<_i208.RequestShipmentReview>(() =>
      _i208.RequestShipmentReview(get<_i116.ReviewShipmentStateManger>()));
  gh.factory<_i209.SettingsModule>(
      () => _i209.SettingsModule(get<_i117.SettingsScreen>()));
  gh.factory<_i210.SubContractServiceScreen>(() =>
      _i210.SubContractServiceScreen(
          get<_i121.SubContractServiceStateManager>()));
  gh.factory<_i211.SubProductScreen>(
      () => _i211.SubProductScreen(get<_i124.SubProductStateManager>()));
  gh.factory<_i212.SubcontractScreen>(
      () => _i212.SubcontractScreen(get<_i127.SubcontractStateManager>()));
  gh.factory<_i213.TrackingScreen>(
      () => _i213.TrackingScreen(get<_i134.TrackingStateManager>()));
  gh.factory<_i214.TravelDetailsStateManager>(
      () => _i214.TravelDetailsStateManager(get<_i136.TravelService>()));
  gh.factory<_i215.TravelFilterScreen>(
      () => _i215.TravelFilterScreen(get<_i199.FilterTravelStateManager>()));
  gh.factory<_i216.TravelFinanceStateManager>(
      () => _i216.TravelFinanceStateManager(get<_i136.TravelService>()));
  gh.factory<_i217.TravelScreen>(
      () => _i217.TravelScreen(get<_i137.TravelStateManager>()));
  gh.factory<_i218.UpdateSubProduct>(
      () => _i218.UpdateSubProduct(get<_i172.AddSubProductStateManager>()));
  gh.factory<_i219.UpdateTravel>(
      () => _i219.UpdateTravel(get<_i175.AddTravelStateManager>()));
  gh.factory<_i220.UpdateWarehouse>(
      () => _i220.UpdateWarehouse(get<_i177.AddWarehouseStateManager>()));
  gh.factory<_i221.ViewWarehousesStateManager>(
      () => _i221.ViewWarehousesStateManager(get<_i148.WarehouseService>()));
  gh.factory<_i222.WaitingShipmentScreen>(() =>
      _i222.WaitingShipmentScreen(get<_i145.WaitingShipmentsStateManager>()));
  gh.factory<_i223.WarehouseFinanceStateManager>(
      () => _i223.WarehouseFinanceStateManager(get<_i148.WarehouseService>()));
  gh.factory<_i224.WarehouseScreen>(
      () => _i224.WarehouseScreen(get<_i149.WarehouseStateManager>()));
  gh.factory<_i225.AcceptedShipmentDetailsScreen>(() =>
      _i225.AcceptedShipmentDetailsScreen(
          get<_i153.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i226.AcceptedShipmentFinanceScreen>(() =>
      _i226.AcceptedShipmentFinanceScreen(
          get<_i154.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i227.AcceptedShipmentScreen>(() =>
      _i227.AcceptedShipmentScreen(get<_i155.AcceptedShipmentsStateManager>()));
  gh.factory<_i228.AcceptedShipmentStatusScreen>(() =>
      _i228.AcceptedShipmentStatusScreen(
          get<_i156.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i229.AddAirwaybillSpecificationStateManager>(() =>
      _i229.AddAirwaybillSpecificationStateManager(
          get<_i181.AirwaybillSpecificationService>()));
  gh.factory<_i230.AddAirwaybillStateManager>(() =>
      _i230.AddAirwaybillStateManager(
          get<_i179.AirwaybillService>(),
          get<_i126.SubcontractService>(),
          get<_i181.AirwaybillSpecificationService>()));
  gh.factory<_i231.AddNewAirwaybill>(
      () => _i231.AddNewAirwaybill(get<_i230.AddAirwaybillStateManager>()));
  gh.factory<_i232.AddNewAirwaybillSpecification>(() =>
      _i232.AddNewAirwaybillSpecification(
          get<_i229.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i233.AddNewProduct>(
      () => _i233.AddNewProduct(get<_i169.AddProductStateManager>()));
  gh.factory<_i234.AddNewProxy>(
      () => _i234.AddNewProxy(get<_i170.AddProxyStateManager>()));
  gh.factory<_i235.AddNewSubContractService>(() =>
      _i235.AddNewSubContractService(
          get<_i171.AddSubContractServiceStateManager>()));
  gh.factory<_i236.AddNewSubProduct>(
      () => _i236.AddNewSubProduct(get<_i172.AddSubProductStateManager>()));
  gh.factory<_i237.AddNewSubcontract>(
      () => _i237.AddNewSubcontract(get<_i173.AddSubcontractStateManager>()));
  gh.factory<_i238.AddNewSupplier>(
      () => _i238.AddNewSupplier(get<_i174.AddSupplierStateManager>()));
  gh.factory<_i239.AddNewTravel>(
      () => _i239.AddNewTravel(get<_i175.AddTravelStateManager>()));
  gh.factory<_i240.AddNewUnit>(
      () => _i240.AddNewUnit(get<_i176.AddUnitStateManager>()));
  gh.factory<_i241.AddNewWarehouse>(
      () => _i241.AddNewWarehouse(get<_i177.AddWarehouseStateManager>()));
  gh.factory<_i242.AirwaybillDetailsStateManager>(() =>
      _i242.AirwaybillDetailsStateManager(
          get<_i179.AirwaybillService>(), get<_i136.TravelService>()));
  gh.factory<_i243.AirwaybillFilterScreen>(() =>
      _i243.AirwaybillFilterScreen(get<_i197.FilterAirwaybillStateManager>()));
  gh.factory<_i244.AirwaybillFinanceStateManager>(() =>
      _i244.AirwaybillFinanceStateManager(get<_i179.AirwaybillService>()));
  gh.factory<_i245.AirwaybillScreen>(
      () => _i245.AirwaybillScreen(get<_i184.AirwaybillStateManager>()));
  gh.factory<_i246.AirwaybillSpecificationModule>(() =>
      _i246.AirwaybillSpecificationModule(
          get<_i183.AirwaybillSpecificationsScreen>(),
          get<_i232.AddNewAirwaybillSpecification>()));
  gh.factory<_i247.ClientModule>(() => _i247.ClientModule(
      get<_i187.ClientsScreen>(), get<_i163.AddNewClient>()));
  gh.factory<_i248.ContainerDetailsScreen>(() =>
      _i248.ContainerDetailsScreen(get<_i188.ContainerDetailsStateManager>()));
  gh.factory<_i249.ContainerFilterScreen>(() =>
      _i249.ContainerFilterScreen(get<_i198.FilterContainerStateManager>()));
  gh.factory<_i250.ContainerFinanceScreen>(() =>
      _i250.ContainerFinanceScreen(get<_i189.ContainerFinanceStateManager>()));
  gh.factory<_i251.ContainerModule>(() => _i251.ContainerModule(
      get<_i190.ContainerScreen>(),
      get<_i164.AddNewContainer>(),
      get<_i249.ContainerFilterScreen>(),
      get<_i248.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i250.ContainerFinanceScreen>()));
  gh.factory<_i252.HomeModule>(() => _i252.HomeModule(get<_i200.HomeScreen>()));
  gh.factory<_i253.MarkModule>(() => _i253.MarkModule(get<_i201.MarkScreen>()));
  gh.factory<_i254.MyShipmentModule>(() => _i254.MyShipmentModule(
      get<_i202.MyShipmentScreen>(), get<_i15.ReviewShipmentScreen>()));
  gh.factory<_i255.NewShipmentsModule>(() => _i255.NewShipmentsModule(
      get<_i203.NewShipment>(), get<_i208.RequestShipmentReview>()));
  gh.factory<_i256.ProductModule>(() => _i256.ProductModule(
      get<_i204.ProductScreen>(), get<_i233.AddNewProduct>()));
  gh.factory<_i257.ProfileModule>(
      () => _i257.ProfileModule(get<_i205.ProfileScreen>()));
  gh.factory<_i258.ProxiesModule>(() => _i258.ProxiesModule(
      get<_i206.ProxiesScreen>(), get<_i234.AddNewProxy>()));
  gh.factory<_i259.ReceiverModule>(
      () => _i259.ReceiverModule(get<_i207.ReceiverScreen>()));
  gh.factory<_i260.SubContractServiceModule>(() =>
      _i260.SubContractServiceModule(get<_i210.SubContractServiceScreen>(),
          get<_i235.AddNewSubContractService>()));
  gh.factory<_i261.SubProductModule>(() => _i261.SubProductModule(
      get<_i211.SubProductScreen>(),
      get<_i236.AddNewSubProduct>(),
      get<_i218.UpdateSubProduct>()));
  gh.factory<_i262.SubcontractModule>(() => _i262.SubcontractModule(
      get<_i212.SubcontractScreen>(), get<_i237.AddNewSubcontract>()));
  gh.factory<_i263.SupplierModule>(() => _i263.SupplierModule(
      get<_i131.SuppliersScreen>(), get<_i238.AddNewSupplier>()));
  gh.factory<_i264.TrackingModule>(
      () => _i264.TrackingModule(get<_i213.TrackingScreen>()));
  gh.factory<_i265.TravelDetailsScreen>(
      () => _i265.TravelDetailsScreen(get<_i214.TravelDetailsStateManager>()));
  gh.factory<_i266.TravelFinanceScreen>(
      () => _i266.TravelFinanceScreen(get<_i216.TravelFinanceStateManager>()));
  gh.factory<_i267.TravelModule>(() => _i267.TravelModule(
      get<_i217.TravelScreen>(),
      get<_i239.AddNewTravel>(),
      get<_i215.TravelFilterScreen>(),
      get<_i265.TravelDetailsScreen>(),
      get<_i266.TravelFinanceScreen>(),
      get<_i219.UpdateTravel>()));
  gh.factory<_i268.UnitModule>(() =>
      _i268.UnitModule(get<_i141.UnitsScreen>(), get<_i240.AddNewUnit>()));
  gh.factory<_i269.ViewWarehouseScreen>(
      () => _i269.ViewWarehouseScreen(get<_i221.ViewWarehousesStateManager>()));
  gh.factory<_i270.WaitingShipmentModule>(() => _i270.WaitingShipmentModule(
      get<_i222.WaitingShipmentScreen>(),
      get<_i146.WantingShipmentDetailsScreen>()));
  gh.factory<_i271.WarehouseFinanceScreen>(() =>
      _i271.WarehouseFinanceScreen(get<_i223.WarehouseFinanceStateManager>()));
  gh.factory<_i272.WarehouseModule>(() => _i272.WarehouseModule(
      get<_i224.WarehouseScreen>(),
      get<_i241.AddNewWarehouse>(),
      get<_i271.WarehouseFinanceScreen>(),
      get<_i220.UpdateWarehouse>()));
  gh.factory<_i273.AcceptedShipmentModule>(() => _i273.AcceptedShipmentModule(
      get<_i227.AcceptedShipmentScreen>(),
      get<_i225.AcceptedShipmentDetailsScreen>(),
      get<_i150.AcceptedShipmentFilterScreen>(),
      get<_i228.AcceptedShipmentStatusScreen>(),
      get<_i226.AcceptedShipmentFinanceScreen>(),
      get<_i269.ViewWarehouseScreen>()));
  gh.factory<_i274.AirwaybillDetailsScreen>(() => _i274.AirwaybillDetailsScreen(
      get<_i242.AirwaybillDetailsStateManager>()));
  gh.factory<_i275.AirwaybillFinanceScreen>(() => _i275.AirwaybillFinanceScreen(
      get<_i244.AirwaybillFinanceStateManager>()));
  gh.factory<_i276.AirwaybillModule>(() => _i276.AirwaybillModule(
      get<_i245.AirwaybillScreen>(),
      get<_i231.AddNewAirwaybill>(),
      get<_i243.AirwaybillFilterScreen>(),
      get<_i274.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i275.AirwaybillFinanceScreen>()));
  gh.factory<_i277.MyApp>(() => _i277.MyApp(
      get<_i19.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i88.FireNotificationService>(),
      get<_i118.SplashModule>(),
      get<_i185.AuthorizationModule>(),
      get<_i60.ChatModule>(),
      get<_i209.SettingsModule>(),
      get<_i252.HomeModule>(),
      get<_i257.ProfileModule>(),
      get<_i253.MarkModule>(),
      get<_i21.NotificationModule>(),
      get<_i255.NewShipmentsModule>(),
      get<_i264.TrackingModule>(),
      get<_i195.EditShipmentModule>(),
      get<_i193.CountryModule>(),
      get<_i194.DistributorsModule>(),
      get<_i258.ProxiesModule>(),
      get<_i263.SupplierModule>(),
      get<_i260.SubContractServiceModule>(),
      get<_i262.SubcontractModule>(),
      get<_i268.UnitModule>(),
      get<_i267.TravelModule>(),
      get<_i251.ContainerModule>(),
      get<_i276.AirwaybillModule>(),
      get<_i191.ContainerSpecificationModule>(),
      get<_i246.AirwaybillSpecificationModule>(),
      get<_i270.WaitingShipmentModule>(),
      get<_i273.AcceptedShipmentModule>(),
      get<_i247.ClientModule>(),
      get<_i256.ProductModule>(),
      get<_i261.SubProductModule>(),
      get<_i272.WarehouseModule>(),
      get<_i259.ReceiverModule>(),
      get<_i196.EmployeeModule>()));
  return get;
}
