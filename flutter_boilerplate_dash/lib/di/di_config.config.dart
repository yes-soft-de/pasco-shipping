// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i291;
import '../module_airwaybill/airwaybill_module.dart' as _i289;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i185;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i60;
import '../module_airwaybill/service/airwaybill_service.dart' as _i186;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i254;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i191;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i252;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i205;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i240;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i287;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i253;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i288;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i241;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i255;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i281;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i256;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i187;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i61;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i188;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i189;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i239;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i242;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i190;
import '../module_auth/authoriazation_module.dart' as _i192;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i40;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i101;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i193;
import '../module_chat/chat_module.dart' as _i63;
import '../module_chat/manager/chat/chat_manager.dart' as _i62;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i64;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i257;
import '../module_client/manager/client_manager.dart' as _i65;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i66;
import '../module_client/state_manager/client_state_manager.dart' as _i67;
import '../module_client/state_manager/new_client_state_manger.dart' as _i162;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i169;
import '../module_client/ui/screen/client_screen.dart' as _i194;
import '../module_container/container_module.dart' as _i261;
import '../module_container/manager/container_manager.dart' as _i68;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i69;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i196;
import '../module_container/state_manger/container_state_manager.dart' as _i74;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i195;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i206;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i164;
import '../module_container/ui/screen/container_details_screen.dart' as _i258;
import '../module_container/ui/screen/container_filter_screen.dart' as _i259;
import '../module_container/ui/screen/container_finance_screen.dart' as _i260;
import '../module_container/ui/screen/container_new_screen.dart' as _i170;
import '../module_container/ui/screen/container_screen.dart' as _i197;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i226;
import '../module_container_specification/container_specification_module.dart'
    as _i198;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i70;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i71;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i72;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i163;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i171;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i73;
import '../module_countries/country_module.dart' as _i200;
import '../module_countries/manager/country_manager.dart' as _i75;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i76;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i77;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i165;
import '../module_countries/ui/screen/countries_screen.dart' as _i199;
import '../module_countries/ui/screen/country_new_screen.dart' as _i172;
import '../module_distributors/distributors_module.dart' as _i201;
import '../module_distributors/manager/distributors_manager.dart' as _i78;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i79;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i80;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i166;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i173;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i81;
import '../module_edit_shipment/edit_shipment_module.dart' as _i262;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i82;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i83;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i202;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i203;
import '../module_employees/employe_module.dart' as _i204;
import '../module_employees/manager/employees_manager.dart' as _i84;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i85;
import '../module_employees/state_manger/employees_state_manager.dart' as _i86;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i167;
import '../module_employees/ui/screen/employees_screen.dart' as _i87;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i174;
import '../module_gunny/manager/gunny_manager.dart' as _i92;
import '../module_gunny/repository/gunny_repo.dart' as _i36;
import '../module_gunny/service/gunny_service.dart' as _i93;
import '../module_harbor/harbor_module.dart' as _i208;
import '../module_harbor/manager/harbor_manager.dart' as _i94;
import '../module_harbor/repository/harbor_repository.dart' as _i37;
import '../module_harbor/service/harbor_service.dart' as _i95;
import '../module_harbor/state_manger/harbors_state_manager.dart' as _i96;
import '../module_harbor/state_manger/new_harbor_state_manger.dart' as _i168;
import '../module_harbor/ui/screen/harbors_new_screen.dart' as _i175;
import '../module_harbor/ui/screen/harbors_screen.dart' as _i97;
import '../module_home/home_module.dart' as _i263;
import '../module_home/manager/home_manager.dart' as _i98;
import '../module_home/repository/home_repository.dart' as _i38;
import '../module_home/service/home_service.dart' as _i99;
import '../module_home/state_manager/state_manager_home.dart' as _i100;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i102;
import '../module_mark/mark_module.dart' as _i264;
import '../module_mark/repository/mark_repository.dart' as _i41;
import '../module_mark/service/mark_service.dart' as _i103;
import '../module_mark/state_manager/mark_state_manager.dart' as _i104;
import '../module_mark/ui/mark_screen.dart' as _i209;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i105;
import '../module_my_shipment/my_shipment_module.dart' as _i265;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i42;
import '../module_my_shipment/service/my_shipment_service.dart' as _i106;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i107;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i210;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i43;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i89;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_product_category/manager/product_category_manager.dart'
    as _i108;
import '../module_product_category/product_module.dart' as _i268;
import '../module_product_category/repository/product_category_repository.dart'
    as _i44;
