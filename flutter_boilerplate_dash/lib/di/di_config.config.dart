// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i299;
import '../module_airwaybill/airwaybill_module.dart' as _i297;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i190;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i61;
import '../module_airwaybill/service/airwaybill_service.dart' as _i191;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i261;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i196;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i259;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i210;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i246;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i295;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i260;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i296;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i247;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i262;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i289;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i263;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i192;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i62;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i193;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i194;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i245;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i248;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i195;
import '../module_auth/authoriazation_module.dart' as _i197;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i40;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i102;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i198;
import '../module_chat/chat_module.dart' as _i64;
import '../module_chat/manager/chat/chat_manager.dart' as _i63;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i65;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i264;
import '../module_client/manager/client_manager.dart' as _i66;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i67;
import '../module_client/state_manager/client_state_manager.dart' as _i68;
import '../module_client/state_manager/new_client_state_manger.dart' as _i166;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i173;
import '../module_client/ui/screen/client_screen.dart' as _i199;
import '../module_container/container_module.dart' as _i268;
import '../module_container/manager/container_manager.dart' as _i69;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i70;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i201;
import '../module_container/state_manger/container_state_manager.dart' as _i75;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i200;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i211;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i168;
import '../module_container/ui/screen/container_details_screen.dart' as _i265;
import '../module_container/ui/screen/container_filter_screen.dart' as _i266;
import '../module_container/ui/screen/container_finance_screen.dart' as _i267;
import '../module_container/ui/screen/container_new_screen.dart' as _i174;
import '../module_container/ui/screen/container_screen.dart' as _i202;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i232;
import '../module_container_specification/container_specification_module.dart'
    as _i203;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i71;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i72;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i73;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i167;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i175;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i74;
import '../module_countries/country_module.dart' as _i205;
import '../module_countries/manager/country_manager.dart' as _i76;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i77;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i78;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i169;
import '../module_countries/ui/screen/countries_screen.dart' as _i204;
import '../module_countries/ui/screen/country_new_screen.dart' as _i176;
import '../module_distributors/distributors_module.dart' as _i206;
import '../module_distributors/manager/distributors_manager.dart' as _i79;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i80;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i81;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i170;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i177;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i82;
import '../module_edit_shipment/edit_shipment_module.dart' as _i269;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i83;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i84;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i207;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i208;
import '../module_employees/employe_module.dart' as _i209;
import '../module_employees/manager/employees_manager.dart' as _i85;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i86;
import '../module_employees/state_manger/employees_state_manager.dart' as _i87;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i171;
import '../module_employees/ui/screen/employees_screen.dart' as _i88;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i178;
import '../module_gunny/manager/gunny_manager.dart' as _i93;
import '../module_gunny/repository/gunny_repo.dart' as _i36;
import '../module_gunny/service/gunny_service.dart' as _i94;
import '../module_harbor/harbor_module.dart' as _i213;
import '../module_harbor/manager/harbor_manager.dart' as _i95;
import '../module_harbor/repository/harbor_repository.dart' as _i37;
import '../module_harbor/service/harbor_service.dart' as _i96;
import '../module_harbor/state_manger/harbors_state_manager.dart' as _i97;
import '../module_harbor/state_manger/new_harbor_state_manger.dart' as _i172;
import '../module_harbor/ui/screen/harbors_new_screen.dart' as _i179;
import '../module_harbor/ui/screen/harbors_screen.dart' as _i98;
import '../module_home/home_module.dart' as _i270;
import '../module_home/manager/home_manager.dart' as _i99;
import '../module_home/repository/home_repository.dart' as _i38;
import '../module_home/service/home_service.dart' as _i100;
import '../module_home/state_manager/state_manager_home.dart' as _i101;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i103;
import '../module_mark/mark_module.dart' as _i271;
import '../module_mark/repository/mark_repository.dart' as _i41;
import '../module_mark/service/mark_service.dart' as _i104;
import '../module_mark/state_manager/mark_state_manager.dart' as _i105;
import '../module_mark/ui/mark_screen.dart' as _i214;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i106;
import '../module_my_shipment/my_shipment_module.dart' as _i272;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i42;
import '../module_my_shipment/service/my_shipment_service.dart' as _i107;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i108;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i215;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i43;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i90;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_product_category/manager/product_category_manager.dart'
    as _i109;
import '../module_product_category/product_module.dart' as _i275;
import '../module_product_category/repository/product_category_repository.dart'
    as _i44;
