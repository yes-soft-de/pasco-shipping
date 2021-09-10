// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i279;
import '../module_airwaybill/airwaybill_module.dart' as _i277;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i177;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i58;
import '../module_airwaybill/service/airwaybill_service.dart' as _i178;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i243;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i183;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i241;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i196;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i229;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i275;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i242;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i276;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i230;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i244;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i269;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i245;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i179;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i59;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i180;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i181;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i228;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i231;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i182;
import '../module_auth/authoriazation_module.dart' as _i184;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i38;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i95;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i185;
import '../module_chat/chat_module.dart' as _i61;
import '../module_chat/manager/chat/chat_manager.dart' as _i60;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i62;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i246;
import '../module_client/manager/client_manager.dart' as _i63;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i64;
import '../module_client/state_manager/client_state_manager.dart' as _i65;
import '../module_client/state_manager/new_client_state_manger.dart' as _i156;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i162;
import '../module_client/ui/screen/client_screen.dart' as _i186;
import '../module_container/container_module.dart' as _i250;
import '../module_container/manager/container_manager.dart' as _i66;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i67;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i188;
import '../module_container/state_manger/container_state_manager.dart' as _i72;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i187;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i197;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i158;
import '../module_container/ui/screen/container_details_screen.dart' as _i247;
import '../module_container/ui/screen/container_filter_screen.dart' as _i248;
import '../module_container/ui/screen/container_finance_screen.dart' as _i249;
import '../module_container/ui/screen/container_new_screen.dart' as _i163;
import '../module_container/ui/screen/container_screen.dart' as _i189;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i216;
import '../module_container_specification/container_specification_module.dart'
    as _i190;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i68;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i69;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i70;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i157;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i164;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i71;
import '../module_countries/country_module.dart' as _i192;
import '../module_countries/manager/country_manager.dart' as _i73;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i74;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i75;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i159;
import '../module_countries/ui/screen/countries_screen.dart' as _i191;
import '../module_countries/ui/screen/country_new_screen.dart' as _i165;
import '../module_distributors/distributors_module.dart' as _i193;
import '../module_distributors/manager/distributors_manager.dart' as _i76;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i77;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i78;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i160;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i166;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i79;
import '../module_edit_shipment/edit_shipment_module.dart' as _i194;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i80;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i81;
import '../module_edit_shipment/state_manager/confirmed_state_manager.dart'
    as _i82;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i83;
import '../module_employees/employe_module.dart' as _i195;
import '../module_employees/manager/employees_manager.dart' as _i84;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i85;
import '../module_employees/state_manger/employees_state_manager.dart' as _i86;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i161;
import '../module_employees/ui/screen/employees_screen.dart' as _i87;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i167;
import '../module_home/home_module.dart' as _i251;
import '../module_home/manager/home_manager.dart' as _i92;
import '../module_home/repository/home_repository.dart' as _i36;
import '../module_home/service/home_service.dart' as _i93;
import '../module_home/state_manager/state_manager_home.dart' as _i94;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i96;
import '../module_mark/mark_module.dart' as _i252;
import '../module_mark/repository/mark_repository.dart' as _i39;
import '../module_mark/service/mark_service.dart' as _i97;
import '../module_mark/state_manager/mark_state_manager.dart' as _i98;
import '../module_mark/ui/mark_screen.dart' as _i199;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i99;
import '../module_my_shipment/my_shipment_module.dart' as _i253;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i40;
import '../module_my_shipment/service/my_shipment_service.dart' as _i100;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i101;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i200;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i41;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i89;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_product_category/manager/product_category_manager.dart'
    as _i102;
import '../module_product_category/product_module.dart' as _i256;
import '../module_product_category/repository/product_category_repository.dart'
    as _i42;