import '../module_product_category/service/product_service.dart' as _i109;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i176;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i110;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i243;
import '../module_product_category/ui/screen/products_screen.dart' as _i211;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i128;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i51;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i129;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i179;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i130;
import '../module_product_sub_category/sub_product_module.dart' as _i273;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i246;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i228;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i219;
import '../module_profile/manager/profile_manager.dart' as _i111;
import '../module_profile/profile_module.dart' as _i269;
import '../module_profile/repository/profile_repository.dart' as _i45;
import '../module_profile/service/profile_service.dart' as _i112;
import '../module_profile/state_manager/profile_state_manager.dart' as _i113;
import '../module_profile/ui/profile_screen.dart' as _i212;
import '../module_proxies/manager/proxies_manager.dart' as _i114;
import '../module_proxies/proxies_module.dart' as _i270;
import '../module_proxies/repository/proxies_repository.dart' as _i46;
import '../module_proxies/service/proixes_service.dart' as _i115;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i177;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i116;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i213;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i244;
import '../module_receiver/manager/receiver_manager.dart' as _i117;
import '../module_receiver/recevier_module.dart' as _i271;
import '../module_receiver/repository/recevier_repository.dart' as _i47;
import '../module_receiver/service/receiver_service.dart' as _i118;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i119;
import '../module_receiver/ui/receiver_screen.dart' as _i214;
import '../module_report/manager/report_manager.dart' as _i120;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i48;
import '../module_report/service/report_service.dart' as _i121;
import '../module_settings/settings_module.dart' as _i217;
import '../module_settings/ui/settings_page/settings_page.dart' as _i123;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i90;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i35;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i91;
import '../module_shipment_request/shipment_request_module.dart' as _i267;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i216;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i122;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i266;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i215;
import '../module_shipment_track/manager/tracking_manager.dart' as _i138;
import '../module_shipment_track/repository/tracking_repository.dart' as _i54;
import '../module_shipment_track/service/tracking_service.dart' as _i139;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i140;
import '../module_shipment_track/tracking_module.dart' as _i276;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i221;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i290;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i157;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i59;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i158;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i159;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i160;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i161;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i238;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i88;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i231;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i235;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i236;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i237;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i286;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i156;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i282;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i148;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i57;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i149;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i150;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i151;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i152;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i232;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i283;
import '../module_splash/splash_module.dart' as _i124;
import '../module_splash/ui/screen/splash_screen.dart' as _i49;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i131;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i52;
import '../module_sub_contract/service/subcontract_service.dart' as _i132;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i180;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i133;
import '../module_sub_contract/subcontract_module.dart' as _i274;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i247;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i227;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i220;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i125;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i50;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i126;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i178;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i127;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i272;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i245;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i218;
import '../module_suppliers/manager/suppliers_manager.dart' as _i134;
import '../module_suppliers/repository/suppliers_repository.dart' as _i53;
import '../module_suppliers/service/suppliers_service.dart' as _i135;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i181;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i136;
import '../module_suppliers/supplier_module.dart' as _i275;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i248;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i137;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i141;
import '../module_travel/repository/travel_repository.dart' as _i55;
import '../module_travel/service/travel_service.dart' as _i142;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i222;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i207;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i182;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i224;
import '../module_travel/state_manger/travels_state_manager.dart' as _i143;
import '../module_travel/travel_module.dart' as _i279;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i277;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i223;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i278;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i249;
import '../module_travel/ui/screen/travel_screen.dart' as _i225;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i229;
import '../module_unit/manager/unit_manager.dart' as _i144;
import '../module_unit/repository/unit_repository.dart' as _i56;
import '../module_unit/service/unit_service.dart' as _i145;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i183;
import '../module_unit/state_manger/units_state_manager.dart' as _i146;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i250;
import '../module_unit/ui/screen/units_screen.dart' as _i147;
import '../module_unit/unit_module.dart' as _i280;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i39;
import '../module_warehouses/manager/warehouses_manager.dart' as _i153;
import '../module_warehouses/repository/warehouse_repository.dart' as _i58;
import '../module_warehouses/service/warehouse_service.dart' as _i154;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i184;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i233;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i155;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i284;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i251;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i234;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i230;
import '../module_warehouses/warehouse_module.dart' as _i285;
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
  gh.factory<_i37.HarborRepository>(() =>
      _i37.HarborRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i38.HomeRepository>(() =>
      _i38.HomeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i39.ImageUploadService>(
      () => _i39.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i40.LoginStateManager>(
      () => _i40.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i41.MarkRepository>(() =>
      _i41.MarkRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i42.MyShipmentRepository>(() => _i42.MyShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i43.NotificationRepo>(() =>
      _i43.NotificationRepo(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i44.ProductRepository>(() =>
      _i44.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i45.ProfileRepository>(() =>
      _i45.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i46.ProxyRepository>(() =>
      _i46.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i47.ReceiverRepository>(() =>
      _i47.ReceiverRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i48.ReportRepository>(() => _i48.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i49.SplashScreen>(
      () => _i49.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i50.SubContractServiceRepository>(() =>
      _i50.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.SubProductRepository>(() => _i51.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.SubcontractRepository>(() => _i52.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.SupplierRepository>(() =>
      _i53.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.TrackingRepository>(() =>
      _i54.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.TravelRepository>(() =>
      _i55.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.UnitRepository>(() =>
      _i56.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.WaitingShipmentRepository>(() =>
      _i57.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.WarehousesRepository>(() => _i58.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.AcceptedShipmentRepository>(() =>
      _i59.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.AirwaybillRepository>(() => _i60.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.AirwaybillSpecificationRepository>(() =>
      _i61.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i62.ChatManager>(
      () => _i62.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i63.ChatModule>(() => _i63.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i64.ChatService>(() => _i64.ChatService(get<_i62.ChatManager>()));
  gh.factory<_i65.ClientManager>(
      () => _i65.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i66.ClientService>(
      () => _i66.ClientService(get<_i65.ClientManager>()));
  gh.factory<_i67.ClientsStateManager>(
      () => _i67.ClientsStateManager(get<_i66.ClientService>()));
  gh.factory<_i68.ContainerManager>(
      () => _i68.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i69.ContainerService>(
      () => _i69.ContainerService(get<_i68.ContainerManager>()));
  gh.factory<_i70.ContainerSpecificationManager>(() =>
      _i70.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i71.ContainerSpecificationService>(() =>
      _i71.ContainerSpecificationService(
          get<_i70.ContainerSpecificationManager>()));
  gh.factory<_i72.ContainerSpecificationStateManager>(() =>
      _i72.ContainerSpecificationStateManager(
          get<_i71.ContainerSpecificationService>()));
  gh.factory<_i73.ContainerSpecificationsScreen>(() =>
      _i73.ContainerSpecificationsScreen(
          get<_i72.ContainerSpecificationStateManager>()));
  gh.factory<_i74.ContainerStateManager>(
      () => _i74.ContainerStateManager(get<_i69.ContainerService>()));
  gh.factory<_i75.CountryManager>(
      () => _i75.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i76.CountryService>(
      () => _i76.CountryService(get<_i75.CountryManager>()));
  gh.factory<_i77.CountryStateManager>(
      () => _i77.CountryStateManager(get<_i76.CountryService>()));
  gh.factory<_i78.DistributorManager>(
      () => _i78.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i79.DistributorService>(
      () => _i79.DistributorService(get<_i78.DistributorManager>()));
  gh.factory<_i80.DistributorStateManager>(
      () => _i80.DistributorStateManager(get<_i79.DistributorService>()));
  gh.factory<_i81.DistributorsScreen>(
      () => _i81.DistributorsScreen(get<_i80.DistributorStateManager>()));
  gh.factory<_i82.EditShipmentManager>(
      () => _i82.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i83.EditShipmentService>(
      () => _i83.EditShipmentService(get<_i82.EditShipmentManager>()));
  gh.factory<_i84.EmployeeManager>(
      () => _i84.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i85.EmployeeService>(
      () => _i85.EmployeeService(get<_i84.EmployeeManager>()));
  gh.factory<_i86.EmployeeStateManager>(
      () => _i86.EmployeeStateManager(get<_i85.EmployeeService>()));
  gh.factory<_i87.EmployeesScreen>(
      () => _i87.EmployeesScreen(get<_i86.EmployeeStateManager>()));
  gh.factory<_i88.FilterAcceptedShipmentStateManager>(() =>
      _i88.FilterAcceptedShipmentStateManager(
          get<_i76.CountryService>(), get<_i66.ClientService>()));
  gh.factory<_i89.FireNotificationService>(() => _i89.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i43.NotificationRepo>()));
  gh.factory<_i90.FirstOptionManager>(
      () => _i90.FirstOptionManager(get<_i35.FirstOptionRepository>()));
  gh.factory<_i91.FirstOptionService>(
      () => _i91.FirstOptionService(get<_i90.FirstOptionManager>()));
  gh.factory<_i92.GunnyManager>(
      () => _i92.GunnyManager(get<_i36.GunnyRepository>()));
  gh.factory<_i93.GunnyService>(
      () => _i93.GunnyService(get<_i92.GunnyManager>()));
  gh.factory<_i94.HarborManager>(
      () => _i94.HarborManager(get<_i37.HarborRepository>()));
  gh.factory<_i95.HarborService>(
      () => _i95.HarborService(get<_i94.HarborManager>()));
  gh.factory<_i96.HarborStateManager>(
      () => _i96.HarborStateManager(get<_i95.HarborService>()));
  gh.factory<_i97.HarborsScreen>(
      () => _i97.HarborsScreen(get<_i96.HarborStateManager>()));
  gh.factory<_i98.HomeManager>(
      () => _i98.HomeManager(get<_i38.HomeRepository>()));
  gh.factory<_i99.HomeService>(() => _i99.HomeService(get<_i98.HomeManager>()));
  gh.factory<_i100.HomeStateManager>(() => _i100.HomeStateManager(
      get<_i99.HomeService>(), get<_i85.EmployeeService>()));
  gh.factory<_i101.LoginScreen>(
      () => _i101.LoginScreen(get<_i40.LoginStateManager>()));
  gh.factory<_i102.MarkManager>(
      () => _i102.MarkManager(get<_i41.MarkRepository>()));
  gh.factory<_i103.MarkService>(
      () => _i103.MarkService(get<_i102.MarkManager>()));
  gh.factory<_i104.MarkStateManager>(() => _i104.MarkStateManager(
      get<_i103.MarkService>(), get<_i66.ClientService>()));
  gh.factory<_i105.MyShipmentManager>(
      () => _i105.MyShipmentManager(get<_i42.MyShipmentRepository>()));
  gh.factory<_i106.MyShipmentService>(
      () => _i106.MyShipmentService(get<_i105.MyShipmentManager>()));
  gh.factory<_i107.MyShipmentStateManger>(
      () => _i107.MyShipmentStateManger(get<_i106.MyShipmentService>()));
  gh.factory<_i108.ProductManager>(
      () => _i108.ProductManager(get<_i44.ProductRepository>()));
  gh.factory<_i109.ProductService>(
      () => _i109.ProductService(get<_i108.ProductManager>()));
  gh.factory<_i110.ProductStateManager>(
      () => _i110.ProductStateManager(get<_i109.ProductService>()));
  gh.factory<_i111.ProfileManager>(
      () => _i111.ProfileManager(get<_i45.ProfileRepository>()));
  gh.factory<_i112.ProfileService>(
      () => _i112.ProfileService(get<_i111.ProfileManager>()));
  gh.factory<_i113.ProfileStateManager>(
      () => _i113.ProfileStateManager(get<_i112.ProfileService>()));
  gh.factory<_i114.ProxyManager>(
      () => _i114.ProxyManager(get<_i46.ProxyRepository>()));
  gh.factory<_i115.ProxyService>(
      () => _i115.ProxyService(get<_i114.ProxyManager>()));
  gh.factory<_i116.ProxyStateManager>(
      () => _i116.ProxyStateManager(get<_i115.ProxyService>()));
  gh.factory<_i117.ReceiverManager>(
      () => _i117.ReceiverManager(get<_i47.ReceiverRepository>()));
  gh.factory<_i118.ReceiverService>(
      () => _i118.ReceiverService(get<_i117.ReceiverManager>()));
  gh.factory<_i119.ReceiverStateManager>(() => _i119.ReceiverStateManager(
      get<_i118.ReceiverService>(), get<_i66.ClientService>()));
  gh.factory<_i120.ReportManager>(
      () => _i120.ReportManager(get<_i48.ReportRepository>()));
  gh.factory<_i121.ReportService>(
      () => _i121.ReportService(get<_i120.ReportManager>()));
  gh.factory<_i122.ReviewShipmentStateManger>(() =>
      _i122.ReviewShipmentStateManger(
          get<_i91.FirstOptionService>(), get<_i39.ImageUploadService>()));
  gh.factory<_i123.SettingsScreen>(() => _i123.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i89.FireNotificationService>()));
  gh.factory<_i124.SplashModule>(
      () => _i124.SplashModule(get<_i49.SplashScreen>()));
  gh.factory<_i125.SubContractServiceManager>(() =>
      _i125.SubContractServiceManager(
          get<_i50.SubContractServiceRepository>()));
  gh.factory<_i126.SubContractServiceService>(() =>
      _i126.SubContractServiceService(get<_i125.SubContractServiceManager>()));
  gh.factory<_i127.SubContractServiceStateManager>(() =>
      _i127.SubContractServiceStateManager(
          get<_i126.SubContractServiceService>()));
  gh.factory<_i128.SubProductManager>(
      () => _i128.SubProductManager(get<_i51.SubProductRepository>()));
  gh.factory<_i129.SubProductService>(
      () => _i129.SubProductService(get<_i128.SubProductManager>()));
  gh.factory<_i130.SubProductStateManager>(
      () => _i130.SubProductStateManager(get<_i129.SubProductService>()));
  gh.factory<_i131.SubcontractManager>(
      () => _i131.SubcontractManager(get<_i52.SubcontractRepository>()));
  gh.factory<_i132.SubcontractService>(
      () => _i132.SubcontractService(get<_i131.SubcontractManager>()));
  gh.factory<_i133.SubcontractStateManager>(
      () => _i133.SubcontractStateManager(get<_i132.SubcontractService>()));
  gh.factory<_i134.SupplierManager>(
      () => _i134.SupplierManager(get<_i53.SupplierRepository>()));
  gh.factory<_i135.SupplierService>(
      () => _i135.SupplierService(get<_i134.SupplierManager>()));
  gh.factory<_i136.SupplierStateManager>(
      () => _i136.SupplierStateManager(get<_i135.SupplierService>()));
  gh.factory<_i137.SuppliersScreen>(
      () => _i137.SuppliersScreen(get<_i136.SupplierStateManager>()));
  gh.factory<_i138.TrackingManager>(
      () => _i138.TrackingManager(get<_i54.TrackingRepository>()));
  gh.factory<_i139.TrackingService>(
      () => _i139.TrackingService(get<_i138.TrackingManager>()));
  gh.factory<_i140.TrackingStateManager>(
      () => _i140.TrackingStateManager(get<_i139.TrackingService>()));
  gh.factory<_i141.TravelManager>(
      () => _i141.TravelManager(get<_i55.TravelRepository>()));
  gh.factory<_i142.TravelService>(
      () => _i142.TravelService(get<_i141.TravelManager>()));
  gh.factory<_i143.TravelStateManager>(
      () => _i143.TravelStateManager(get<_i142.TravelService>()));
  gh.factory<_i144.UnitManager>(
      () => _i144.UnitManager(get<_i56.UnitRepository>()));
  gh.factory<_i145.UnitService>(
      () => _i145.UnitService(get<_i144.UnitManager>()));
  gh.factory<_i146.UnitStateManager>(
      () => _i146.UnitStateManager(get<_i145.UnitService>()));
  gh.factory<_i147.UnitsScreen>(
      () => _i147.UnitsScreen(get<_i146.UnitStateManager>()));
  gh.factory<_i148.WaitingShipmentManager>(() =>
      _i148.WaitingShipmentManager(get<_i57.WaitingShipmentRepository>()));
  gh.factory<_i149.WaitingShipmentService>(
      () => _i149.WaitingShipmentService(get<_i148.WaitingShipmentManager>()));
  gh.factory<_i150.WaitingShipmentsDetailsStateManager>(() =>
      _i150.WaitingShipmentsDetailsStateManager(
          get<_i149.WaitingShipmentService>()));
  gh.factory<_i151.WaitingShipmentsStateManager>(() =>
      _i151.WaitingShipmentsStateManager(get<_i149.WaitingShipmentService>()));
  gh.factory<_i152.WantingShipmentDetailsScreen>(() =>
      _i152.WantingShipmentDetailsScreen(
          get<_i150.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i153.WarehouseManager>(
      () => _i153.WarehouseManager(get<_i58.WarehousesRepository>()));
  gh.factory<_i154.WarehouseService>(
      () => _i154.WarehouseService(get<_i153.WarehouseManager>()));
  gh.factory<_i155.WarehouseStateManager>(
      () => _i155.WarehouseStateManager(get<_i154.WarehouseService>()));
  gh.factory<_i156.AcceptedShipmentFilterScreen>(() =>
      _i156.AcceptedShipmentFilterScreen(
          get<_i88.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i157.AcceptedShipmentManager>(() =>
      _i157.AcceptedShipmentManager(get<_i59.AcceptedShipmentRepository>()));
  gh.factory<_i158.AcceptedShipmentService>(() =>
      _i158.AcceptedShipmentService(get<_i157.AcceptedShipmentManager>()));
  gh.factory<_i159.AcceptedShipmentsDetailsStateManager>(() =>
      _i159.AcceptedShipmentsDetailsStateManager(
          get<_i158.AcceptedShipmentService>(), get<_i69.ContainerService>()));
  gh.factory<_i160.AcceptedShipmentsFinanceStateManager>(() =>
      _i160.AcceptedShipmentsFinanceStateManager(
          get<_i158.AcceptedShipmentService>()));
  gh.factory<_i161.AcceptedShipmentsStateManager>(() =>
      _i161.AcceptedShipmentsStateManager(
          get<_i158.AcceptedShipmentService>()));
  gh.factory<_i162.AddClientStateManager>(
      () => _i162.AddClientStateManager(get<_i66.ClientService>()));
  gh.factory<_i163.AddContainerSpecificationStateManager>(() =>
      _i163.AddContainerSpecificationStateManager(
          get<_i71.ContainerSpecificationService>()));
  gh.factory<_i164.AddContainerStateManager>(() =>
      _i164.AddContainerStateManager(
          get<_i69.ContainerService>(),
          get<_i132.SubcontractService>(),
          get<_i71.ContainerSpecificationService>(),
          get<_i66.ClientService>(),
          get<_i95.HarborService>()));
  gh.factory<_i165.AddCountryStateManager>(
      () => _i165.AddCountryStateManager(get<_i76.CountryService>()));
  gh.factory<_i166.AddDistributorStateManager>(
      () => _i166.AddDistributorStateManager(get<_i79.DistributorService>()));
  gh.factory<_i167.AddEmployeeStateManager>(
      () => _i167.AddEmployeeStateManager(get<_i85.EmployeeService>()));
  gh.factory<_i168.AddHarborStateManager>(() => _i168.AddHarborStateManager(
      get<_i95.HarborService>(), get<_i76.CountryService>()));
  gh.factory<_i169.AddNewClient>(
      () => _i169.AddNewClient(get<_i162.AddClientStateManager>()));
  gh.factory<_i170.AddNewContainer>(
      () => _i170.AddNewContainer(get<_i164.AddContainerStateManager>()));
  gh.factory<_i171.AddNewContainerSpecification>(() =>
      _i171.AddNewContainerSpecification(
          get<_i163.AddContainerSpecificationStateManager>()));
  gh.factory<_i172.AddNewCountry>(
      () => _i172.AddNewCountry(get<_i165.AddCountryStateManager>()));
  gh.factory<_i173.AddNewDistributor>(
      () => _i173.AddNewDistributor(get<_i166.AddDistributorStateManager>()));
  gh.factory<_i174.AddNewEmployee>(
      () => _i174.AddNewEmployee(get<_i167.AddEmployeeStateManager>()));
  gh.factory<_i175.AddNewHarbor>(
      () => _i175.AddNewHarbor(get<_i168.AddHarborStateManager>()));
  gh.factory<_i176.AddProductStateManager>(
      () => _i176.AddProductStateManager(get<_i109.ProductService>()));
  gh.factory<_i177.AddProxyStateManager>(
      () => _i177.AddProxyStateManager(get<_i115.ProxyService>()));
  gh.factory<_i178.AddSubContractServiceStateManager>(() =>
      _i178.AddSubContractServiceStateManager(
          get<_i126.SubContractServiceService>()));
  gh.factory<_i179.AddSubProductStateManager>(() =>
      _i179.AddSubProductStateManager(
          get<_i129.SubProductService>(), get<_i109.ProductService>()));
  gh.factory<_i180.AddSubcontractStateManager>(() =>
      _i180.AddSubcontractStateManager(get<_i126.SubContractServiceService>(),
          get<_i132.SubcontractService>()));
  gh.factory<_i181.AddSupplierStateManager>(
      () => _i181.AddSupplierStateManager(get<_i135.SupplierService>()));
  gh.factory<_i182.AddTravelStateManager>(() => _i182.AddTravelStateManager(
      get<_i142.TravelService>(),
      get<_i76.CountryService>(),
      get<_i132.SubcontractService>()));
  gh.factory<_i183.AddUnitStateManager>(
      () => _i183.AddUnitStateManager(get<_i145.UnitService>()));
  gh.factory<_i184.AddWarehouseStateManager>(() =>
      _i184.AddWarehouseStateManager(
          get<_i154.WarehouseService>(),
          get<_i132.SubcontractService>(),
          get<_i115.ProxyService>(),
          get<_i76.CountryService>()));
  gh.factory<_i185.AirwaybillManager>(
      () => _i185.AirwaybillManager(get<_i60.AirwaybillRepository>()));
  gh.factory<_i186.AirwaybillService>(
      () => _i186.AirwaybillService(get<_i185.AirwaybillManager>()));
  gh.factory<_i187.AirwaybillSpecificationManager>(() =>
      _i187.AirwaybillSpecificationManager(
          get<_i61.AirwaybillSpecificationRepository>()));
  gh.factory<_i188.AirwaybillSpecificationService>(() =>
      _i188.AirwaybillSpecificationService(
          get<_i187.AirwaybillSpecificationManager>()));
  gh.factory<_i189.AirwaybillSpecificationStateManager>(() =>
      _i189.AirwaybillSpecificationStateManager(
          get<_i188.AirwaybillSpecificationService>()));
  gh.factory<_i190.AirwaybillSpecificationsScreen>(() =>
      _i190.AirwaybillSpecificationsScreen(
          get<_i189.AirwaybillSpecificationStateManager>()));
  gh.factory<_i191.AirwaybillStateManager>(
      () => _i191.AirwaybillStateManager(get<_i186.AirwaybillService>()));
  gh.factory<_i192.AuthorizationModule>(
      () => _i192.AuthorizationModule(get<_i101.LoginScreen>()));
  gh.factory<_i193.ChatPageBloc>(
      () => _i193.ChatPageBloc(get<_i64.ChatService>()));
  gh.factory<_i194.ClientsScreen>(
      () => _i194.ClientsScreen(get<_i67.ClientsStateManager>()));
  gh.factory<_i195.ContainerDetailsStateManager>(() =>
      _i195.ContainerDetailsStateManager(
          get<_i69.ContainerService>(), get<_i142.TravelService>()));
  gh.factory<_i196.ContainerFinanceStateManager>(
      () => _i196.ContainerFinanceStateManager(get<_i69.ContainerService>()));
  gh.factory<_i197.ContainerScreen>(
      () => _i197.ContainerScreen(get<_i74.ContainerStateManager>()));
  gh.factory<_i198.ContainerSpecificationModule>(() =>
      _i198.ContainerSpecificationModule(
          get<_i73.ContainerSpecificationsScreen>(),
          get<_i171.AddNewContainerSpecification>()));
  gh.factory<_i199.CountriesScreen>(
      () => _i199.CountriesScreen(get<_i77.CountryStateManager>()));
  gh.factory<_i200.CountryModule>(() => _i200.CountryModule(
      get<_i199.CountriesScreen>(), get<_i172.AddNewCountry>()));
  gh.factory<_i201.DistributorsModule>(() => _i201.DistributorsModule(
      get<_i81.DistributorsScreen>(), get<_i173.AddNewDistributor>()));
  gh.factory<_i202.EditShipmentStateManager>(() =>
      _i202.EditShipmentStateManager(
          get<_i83.EditShipmentService>(),
          get<_i39.ImageUploadService>(),
          get<_i118.ReceiverService>(),
          get<_i103.MarkService>(),
          get<_i109.ProductService>(),
          get<_i79.DistributorService>(),
          get<_i145.UnitService>()));
  gh.factory<_i203.EditedShipmentScreen>(
      () => _i203.EditedShipmentScreen(get<_i202.EditShipmentStateManager>()));
  gh.factory<_i204.EmployeeModule>(() => _i204.EmployeeModule(
      get<_i87.EmployeesScreen>(), get<_i174.AddNewEmployee>()));
  gh.factory<_i205.FilterAirwaybillStateManager>(() =>
      _i205.FilterAirwaybillStateManager(get<_i132.SubcontractService>()));
  gh.factory<_i206.FilterContainerStateManager>(() =>
      _i206.FilterContainerStateManager(get<_i132.SubcontractService>(),
          get<_i71.ContainerSpecificationService>()));
  gh.factory<_i207.FilterTravelStateManager>(() =>
      _i207.FilterTravelStateManager(get<_i142.TravelService>(),
          get<_i76.CountryService>(), get<_i132.SubcontractService>()));
  gh.factory<_i208.HarborModule>(() =>
      _i208.HarborModule(get<_i97.HarborsScreen>(), get<_i175.AddNewHarbor>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i100.HomeStateManager>()));
  gh.factory<_i209.MarkScreen>(
      () => _i209.MarkScreen(get<_i104.MarkStateManager>()));
  gh.factory<_i210.MyShipmentScreen>(
      () => _i210.MyShipmentScreen(get<_i107.MyShipmentStateManger>()));
  gh.factory<_i211.ProductScreen>(
      () => _i211.ProductScreen(get<_i110.ProductStateManager>()));
  gh.factory<_i212.ProfileScreen>(
      () => _i212.ProfileScreen(get<_i113.ProfileStateManager>()));
  gh.factory<_i213.ProxiesScreen>(
      () => _i213.ProxiesScreen(get<_i116.ProxyStateManager>()));
  gh.factory<_i214.ReceiverScreen>(
      () => _i214.ReceiverScreen(get<_i119.ReceiverStateManager>()));
  gh.factory<_i215.RequestShipmentReview>(() =>
      _i215.RequestShipmentReview(get<_i122.ReviewShipmentStateManger>()));
  gh.factory<_i216.RequestShipmentStateManger>(() =>
      _i216.RequestShipmentStateManger(
          get<_i91.FirstOptionService>(),
          get<_i103.MarkService>(),
          get<_i66.ClientService>(),
          get<_i79.DistributorService>(),
          get<_i118.ReceiverService>(),
          get<_i145.UnitService>(),
          get<_i71.ContainerSpecificationService>(),
          get<_i188.AirwaybillSpecificationService>()));
  gh.factory<_i217.SettingsModule>(
      () => _i217.SettingsModule(get<_i123.SettingsScreen>()));
  gh.factory<_i218.SubContractServiceScreen>(() =>
      _i218.SubContractServiceScreen(
          get<_i127.SubContractServiceStateManager>()));
  gh.factory<_i219.SubProductScreen>(
      () => _i219.SubProductScreen(get<_i130.SubProductStateManager>()));
  gh.factory<_i220.SubcontractScreen>(
      () => _i220.SubcontractScreen(get<_i133.SubcontractStateManager>()));
  gh.factory<_i221.TrackingScreen>(
      () => _i221.TrackingScreen(get<_i140.TrackingStateManager>()));
  gh.factory<_i222.TravelDetailsStateManager>(
      () => _i222.TravelDetailsStateManager(get<_i142.TravelService>()));
  gh.factory<_i223.TravelFilterScreen>(
      () => _i223.TravelFilterScreen(get<_i207.FilterTravelStateManager>()));
  gh.factory<_i224.TravelFinanceStateManager>(
      () => _i224.TravelFinanceStateManager(get<_i142.TravelService>()));
  gh.factory<_i225.TravelScreen>(
      () => _i225.TravelScreen(get<_i143.TravelStateManager>()));
  gh.factory<_i226.UpdateContainer>(
      () => _i226.UpdateContainer(get<_i164.AddContainerStateManager>()));
  gh.factory<_i227.UpdateSubContract>(
      () => _i227.UpdateSubContract(get<_i180.AddSubcontractStateManager>()));
  gh.factory<_i228.UpdateSubProduct>(
      () => _i228.UpdateSubProduct(get<_i179.AddSubProductStateManager>()));
  gh.factory<_i229.UpdateTravel>(
      () => _i229.UpdateTravel(get<_i182.AddTravelStateManager>()));
  gh.factory<_i230.UpdateWarehouse>(
      () => _i230.UpdateWarehouse(get<_i184.AddWarehouseStateManager>()));
  gh.factory<_i231.ViewWarehousesStateManager>(
      () => _i231.ViewWarehousesStateManager(get<_i154.WarehouseService>()));
  gh.factory<_i232.WaitingShipmentScreen>(() =>
      _i232.WaitingShipmentScreen(get<_i151.WaitingShipmentsStateManager>()));
  gh.factory<_i233.WarehouseFinanceStateManager>(
      () => _i233.WarehouseFinanceStateManager(get<_i154.WarehouseService>()));
  gh.factory<_i234.WarehouseScreen>(
      () => _i234.WarehouseScreen(get<_i155.WarehouseStateManager>()));
  gh.factory<_i235.AcceptedShipmentDetailsScreen>(() =>
      _i235.AcceptedShipmentDetailsScreen(
          get<_i159.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i236.AcceptedShipmentFinanceScreen>(() =>
      _i236.AcceptedShipmentFinanceScreen(
          get<_i160.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i237.AcceptedShipmentScreen>(() =>
      _i237.AcceptedShipmentScreen(get<_i161.AcceptedShipmentsStateManager>()));
  gh.factory<_i238.AcceptedShipmentsStatusStateManager>(() =>
      _i238.AcceptedShipmentsStatusStateManager(
          get<_i158.AcceptedShipmentService>(),
          get<_i132.SubcontractService>(),
          get<_i69.ContainerService>(),
          get<_i142.TravelService>(),
          get<_i154.WarehouseService>(),
          get<_i186.AirwaybillService>(),
          get<_i93.GunnyService>()));
  gh.factory<_i239.AddAirwaybillSpecificationStateManager>(() =>
      _i239.AddAirwaybillSpecificationStateManager(
          get<_i188.AirwaybillSpecificationService>()));
  gh.factory<_i240.AddAirwaybillStateManager>(() =>
      _i240.AddAirwaybillStateManager(
          get<_i186.AirwaybillService>(),
          get<_i132.SubcontractService>(),
          get<_i188.AirwaybillSpecificationService>(),
          get<_i66.ClientService>(),
          get<_i95.HarborService>()));
  gh.factory<_i241.AddNewAirwaybill>(
      () => _i241.AddNewAirwaybill(get<_i240.AddAirwaybillStateManager>()));
  gh.factory<_i242.AddNewAirwaybillSpecification>(() =>
      _i242.AddNewAirwaybillSpecification(
          get<_i239.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i243.AddNewProduct>(
      () => _i243.AddNewProduct(get<_i176.AddProductStateManager>()));
  gh.factory<_i244.AddNewProxy>(
      () => _i244.AddNewProxy(get<_i177.AddProxyStateManager>()));
  gh.factory<_i245.AddNewSubContractService>(() =>
      _i245.AddNewSubContractService(
          get<_i178.AddSubContractServiceStateManager>()));
  gh.factory<_i246.AddNewSubProduct>(
      () => _i246.AddNewSubProduct(get<_i179.AddSubProductStateManager>()));
  gh.factory<_i247.AddNewSubcontract>(
      () => _i247.AddNewSubcontract(get<_i180.AddSubcontractStateManager>()));
  gh.factory<_i248.AddNewSupplier>(
      () => _i248.AddNewSupplier(get<_i181.AddSupplierStateManager>()));
  gh.factory<_i249.AddNewTravel>(
      () => _i249.AddNewTravel(get<_i182.AddTravelStateManager>()));
  gh.factory<_i250.AddNewUnit>(
      () => _i250.AddNewUnit(get<_i183.AddUnitStateManager>()));
  gh.factory<_i251.AddNewWarehouse>(
      () => _i251.AddNewWarehouse(get<_i184.AddWarehouseStateManager>()));
  gh.factory<_i252.AirwaybillDetailsStateManager>(() =>
      _i252.AirwaybillDetailsStateManager(
          get<_i186.AirwaybillService>(), get<_i142.TravelService>()));
  gh.factory<_i253.AirwaybillFilterScreen>(() =>
      _i253.AirwaybillFilterScreen(get<_i205.FilterAirwaybillStateManager>()));
  gh.factory<_i254.AirwaybillFinanceStateManager>(() =>
      _i254.AirwaybillFinanceStateManager(get<_i186.AirwaybillService>()));
  gh.factory<_i255.AirwaybillScreen>(
      () => _i255.AirwaybillScreen(get<_i191.AirwaybillStateManager>()));
  gh.factory<_i256.AirwaybillSpecificationModule>(() =>
      _i256.AirwaybillSpecificationModule(
          get<_i190.AirwaybillSpecificationsScreen>(),
          get<_i242.AddNewAirwaybillSpecification>()));
  gh.factory<_i257.ClientModule>(() => _i257.ClientModule(
      get<_i194.ClientsScreen>(), get<_i169.AddNewClient>()));
  gh.factory<_i258.ContainerDetailsScreen>(() =>
      _i258.ContainerDetailsScreen(get<_i195.ContainerDetailsStateManager>()));
  gh.factory<_i259.ContainerFilterScreen>(() =>
      _i259.ContainerFilterScreen(get<_i206.FilterContainerStateManager>()));
  gh.factory<_i260.ContainerFinanceScreen>(() =>
      _i260.ContainerFinanceScreen(get<_i196.ContainerFinanceStateManager>()));
  gh.factory<_i261.ContainerModule>(() => _i261.ContainerModule(
      get<_i197.ContainerScreen>(),
      get<_i170.AddNewContainer>(),
      get<_i259.ContainerFilterScreen>(),
      get<_i258.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i260.ContainerFinanceScreen>(),
      get<_i226.UpdateContainer>()));
  gh.factory<_i262.EditShipmentModule>(
      () => _i262.EditShipmentModule(get<_i203.EditedShipmentScreen>()));
  gh.factory<_i263.HomeModule>(
      () => _i263.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i264.MarkModule>(() => _i264.MarkModule(get<_i209.MarkScreen>()));
  gh.factory<_i265.MyShipmentModule>(() => _i265.MyShipmentModule(
      get<_i210.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i266.NewShipment>(
      () => _i266.NewShipment(get<_i216.RequestShipmentStateManger>()));
  gh.factory<_i267.NewShipmentsModule>(() => _i267.NewShipmentsModule(
      get<_i266.NewShipment>(), get<_i215.RequestShipmentReview>()));
  gh.factory<_i268.ProductModule>(() => _i268.ProductModule(
      get<_i211.ProductScreen>(), get<_i243.AddNewProduct>()));
  gh.factory<_i269.ProfileModule>(
      () => _i269.ProfileModule(get<_i212.ProfileScreen>()));
  gh.factory<_i270.ProxiesModule>(() => _i270.ProxiesModule(
      get<_i213.ProxiesScreen>(), get<_i244.AddNewProxy>()));
  gh.factory<_i271.ReceiverModule>(
      () => _i271.ReceiverModule(get<_i214.ReceiverScreen>()));
  gh.factory<_i272.SubContractServiceModule>(() =>
      _i272.SubContractServiceModule(get<_i218.SubContractServiceScreen>(),
          get<_i245.AddNewSubContractService>()));
  gh.factory<_i273.SubProductModule>(() => _i273.SubProductModule(
      get<_i219.SubProductScreen>(),
      get<_i246.AddNewSubProduct>(),
      get<_i228.UpdateSubProduct>()));
  gh.factory<_i274.SubcontractModule>(() => _i274.SubcontractModule(
      get<_i220.SubcontractScreen>(),
      get<_i247.AddNewSubcontract>(),
      get<_i227.UpdateSubContract>()));
  gh.factory<_i275.SupplierModule>(() => _i275.SupplierModule(
      get<_i137.SuppliersScreen>(), get<_i248.AddNewSupplier>()));
  gh.factory<_i276.TrackingModule>(
      () => _i276.TrackingModule(get<_i221.TrackingScreen>()));
  gh.factory<_i277.TravelDetailsScreen>(
      () => _i277.TravelDetailsScreen(get<_i222.TravelDetailsStateManager>()));
  gh.factory<_i278.TravelFinanceScreen>(
      () => _i278.TravelFinanceScreen(get<_i224.TravelFinanceStateManager>()));
  gh.factory<_i279.TravelModule>(() => _i279.TravelModule(
      get<_i225.TravelScreen>(),
      get<_i249.AddNewTravel>(),
      get<_i223.TravelFilterScreen>(),
      get<_i277.TravelDetailsScreen>(),
      get<_i278.TravelFinanceScreen>(),
      get<_i229.UpdateTravel>()));
  gh.factory<_i280.UnitModule>(() =>
      _i280.UnitModule(get<_i147.UnitsScreen>(), get<_i250.AddNewUnit>()));
  gh.factory<_i281.UpdateAirwaybill>(
      () => _i281.UpdateAirwaybill(get<_i240.AddAirwaybillStateManager>()));
  gh.factory<_i282.ViewWarehouseScreen>(
      () => _i282.ViewWarehouseScreen(get<_i231.ViewWarehousesStateManager>()));
  gh.factory<_i283.WaitingShipmentModule>(() => _i283.WaitingShipmentModule(
      get<_i232.WaitingShipmentScreen>(),
      get<_i152.WantingShipmentDetailsScreen>()));
  gh.factory<_i284.WarehouseFinanceScreen>(() =>
      _i284.WarehouseFinanceScreen(get<_i233.WarehouseFinanceStateManager>()));
  gh.factory<_i285.WarehouseModule>(() => _i285.WarehouseModule(
      get<_i234.WarehouseScreen>(),
      get<_i251.AddNewWarehouse>(),
      get<_i284.WarehouseFinanceScreen>(),
      get<_i230.UpdateWarehouse>()));
  gh.factory<_i286.AcceptedShipmentStatusScreen>(() =>
      _i286.AcceptedShipmentStatusScreen(
          get<_i238.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i287.AirwaybillDetailsScreen>(() => _i287.AirwaybillDetailsScreen(
      get<_i252.AirwaybillDetailsStateManager>()));
  gh.factory<_i288.AirwaybillFinanceScreen>(() => _i288.AirwaybillFinanceScreen(
      get<_i254.AirwaybillFinanceStateManager>()));
  gh.factory<_i289.AirwaybillModule>(() => _i289.AirwaybillModule(
      get<_i255.AirwaybillScreen>(),
      get<_i241.AddNewAirwaybill>(),
      get<_i253.AirwaybillFilterScreen>(),
      get<_i287.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i288.AirwaybillFinanceScreen>(),
      get<_i281.UpdateAirwaybill>()));
  gh.factory<_i290.AcceptedShipmentModule>(() => _i290.AcceptedShipmentModule(
      get<_i237.AcceptedShipmentScreen>(),
      get<_i235.AcceptedShipmentDetailsScreen>(),
      get<_i156.AcceptedShipmentFilterScreen>(),
      get<_i286.AcceptedShipmentStatusScreen>(),
      get<_i236.AcceptedShipmentFinanceScreen>(),
      get<_i282.ViewWarehouseScreen>()));
  gh.factory<_i291.MyApp>(() => _i291.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i89.FireNotificationService>(),
      get<_i263.HomeModule>(),
      get<_i124.SplashModule>(),
      get<_i192.AuthorizationModule>(),
      get<_i63.ChatModule>(),
      get<_i217.SettingsModule>(),
      get<_i269.ProfileModule>(),
      get<_i264.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i267.NewShipmentsModule>(),
      get<_i276.TrackingModule>(),
      get<_i262.EditShipmentModule>(),
      get<_i200.CountryModule>(),
      get<_i201.DistributorsModule>(),
      get<_i270.ProxiesModule>(),
      get<_i275.SupplierModule>(),
      get<_i272.SubContractServiceModule>(),
      get<_i274.SubcontractModule>(),
      get<_i280.UnitModule>(),
      get<_i279.TravelModule>(),
      get<_i261.ContainerModule>(),
      get<_i289.AirwaybillModule>(),
      get<_i198.ContainerSpecificationModule>(),
      get<_i256.AirwaybillSpecificationModule>(),
      get<_i283.WaitingShipmentModule>(),
      get<_i290.AcceptedShipmentModule>(),
      get<_i257.ClientModule>(),
      get<_i268.ProductModule>(),
      get<_i273.SubProductModule>(),
      get<_i285.WarehouseModule>(),
      get<_i271.ReceiverModule>(),
      get<_i204.EmployeeModule>(),
      get<_i208.HarborModule>()));
  return get;
}