import '../module_product_category/service/product_service.dart' as _i110;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i180;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i111;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i249;
import '../module_product_category/ui/screen/products_screen.dart' as _i216;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i132;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i52;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i133;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i184;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i134;
import '../module_product_sub_category/sub_product_module.dart' as _i281;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i253;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i234;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i225;
import '../module_profile/manager/profile_manager.dart' as _i112;
import '../module_profile/profile_module.dart' as _i276;
import '../module_profile/repository/profile_repository.dart' as _i45;
import '../module_profile/service/profile_service.dart' as _i113;
import '../module_profile/state_manager/profile_state_manager.dart' as _i114;
import '../module_profile/ui/profile_screen.dart' as _i217;
import '../module_proxies/manager/proxies_manager.dart' as _i115;
import '../module_proxies/proxies_module.dart' as _i277;
import '../module_proxies/repository/proxies_repository.dart' as _i46;
import '../module_proxies/service/proixes_service.dart' as _i116;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i181;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i117;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i218;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i250;
import '../module_receiver/manager/receiver_manager.dart' as _i118;
import '../module_receiver/recevier_module.dart' as _i278;
import '../module_receiver/repository/recevier_repository.dart' as _i47;
import '../module_receiver/service/receiver_service.dart' as _i119;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i120;
import '../module_receiver/ui/receiver_screen.dart' as _i219;
import '../module_report/manager/report_manager.dart' as _i121;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i48;
import '../module_report/service/report_service.dart' as _i122;
import '../module_settings/settings_module.dart' as _i222;
import '../module_settings/ui/settings_page/settings_page.dart' as _i124;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i91;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i35;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i92;
import '../module_shipment_request/shipment_request_module.dart' as _i274;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i221;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i123;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i273;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i220;
import '../module_shipment_track/manager/tracking_manager.dart' as _i142;
import '../module_shipment_track/repository/tracking_repository.dart' as _i55;
import '../module_shipment_track/service/tracking_service.dart' as _i143;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i144;
import '../module_shipment_track/tracking_module.dart' as _i284;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i227;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i298;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i161;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i60;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i162;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i163;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i164;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i165;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i244;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i89;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i237;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i241;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i242;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i243;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i294;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i160;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i290;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i152;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i58;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i153;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i154;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i155;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i156;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i238;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i291;
import '../module_shipper/manager/shipper_manager.dart' as _i125;
import '../module_shipper/repository/shipper_repository.dart' as _i49;
import '../module_shipper/service/shipper_service.dart' as _i126;
import '../module_shipper/shipper_module.dart' as _i279;
import '../module_shipper/state_manger/new_shipper_state_manger.dart' as _i182;
import '../module_shipper/state_manger/shipper_state_manager.dart' as _i127;
import '../module_shipper/ui/screen/shipper_new_screen.dart' as _i251;
import '../module_shipper/ui/screen/shipper_screen.dart' as _i223;
import '../module_splash/splash_module.dart' as _i128;
import '../module_splash/ui/screen/splash_screen.dart' as _i50;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i135;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i53;
import '../module_sub_contract/service/subcontract_service.dart' as _i136;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i185;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i137;
import '../module_sub_contract/subcontract_module.dart' as _i282;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i254;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i233;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i226;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i129;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i51;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i130;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i183;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i131;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i280;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i252;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i224;
import '../module_suppliers/manager/suppliers_manager.dart' as _i138;
import '../module_suppliers/repository/suppliers_repository.dart' as _i54;
import '../module_suppliers/service/suppliers_service.dart' as _i139;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i186;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i140;
import '../module_suppliers/supplier_module.dart' as _i283;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i255;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i141;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i145;
import '../module_travel/repository/travel_repository.dart' as _i56;
import '../module_travel/service/travel_service.dart' as _i146;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i228;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i212;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i187;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i230;
import '../module_travel/state_manger/travels_state_manager.dart' as _i147;
import '../module_travel/travel_module.dart' as _i287;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i285;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i229;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i286;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i256;
import '../module_travel/ui/screen/travel_screen.dart' as _i231;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i235;
import '../module_unit/manager/unit_manager.dart' as _i148;
import '../module_unit/repository/unit_repository.dart' as _i57;
import '../module_unit/service/unit_service.dart' as _i149;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i188;
import '../module_unit/state_manger/units_state_manager.dart' as _i150;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i257;
import '../module_unit/ui/screen/units_screen.dart' as _i151;
import '../module_unit/unit_module.dart' as _i288;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i39;
import '../module_warehouses/manager/warehouses_manager.dart' as _i157;
import '../module_warehouses/repository/warehouse_repository.dart' as _i59;
import '../module_warehouses/service/warehouse_service.dart' as _i158;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i189;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i239;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i159;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i292;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i258;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i240;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i236;
import '../module_warehouses/warehouse_module.dart' as _i293;
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
  gh.factory<_i49.ShipperRepository>(() =>
      _i49.ShipperRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i50.SplashScreen>(
      () => _i50.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i51.SubContractServiceRepository>(() =>
      _i51.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.SubProductRepository>(() => _i52.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.SubcontractRepository>(() => _i53.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.SupplierRepository>(() =>
      _i54.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.TrackingRepository>(() =>
      _i55.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.TravelRepository>(() =>
      _i56.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.UnitRepository>(() =>
      _i57.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.WaitingShipmentRepository>(() =>
      _i58.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.WarehousesRepository>(() => _i59.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.AcceptedShipmentRepository>(() =>
      _i60.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.AirwaybillRepository>(() => _i61.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i62.AirwaybillSpecificationRepository>(() =>
      _i62.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i63.ChatManager>(
      () => _i63.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i64.ChatModule>(() => _i64.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i65.ChatService>(() => _i65.ChatService(get<_i63.ChatManager>()));
  gh.factory<_i66.ClientManager>(
      () => _i66.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i67.ClientService>(
      () => _i67.ClientService(get<_i66.ClientManager>()));
  gh.factory<_i68.ClientsStateManager>(
      () => _i68.ClientsStateManager(get<_i67.ClientService>()));
  gh.factory<_i69.ContainerManager>(
      () => _i69.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i70.ContainerService>(
      () => _i70.ContainerService(get<_i69.ContainerManager>()));
  gh.factory<_i71.ContainerSpecificationManager>(() =>
      _i71.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i72.ContainerSpecificationService>(() =>
      _i72.ContainerSpecificationService(
          get<_i71.ContainerSpecificationManager>()));
  gh.factory<_i73.ContainerSpecificationStateManager>(() =>
      _i73.ContainerSpecificationStateManager(
          get<_i72.ContainerSpecificationService>()));
  gh.factory<_i74.ContainerSpecificationsScreen>(() =>
      _i74.ContainerSpecificationsScreen(
          get<_i73.ContainerSpecificationStateManager>()));
  gh.factory<_i75.ContainerStateManager>(
      () => _i75.ContainerStateManager(get<_i70.ContainerService>()));
  gh.factory<_i76.CountryManager>(
      () => _i76.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i77.CountryService>(
      () => _i77.CountryService(get<_i76.CountryManager>()));
  gh.factory<_i78.CountryStateManager>(
      () => _i78.CountryStateManager(get<_i77.CountryService>()));
  gh.factory<_i79.DistributorManager>(
      () => _i79.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i80.DistributorService>(
      () => _i80.DistributorService(get<_i79.DistributorManager>()));
  gh.factory<_i81.DistributorStateManager>(
      () => _i81.DistributorStateManager(get<_i80.DistributorService>()));
  gh.factory<_i82.DistributorsScreen>(
      () => _i82.DistributorsScreen(get<_i81.DistributorStateManager>()));
  gh.factory<_i83.EditShipmentManager>(
      () => _i83.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i84.EditShipmentService>(
      () => _i84.EditShipmentService(get<_i83.EditShipmentManager>()));
  gh.factory<_i85.EmployeeManager>(
      () => _i85.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i86.EmployeeService>(
      () => _i86.EmployeeService(get<_i85.EmployeeManager>()));
  gh.factory<_i87.EmployeeStateManager>(
      () => _i87.EmployeeStateManager(get<_i86.EmployeeService>()));
  gh.factory<_i88.EmployeesScreen>(
      () => _i88.EmployeesScreen(get<_i87.EmployeeStateManager>()));
  gh.factory<_i89.FilterAcceptedShipmentStateManager>(() =>
      _i89.FilterAcceptedShipmentStateManager(
          get<_i77.CountryService>(), get<_i67.ClientService>()));
  gh.factory<_i90.FireNotificationService>(() => _i90.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i43.NotificationRepo>()));
  gh.factory<_i91.FirstOptionManager>(
      () => _i91.FirstOptionManager(get<_i35.FirstOptionRepository>()));
  gh.factory<_i92.FirstOptionService>(
      () => _i92.FirstOptionService(get<_i91.FirstOptionManager>()));
  gh.factory<_i93.GunnyManager>(
      () => _i93.GunnyManager(get<_i36.GunnyRepository>()));
  gh.factory<_i94.GunnyService>(
      () => _i94.GunnyService(get<_i93.GunnyManager>()));
  gh.factory<_i95.HarborManager>(
      () => _i95.HarborManager(get<_i37.HarborRepository>()));
  gh.factory<_i96.HarborService>(
      () => _i96.HarborService(get<_i95.HarborManager>()));
  gh.factory<_i97.HarborStateManager>(
      () => _i97.HarborStateManager(get<_i96.HarborService>()));
  gh.factory<_i98.HarborsScreen>(
      () => _i98.HarborsScreen(get<_i97.HarborStateManager>()));
  gh.factory<_i99.HomeManager>(
      () => _i99.HomeManager(get<_i38.HomeRepository>()));
  gh.factory<_i100.HomeService>(
      () => _i100.HomeService(get<_i99.HomeManager>()));
  gh.factory<_i101.HomeStateManager>(() => _i101.HomeStateManager(
      get<_i100.HomeService>(), get<_i86.EmployeeService>()));
  gh.factory<_i102.LoginScreen>(
      () => _i102.LoginScreen(get<_i40.LoginStateManager>()));
  gh.factory<_i103.MarkManager>(
      () => _i103.MarkManager(get<_i41.MarkRepository>()));
  gh.factory<_i104.MarkService>(
      () => _i104.MarkService(get<_i103.MarkManager>()));
  gh.factory<_i105.MarkStateManager>(() => _i105.MarkStateManager(
      get<_i104.MarkService>(), get<_i67.ClientService>()));
  gh.factory<_i106.MyShipmentManager>(
      () => _i106.MyShipmentManager(get<_i42.MyShipmentRepository>()));
  gh.factory<_i107.MyShipmentService>(
      () => _i107.MyShipmentService(get<_i106.MyShipmentManager>()));
  gh.factory<_i108.MyShipmentStateManger>(
      () => _i108.MyShipmentStateManger(get<_i107.MyShipmentService>()));
  gh.factory<_i109.ProductManager>(
      () => _i109.ProductManager(get<_i44.ProductRepository>()));
  gh.factory<_i110.ProductService>(
      () => _i110.ProductService(get<_i109.ProductManager>()));
  gh.factory<_i111.ProductStateManager>(
      () => _i111.ProductStateManager(get<_i110.ProductService>()));
  gh.factory<_i112.ProfileManager>(
      () => _i112.ProfileManager(get<_i45.ProfileRepository>()));
  gh.factory<_i113.ProfileService>(
      () => _i113.ProfileService(get<_i112.ProfileManager>()));
  gh.factory<_i114.ProfileStateManager>(
      () => _i114.ProfileStateManager(get<_i113.ProfileService>()));
  gh.factory<_i115.ProxyManager>(
      () => _i115.ProxyManager(get<_i46.ProxyRepository>()));
  gh.factory<_i116.ProxyService>(
      () => _i116.ProxyService(get<_i115.ProxyManager>()));
  gh.factory<_i117.ProxyStateManager>(
      () => _i117.ProxyStateManager(get<_i116.ProxyService>()));
  gh.factory<_i118.ReceiverManager>(
      () => _i118.ReceiverManager(get<_i47.ReceiverRepository>()));
  gh.factory<_i119.ReceiverService>(
      () => _i119.ReceiverService(get<_i118.ReceiverManager>()));
  gh.factory<_i120.ReceiverStateManager>(() => _i120.ReceiverStateManager(
      get<_i119.ReceiverService>(), get<_i67.ClientService>()));
  gh.factory<_i121.ReportManager>(
      () => _i121.ReportManager(get<_i48.ReportRepository>()));
  gh.factory<_i122.ReportService>(
      () => _i122.ReportService(get<_i121.ReportManager>()));
  gh.factory<_i123.ReviewShipmentStateManger>(() =>
      _i123.ReviewShipmentStateManger(
          get<_i92.FirstOptionService>(), get<_i39.ImageUploadService>()));
  gh.factory<_i124.SettingsScreen>(() => _i124.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i90.FireNotificationService>()));
  gh.factory<_i125.ShipperManager>(
      () => _i125.ShipperManager(get<_i49.ShipperRepository>()));
  gh.factory<_i126.ShipperService>(
      () => _i126.ShipperService(get<_i125.ShipperManager>()));
  gh.factory<_i127.ShipperStateManager>(
      () => _i127.ShipperStateManager(get<_i126.ShipperService>()));
  gh.factory<_i128.SplashModule>(
      () => _i128.SplashModule(get<_i50.SplashScreen>()));
  gh.factory<_i129.SubContractServiceManager>(() =>
      _i129.SubContractServiceManager(
          get<_i51.SubContractServiceRepository>()));
  gh.factory<_i130.SubContractServiceService>(() =>
      _i130.SubContractServiceService(get<_i129.SubContractServiceManager>()));
  gh.factory<_i131.SubContractServiceStateManager>(() =>
      _i131.SubContractServiceStateManager(
          get<_i130.SubContractServiceService>()));
  gh.factory<_i132.SubProductManager>(
      () => _i132.SubProductManager(get<_i52.SubProductRepository>()));
  gh.factory<_i133.SubProductService>(
      () => _i133.SubProductService(get<_i132.SubProductManager>()));
  gh.factory<_i134.SubProductStateManager>(
      () => _i134.SubProductStateManager(get<_i133.SubProductService>()));
  gh.factory<_i135.SubcontractManager>(
      () => _i135.SubcontractManager(get<_i53.SubcontractRepository>()));
  gh.factory<_i136.SubcontractService>(
      () => _i136.SubcontractService(get<_i135.SubcontractManager>()));
  gh.factory<_i137.SubcontractStateManager>(
      () => _i137.SubcontractStateManager(get<_i136.SubcontractService>()));
  gh.factory<_i138.SupplierManager>(
      () => _i138.SupplierManager(get<_i54.SupplierRepository>()));
  gh.factory<_i139.SupplierService>(
      () => _i139.SupplierService(get<_i138.SupplierManager>()));
  gh.factory<_i140.SupplierStateManager>(
      () => _i140.SupplierStateManager(get<_i139.SupplierService>()));
  gh.factory<_i141.SuppliersScreen>(
      () => _i141.SuppliersScreen(get<_i140.SupplierStateManager>()));
  gh.factory<_i142.TrackingManager>(
      () => _i142.TrackingManager(get<_i55.TrackingRepository>()));
  gh.factory<_i143.TrackingService>(
      () => _i143.TrackingService(get<_i142.TrackingManager>()));
  gh.factory<_i144.TrackingStateManager>(
      () => _i144.TrackingStateManager(get<_i143.TrackingService>()));
  gh.factory<_i145.TravelManager>(
      () => _i145.TravelManager(get<_i56.TravelRepository>()));
  gh.factory<_i146.TravelService>(
      () => _i146.TravelService(get<_i145.TravelManager>()));
  gh.factory<_i147.TravelStateManager>(
      () => _i147.TravelStateManager(get<_i146.TravelService>()));
  gh.factory<_i148.UnitManager>(
      () => _i148.UnitManager(get<_i57.UnitRepository>()));
  gh.factory<_i149.UnitService>(
      () => _i149.UnitService(get<_i148.UnitManager>()));
  gh.factory<_i150.UnitStateManager>(
      () => _i150.UnitStateManager(get<_i149.UnitService>()));
  gh.factory<_i151.UnitsScreen>(
      () => _i151.UnitsScreen(get<_i150.UnitStateManager>()));
  gh.factory<_i152.WaitingShipmentManager>(() =>
      _i152.WaitingShipmentManager(get<_i58.WaitingShipmentRepository>()));
  gh.factory<_i153.WaitingShipmentService>(
      () => _i153.WaitingShipmentService(get<_i152.WaitingShipmentManager>()));
  gh.factory<_i154.WaitingShipmentsDetailsStateManager>(() =>
      _i154.WaitingShipmentsDetailsStateManager(
          get<_i153.WaitingShipmentService>()));
  gh.factory<_i155.WaitingShipmentsStateManager>(() =>
      _i155.WaitingShipmentsStateManager(get<_i153.WaitingShipmentService>()));
  gh.factory<_i156.WantingShipmentDetailsScreen>(() =>
      _i156.WantingShipmentDetailsScreen(
          get<_i154.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i157.WarehouseManager>(
      () => _i157.WarehouseManager(get<_i59.WarehousesRepository>()));
  gh.factory<_i158.WarehouseService>(
      () => _i158.WarehouseService(get<_i157.WarehouseManager>()));
  gh.factory<_i159.WarehouseStateManager>(
      () => _i159.WarehouseStateManager(get<_i158.WarehouseService>()));
  gh.factory<_i160.AcceptedShipmentFilterScreen>(() =>
      _i160.AcceptedShipmentFilterScreen(
          get<_i89.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i161.AcceptedShipmentManager>(() =>
      _i161.AcceptedShipmentManager(get<_i60.AcceptedShipmentRepository>()));
  gh.factory<_i162.AcceptedShipmentService>(() =>
      _i162.AcceptedShipmentService(get<_i161.AcceptedShipmentManager>()));
  gh.factory<_i163.AcceptedShipmentsDetailsStateManager>(() =>
      _i163.AcceptedShipmentsDetailsStateManager(
          get<_i162.AcceptedShipmentService>(), get<_i70.ContainerService>()));
  gh.factory<_i164.AcceptedShipmentsFinanceStateManager>(() =>
      _i164.AcceptedShipmentsFinanceStateManager(
          get<_i162.AcceptedShipmentService>()));
  gh.factory<_i165.AcceptedShipmentsStateManager>(() =>
      _i165.AcceptedShipmentsStateManager(
          get<_i162.AcceptedShipmentService>()));
  gh.factory<_i166.AddClientStateManager>(
      () => _i166.AddClientStateManager(get<_i67.ClientService>()));
  gh.factory<_i167.AddContainerSpecificationStateManager>(() =>
      _i167.AddContainerSpecificationStateManager(
          get<_i72.ContainerSpecificationService>()));
  gh.factory<_i168.AddContainerStateManager>(() =>
      _i168.AddContainerStateManager(
          get<_i70.ContainerService>(),
          get<_i136.SubcontractService>(),
          get<_i72.ContainerSpecificationService>(),
          get<_i67.ClientService>(),
          get<_i96.HarborService>()));
  gh.factory<_i169.AddCountryStateManager>(
      () => _i169.AddCountryStateManager(get<_i77.CountryService>()));
  gh.factory<_i170.AddDistributorStateManager>(
      () => _i170.AddDistributorStateManager(get<_i80.DistributorService>()));
  gh.factory<_i171.AddEmployeeStateManager>(
      () => _i171.AddEmployeeStateManager(get<_i86.EmployeeService>()));
  gh.factory<_i172.AddHarborStateManager>(() => _i172.AddHarborStateManager(
      get<_i96.HarborService>(), get<_i77.CountryService>()));
  gh.factory<_i173.AddNewClient>(
      () => _i173.AddNewClient(get<_i166.AddClientStateManager>()));
  gh.factory<_i174.AddNewContainer>(
      () => _i174.AddNewContainer(get<_i168.AddContainerStateManager>()));
  gh.factory<_i175.AddNewContainerSpecification>(() =>
      _i175.AddNewContainerSpecification(
          get<_i167.AddContainerSpecificationStateManager>()));
  gh.factory<_i176.AddNewCountry>(
      () => _i176.AddNewCountry(get<_i169.AddCountryStateManager>()));
  gh.factory<_i177.AddNewDistributor>(
      () => _i177.AddNewDistributor(get<_i170.AddDistributorStateManager>()));
  gh.factory<_i178.AddNewEmployee>(
      () => _i178.AddNewEmployee(get<_i171.AddEmployeeStateManager>()));
  gh.factory<_i179.AddNewHarbor>(
      () => _i179.AddNewHarbor(get<_i172.AddHarborStateManager>()));
  gh.factory<_i180.AddProductStateManager>(
      () => _i180.AddProductStateManager(get<_i110.ProductService>()));
  gh.factory<_i181.AddProxyStateManager>(
      () => _i181.AddProxyStateManager(get<_i116.ProxyService>()));
  gh.factory<_i182.AddShipperStateManager>(
      () => _i182.AddShipperStateManager(get<_i126.ShipperService>()));
  gh.factory<_i183.AddSubContractServiceStateManager>(() =>
      _i183.AddSubContractServiceStateManager(
          get<_i130.SubContractServiceService>()));
  gh.factory<_i184.AddSubProductStateManager>(() =>
      _i184.AddSubProductStateManager(
          get<_i133.SubProductService>(), get<_i110.ProductService>()));
  gh.factory<_i185.AddSubcontractStateManager>(() =>
      _i185.AddSubcontractStateManager(get<_i130.SubContractServiceService>(),
          get<_i136.SubcontractService>()));
  gh.factory<_i186.AddSupplierStateManager>(
      () => _i186.AddSupplierStateManager(get<_i139.SupplierService>()));
  gh.factory<_i187.AddTravelStateManager>(() => _i187.AddTravelStateManager(
      get<_i146.TravelService>(),
      get<_i77.CountryService>(),
      get<_i136.SubcontractService>()));
  gh.factory<_i188.AddUnitStateManager>(
      () => _i188.AddUnitStateManager(get<_i149.UnitService>()));
  gh.factory<_i189.AddWarehouseStateManager>(() =>
      _i189.AddWarehouseStateManager(
          get<_i158.WarehouseService>(),
          get<_i136.SubcontractService>(),
          get<_i116.ProxyService>(),
          get<_i77.CountryService>()));
  gh.factory<_i190.AirwaybillManager>(
      () => _i190.AirwaybillManager(get<_i61.AirwaybillRepository>()));
  gh.factory<_i191.AirwaybillService>(
      () => _i191.AirwaybillService(get<_i190.AirwaybillManager>()));
  gh.factory<_i192.AirwaybillSpecificationManager>(() =>
      _i192.AirwaybillSpecificationManager(
          get<_i62.AirwaybillSpecificationRepository>()));
  gh.factory<_i193.AirwaybillSpecificationService>(() =>
      _i193.AirwaybillSpecificationService(
          get<_i192.AirwaybillSpecificationManager>()));
  gh.factory<_i194.AirwaybillSpecificationStateManager>(() =>
      _i194.AirwaybillSpecificationStateManager(
          get<_i193.AirwaybillSpecificationService>()));
  gh.factory<_i195.AirwaybillSpecificationsScreen>(() =>
      _i195.AirwaybillSpecificationsScreen(
          get<_i194.AirwaybillSpecificationStateManager>()));
  gh.factory<_i196.AirwaybillStateManager>(
      () => _i196.AirwaybillStateManager(get<_i191.AirwaybillService>()));
  gh.factory<_i197.AuthorizationModule>(
      () => _i197.AuthorizationModule(get<_i102.LoginScreen>()));
  gh.factory<_i198.ChatPageBloc>(
      () => _i198.ChatPageBloc(get<_i65.ChatService>()));
  gh.factory<_i199.ClientsScreen>(
      () => _i199.ClientsScreen(get<_i68.ClientsStateManager>()));
  gh.factory<_i200.ContainerDetailsStateManager>(() =>
      _i200.ContainerDetailsStateManager(
          get<_i70.ContainerService>(), get<_i146.TravelService>()));
  gh.factory<_i201.ContainerFinanceStateManager>(
      () => _i201.ContainerFinanceStateManager(get<_i70.ContainerService>()));
  gh.factory<_i202.ContainerScreen>(
      () => _i202.ContainerScreen(get<_i75.ContainerStateManager>()));
  gh.factory<_i203.ContainerSpecificationModule>(() =>
      _i203.ContainerSpecificationModule(
          get<_i74.ContainerSpecificationsScreen>(),
          get<_i175.AddNewContainerSpecification>()));
  gh.factory<_i204.CountriesScreen>(
      () => _i204.CountriesScreen(get<_i78.CountryStateManager>()));
  gh.factory<_i205.CountryModule>(() => _i205.CountryModule(
      get<_i204.CountriesScreen>(), get<_i176.AddNewCountry>()));
  gh.factory<_i206.DistributorsModule>(() => _i206.DistributorsModule(
      get<_i82.DistributorsScreen>(), get<_i177.AddNewDistributor>()));
  gh.factory<_i207.EditShipmentStateManager>(() =>
      _i207.EditShipmentStateManager(
          get<_i84.EditShipmentService>(),
          get<_i39.ImageUploadService>(),
          get<_i119.ReceiverService>(),
          get<_i104.MarkService>(),
          get<_i110.ProductService>(),
          get<_i80.DistributorService>(),
          get<_i149.UnitService>()));
  gh.factory<_i208.EditedShipmentScreen>(
      () => _i208.EditedShipmentScreen(get<_i207.EditShipmentStateManager>()));
  gh.factory<_i209.EmployeeModule>(() => _i209.EmployeeModule(
      get<_i88.EmployeesScreen>(), get<_i178.AddNewEmployee>()));
  gh.factory<_i210.FilterAirwaybillStateManager>(() =>
      _i210.FilterAirwaybillStateManager(get<_i136.SubcontractService>()));
  gh.factory<_i211.FilterContainerStateManager>(() =>
      _i211.FilterContainerStateManager(get<_i136.SubcontractService>(),
          get<_i72.ContainerSpecificationService>()));
  gh.factory<_i212.FilterTravelStateManager>(() =>
      _i212.FilterTravelStateManager(get<_i146.TravelService>(),
          get<_i77.CountryService>(), get<_i136.SubcontractService>()));
  gh.factory<_i213.HarborModule>(() =>
      _i213.HarborModule(get<_i98.HarborsScreen>(), get<_i179.AddNewHarbor>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i101.HomeStateManager>()));
  gh.factory<_i214.MarkScreen>(
      () => _i214.MarkScreen(get<_i105.MarkStateManager>()));
  gh.factory<_i215.MyShipmentScreen>(
      () => _i215.MyShipmentScreen(get<_i108.MyShipmentStateManger>()));
  gh.factory<_i216.ProductScreen>(
      () => _i216.ProductScreen(get<_i111.ProductStateManager>()));
  gh.factory<_i217.ProfileScreen>(
      () => _i217.ProfileScreen(get<_i114.ProfileStateManager>()));
  gh.factory<_i218.ProxiesScreen>(
      () => _i218.ProxiesScreen(get<_i117.ProxyStateManager>()));
  gh.factory<_i219.ReceiverScreen>(
      () => _i219.ReceiverScreen(get<_i120.ReceiverStateManager>()));
  gh.factory<_i220.RequestShipmentReview>(() =>
      _i220.RequestShipmentReview(get<_i123.ReviewShipmentStateManger>()));
  gh.factory<_i221.RequestShipmentStateManger>(() =>
      _i221.RequestShipmentStateManger(
          get<_i92.FirstOptionService>(),
          get<_i104.MarkService>(),
          get<_i67.ClientService>(),
          get<_i80.DistributorService>(),
          get<_i119.ReceiverService>(),
          get<_i149.UnitService>(),
          get<_i72.ContainerSpecificationService>(),
          get<_i96.HarborService>(),
          get<_i136.SubcontractService>()));
  gh.factory<_i222.SettingsModule>(
      () => _i222.SettingsModule(get<_i124.SettingsScreen>()));
  gh.factory<_i223.ShipperScreen>(
      () => _i223.ShipperScreen(get<_i127.ShipperStateManager>()));
  gh.factory<_i224.SubContractServiceScreen>(() =>
      _i224.SubContractServiceScreen(
          get<_i131.SubContractServiceStateManager>()));
  gh.factory<_i225.SubProductScreen>(
      () => _i225.SubProductScreen(get<_i134.SubProductStateManager>()));
  gh.factory<_i226.SubcontractScreen>(
      () => _i226.SubcontractScreen(get<_i137.SubcontractStateManager>()));
  gh.factory<_i227.TrackingScreen>(
      () => _i227.TrackingScreen(get<_i144.TrackingStateManager>()));
  gh.factory<_i228.TravelDetailsStateManager>(
      () => _i228.TravelDetailsStateManager(get<_i146.TravelService>()));
  gh.factory<_i229.TravelFilterScreen>(
      () => _i229.TravelFilterScreen(get<_i212.FilterTravelStateManager>()));
  gh.factory<_i230.TravelFinanceStateManager>(
      () => _i230.TravelFinanceStateManager(get<_i146.TravelService>()));
  gh.factory<_i231.TravelScreen>(
      () => _i231.TravelScreen(get<_i147.TravelStateManager>()));
  gh.factory<_i232.UpdateContainer>(
      () => _i232.UpdateContainer(get<_i168.AddContainerStateManager>()));
  gh.factory<_i233.UpdateSubContract>(
      () => _i233.UpdateSubContract(get<_i185.AddSubcontractStateManager>()));
  gh.factory<_i234.UpdateSubProduct>(
      () => _i234.UpdateSubProduct(get<_i184.AddSubProductStateManager>()));
  gh.factory<_i235.UpdateTravel>(
      () => _i235.UpdateTravel(get<_i187.AddTravelStateManager>()));
  gh.factory<_i236.UpdateWarehouse>(
      () => _i236.UpdateWarehouse(get<_i189.AddWarehouseStateManager>()));
  gh.factory<_i237.ViewWarehousesStateManager>(
      () => _i237.ViewWarehousesStateManager(get<_i158.WarehouseService>()));
  gh.factory<_i238.WaitingShipmentScreen>(() =>
      _i238.WaitingShipmentScreen(get<_i155.WaitingShipmentsStateManager>()));
  gh.factory<_i239.WarehouseFinanceStateManager>(
      () => _i239.WarehouseFinanceStateManager(get<_i158.WarehouseService>()));
  gh.factory<_i240.WarehouseScreen>(
      () => _i240.WarehouseScreen(get<_i159.WarehouseStateManager>()));
  gh.factory<_i241.AcceptedShipmentDetailsScreen>(() =>
      _i241.AcceptedShipmentDetailsScreen(
          get<_i163.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i242.AcceptedShipmentFinanceScreen>(() =>
      _i242.AcceptedShipmentFinanceScreen(
          get<_i164.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i243.AcceptedShipmentScreen>(() =>
      _i243.AcceptedShipmentScreen(get<_i165.AcceptedShipmentsStateManager>()));
  gh.factory<_i244.AcceptedShipmentsStatusStateManager>(() =>
      _i244.AcceptedShipmentsStatusStateManager(
          get<_i162.AcceptedShipmentService>(),
          get<_i136.SubcontractService>(),
          get<_i70.ContainerService>(),
          get<_i146.TravelService>(),
          get<_i158.WarehouseService>(),
          get<_i191.AirwaybillService>(),
          get<_i94.GunnyService>()));
  gh.factory<_i245.AddAirwaybillSpecificationStateManager>(() =>
      _i245.AddAirwaybillSpecificationStateManager(
          get<_i193.AirwaybillSpecificationService>()));
  gh.factory<_i246.AddAirwaybillStateManager>(() =>
      _i246.AddAirwaybillStateManager(
          get<_i191.AirwaybillService>(),
          get<_i136.SubcontractService>(),
          get<_i67.ClientService>(),
          get<_i96.HarborService>()));
  gh.factory<_i247.AddNewAirwaybill>(
      () => _i247.AddNewAirwaybill(get<_i246.AddAirwaybillStateManager>()));
  gh.factory<_i248.AddNewAirwaybillSpecification>(() =>
      _i248.AddNewAirwaybillSpecification(
          get<_i245.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i249.AddNewProduct>(
      () => _i249.AddNewProduct(get<_i180.AddProductStateManager>()));
  gh.factory<_i250.AddNewProxy>(
      () => _i250.AddNewProxy(get<_i181.AddProxyStateManager>()));
  gh.factory<_i251.AddNewShipper>(
      () => _i251.AddNewShipper(get<_i182.AddShipperStateManager>()));
  gh.factory<_i252.AddNewSubContractService>(() =>
      _i252.AddNewSubContractService(
          get<_i183.AddSubContractServiceStateManager>()));
  gh.factory<_i253.AddNewSubProduct>(
      () => _i253.AddNewSubProduct(get<_i184.AddSubProductStateManager>()));
  gh.factory<_i254.AddNewSubcontract>(
      () => _i254.AddNewSubcontract(get<_i185.AddSubcontractStateManager>()));
  gh.factory<_i255.AddNewSupplier>(
      () => _i255.AddNewSupplier(get<_i186.AddSupplierStateManager>()));
  gh.factory<_i256.AddNewTravel>(
      () => _i256.AddNewTravel(get<_i187.AddTravelStateManager>()));
  gh.factory<_i257.AddNewUnit>(
      () => _i257.AddNewUnit(get<_i188.AddUnitStateManager>()));
  gh.factory<_i258.AddNewWarehouse>(
      () => _i258.AddNewWarehouse(get<_i189.AddWarehouseStateManager>()));
  gh.factory<_i259.AirwaybillDetailsStateManager>(() =>
      _i259.AirwaybillDetailsStateManager(
          get<_i191.AirwaybillService>(), get<_i146.TravelService>()));
  gh.factory<_i260.AirwaybillFilterScreen>(() =>
      _i260.AirwaybillFilterScreen(get<_i210.FilterAirwaybillStateManager>()));
  gh.factory<_i261.AirwaybillFinanceStateManager>(() =>
      _i261.AirwaybillFinanceStateManager(get<_i191.AirwaybillService>()));
  gh.factory<_i262.AirwaybillScreen>(
      () => _i262.AirwaybillScreen(get<_i196.AirwaybillStateManager>()));
  gh.factory<_i263.AirwaybillSpecificationModule>(() =>
      _i263.AirwaybillSpecificationModule(
          get<_i195.AirwaybillSpecificationsScreen>(),
          get<_i248.AddNewAirwaybillSpecification>()));
  gh.factory<_i264.ClientModule>(() => _i264.ClientModule(
      get<_i199.ClientsScreen>(), get<_i173.AddNewClient>()));
  gh.factory<_i265.ContainerDetailsScreen>(() =>
      _i265.ContainerDetailsScreen(get<_i200.ContainerDetailsStateManager>()));
  gh.factory<_i266.ContainerFilterScreen>(() =>
      _i266.ContainerFilterScreen(get<_i211.FilterContainerStateManager>()));
  gh.factory<_i267.ContainerFinanceScreen>(() =>
      _i267.ContainerFinanceScreen(get<_i201.ContainerFinanceStateManager>()));
  gh.factory<_i268.ContainerModule>(() => _i268.ContainerModule(
      get<_i202.ContainerScreen>(),
      get<_i174.AddNewContainer>(),
      get<_i266.ContainerFilterScreen>(),
      get<_i265.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i267.ContainerFinanceScreen>(),
      get<_i232.UpdateContainer>()));
  gh.factory<_i269.EditShipmentModule>(
      () => _i269.EditShipmentModule(get<_i208.EditedShipmentScreen>()));
  gh.factory<_i270.HomeModule>(
      () => _i270.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i271.MarkModule>(() => _i271.MarkModule(get<_i214.MarkScreen>()));
  gh.factory<_i272.MyShipmentModule>(() => _i272.MyShipmentModule(
      get<_i215.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i273.NewShipment>(
      () => _i273.NewShipment(get<_i221.RequestShipmentStateManger>()));
  gh.factory<_i274.NewShipmentsModule>(() => _i274.NewShipmentsModule(
      get<_i273.NewShipment>(), get<_i220.RequestShipmentReview>()));
  gh.factory<_i275.ProductModule>(() => _i275.ProductModule(
      get<_i216.ProductScreen>(), get<_i249.AddNewProduct>()));
  gh.factory<_i276.ProfileModule>(
      () => _i276.ProfileModule(get<_i217.ProfileScreen>()));
  gh.factory<_i277.ProxiesModule>(() => _i277.ProxiesModule(
      get<_i218.ProxiesScreen>(), get<_i250.AddNewProxy>()));
  gh.factory<_i278.ReceiverModule>(
      () => _i278.ReceiverModule(get<_i219.ReceiverScreen>()));
  gh.factory<_i279.ShipperModule>(() => _i279.ShipperModule(
      get<_i223.ShipperScreen>(), get<_i251.AddNewShipper>()));
  gh.factory<_i280.SubContractServiceModule>(() =>
      _i280.SubContractServiceModule(get<_i224.SubContractServiceScreen>(),
          get<_i252.AddNewSubContractService>()));
  gh.factory<_i281.SubProductModule>(() => _i281.SubProductModule(
      get<_i225.SubProductScreen>(),
      get<_i253.AddNewSubProduct>(),
      get<_i234.UpdateSubProduct>()));
  gh.factory<_i282.SubcontractModule>(() => _i282.SubcontractModule(
      get<_i226.SubcontractScreen>(),
      get<_i254.AddNewSubcontract>(),
      get<_i233.UpdateSubContract>()));
  gh.factory<_i283.SupplierModule>(() => _i283.SupplierModule(
      get<_i141.SuppliersScreen>(), get<_i255.AddNewSupplier>()));
  gh.factory<_i284.TrackingModule>(
      () => _i284.TrackingModule(get<_i227.TrackingScreen>()));
  gh.factory<_i285.TravelDetailsScreen>(
      () => _i285.TravelDetailsScreen(get<_i228.TravelDetailsStateManager>()));
  gh.factory<_i286.TravelFinanceScreen>(
      () => _i286.TravelFinanceScreen(get<_i230.TravelFinanceStateManager>()));
  gh.factory<_i287.TravelModule>(() => _i287.TravelModule(
      get<_i231.TravelScreen>(),
      get<_i256.AddNewTravel>(),
      get<_i229.TravelFilterScreen>(),
      get<_i285.TravelDetailsScreen>(),
      get<_i286.TravelFinanceScreen>(),
      get<_i235.UpdateTravel>()));
  gh.factory<_i288.UnitModule>(() =>
      _i288.UnitModule(get<_i151.UnitsScreen>(), get<_i257.AddNewUnit>()));
  gh.factory<_i289.UpdateAirwaybill>(
      () => _i289.UpdateAirwaybill(get<_i246.AddAirwaybillStateManager>()));
  gh.factory<_i290.ViewWarehouseScreen>(
      () => _i290.ViewWarehouseScreen(get<_i237.ViewWarehousesStateManager>()));
  gh.factory<_i291.WaitingShipmentModule>(() => _i291.WaitingShipmentModule(
      get<_i238.WaitingShipmentScreen>(),
      get<_i156.WantingShipmentDetailsScreen>()));
  gh.factory<_i292.WarehouseFinanceScreen>(() =>
      _i292.WarehouseFinanceScreen(get<_i239.WarehouseFinanceStateManager>()));
  gh.factory<_i293.WarehouseModule>(() => _i293.WarehouseModule(
      get<_i240.WarehouseScreen>(),
      get<_i258.AddNewWarehouse>(),
      get<_i292.WarehouseFinanceScreen>(),
      get<_i236.UpdateWarehouse>()));
  gh.factory<_i294.AcceptedShipmentStatusScreen>(() =>
      _i294.AcceptedShipmentStatusScreen(
          get<_i244.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i295.AirwaybillDetailsScreen>(() => _i295.AirwaybillDetailsScreen(
      get<_i259.AirwaybillDetailsStateManager>()));
  gh.factory<_i296.AirwaybillFinanceScreen>(() => _i296.AirwaybillFinanceScreen(
      get<_i261.AirwaybillFinanceStateManager>()));
  gh.factory<_i297.AirwaybillModule>(() => _i297.AirwaybillModule(
      get<_i262.AirwaybillScreen>(),
      get<_i247.AddNewAirwaybill>(),
      get<_i260.AirwaybillFilterScreen>(),
      get<_i295.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i296.AirwaybillFinanceScreen>(),
      get<_i289.UpdateAirwaybill>()));
  gh.factory<_i298.AcceptedShipmentModule>(() => _i298.AcceptedShipmentModule(
      get<_i243.AcceptedShipmentScreen>(),
      get<_i241.AcceptedShipmentDetailsScreen>(),
      get<_i160.AcceptedShipmentFilterScreen>(),
      get<_i294.AcceptedShipmentStatusScreen>(),
      get<_i242.AcceptedShipmentFinanceScreen>(),
      get<_i290.ViewWarehouseScreen>()));
  gh.factory<_i299.MyApp>(() => _i299.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i90.FireNotificationService>(),
      get<_i270.HomeModule>(),
      get<_i128.SplashModule>(),
      get<_i197.AuthorizationModule>(),
      get<_i64.ChatModule>(),
      get<_i222.SettingsModule>(),
      get<_i276.ProfileModule>(),
      get<_i271.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i274.NewShipmentsModule>(),
      get<_i284.TrackingModule>(),
      get<_i269.EditShipmentModule>(),
      get<_i205.CountryModule>(),
      get<_i206.DistributorsModule>(),
      get<_i277.ProxiesModule>(),
      get<_i283.SupplierModule>(),
      get<_i280.SubContractServiceModule>(),
      get<_i282.SubcontractModule>(),
      get<_i288.UnitModule>(),
      get<_i287.TravelModule>(),
      get<_i268.ContainerModule>(),
      get<_i297.AirwaybillModule>(),
      get<_i203.ContainerSpecificationModule>(),
      get<_i263.AirwaybillSpecificationModule>(),
      get<_i291.WaitingShipmentModule>(),
      get<_i298.AcceptedShipmentModule>(),
      get<_i264.ClientModule>(),
      get<_i275.ProductModule>(),
      get<_i281.SubProductModule>(),
      get<_i293.WarehouseModule>(),
      get<_i278.ReceiverModule>(),
      get<_i209.EmployeeModule>(),
      get<_i213.HarborModule>(),
      get<_i279.ShipperModule>()));
  return get;
}