import '../module_product_category/service/product_service.dart' as _i103;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i168;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i104;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i232;
import '../module_product_category/ui/screen/products_screen.dart' as _i201;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i122;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i49;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i123;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i171;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i124;
import '../module_product_sub_category/sub_product_module.dart' as _i261;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i235;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i217;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i209;
import '../module_profile/manager/profile_manager.dart' as _i105;
import '../module_profile/profile_module.dart' as _i257;
import '../module_profile/repository/profile_repository.dart' as _i43;
import '../module_profile/service/profile_service.dart' as _i106;
import '../module_profile/state_manager/profile_state_manager.dart' as _i107;
import '../module_profile/ui/profile_screen.dart' as _i202;
import '../module_proxies/manager/proxies_manager.dart' as _i108;
import '../module_proxies/proxies_module.dart' as _i258;
import '../module_proxies/repository/proxies_repository.dart' as _i44;
import '../module_proxies/service/proixes_service.dart' as _i109;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i169;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i110;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i203;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i233;
import '../module_receiver/manager/receiver_manager.dart' as _i111;
import '../module_receiver/recevier_module.dart' as _i259;
import '../module_receiver/repository/recevier_repository.dart' as _i45;
import '../module_receiver/service/receiver_service.dart' as _i112;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i113;
import '../module_receiver/ui/receiver_screen.dart' as _i204;
import '../module_report/manager/report_manager.dart' as _i114;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i46;
import '../module_report/service/report_service.dart' as _i115;
import '../module_settings/settings_module.dart' as _i207;
import '../module_settings/ui/settings_page/settings_page.dart' as _i117;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i90;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i35;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i91;
import '../module_shipment_request/shipment_request_module.dart' as _i255;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i206;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i116;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i254;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i205;
import '../module_shipment_track/manager/tracking_manager.dart' as _i132;
import '../module_shipment_track/repository/tracking_repository.dart' as _i52;
import '../module_shipment_track/service/tracking_service.dart' as _i133;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i134;
import '../module_shipment_track/tracking_module.dart' as _i264;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i211;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i278;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i151;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i57;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i152;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i153;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i154;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i155;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i227;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i88;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i220;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i224;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i225;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i226;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i274;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i150;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i270;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i142;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i55;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i143;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i144;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i145;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i146;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i221;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i271;
import '../module_splash/splash_module.dart' as _i118;
import '../module_splash/ui/screen/splash_screen.dart' as _i47;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i125;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i50;
import '../module_sub_contract/service/subcontract_service.dart' as _i126;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i172;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i127;
import '../module_sub_contract/subcontract_module.dart' as _i262;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i236;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i210;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i119;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i48;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i120;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i170;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i121;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i260;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i234;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i208;
import '../module_suppliers/manager/suppliers_manager.dart' as _i128;
import '../module_suppliers/repository/suppliers_repository.dart' as _i51;
import '../module_suppliers/service/suppliers_service.dart' as _i129;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i173;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i130;
import '../module_suppliers/supplier_module.dart' as _i263;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i237;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i131;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i135;
import '../module_travel/repository/travel_repository.dart' as _i53;
import '../module_travel/service/travel_service.dart' as _i136;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i212;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i198;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i174;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i214;
import '../module_travel/state_manger/travels_state_manager.dart' as _i137;
import '../module_travel/travel_module.dart' as _i267;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i265;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i213;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i266;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i238;
import '../module_travel/ui/screen/travel_screen.dart' as _i215;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i218;
import '../module_unit/manager/unit_manager.dart' as _i138;
import '../module_unit/repository/unit_repository.dart' as _i54;
import '../module_unit/service/unit_service.dart' as _i139;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i175;
import '../module_unit/state_manger/units_state_manager.dart' as _i140;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i239;
import '../module_unit/ui/screen/units_screen.dart' as _i141;
import '../module_unit/unit_module.dart' as _i268;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i37;
import '../module_warehouses/manager/warehouses_manager.dart' as _i147;
import '../module_warehouses/repository/warehouse_repository.dart' as _i56;
import '../module_warehouses/service/warehouse_service.dart' as _i148;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i176;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i222;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i149;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i272;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i240;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i223;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i219;
import '../module_warehouses/warehouse_module.dart' as _i273;
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
  gh.factory<_i11.MyFirstApp>(() => _i11.MyFirstApp());
  gh.factory<_i12.NotificationScreen>(() => _i12.NotificationScreen());
  gh.factory<_i13.NotificationsPrefsHelper>(
      () => _i13.NotificationsPrefsHelper());
  gh.factory<_i14.PreviousShipmentsModule>(
      () => _i14.PreviousShipmentsModule());
  gh.factory<_i15.ReportPrefsHelper>(() => _i15.ReportPrefsHelper());
  gh.factory<_i16.ReviewShipmentScreen>(() => _i16.ReviewShipmentScreen());
  gh.factory<_i17.ThemePreferencesHelper>(() => _i17.ThemePreferencesHelper());
  gh.factory<_i18.UploadRepository>(() => _i18.UploadRepository());
  gh.factory<_i19.ApiClient>(() => _i19.ApiClient(get<_i10.Logger>()));
  gh.factory<_i20.AppThemeDataService>(
      () => _i20.AppThemeDataService(get<_i17.ThemePreferencesHelper>()));
  gh.factory<_i21.AuthRepository>(
      () => _i21.AuthRepository(get<_i19.ApiClient>(), get<_i10.Logger>()));
  gh.factory<_i22.NotificationModule>(
      () => _i22.NotificationModule(get<_i12.NotificationScreen>()));
  gh.factory<_i23.UploadManager>(
      () => _i23.UploadManager(get<_i18.UploadRepository>()));
  gh.factory<_i24.AuthManager>(
      () => _i24.AuthManager(get<_i21.AuthRepository>()));
  gh.factory<_i25.AuthService>(() =>
      _i25.AuthService(get<_i4.AuthPrefsHelper>(), get<_i24.AuthManager>()));
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
  gh.factory<_i34.EmployeeRepository>(() =>
      _i34.EmployeeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i35.FirstOptionRepository>(() => _i35.FirstOptionRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i36.HomeRepository>(() =>
      _i36.HomeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i37.ImageUploadService>(
      () => _i37.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i38.LoginStateManager>(
      () => _i38.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i39.MarkRepository>(() =>
      _i39.MarkRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i40.MyShipmentRepository>(() => _i40.MyShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i41.NotificationRepo>(() =>
      _i41.NotificationRepo(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i42.ProductRepository>(() =>
      _i42.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i43.ProfileRepository>(() =>
      _i43.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i44.ProxyRepository>(() =>
      _i44.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i45.ReceiverRepository>(() =>
      _i45.ReceiverRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i46.ReportRepository>(() => _i46.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i47.SplashScreen>(
      () => _i47.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i48.SubContractServiceRepository>(() =>
      _i48.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i49.SubProductRepository>(() => _i49.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i50.SubcontractRepository>(() => _i50.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.SupplierRepository>(() =>
      _i51.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.TrackingRepository>(() =>
      _i52.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.TravelRepository>(() =>
      _i53.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.UnitRepository>(() =>
      _i54.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.WaitingShipmentRepository>(() =>
      _i55.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.WarehousesRepository>(() => _i56.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.AcceptedShipmentRepository>(() =>
      _i57.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.AirwaybillRepository>(() => _i58.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.AirwaybillSpecificationRepository>(() =>
      _i59.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.ChatManager>(
      () => _i60.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i61.ChatModule>(() => _i61.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i62.ChatService>(() => _i62.ChatService(get<_i60.ChatManager>()));
  gh.factory<_i63.ClientManager>(
      () => _i63.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i64.ClientService>(
      () => _i64.ClientService(get<_i63.ClientManager>()));
  gh.factory<_i65.ClientsStateManager>(
      () => _i65.ClientsStateManager(get<_i64.ClientService>()));
  gh.factory<_i66.ContainerManager>(
      () => _i66.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i67.ContainerService>(
      () => _i67.ContainerService(get<_i66.ContainerManager>()));
  gh.factory<_i68.ContainerSpecificationManager>(() =>
      _i68.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i69.ContainerSpecificationService>(() =>
      _i69.ContainerSpecificationService(
          get<_i68.ContainerSpecificationManager>()));
  gh.factory<_i70.ContainerSpecificationStateManager>(() =>
      _i70.ContainerSpecificationStateManager(
          get<_i69.ContainerSpecificationService>()));
  gh.factory<_i71.ContainerSpecificationsScreen>(() =>
      _i71.ContainerSpecificationsScreen(
          get<_i70.ContainerSpecificationStateManager>()));
  gh.factory<_i72.ContainerStateManager>(
      () => _i72.ContainerStateManager(get<_i67.ContainerService>()));
  gh.factory<_i73.CountryManager>(
      () => _i73.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i74.CountryService>(
      () => _i74.CountryService(get<_i73.CountryManager>()));
  gh.factory<_i75.CountryStateManager>(
      () => _i75.CountryStateManager(get<_i74.CountryService>()));
  gh.factory<_i76.DistributorManager>(
      () => _i76.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i77.DistributorService>(
      () => _i77.DistributorService(get<_i76.DistributorManager>()));
  gh.factory<_i78.DistributorStateManager>(
      () => _i78.DistributorStateManager(get<_i77.DistributorService>()));
  gh.factory<_i79.DistributorsScreen>(
      () => _i79.DistributorsScreen(get<_i78.DistributorStateManager>()));
  gh.factory<_i80.EditShipmentManager>(
      () => _i80.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i81.EditShipmentService>(
      () => _i81.EditShipmentService(get<_i80.EditShipmentManager>()));
  gh.factory<_i82.EditShipmentStateManager>(() => _i82.EditShipmentStateManager(
      get<_i81.EditShipmentService>(), get<_i37.ImageUploadService>()));
  gh.factory<_i83.EditedShipmentScreen>(
      () => _i83.EditedShipmentScreen(get<_i82.EditShipmentStateManager>()));
  gh.factory<_i84.EmployeeManager>(
      () => _i84.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i85.EmployeeService>(
      () => _i85.EmployeeService(get<_i84.EmployeeManager>()));
  gh.factory<_i86.EmployeeStateManager>(
      () => _i86.EmployeeStateManager(get<_i85.EmployeeService>()));
  gh.factory<_i87.EmployeesScreen>(
      () => _i87.EmployeesScreen(get<_i86.EmployeeStateManager>()));
  gh.factory<_i88.FilterAcceptedShipmentStateManager>(() =>
      _i88.FilterAcceptedShipmentStateManager(get<_i74.CountryService>()));
  gh.factory<_i89.FireNotificationService>(() => _i89.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i41.NotificationRepo>()));
  gh.factory<_i90.FirstOptionManager>(
      () => _i90.FirstOptionManager(get<_i35.FirstOptionRepository>()));
  gh.factory<_i91.FirstOptionService>(
      () => _i91.FirstOptionService(get<_i90.FirstOptionManager>()));
  gh.factory<_i92.HomeManager>(
      () => _i92.HomeManager(get<_i36.HomeRepository>()));
  gh.factory<_i93.HomeService>(() => _i93.HomeService(get<_i92.HomeManager>()));
  gh.factory<_i94.HomeStateManager>(() => _i94.HomeStateManager(
      get<_i93.HomeService>(), get<_i85.EmployeeService>()));
  gh.factory<_i95.LoginScreen>(
      () => _i95.LoginScreen(get<_i38.LoginStateManager>()));
  gh.factory<_i96.MarkManager>(
      () => _i96.MarkManager(get<_i39.MarkRepository>()));
  gh.factory<_i97.MarkService>(() => _i97.MarkService(get<_i96.MarkManager>()));
  gh.factory<_i98.MarkStateManager>(() => _i98.MarkStateManager(
      get<_i97.MarkService>(), get<_i64.ClientService>()));
  gh.factory<_i99.MyShipmentManager>(
      () => _i99.MyShipmentManager(get<_i40.MyShipmentRepository>()));
  gh.factory<_i100.MyShipmentService>(
      () => _i100.MyShipmentService(get<_i99.MyShipmentManager>()));
  gh.factory<_i101.MyShipmentStateManger>(
      () => _i101.MyShipmentStateManger(get<_i100.MyShipmentService>()));
  gh.factory<_i102.ProductManager>(
      () => _i102.ProductManager(get<_i42.ProductRepository>()));
  gh.factory<_i103.ProductService>(
      () => _i103.ProductService(get<_i102.ProductManager>()));
  gh.factory<_i104.ProductStateManager>(
      () => _i104.ProductStateManager(get<_i103.ProductService>()));
  gh.factory<_i105.ProfileManager>(
      () => _i105.ProfileManager(get<_i43.ProfileRepository>()));
  gh.factory<_i106.ProfileService>(
      () => _i106.ProfileService(get<_i105.ProfileManager>()));
  gh.factory<_i107.ProfileStateManager>(
      () => _i107.ProfileStateManager(get<_i106.ProfileService>()));
  gh.factory<_i108.ProxyManager>(
      () => _i108.ProxyManager(get<_i44.ProxyRepository>()));
  gh.factory<_i109.ProxyService>(
      () => _i109.ProxyService(get<_i108.ProxyManager>()));
  gh.factory<_i110.ProxyStateManager>(
      () => _i110.ProxyStateManager(get<_i109.ProxyService>()));
  gh.factory<_i111.ReceiverManager>(
      () => _i111.ReceiverManager(get<_i45.ReceiverRepository>()));
  gh.factory<_i112.ReceiverService>(
      () => _i112.ReceiverService(get<_i111.ReceiverManager>()));
  gh.factory<_i113.ReceiverStateManager>(() => _i113.ReceiverStateManager(
      get<_i112.ReceiverService>(), get<_i64.ClientService>()));
  gh.factory<_i114.ReportManager>(
      () => _i114.ReportManager(get<_i46.ReportRepository>()));
  gh.factory<_i115.ReportService>(
      () => _i115.ReportService(get<_i114.ReportManager>()));
  gh.factory<_i116.ReviewShipmentStateManger>(() =>
      _i116.ReviewShipmentStateManger(
          get<_i91.FirstOptionService>(), get<_i37.ImageUploadService>()));
  gh.factory<_i117.SettingsScreen>(() => _i117.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i89.FireNotificationService>()));
  gh.factory<_i118.SplashModule>(
      () => _i118.SplashModule(get<_i47.SplashScreen>()));
  gh.factory<_i119.SubContractServiceManager>(() =>
      _i119.SubContractServiceManager(
          get<_i48.SubContractServiceRepository>()));
  gh.factory<_i120.SubContractServiceService>(() =>
      _i120.SubContractServiceService(get<_i119.SubContractServiceManager>()));
  gh.factory<_i121.SubContractServiceStateManager>(() =>
      _i121.SubContractServiceStateManager(
          get<_i120.SubContractServiceService>()));
  gh.factory<_i122.SubProductManager>(
      () => _i122.SubProductManager(get<_i49.SubProductRepository>()));
  gh.factory<_i123.SubProductService>(
      () => _i123.SubProductService(get<_i122.SubProductManager>()));
  gh.factory<_i124.SubProductStateManager>(
      () => _i124.SubProductStateManager(get<_i123.SubProductService>()));
  gh.factory<_i125.SubcontractManager>(
      () => _i125.SubcontractManager(get<_i50.SubcontractRepository>()));
  gh.factory<_i126.SubcontractService>(
      () => _i126.SubcontractService(get<_i125.SubcontractManager>()));
  gh.factory<_i127.SubcontractStateManager>(
      () => _i127.SubcontractStateManager(get<_i126.SubcontractService>()));
  gh.factory<_i128.SupplierManager>(
      () => _i128.SupplierManager(get<_i51.SupplierRepository>()));
  gh.factory<_i129.SupplierService>(
      () => _i129.SupplierService(get<_i128.SupplierManager>()));
  gh.factory<_i130.SupplierStateManager>(
      () => _i130.SupplierStateManager(get<_i129.SupplierService>()));
  gh.factory<_i131.SuppliersScreen>(
      () => _i131.SuppliersScreen(get<_i130.SupplierStateManager>()));
  gh.factory<_i132.TrackingManager>(
      () => _i132.TrackingManager(get<_i52.TrackingRepository>()));
  gh.factory<_i133.TrackingService>(
      () => _i133.TrackingService(get<_i132.TrackingManager>()));
  gh.factory<_i134.TrackingStateManager>(
      () => _i134.TrackingStateManager(get<_i133.TrackingService>()));
  gh.factory<_i135.TravelManager>(
      () => _i135.TravelManager(get<_i53.TravelRepository>()));
  gh.factory<_i136.TravelService>(
      () => _i136.TravelService(get<_i135.TravelManager>()));
  gh.factory<_i137.TravelStateManager>(
      () => _i137.TravelStateManager(get<_i136.TravelService>()));
  gh.factory<_i138.UnitManager>(
      () => _i138.UnitManager(get<_i54.UnitRepository>()));
  gh.factory<_i139.UnitService>(
      () => _i139.UnitService(get<_i138.UnitManager>()));
  gh.factory<_i140.UnitStateManager>(
      () => _i140.UnitStateManager(get<_i139.UnitService>()));
  gh.factory<_i141.UnitsScreen>(
      () => _i141.UnitsScreen(get<_i140.UnitStateManager>()));
  gh.factory<_i142.WaitingShipmentManager>(() =>
      _i142.WaitingShipmentManager(get<_i55.WaitingShipmentRepository>()));
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
      () => _i147.WarehouseManager(get<_i56.WarehousesRepository>()));
  gh.factory<_i148.WarehouseService>(
      () => _i148.WarehouseService(get<_i147.WarehouseManager>()));
  gh.factory<_i149.WarehouseStateManager>(
      () => _i149.WarehouseStateManager(get<_i148.WarehouseService>()));
  gh.factory<_i150.AcceptedShipmentFilterScreen>(() =>
      _i150.AcceptedShipmentFilterScreen(
          get<_i88.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i151.AcceptedShipmentManager>(() =>
      _i151.AcceptedShipmentManager(get<_i57.AcceptedShipmentRepository>()));
  gh.factory<_i152.AcceptedShipmentService>(() =>
      _i152.AcceptedShipmentService(get<_i151.AcceptedShipmentManager>()));
  gh.factory<_i153.AcceptedShipmentsDetailsStateManager>(() =>
      _i153.AcceptedShipmentsDetailsStateManager(
          get<_i152.AcceptedShipmentService>(), get<_i67.ContainerService>()));
  gh.factory<_i154.AcceptedShipmentsFinanceStateManager>(() =>
      _i154.AcceptedShipmentsFinanceStateManager(
          get<_i152.AcceptedShipmentService>()));
  gh.factory<_i155.AcceptedShipmentsStateManager>(() =>
      _i155.AcceptedShipmentsStateManager(
          get<_i152.AcceptedShipmentService>()));
  gh.factory<_i156.AddClientStateManager>(
      () => _i156.AddClientStateManager(get<_i64.ClientService>()));
  gh.factory<_i157.AddContainerSpecificationStateManager>(() =>
      _i157.AddContainerSpecificationStateManager(
          get<_i69.ContainerSpecificationService>()));
  gh.factory<_i158.AddContainerStateManager>(() =>
      _i158.AddContainerStateManager(
          get<_i67.ContainerService>(),
          get<_i126.SubcontractService>(),
          get<_i69.ContainerSpecificationService>()));
  gh.factory<_i159.AddCountryStateManager>(
      () => _i159.AddCountryStateManager(get<_i74.CountryService>()));
  gh.factory<_i160.AddDistributorStateManager>(
      () => _i160.AddDistributorStateManager(get<_i77.DistributorService>()));
  gh.factory<_i161.AddEmployeeStateManager>(
      () => _i161.AddEmployeeStateManager(get<_i85.EmployeeService>()));
  gh.factory<_i162.AddNewClient>(
      () => _i162.AddNewClient(get<_i156.AddClientStateManager>()));
  gh.factory<_i163.AddNewContainer>(
      () => _i163.AddNewContainer(get<_i158.AddContainerStateManager>()));
  gh.factory<_i164.AddNewContainerSpecification>(() =>
      _i164.AddNewContainerSpecification(
          get<_i157.AddContainerSpecificationStateManager>()));
  gh.factory<_i165.AddNewCountry>(
      () => _i165.AddNewCountry(get<_i159.AddCountryStateManager>()));
  gh.factory<_i166.AddNewDistributor>(
      () => _i166.AddNewDistributor(get<_i160.AddDistributorStateManager>()));
  gh.factory<_i167.AddNewEmployee>(
      () => _i167.AddNewEmployee(get<_i161.AddEmployeeStateManager>()));
  gh.factory<_i168.AddProductStateManager>(
      () => _i168.AddProductStateManager(get<_i103.ProductService>()));
  gh.factory<_i169.AddProxyStateManager>(
      () => _i169.AddProxyStateManager(get<_i109.ProxyService>()));
  gh.factory<_i170.AddSubContractServiceStateManager>(() =>
      _i170.AddSubContractServiceStateManager(
          get<_i120.SubContractServiceService>()));
  gh.factory<_i171.AddSubProductStateManager>(() =>
      _i171.AddSubProductStateManager(
          get<_i123.SubProductService>(), get<_i103.ProductService>()));
  gh.factory<_i172.AddSubcontractStateManager>(() =>
      _i172.AddSubcontractStateManager(get<_i120.SubContractServiceService>(),
          get<_i126.SubcontractService>()));
  gh.factory<_i173.AddSupplierStateManager>(
      () => _i173.AddSupplierStateManager(get<_i129.SupplierService>()));
  gh.factory<_i174.AddTravelStateManager>(() => _i174.AddTravelStateManager(
      get<_i136.TravelService>(),
      get<_i74.CountryService>(),
      get<_i126.SubcontractService>()));
  gh.factory<_i175.AddUnitStateManager>(
      () => _i175.AddUnitStateManager(get<_i139.UnitService>()));
  gh.factory<_i176.AddWarehouseStateManager>(() =>
      _i176.AddWarehouseStateManager(
          get<_i148.WarehouseService>(),
          get<_i126.SubcontractService>(),
          get<_i109.ProxyService>(),
          get<_i74.CountryService>()));
  gh.factory<_i177.AirwaybillManager>(
      () => _i177.AirwaybillManager(get<_i58.AirwaybillRepository>()));
  gh.factory<_i178.AirwaybillService>(
      () => _i178.AirwaybillService(get<_i177.AirwaybillManager>()));
  gh.factory<_i179.AirwaybillSpecificationManager>(() =>
      _i179.AirwaybillSpecificationManager(
          get<_i59.AirwaybillSpecificationRepository>()));
  gh.factory<_i180.AirwaybillSpecificationService>(() =>
      _i180.AirwaybillSpecificationService(
          get<_i179.AirwaybillSpecificationManager>()));
  gh.factory<_i181.AirwaybillSpecificationStateManager>(() =>
      _i181.AirwaybillSpecificationStateManager(
          get<_i180.AirwaybillSpecificationService>()));
  gh.factory<_i182.AirwaybillSpecificationsScreen>(() =>
      _i182.AirwaybillSpecificationsScreen(
          get<_i181.AirwaybillSpecificationStateManager>()));
  gh.factory<_i183.AirwaybillStateManager>(
      () => _i183.AirwaybillStateManager(get<_i178.AirwaybillService>()));
  gh.factory<_i184.AuthorizationModule>(
      () => _i184.AuthorizationModule(get<_i95.LoginScreen>()));
  gh.factory<_i185.ChatPageBloc>(
      () => _i185.ChatPageBloc(get<_i62.ChatService>()));
  gh.factory<_i186.ClientsScreen>(
      () => _i186.ClientsScreen(get<_i65.ClientsStateManager>()));
  gh.factory<_i187.ContainerDetailsStateManager>(() =>
      _i187.ContainerDetailsStateManager(
          get<_i67.ContainerService>(), get<_i136.TravelService>()));
  gh.factory<_i188.ContainerFinanceStateManager>(
      () => _i188.ContainerFinanceStateManager(get<_i67.ContainerService>()));
  gh.factory<_i189.ContainerScreen>(
      () => _i189.ContainerScreen(get<_i72.ContainerStateManager>()));
  gh.factory<_i190.ContainerSpecificationModule>(() =>
      _i190.ContainerSpecificationModule(
          get<_i71.ContainerSpecificationsScreen>(),
          get<_i164.AddNewContainerSpecification>()));
  gh.factory<_i191.CountriesScreen>(
      () => _i191.CountriesScreen(get<_i75.CountryStateManager>()));
  gh.factory<_i192.CountryModule>(() => _i192.CountryModule(
      get<_i191.CountriesScreen>(), get<_i165.AddNewCountry>()));
  gh.factory<_i193.DistributorsModule>(() => _i193.DistributorsModule(
      get<_i79.DistributorsScreen>(), get<_i166.AddNewDistributor>()));
  gh.factory<_i194.EditShipmentModule>(
      () => _i194.EditShipmentModule(get<_i83.EditedShipmentScreen>()));
  gh.factory<_i195.EmployeeModule>(() => _i195.EmployeeModule(
      get<_i87.EmployeesScreen>(), get<_i167.AddNewEmployee>()));
  gh.factory<_i196.FilterAirwaybillStateManager>(() =>
      _i196.FilterAirwaybillStateManager(get<_i126.SubcontractService>()));
  gh.factory<_i197.FilterContainerStateManager>(() =>
      _i197.FilterContainerStateManager(get<_i126.SubcontractService>(),
          get<_i69.ContainerSpecificationService>()));
  gh.factory<_i198.FilterTravelStateManager>(() =>
      _i198.FilterTravelStateManager(get<_i136.TravelService>(),
          get<_i74.CountryService>(), get<_i126.SubcontractService>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i94.HomeStateManager>()));
  gh.factory<_i199.MarkScreen>(
      () => _i199.MarkScreen(get<_i98.MarkStateManager>()));
  gh.factory<_i200.MyShipmentScreen>(
      () => _i200.MyShipmentScreen(get<_i101.MyShipmentStateManger>()));
  gh.factory<_i201.ProductScreen>(
      () => _i201.ProductScreen(get<_i104.ProductStateManager>()));
  gh.factory<_i202.ProfileScreen>(
      () => _i202.ProfileScreen(get<_i107.ProfileStateManager>()));
  gh.factory<_i203.ProxiesScreen>(
      () => _i203.ProxiesScreen(get<_i110.ProxyStateManager>()));
  gh.factory<_i204.ReceiverScreen>(
      () => _i204.ReceiverScreen(get<_i113.ReceiverStateManager>()));
  gh.factory<_i205.RequestShipmentReview>(() =>
      _i205.RequestShipmentReview(get<_i116.ReviewShipmentStateManger>()));
  gh.factory<_i206.RequestShipmentStateManger>(() =>
      _i206.RequestShipmentStateManger(
          get<_i91.FirstOptionService>(),
          get<_i97.MarkService>(),
          get<_i64.ClientService>(),
          get<_i77.DistributorService>(),
          get<_i112.ReceiverService>(),
          get<_i139.UnitService>(),
          get<_i69.ContainerSpecificationService>(),
          get<_i180.AirwaybillSpecificationService>()));
  gh.factory<_i207.SettingsModule>(
      () => _i207.SettingsModule(get<_i117.SettingsScreen>()));
  gh.factory<_i208.SubContractServiceScreen>(() =>
      _i208.SubContractServiceScreen(
          get<_i121.SubContractServiceStateManager>()));
  gh.factory<_i209.SubProductScreen>(
      () => _i209.SubProductScreen(get<_i124.SubProductStateManager>()));
  gh.factory<_i210.SubcontractScreen>(
      () => _i210.SubcontractScreen(get<_i127.SubcontractStateManager>()));
  gh.factory<_i211.TrackingScreen>(
      () => _i211.TrackingScreen(get<_i134.TrackingStateManager>()));
  gh.factory<_i212.TravelDetailsStateManager>(
      () => _i212.TravelDetailsStateManager(get<_i136.TravelService>()));
  gh.factory<_i213.TravelFilterScreen>(
      () => _i213.TravelFilterScreen(get<_i198.FilterTravelStateManager>()));
  gh.factory<_i214.TravelFinanceStateManager>(
      () => _i214.TravelFinanceStateManager(get<_i136.TravelService>()));
  gh.factory<_i215.TravelScreen>(
      () => _i215.TravelScreen(get<_i137.TravelStateManager>()));
  gh.factory<_i216.UpdateContainer>(
      () => _i216.UpdateContainer(get<_i158.AddContainerStateManager>()));
  gh.factory<_i217.UpdateSubProduct>(
      () => _i217.UpdateSubProduct(get<_i171.AddSubProductStateManager>()));
  gh.factory<_i218.UpdateTravel>(
      () => _i218.UpdateTravel(get<_i174.AddTravelStateManager>()));
  gh.factory<_i219.UpdateWarehouse>(
      () => _i219.UpdateWarehouse(get<_i176.AddWarehouseStateManager>()));
  gh.factory<_i220.ViewWarehousesStateManager>(
      () => _i220.ViewWarehousesStateManager(get<_i148.WarehouseService>()));
  gh.factory<_i221.WaitingShipmentScreen>(() =>
      _i221.WaitingShipmentScreen(get<_i145.WaitingShipmentsStateManager>()));
  gh.factory<_i222.WarehouseFinanceStateManager>(
      () => _i222.WarehouseFinanceStateManager(get<_i148.WarehouseService>()));
  gh.factory<_i223.WarehouseScreen>(
      () => _i223.WarehouseScreen(get<_i149.WarehouseStateManager>()));
  gh.factory<_i224.AcceptedShipmentDetailsScreen>(() =>
      _i224.AcceptedShipmentDetailsScreen(
          get<_i153.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i225.AcceptedShipmentFinanceScreen>(() =>
      _i225.AcceptedShipmentFinanceScreen(
          get<_i154.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i226.AcceptedShipmentScreen>(() =>
      _i226.AcceptedShipmentScreen(get<_i155.AcceptedShipmentsStateManager>()));
  gh.factory<_i227.AcceptedShipmentsStatusStateManager>(() =>
      _i227.AcceptedShipmentsStatusStateManager(
          get<_i152.AcceptedShipmentService>(),
          get<_i126.SubcontractService>(),
          get<_i67.ContainerService>(),
          get<_i136.TravelService>(),
          get<_i148.WarehouseService>(),
          get<_i178.AirwaybillService>()));
  gh.factory<_i228.AddAirwaybillSpecificationStateManager>(() =>
      _i228.AddAirwaybillSpecificationStateManager(
          get<_i180.AirwaybillSpecificationService>()));
  gh.factory<_i229.AddAirwaybillStateManager>(() =>
      _i229.AddAirwaybillStateManager(
          get<_i178.AirwaybillService>(),
          get<_i126.SubcontractService>(),
          get<_i180.AirwaybillSpecificationService>()));
  gh.factory<_i230.AddNewAirwaybill>(
      () => _i230.AddNewAirwaybill(get<_i229.AddAirwaybillStateManager>()));
  gh.factory<_i231.AddNewAirwaybillSpecification>(() =>
      _i231.AddNewAirwaybillSpecification(
          get<_i228.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i232.AddNewProduct>(
      () => _i232.AddNewProduct(get<_i168.AddProductStateManager>()));
  gh.factory<_i233.AddNewProxy>(
      () => _i233.AddNewProxy(get<_i169.AddProxyStateManager>()));
  gh.factory<_i234.AddNewSubContractService>(() =>
      _i234.AddNewSubContractService(
          get<_i170.AddSubContractServiceStateManager>()));
  gh.factory<_i235.AddNewSubProduct>(
      () => _i235.AddNewSubProduct(get<_i171.AddSubProductStateManager>()));
  gh.factory<_i236.AddNewSubcontract>(
      () => _i236.AddNewSubcontract(get<_i172.AddSubcontractStateManager>()));
  gh.factory<_i237.AddNewSupplier>(
      () => _i237.AddNewSupplier(get<_i173.AddSupplierStateManager>()));
  gh.factory<_i238.AddNewTravel>(
      () => _i238.AddNewTravel(get<_i174.AddTravelStateManager>()));
  gh.factory<_i239.AddNewUnit>(
      () => _i239.AddNewUnit(get<_i175.AddUnitStateManager>()));
  gh.factory<_i240.AddNewWarehouse>(
      () => _i240.AddNewWarehouse(get<_i176.AddWarehouseStateManager>()));
  gh.factory<_i241.AirwaybillDetailsStateManager>(() =>
      _i241.AirwaybillDetailsStateManager(
          get<_i178.AirwaybillService>(), get<_i136.TravelService>()));
  gh.factory<_i242.AirwaybillFilterScreen>(() =>
      _i242.AirwaybillFilterScreen(get<_i196.FilterAirwaybillStateManager>()));
  gh.factory<_i243.AirwaybillFinanceStateManager>(() =>
      _i243.AirwaybillFinanceStateManager(get<_i178.AirwaybillService>()));
  gh.factory<_i244.AirwaybillScreen>(
      () => _i244.AirwaybillScreen(get<_i183.AirwaybillStateManager>()));
  gh.factory<_i245.AirwaybillSpecificationModule>(() =>
      _i245.AirwaybillSpecificationModule(
          get<_i182.AirwaybillSpecificationsScreen>(),
          get<_i231.AddNewAirwaybillSpecification>()));
  gh.factory<_i246.ClientModule>(() => _i246.ClientModule(
      get<_i186.ClientsScreen>(), get<_i162.AddNewClient>()));
  gh.factory<_i247.ContainerDetailsScreen>(() =>
      _i247.ContainerDetailsScreen(get<_i187.ContainerDetailsStateManager>()));
  gh.factory<_i248.ContainerFilterScreen>(() =>
      _i248.ContainerFilterScreen(get<_i197.FilterContainerStateManager>()));
  gh.factory<_i249.ContainerFinanceScreen>(() =>
      _i249.ContainerFinanceScreen(get<_i188.ContainerFinanceStateManager>()));
  gh.factory<_i250.ContainerModule>(() => _i250.ContainerModule(
      get<_i189.ContainerScreen>(),
      get<_i163.AddNewContainer>(),
      get<_i248.ContainerFilterScreen>(),
      get<_i247.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i249.ContainerFinanceScreen>(),
      get<_i216.UpdateContainer>()));
  gh.factory<_i251.HomeModule>(
      () => _i251.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i252.MarkModule>(() => _i252.MarkModule(get<_i199.MarkScreen>()));
  gh.factory<_i253.MyShipmentModule>(() => _i253.MyShipmentModule(
      get<_i200.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i254.NewShipment>(
      () => _i254.NewShipment(get<_i206.RequestShipmentStateManger>()));
  gh.factory<_i255.NewShipmentsModule>(() => _i255.NewShipmentsModule(
      get<_i254.NewShipment>(), get<_i205.RequestShipmentReview>()));
  gh.factory<_i256.ProductModule>(() => _i256.ProductModule(
      get<_i201.ProductScreen>(), get<_i232.AddNewProduct>()));
  gh.factory<_i257.ProfileModule>(
      () => _i257.ProfileModule(get<_i202.ProfileScreen>()));
  gh.factory<_i258.ProxiesModule>(() => _i258.ProxiesModule(
      get<_i203.ProxiesScreen>(), get<_i233.AddNewProxy>()));
  gh.factory<_i259.ReceiverModule>(
      () => _i259.ReceiverModule(get<_i204.ReceiverScreen>()));
  gh.factory<_i260.SubContractServiceModule>(() =>
      _i260.SubContractServiceModule(get<_i208.SubContractServiceScreen>(),
          get<_i234.AddNewSubContractService>()));
  gh.factory<_i261.SubProductModule>(() => _i261.SubProductModule(
      get<_i209.SubProductScreen>(),
      get<_i235.AddNewSubProduct>(),
      get<_i217.UpdateSubProduct>()));
  gh.factory<_i262.SubcontractModule>(() => _i262.SubcontractModule(
      get<_i210.SubcontractScreen>(), get<_i236.AddNewSubcontract>()));
  gh.factory<_i263.SupplierModule>(() => _i263.SupplierModule(
      get<_i131.SuppliersScreen>(), get<_i237.AddNewSupplier>()));
  gh.factory<_i264.TrackingModule>(
      () => _i264.TrackingModule(get<_i211.TrackingScreen>()));
  gh.factory<_i265.TravelDetailsScreen>(
      () => _i265.TravelDetailsScreen(get<_i212.TravelDetailsStateManager>()));
  gh.factory<_i266.TravelFinanceScreen>(
      () => _i266.TravelFinanceScreen(get<_i214.TravelFinanceStateManager>()));
  gh.factory<_i267.TravelModule>(() => _i267.TravelModule(
      get<_i215.TravelScreen>(),
      get<_i238.AddNewTravel>(),
      get<_i213.TravelFilterScreen>(),
      get<_i265.TravelDetailsScreen>(),
      get<_i266.TravelFinanceScreen>(),
      get<_i218.UpdateTravel>()));
  gh.factory<_i268.UnitModule>(() =>
      _i268.UnitModule(get<_i141.UnitsScreen>(), get<_i239.AddNewUnit>()));
  gh.factory<_i269.UpdateAirwaybill>(
      () => _i269.UpdateAirwaybill(get<_i229.AddAirwaybillStateManager>()));
  gh.factory<_i270.ViewWarehouseScreen>(
      () => _i270.ViewWarehouseScreen(get<_i220.ViewWarehousesStateManager>()));
  gh.factory<_i271.WaitingShipmentModule>(() => _i271.WaitingShipmentModule(
      get<_i221.WaitingShipmentScreen>(),
      get<_i146.WantingShipmentDetailsScreen>()));
  gh.factory<_i272.WarehouseFinanceScreen>(() =>
      _i272.WarehouseFinanceScreen(get<_i222.WarehouseFinanceStateManager>()));
  gh.factory<_i273.WarehouseModule>(() => _i273.WarehouseModule(
      get<_i223.WarehouseScreen>(),
      get<_i240.AddNewWarehouse>(),
      get<_i272.WarehouseFinanceScreen>(),
      get<_i219.UpdateWarehouse>()));
  gh.factory<_i274.AcceptedShipmentStatusScreen>(() =>
      _i274.AcceptedShipmentStatusScreen(
          get<_i227.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i275.AirwaybillDetailsScreen>(() => _i275.AirwaybillDetailsScreen(
      get<_i241.AirwaybillDetailsStateManager>()));
  gh.factory<_i276.AirwaybillFinanceScreen>(() => _i276.AirwaybillFinanceScreen(
      get<_i243.AirwaybillFinanceStateManager>()));
  gh.factory<_i277.AirwaybillModule>(() => _i277.AirwaybillModule(
      get<_i244.AirwaybillScreen>(),
      get<_i230.AddNewAirwaybill>(),
      get<_i242.AirwaybillFilterScreen>(),
      get<_i275.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i276.AirwaybillFinanceScreen>(),
      get<_i269.UpdateAirwaybill>()));
  gh.factory<_i278.AcceptedShipmentModule>(() => _i278.AcceptedShipmentModule(
      get<_i226.AcceptedShipmentScreen>(),
      get<_i224.AcceptedShipmentDetailsScreen>(),
      get<_i150.AcceptedShipmentFilterScreen>(),
      get<_i274.AcceptedShipmentStatusScreen>(),
      get<_i225.AcceptedShipmentFinanceScreen>(),
      get<_i270.ViewWarehouseScreen>()));
  gh.factory<_i279.MyApp>(() => _i279.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i89.FireNotificationService>(),
      get<_i251.HomeModule>(),
      get<_i118.SplashModule>(),
      get<_i184.AuthorizationModule>(),
      get<_i61.ChatModule>(),
      get<_i207.SettingsModule>(),
      get<_i257.ProfileModule>(),
      get<_i252.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i255.NewShipmentsModule>(),
      get<_i264.TrackingModule>(),
      get<_i194.EditShipmentModule>(),
      get<_i192.CountryModule>(),
      get<_i193.DistributorsModule>(),
      get<_i258.ProxiesModule>(),
      get<_i263.SupplierModule>(),
      get<_i260.SubContractServiceModule>(),
      get<_i262.SubcontractModule>(),
      get<_i268.UnitModule>(),
      get<_i267.TravelModule>(),
      get<_i250.ContainerModule>(),
      get<_i277.AirwaybillModule>(),
      get<_i190.ContainerSpecificationModule>(),
      get<_i245.AirwaybillSpecificationModule>(),
      get<_i271.WaitingShipmentModule>(),
      get<_i278.AcceptedShipmentModule>(),
      get<_i246.ClientModule>(),
      get<_i256.ProductModule>(),
      get<_i261.SubProductModule>(),
      get<_i273.WarehouseModule>(),
      get<_i259.ReceiverModule>(),
      get<_i195.EmployeeModule>()));
  return get;
}
