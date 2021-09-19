// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i283;
import '../module_airwaybill/airwaybill_module.dart' as _i281;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i178;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i59;
import '../module_airwaybill/service/airwaybill_service.dart' as _i179;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i246;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i184;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i244;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i198;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i232;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i279;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i245;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i280;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i233;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i247;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i273;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i248;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i180;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i60;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i181;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i182;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i231;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i234;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i183;
import '../module_auth/authoriazation_module.dart' as _i185;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i39;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i96;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i186;
import '../module_chat/chat_module.dart' as _i62;
import '../module_chat/manager/chat/chat_manager.dart' as _i61;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i63;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i249;
import '../module_client/manager/client_manager.dart' as _i64;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i65;
import '../module_client/state_manager/client_state_manager.dart' as _i66;
import '../module_client/state_manager/new_client_state_manger.dart' as _i157;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i163;
import '../module_client/ui/screen/client_screen.dart' as _i187;
import '../module_container/container_module.dart' as _i253;
import '../module_container/manager/container_manager.dart' as _i67;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i68;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i189;
import '../module_container/state_manger/container_state_manager.dart' as _i73;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i188;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i199;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i159;
import '../module_container/ui/screen/container_details_screen.dart' as _i250;
import '../module_container/ui/screen/container_filter_screen.dart' as _i251;
import '../module_container/ui/screen/container_finance_screen.dart' as _i252;
import '../module_container/ui/screen/container_new_screen.dart' as _i164;
import '../module_container/ui/screen/container_screen.dart' as _i190;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i218;
import '../module_container_specification/container_specification_module.dart'
    as _i191;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i69;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i70;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i71;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i158;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i165;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i72;
import '../module_countries/country_module.dart' as _i193;
import '../module_countries/manager/country_manager.dart' as _i74;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i75;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i76;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i160;
import '../module_countries/ui/screen/countries_screen.dart' as _i192;
import '../module_countries/ui/screen/country_new_screen.dart' as _i166;
import '../module_distributors/distributors_module.dart' as _i194;
import '../module_distributors/manager/distributors_manager.dart' as _i77;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i78;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i79;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i161;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i167;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i80;
import '../module_edit_shipment/edit_shipment_module.dart' as _i254;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i81;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i82;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i195;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i196;
import '../module_employees/employe_module.dart' as _i197;
import '../module_employees/manager/employees_manager.dart' as _i83;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i84;
import '../module_employees/state_manger/employees_state_manager.dart' as _i85;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i162;
import '../module_employees/ui/screen/employees_screen.dart' as _i86;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i168;
import '../module_gunny/manager/gunny_manager.dart' as _i91;
import '../module_gunny/repository/gunny_repo.dart' as _i36;
import '../module_gunny/service/gunny_service.dart' as _i92;
import '../module_home/home_module.dart' as _i255;
import '../module_home/manager/home_manager.dart' as _i93;
import '../module_home/repository/home_repository.dart' as _i37;
import '../module_home/service/home_service.dart' as _i94;
import '../module_home/state_manager/state_manager_home.dart' as _i95;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i97;
import '../module_mark/mark_module.dart' as _i256;
import '../module_mark/repository/mark_repository.dart' as _i40;
import '../module_mark/service/mark_service.dart' as _i98;
import '../module_mark/state_manager/mark_state_manager.dart' as _i99;
import '../module_mark/ui/mark_screen.dart' as _i201;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i100;
import '../module_my_shipment/my_shipment_module.dart' as _i257;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i41;
import '../module_my_shipment/service/my_shipment_service.dart' as _i101;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i102;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i202;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i42;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i88;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_product_category/manager/product_category_manager.dart'
    as _i103;
import '../module_product_category/product_module.dart' as _i260;
import '../module_product_category/repository/product_category_repository.dart'
    as _i43;
import '../module_product_category/service/product_service.dart' as _i104;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i169;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i105;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i235;
import '../module_product_category/ui/screen/products_screen.dart' as _i203;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i123;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i50;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i124;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i172;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i125;
import '../module_product_sub_category/sub_product_module.dart' as _i265;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i238;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i220;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i211;
import '../module_profile/manager/profile_manager.dart' as _i106;
import '../module_profile/profile_module.dart' as _i261;
import '../module_profile/repository/profile_repository.dart' as _i44;
import '../module_profile/service/profile_service.dart' as _i107;
import '../module_profile/state_manager/profile_state_manager.dart' as _i108;
import '../module_profile/ui/profile_screen.dart' as _i204;
import '../module_proxies/manager/proxies_manager.dart' as _i109;
import '../module_proxies/proxies_module.dart' as _i262;
import '../module_proxies/repository/proxies_repository.dart' as _i45;
import '../module_proxies/service/proixes_service.dart' as _i110;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i170;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i111;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i205;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i236;
import '../module_receiver/manager/receiver_manager.dart' as _i112;
import '../module_receiver/recevier_module.dart' as _i263;
import '../module_receiver/repository/recevier_repository.dart' as _i46;
import '../module_receiver/service/receiver_service.dart' as _i113;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i114;
import '../module_receiver/ui/receiver_screen.dart' as _i206;
import '../module_report/manager/report_manager.dart' as _i115;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i47;
import '../module_report/service/report_service.dart' as _i116;
import '../module_settings/settings_module.dart' as _i209;
import '../module_settings/ui/settings_page/settings_page.dart' as _i118;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i89;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i35;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i90;
import '../module_shipment_request/shipment_request_module.dart' as _i259;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i208;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i117;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i258;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i207;
import '../module_shipment_track/manager/tracking_manager.dart' as _i133;
import '../module_shipment_track/repository/tracking_repository.dart' as _i53;
import '../module_shipment_track/service/tracking_service.dart' as _i134;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i135;
import '../module_shipment_track/tracking_module.dart' as _i268;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i213;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i282;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i152;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i58;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i153;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i154;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i155;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i156;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i230;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i87;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i223;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i227;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i228;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i229;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i278;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i151;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i274;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i143;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i56;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i144;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i145;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i146;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i147;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i224;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i275;
import '../module_splash/splash_module.dart' as _i119;
import '../module_splash/ui/screen/splash_screen.dart' as _i48;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i126;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i51;
import '../module_sub_contract/service/subcontract_service.dart' as _i127;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i173;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i128;
import '../module_sub_contract/subcontract_module.dart' as _i266;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i239;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i219;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i212;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i120;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i49;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i121;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i171;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i122;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i264;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i237;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i210;
import '../module_suppliers/manager/suppliers_manager.dart' as _i129;
import '../module_suppliers/repository/suppliers_repository.dart' as _i52;
import '../module_suppliers/service/suppliers_service.dart' as _i130;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i174;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i131;
import '../module_suppliers/supplier_module.dart' as _i267;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i240;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i132;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i136;
import '../module_travel/repository/travel_repository.dart' as _i54;
import '../module_travel/service/travel_service.dart' as _i137;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i214;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i200;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i175;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i216;
import '../module_travel/state_manger/travels_state_manager.dart' as _i138;
import '../module_travel/travel_module.dart' as _i271;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i269;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i215;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i270;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i241;
import '../module_travel/ui/screen/travel_screen.dart' as _i217;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i221;
import '../module_unit/manager/unit_manager.dart' as _i139;
import '../module_unit/repository/unit_repository.dart' as _i55;
import '../module_unit/service/unit_service.dart' as _i140;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i176;
import '../module_unit/state_manger/units_state_manager.dart' as _i141;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i242;
import '../module_unit/ui/screen/units_screen.dart' as _i142;
import '../module_unit/unit_module.dart' as _i272;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i38;
import '../module_warehouses/manager/warehouses_manager.dart' as _i148;
import '../module_warehouses/repository/warehouse_repository.dart' as _i57;
import '../module_warehouses/service/warehouse_service.dart' as _i149;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i177;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i225;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i150;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i276;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i243;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i226;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i222;
import '../module_warehouses/warehouse_module.dart' as _i277;
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
  gh.factory<_i36.GunnyRepository>(() =>
      _i36.GunnyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i37.HomeRepository>(() =>
      _i37.HomeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i38.ImageUploadService>(
      () => _i38.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i39.LoginStateManager>(
      () => _i39.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i40.MarkRepository>(() =>
      _i40.MarkRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i41.MyShipmentRepository>(() => _i41.MyShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i42.NotificationRepo>(() =>
      _i42.NotificationRepo(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i43.ProductRepository>(() =>
      _i43.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i44.ProfileRepository>(() =>
      _i44.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i45.ProxyRepository>(() =>
      _i45.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i46.ReceiverRepository>(() =>
      _i46.ReceiverRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i47.ReportRepository>(() => _i47.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i48.SplashScreen>(
      () => _i48.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i49.SubContractServiceRepository>(() =>
      _i49.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i50.SubProductRepository>(() => _i50.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.SubcontractRepository>(() => _i51.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.SupplierRepository>(() =>
      _i52.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.TrackingRepository>(() =>
      _i53.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.TravelRepository>(() =>
      _i54.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.UnitRepository>(() =>
      _i55.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.WaitingShipmentRepository>(() =>
      _i56.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.WarehousesRepository>(() => _i57.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.AcceptedShipmentRepository>(() =>
      _i58.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.AirwaybillRepository>(() => _i59.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.AirwaybillSpecificationRepository>(() =>
      _i60.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.ChatManager>(
      () => _i61.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i62.ChatModule>(() => _i62.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i63.ChatService>(() => _i63.ChatService(get<_i61.ChatManager>()));
  gh.factory<_i64.ClientManager>(
      () => _i64.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i65.ClientService>(
      () => _i65.ClientService(get<_i64.ClientManager>()));
  gh.factory<_i66.ClientsStateManager>(
      () => _i66.ClientsStateManager(get<_i65.ClientService>()));
  gh.factory<_i67.ContainerManager>(
      () => _i67.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i68.ContainerService>(
      () => _i68.ContainerService(get<_i67.ContainerManager>()));
  gh.factory<_i69.ContainerSpecificationManager>(() =>
      _i69.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i70.ContainerSpecificationService>(() =>
      _i70.ContainerSpecificationService(
          get<_i69.ContainerSpecificationManager>()));
  gh.factory<_i71.ContainerSpecificationStateManager>(() =>
      _i71.ContainerSpecificationStateManager(
          get<_i70.ContainerSpecificationService>()));
  gh.factory<_i72.ContainerSpecificationsScreen>(() =>
      _i72.ContainerSpecificationsScreen(
          get<_i71.ContainerSpecificationStateManager>()));
  gh.factory<_i73.ContainerStateManager>(
      () => _i73.ContainerStateManager(get<_i68.ContainerService>()));
  gh.factory<_i74.CountryManager>(
      () => _i74.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i75.CountryService>(
      () => _i75.CountryService(get<_i74.CountryManager>()));
  gh.factory<_i76.CountryStateManager>(
      () => _i76.CountryStateManager(get<_i75.CountryService>()));
  gh.factory<_i77.DistributorManager>(
      () => _i77.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i78.DistributorService>(
      () => _i78.DistributorService(get<_i77.DistributorManager>()));
  gh.factory<_i79.DistributorStateManager>(
      () => _i79.DistributorStateManager(get<_i78.DistributorService>()));
  gh.factory<_i80.DistributorsScreen>(
      () => _i80.DistributorsScreen(get<_i79.DistributorStateManager>()));
  gh.factory<_i81.EditShipmentManager>(
      () => _i81.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i82.EditShipmentService>(
      () => _i82.EditShipmentService(get<_i81.EditShipmentManager>()));
  gh.factory<_i83.EmployeeManager>(
      () => _i83.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i84.EmployeeService>(
      () => _i84.EmployeeService(get<_i83.EmployeeManager>()));
  gh.factory<_i85.EmployeeStateManager>(
      () => _i85.EmployeeStateManager(get<_i84.EmployeeService>()));
  gh.factory<_i86.EmployeesScreen>(
      () => _i86.EmployeesScreen(get<_i85.EmployeeStateManager>()));
  gh.factory<_i87.FilterAcceptedShipmentStateManager>(() =>
      _i87.FilterAcceptedShipmentStateManager(
          get<_i75.CountryService>(), get<_i65.ClientService>()));
  gh.factory<_i88.FireNotificationService>(() => _i88.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i42.NotificationRepo>()));
  gh.factory<_i89.FirstOptionManager>(
      () => _i89.FirstOptionManager(get<_i35.FirstOptionRepository>()));
  gh.factory<_i90.FirstOptionService>(
      () => _i90.FirstOptionService(get<_i89.FirstOptionManager>()));
  gh.factory<_i91.GunnyManager>(
      () => _i91.GunnyManager(get<_i36.GunnyRepository>()));
  gh.factory<_i92.GunnyService>(
      () => _i92.GunnyService(get<_i91.GunnyManager>()));
  gh.factory<_i93.HomeManager>(
      () => _i93.HomeManager(get<_i37.HomeRepository>()));
  gh.factory<_i94.HomeService>(() => _i94.HomeService(get<_i93.HomeManager>()));
  gh.factory<_i95.HomeStateManager>(() => _i95.HomeStateManager(
      get<_i94.HomeService>(), get<_i84.EmployeeService>()));
  gh.factory<_i96.LoginScreen>(
      () => _i96.LoginScreen(get<_i39.LoginStateManager>()));
  gh.factory<_i97.MarkManager>(
      () => _i97.MarkManager(get<_i40.MarkRepository>()));
  gh.factory<_i98.MarkService>(() => _i98.MarkService(get<_i97.MarkManager>()));
  gh.factory<_i99.MarkStateManager>(() => _i99.MarkStateManager(
      get<_i98.MarkService>(), get<_i65.ClientService>()));
  gh.factory<_i100.MyShipmentManager>(
      () => _i100.MyShipmentManager(get<_i41.MyShipmentRepository>()));
  gh.factory<_i101.MyShipmentService>(
      () => _i101.MyShipmentService(get<_i100.MyShipmentManager>()));
  gh.factory<_i102.MyShipmentStateManger>(
      () => _i102.MyShipmentStateManger(get<_i101.MyShipmentService>()));
  gh.factory<_i103.ProductManager>(
      () => _i103.ProductManager(get<_i43.ProductRepository>()));
  gh.factory<_i104.ProductService>(
      () => _i104.ProductService(get<_i103.ProductManager>()));
  gh.factory<_i105.ProductStateManager>(
      () => _i105.ProductStateManager(get<_i104.ProductService>()));
  gh.factory<_i106.ProfileManager>(
      () => _i106.ProfileManager(get<_i44.ProfileRepository>()));
  gh.factory<_i107.ProfileService>(
      () => _i107.ProfileService(get<_i106.ProfileManager>()));
  gh.factory<_i108.ProfileStateManager>(
      () => _i108.ProfileStateManager(get<_i107.ProfileService>()));
  gh.factory<_i109.ProxyManager>(
      () => _i109.ProxyManager(get<_i45.ProxyRepository>()));
  gh.factory<_i110.ProxyService>(
      () => _i110.ProxyService(get<_i109.ProxyManager>()));
  gh.factory<_i111.ProxyStateManager>(
      () => _i111.ProxyStateManager(get<_i110.ProxyService>()));
  gh.factory<_i112.ReceiverManager>(
      () => _i112.ReceiverManager(get<_i46.ReceiverRepository>()));
  gh.factory<_i113.ReceiverService>(
      () => _i113.ReceiverService(get<_i112.ReceiverManager>()));
  gh.factory<_i114.ReceiverStateManager>(() => _i114.ReceiverStateManager(
      get<_i113.ReceiverService>(), get<_i65.ClientService>()));
  gh.factory<_i115.ReportManager>(
      () => _i115.ReportManager(get<_i47.ReportRepository>()));
  gh.factory<_i116.ReportService>(
      () => _i116.ReportService(get<_i115.ReportManager>()));
  gh.factory<_i117.ReviewShipmentStateManger>(() =>
      _i117.ReviewShipmentStateManger(
          get<_i90.FirstOptionService>(), get<_i38.ImageUploadService>()));
  gh.factory<_i118.SettingsScreen>(() => _i118.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i88.FireNotificationService>()));
  gh.factory<_i119.SplashModule>(
      () => _i119.SplashModule(get<_i48.SplashScreen>()));
  gh.factory<_i120.SubContractServiceManager>(() =>
      _i120.SubContractServiceManager(
          get<_i49.SubContractServiceRepository>()));
  gh.factory<_i121.SubContractServiceService>(() =>
      _i121.SubContractServiceService(get<_i120.SubContractServiceManager>()));
  gh.factory<_i122.SubContractServiceStateManager>(() =>
      _i122.SubContractServiceStateManager(
          get<_i121.SubContractServiceService>()));
  gh.factory<_i123.SubProductManager>(
      () => _i123.SubProductManager(get<_i50.SubProductRepository>()));
  gh.factory<_i124.SubProductService>(
      () => _i124.SubProductService(get<_i123.SubProductManager>()));
  gh.factory<_i125.SubProductStateManager>(
      () => _i125.SubProductStateManager(get<_i124.SubProductService>()));
  gh.factory<_i126.SubcontractManager>(
      () => _i126.SubcontractManager(get<_i51.SubcontractRepository>()));
  gh.factory<_i127.SubcontractService>(
      () => _i127.SubcontractService(get<_i126.SubcontractManager>()));
  gh.factory<_i128.SubcontractStateManager>(
      () => _i128.SubcontractStateManager(get<_i127.SubcontractService>()));
  gh.factory<_i129.SupplierManager>(
      () => _i129.SupplierManager(get<_i52.SupplierRepository>()));
  gh.factory<_i130.SupplierService>(
      () => _i130.SupplierService(get<_i129.SupplierManager>()));
  gh.factory<_i131.SupplierStateManager>(
      () => _i131.SupplierStateManager(get<_i130.SupplierService>()));
  gh.factory<_i132.SuppliersScreen>(
      () => _i132.SuppliersScreen(get<_i131.SupplierStateManager>()));
  gh.factory<_i133.TrackingManager>(
      () => _i133.TrackingManager(get<_i53.TrackingRepository>()));
  gh.factory<_i134.TrackingService>(
      () => _i134.TrackingService(get<_i133.TrackingManager>()));
  gh.factory<_i135.TrackingStateManager>(
      () => _i135.TrackingStateManager(get<_i134.TrackingService>()));
  gh.factory<_i136.TravelManager>(
      () => _i136.TravelManager(get<_i54.TravelRepository>()));
  gh.factory<_i137.TravelService>(
      () => _i137.TravelService(get<_i136.TravelManager>()));
  gh.factory<_i138.TravelStateManager>(
      () => _i138.TravelStateManager(get<_i137.TravelService>()));
  gh.factory<_i139.UnitManager>(
      () => _i139.UnitManager(get<_i55.UnitRepository>()));
  gh.factory<_i140.UnitService>(
      () => _i140.UnitService(get<_i139.UnitManager>()));
  gh.factory<_i141.UnitStateManager>(
      () => _i141.UnitStateManager(get<_i140.UnitService>()));
  gh.factory<_i142.UnitsScreen>(
      () => _i142.UnitsScreen(get<_i141.UnitStateManager>()));
  gh.factory<_i143.WaitingShipmentManager>(() =>
      _i143.WaitingShipmentManager(get<_i56.WaitingShipmentRepository>()));
  gh.factory<_i144.WaitingShipmentService>(
      () => _i144.WaitingShipmentService(get<_i143.WaitingShipmentManager>()));
  gh.factory<_i145.WaitingShipmentsDetailsStateManager>(() =>
      _i145.WaitingShipmentsDetailsStateManager(
          get<_i144.WaitingShipmentService>()));
  gh.factory<_i146.WaitingShipmentsStateManager>(() =>
      _i146.WaitingShipmentsStateManager(get<_i144.WaitingShipmentService>()));
  gh.factory<_i147.WantingShipmentDetailsScreen>(() =>
      _i147.WantingShipmentDetailsScreen(
          get<_i145.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i148.WarehouseManager>(
      () => _i148.WarehouseManager(get<_i57.WarehousesRepository>()));
  gh.factory<_i149.WarehouseService>(
      () => _i149.WarehouseService(get<_i148.WarehouseManager>()));
  gh.factory<_i150.WarehouseStateManager>(
      () => _i150.WarehouseStateManager(get<_i149.WarehouseService>()));
  gh.factory<_i151.AcceptedShipmentFilterScreen>(() =>
      _i151.AcceptedShipmentFilterScreen(
          get<_i87.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i152.AcceptedShipmentManager>(() =>
      _i152.AcceptedShipmentManager(get<_i58.AcceptedShipmentRepository>()));
  gh.factory<_i153.AcceptedShipmentService>(() =>
      _i153.AcceptedShipmentService(get<_i152.AcceptedShipmentManager>()));
  gh.factory<_i154.AcceptedShipmentsDetailsStateManager>(() =>
      _i154.AcceptedShipmentsDetailsStateManager(
          get<_i153.AcceptedShipmentService>(), get<_i68.ContainerService>()));
  gh.factory<_i155.AcceptedShipmentsFinanceStateManager>(() =>
      _i155.AcceptedShipmentsFinanceStateManager(
          get<_i153.AcceptedShipmentService>()));
  gh.factory<_i156.AcceptedShipmentsStateManager>(() =>
      _i156.AcceptedShipmentsStateManager(
          get<_i153.AcceptedShipmentService>()));
  gh.factory<_i157.AddClientStateManager>(
      () => _i157.AddClientStateManager(get<_i65.ClientService>()));
  gh.factory<_i158.AddContainerSpecificationStateManager>(() =>
      _i158.AddContainerSpecificationStateManager(
          get<_i70.ContainerSpecificationService>()));
  gh.factory<_i159.AddContainerStateManager>(() =>
      _i159.AddContainerStateManager(
          get<_i68.ContainerService>(),
          get<_i127.SubcontractService>(),
          get<_i70.ContainerSpecificationService>(),
          get<_i65.ClientService>()));
  gh.factory<_i160.AddCountryStateManager>(
      () => _i160.AddCountryStateManager(get<_i75.CountryService>()));
  gh.factory<_i161.AddDistributorStateManager>(
      () => _i161.AddDistributorStateManager(get<_i78.DistributorService>()));
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
      () => _i169.AddProductStateManager(get<_i104.ProductService>()));
  gh.factory<_i170.AddProxyStateManager>(
      () => _i170.AddProxyStateManager(get<_i110.ProxyService>()));
  gh.factory<_i171.AddSubContractServiceStateManager>(() =>
      _i171.AddSubContractServiceStateManager(
          get<_i121.SubContractServiceService>()));
  gh.factory<_i172.AddSubProductStateManager>(() =>
      _i172.AddSubProductStateManager(
          get<_i124.SubProductService>(), get<_i104.ProductService>()));
  gh.factory<_i173.AddSubcontractStateManager>(() =>
      _i173.AddSubcontractStateManager(get<_i121.SubContractServiceService>(),
          get<_i127.SubcontractService>()));
  gh.factory<_i174.AddSupplierStateManager>(
      () => _i174.AddSupplierStateManager(get<_i130.SupplierService>()));
  gh.factory<_i175.AddTravelStateManager>(() => _i175.AddTravelStateManager(
      get<_i137.TravelService>(),
      get<_i75.CountryService>(),
      get<_i127.SubcontractService>()));
  gh.factory<_i176.AddUnitStateManager>(
      () => _i176.AddUnitStateManager(get<_i140.UnitService>()));
  gh.factory<_i177.AddWarehouseStateManager>(() =>
      _i177.AddWarehouseStateManager(
          get<_i149.WarehouseService>(),
          get<_i127.SubcontractService>(),
          get<_i110.ProxyService>(),
          get<_i75.CountryService>()));
  gh.factory<_i178.AirwaybillManager>(
      () => _i178.AirwaybillManager(get<_i59.AirwaybillRepository>()));
  gh.factory<_i179.AirwaybillService>(
      () => _i179.AirwaybillService(get<_i178.AirwaybillManager>()));
  gh.factory<_i180.AirwaybillSpecificationManager>(() =>
      _i180.AirwaybillSpecificationManager(
          get<_i60.AirwaybillSpecificationRepository>()));
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
      () => _i185.AuthorizationModule(get<_i96.LoginScreen>()));
  gh.factory<_i186.ChatPageBloc>(
      () => _i186.ChatPageBloc(get<_i63.ChatService>()));
  gh.factory<_i187.ClientsScreen>(
      () => _i187.ClientsScreen(get<_i66.ClientsStateManager>()));
  gh.factory<_i188.ContainerDetailsStateManager>(() =>
      _i188.ContainerDetailsStateManager(
          get<_i68.ContainerService>(), get<_i137.TravelService>()));
  gh.factory<_i189.ContainerFinanceStateManager>(
      () => _i189.ContainerFinanceStateManager(get<_i68.ContainerService>()));
  gh.factory<_i190.ContainerScreen>(
      () => _i190.ContainerScreen(get<_i73.ContainerStateManager>()));
  gh.factory<_i191.ContainerSpecificationModule>(() =>
      _i191.ContainerSpecificationModule(
          get<_i72.ContainerSpecificationsScreen>(),
          get<_i165.AddNewContainerSpecification>()));
  gh.factory<_i192.CountriesScreen>(
      () => _i192.CountriesScreen(get<_i76.CountryStateManager>()));
  gh.factory<_i193.CountryModule>(() => _i193.CountryModule(
      get<_i192.CountriesScreen>(), get<_i166.AddNewCountry>()));
  gh.factory<_i194.DistributorsModule>(() => _i194.DistributorsModule(
      get<_i80.DistributorsScreen>(), get<_i167.AddNewDistributor>()));
  gh.factory<_i195.EditShipmentStateManager>(() =>
      _i195.EditShipmentStateManager(
          get<_i82.EditShipmentService>(),
          get<_i38.ImageUploadService>(),
          get<_i113.ReceiverService>(),
          get<_i98.MarkService>(),
          get<_i104.ProductService>(),
          get<_i78.DistributorService>(),
          get<_i140.UnitService>()));
  gh.factory<_i196.EditedShipmentScreen>(
      () => _i196.EditedShipmentScreen(get<_i195.EditShipmentStateManager>()));
  gh.factory<_i197.EmployeeModule>(() => _i197.EmployeeModule(
      get<_i86.EmployeesScreen>(), get<_i168.AddNewEmployee>()));
  gh.factory<_i198.FilterAirwaybillStateManager>(() =>
      _i198.FilterAirwaybillStateManager(get<_i127.SubcontractService>()));
  gh.factory<_i199.FilterContainerStateManager>(() =>
      _i199.FilterContainerStateManager(get<_i127.SubcontractService>(),
          get<_i70.ContainerSpecificationService>()));
  gh.factory<_i200.FilterTravelStateManager>(() =>
      _i200.FilterTravelStateManager(get<_i137.TravelService>(),
          get<_i75.CountryService>(), get<_i127.SubcontractService>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i95.HomeStateManager>()));
  gh.factory<_i201.MarkScreen>(
      () => _i201.MarkScreen(get<_i99.MarkStateManager>()));
  gh.factory<_i202.MyShipmentScreen>(
      () => _i202.MyShipmentScreen(get<_i102.MyShipmentStateManger>()));
  gh.factory<_i203.ProductScreen>(
      () => _i203.ProductScreen(get<_i105.ProductStateManager>()));
  gh.factory<_i204.ProfileScreen>(
      () => _i204.ProfileScreen(get<_i108.ProfileStateManager>()));
  gh.factory<_i205.ProxiesScreen>(
      () => _i205.ProxiesScreen(get<_i111.ProxyStateManager>()));
  gh.factory<_i206.ReceiverScreen>(
      () => _i206.ReceiverScreen(get<_i114.ReceiverStateManager>()));
  gh.factory<_i207.RequestShipmentReview>(() =>
      _i207.RequestShipmentReview(get<_i117.ReviewShipmentStateManger>()));
  gh.factory<_i208.RequestShipmentStateManger>(() =>
      _i208.RequestShipmentStateManger(
          get<_i90.FirstOptionService>(),
          get<_i98.MarkService>(),
          get<_i65.ClientService>(),
          get<_i78.DistributorService>(),
          get<_i113.ReceiverService>(),
          get<_i140.UnitService>(),
          get<_i70.ContainerSpecificationService>(),
          get<_i181.AirwaybillSpecificationService>()));
  gh.factory<_i209.SettingsModule>(
      () => _i209.SettingsModule(get<_i118.SettingsScreen>()));
  gh.factory<_i210.SubContractServiceScreen>(() =>
      _i210.SubContractServiceScreen(
          get<_i122.SubContractServiceStateManager>()));
  gh.factory<_i211.SubProductScreen>(
      () => _i211.SubProductScreen(get<_i125.SubProductStateManager>()));
  gh.factory<_i212.SubcontractScreen>(
      () => _i212.SubcontractScreen(get<_i128.SubcontractStateManager>()));
  gh.factory<_i213.TrackingScreen>(
      () => _i213.TrackingScreen(get<_i135.TrackingStateManager>()));
  gh.factory<_i214.TravelDetailsStateManager>(
      () => _i214.TravelDetailsStateManager(get<_i137.TravelService>()));
  gh.factory<_i215.TravelFilterScreen>(
      () => _i215.TravelFilterScreen(get<_i200.FilterTravelStateManager>()));
  gh.factory<_i216.TravelFinanceStateManager>(
      () => _i216.TravelFinanceStateManager(get<_i137.TravelService>()));
  gh.factory<_i217.TravelScreen>(
      () => _i217.TravelScreen(get<_i138.TravelStateManager>()));
  gh.factory<_i218.UpdateContainer>(
      () => _i218.UpdateContainer(get<_i159.AddContainerStateManager>()));
  gh.factory<_i219.UpdateSubContract>(
      () => _i219.UpdateSubContract(get<_i173.AddSubcontractStateManager>()));
  gh.factory<_i220.UpdateSubProduct>(
      () => _i220.UpdateSubProduct(get<_i172.AddSubProductStateManager>()));
  gh.factory<_i221.UpdateTravel>(
      () => _i221.UpdateTravel(get<_i175.AddTravelStateManager>()));
  gh.factory<_i222.UpdateWarehouse>(
      () => _i222.UpdateWarehouse(get<_i177.AddWarehouseStateManager>()));
  gh.factory<_i223.ViewWarehousesStateManager>(
      () => _i223.ViewWarehousesStateManager(get<_i149.WarehouseService>()));
  gh.factory<_i224.WaitingShipmentScreen>(() =>
      _i224.WaitingShipmentScreen(get<_i146.WaitingShipmentsStateManager>()));
  gh.factory<_i225.WarehouseFinanceStateManager>(
      () => _i225.WarehouseFinanceStateManager(get<_i149.WarehouseService>()));
  gh.factory<_i226.WarehouseScreen>(
      () => _i226.WarehouseScreen(get<_i150.WarehouseStateManager>()));
  gh.factory<_i227.AcceptedShipmentDetailsScreen>(() =>
      _i227.AcceptedShipmentDetailsScreen(
          get<_i154.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i228.AcceptedShipmentFinanceScreen>(() =>
      _i228.AcceptedShipmentFinanceScreen(
          get<_i155.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i229.AcceptedShipmentScreen>(() =>
      _i229.AcceptedShipmentScreen(get<_i156.AcceptedShipmentsStateManager>()));
  gh.factory<_i230.AcceptedShipmentsStatusStateManager>(() =>
      _i230.AcceptedShipmentsStatusStateManager(
          get<_i153.AcceptedShipmentService>(),
          get<_i127.SubcontractService>(),
          get<_i68.ContainerService>(),
          get<_i137.TravelService>(),
          get<_i149.WarehouseService>(),
          get<_i179.AirwaybillService>(),
          get<_i92.GunnyService>()));
  gh.factory<_i231.AddAirwaybillSpecificationStateManager>(() =>
      _i231.AddAirwaybillSpecificationStateManager(
          get<_i181.AirwaybillSpecificationService>()));
  gh.factory<_i232.AddAirwaybillStateManager>(() =>
      _i232.AddAirwaybillStateManager(
          get<_i179.AirwaybillService>(),
          get<_i127.SubcontractService>(),
          get<_i181.AirwaybillSpecificationService>(),
          get<_i65.ClientService>()));
  gh.factory<_i233.AddNewAirwaybill>(
      () => _i233.AddNewAirwaybill(get<_i232.AddAirwaybillStateManager>()));
  gh.factory<_i234.AddNewAirwaybillSpecification>(() =>
      _i234.AddNewAirwaybillSpecification(
          get<_i231.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i235.AddNewProduct>(
      () => _i235.AddNewProduct(get<_i169.AddProductStateManager>()));
  gh.factory<_i236.AddNewProxy>(
      () => _i236.AddNewProxy(get<_i170.AddProxyStateManager>()));
  gh.factory<_i237.AddNewSubContractService>(() =>
      _i237.AddNewSubContractService(
          get<_i171.AddSubContractServiceStateManager>()));
  gh.factory<_i238.AddNewSubProduct>(
      () => _i238.AddNewSubProduct(get<_i172.AddSubProductStateManager>()));
  gh.factory<_i239.AddNewSubcontract>(
      () => _i239.AddNewSubcontract(get<_i173.AddSubcontractStateManager>()));
  gh.factory<_i240.AddNewSupplier>(
      () => _i240.AddNewSupplier(get<_i174.AddSupplierStateManager>()));
  gh.factory<_i241.AddNewTravel>(
      () => _i241.AddNewTravel(get<_i175.AddTravelStateManager>()));
  gh.factory<_i242.AddNewUnit>(
      () => _i242.AddNewUnit(get<_i176.AddUnitStateManager>()));
  gh.factory<_i243.AddNewWarehouse>(
      () => _i243.AddNewWarehouse(get<_i177.AddWarehouseStateManager>()));
  gh.factory<_i244.AirwaybillDetailsStateManager>(() =>
      _i244.AirwaybillDetailsStateManager(
          get<_i179.AirwaybillService>(), get<_i137.TravelService>()));
  gh.factory<_i245.AirwaybillFilterScreen>(() =>
      _i245.AirwaybillFilterScreen(get<_i198.FilterAirwaybillStateManager>()));
  gh.factory<_i246.AirwaybillFinanceStateManager>(() =>
      _i246.AirwaybillFinanceStateManager(get<_i179.AirwaybillService>()));
  gh.factory<_i247.AirwaybillScreen>(
      () => _i247.AirwaybillScreen(get<_i184.AirwaybillStateManager>()));
  gh.factory<_i248.AirwaybillSpecificationModule>(() =>
      _i248.AirwaybillSpecificationModule(
          get<_i183.AirwaybillSpecificationsScreen>(),
          get<_i234.AddNewAirwaybillSpecification>()));
  gh.factory<_i249.ClientModule>(() => _i249.ClientModule(
      get<_i187.ClientsScreen>(), get<_i163.AddNewClient>()));
  gh.factory<_i250.ContainerDetailsScreen>(() =>
      _i250.ContainerDetailsScreen(get<_i188.ContainerDetailsStateManager>()));
  gh.factory<_i251.ContainerFilterScreen>(() =>
      _i251.ContainerFilterScreen(get<_i199.FilterContainerStateManager>()));
  gh.factory<_i252.ContainerFinanceScreen>(() =>
      _i252.ContainerFinanceScreen(get<_i189.ContainerFinanceStateManager>()));
  gh.factory<_i253.ContainerModule>(() => _i253.ContainerModule(
      get<_i190.ContainerScreen>(),
      get<_i164.AddNewContainer>(),
      get<_i251.ContainerFilterScreen>(),
      get<_i250.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i252.ContainerFinanceScreen>(),
      get<_i218.UpdateContainer>()));
  gh.factory<_i254.EditShipmentModule>(
      () => _i254.EditShipmentModule(get<_i196.EditedShipmentScreen>()));
  gh.factory<_i255.HomeModule>(
      () => _i255.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i256.MarkModule>(() => _i256.MarkModule(get<_i201.MarkScreen>()));
  gh.factory<_i257.MyShipmentModule>(() => _i257.MyShipmentModule(
      get<_i202.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i258.NewShipment>(
      () => _i258.NewShipment(get<_i208.RequestShipmentStateManger>()));
  gh.factory<_i259.NewShipmentsModule>(() => _i259.NewShipmentsModule(
      get<_i258.NewShipment>(), get<_i207.RequestShipmentReview>()));
  gh.factory<_i260.ProductModule>(() => _i260.ProductModule(
      get<_i203.ProductScreen>(), get<_i235.AddNewProduct>()));
  gh.factory<_i261.ProfileModule>(
      () => _i261.ProfileModule(get<_i204.ProfileScreen>()));
  gh.factory<_i262.ProxiesModule>(() => _i262.ProxiesModule(
      get<_i205.ProxiesScreen>(), get<_i236.AddNewProxy>()));
  gh.factory<_i263.ReceiverModule>(
      () => _i263.ReceiverModule(get<_i206.ReceiverScreen>()));
  gh.factory<_i264.SubContractServiceModule>(() =>
      _i264.SubContractServiceModule(get<_i210.SubContractServiceScreen>(),
          get<_i237.AddNewSubContractService>()));
  gh.factory<_i265.SubProductModule>(() => _i265.SubProductModule(
      get<_i211.SubProductScreen>(),
      get<_i238.AddNewSubProduct>(),
      get<_i220.UpdateSubProduct>()));
  gh.factory<_i266.SubcontractModule>(() => _i266.SubcontractModule(
      get<_i212.SubcontractScreen>(),
      get<_i239.AddNewSubcontract>(),
      get<_i219.UpdateSubContract>()));
  gh.factory<_i267.SupplierModule>(() => _i267.SupplierModule(
      get<_i132.SuppliersScreen>(), get<_i240.AddNewSupplier>()));
  gh.factory<_i268.TrackingModule>(
      () => _i268.TrackingModule(get<_i213.TrackingScreen>()));
  gh.factory<_i269.TravelDetailsScreen>(
      () => _i269.TravelDetailsScreen(get<_i214.TravelDetailsStateManager>()));
  gh.factory<_i270.TravelFinanceScreen>(
      () => _i270.TravelFinanceScreen(get<_i216.TravelFinanceStateManager>()));
  gh.factory<_i271.TravelModule>(() => _i271.TravelModule(
      get<_i217.TravelScreen>(),
      get<_i241.AddNewTravel>(),
      get<_i215.TravelFilterScreen>(),
      get<_i269.TravelDetailsScreen>(),
      get<_i270.TravelFinanceScreen>(),
      get<_i221.UpdateTravel>()));
  gh.factory<_i272.UnitModule>(() =>
      _i272.UnitModule(get<_i142.UnitsScreen>(), get<_i242.AddNewUnit>()));
  gh.factory<_i273.UpdateAirwaybill>(
      () => _i273.UpdateAirwaybill(get<_i232.AddAirwaybillStateManager>()));
  gh.factory<_i274.ViewWarehouseScreen>(
      () => _i274.ViewWarehouseScreen(get<_i223.ViewWarehousesStateManager>()));
  gh.factory<_i275.WaitingShipmentModule>(() => _i275.WaitingShipmentModule(
      get<_i224.WaitingShipmentScreen>(),
      get<_i147.WantingShipmentDetailsScreen>()));
  gh.factory<_i276.WarehouseFinanceScreen>(() =>
      _i276.WarehouseFinanceScreen(get<_i225.WarehouseFinanceStateManager>()));
  gh.factory<_i277.WarehouseModule>(() => _i277.WarehouseModule(
      get<_i226.WarehouseScreen>(),
      get<_i243.AddNewWarehouse>(),
      get<_i276.WarehouseFinanceScreen>(),
      get<_i222.UpdateWarehouse>()));
  gh.factory<_i278.AcceptedShipmentStatusScreen>(() =>
      _i278.AcceptedShipmentStatusScreen(
          get<_i230.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i279.AirwaybillDetailsScreen>(() => _i279.AirwaybillDetailsScreen(
      get<_i244.AirwaybillDetailsStateManager>()));
  gh.factory<_i280.AirwaybillFinanceScreen>(() => _i280.AirwaybillFinanceScreen(
      get<_i246.AirwaybillFinanceStateManager>()));
  gh.factory<_i281.AirwaybillModule>(() => _i281.AirwaybillModule(
      get<_i247.AirwaybillScreen>(),
      get<_i233.AddNewAirwaybill>(),
      get<_i245.AirwaybillFilterScreen>(),
      get<_i279.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i280.AirwaybillFinanceScreen>(),
      get<_i273.UpdateAirwaybill>()));
  gh.factory<_i282.AcceptedShipmentModule>(() => _i282.AcceptedShipmentModule(
      get<_i229.AcceptedShipmentScreen>(),
      get<_i227.AcceptedShipmentDetailsScreen>(),
      get<_i151.AcceptedShipmentFilterScreen>(),
      get<_i278.AcceptedShipmentStatusScreen>(),
      get<_i228.AcceptedShipmentFinanceScreen>(),
      get<_i274.ViewWarehouseScreen>()));
  gh.factory<_i283.MyApp>(() => _i283.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i88.FireNotificationService>(),
      get<_i255.HomeModule>(),
      get<_i119.SplashModule>(),
      get<_i185.AuthorizationModule>(),
      get<_i62.ChatModule>(),
      get<_i209.SettingsModule>(),
      get<_i261.ProfileModule>(),
      get<_i256.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i259.NewShipmentsModule>(),
      get<_i268.TrackingModule>(),
      get<_i254.EditShipmentModule>(),
      get<_i193.CountryModule>(),
      get<_i194.DistributorsModule>(),
      get<_i262.ProxiesModule>(),
      get<_i267.SupplierModule>(),
      get<_i264.SubContractServiceModule>(),
      get<_i266.SubcontractModule>(),
      get<_i272.UnitModule>(),
      get<_i271.TravelModule>(),
      get<_i253.ContainerModule>(),
      get<_i281.AirwaybillModule>(),
      get<_i191.ContainerSpecificationModule>(),
      get<_i248.AirwaybillSpecificationModule>(),
      get<_i275.WaitingShipmentModule>(),
      get<_i282.AcceptedShipmentModule>(),
      get<_i249.ClientModule>(),
      get<_i260.ProductModule>(),
      get<_i265.SubProductModule>(),
      get<_i277.WarehouseModule>(),
      get<_i263.ReceiverModule>(),
      get<_i197.EmployeeModule>()));
  return get;
}
