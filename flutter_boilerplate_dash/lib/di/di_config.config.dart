// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i306;
import '../module_airwaybill/airwaybill_module.dart' as _i304;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i194;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i62;
import '../module_airwaybill/service/airwaybill_service.dart' as _i195;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i266;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i200;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i264;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i214;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i251;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i302;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i265;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i303;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i252;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i267;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i296;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i268;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i196;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i63;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i197;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i198;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i250;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i253;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i199;
import '../module_auth/authoriazation_module.dart' as _i201;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i40;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i103;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i202;
import '../module_chat/chat_module.dart' as _i65;
import '../module_chat/manager/chat/chat_manager.dart' as _i64;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i66;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i269;
import '../module_client/manager/client_manager.dart' as _i67;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i68;
import '../module_client/state_manager/client_state_manager.dart' as _i69;
import '../module_client/state_manager/new_client_state_manger.dart' as _i170;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i177;
import '../module_client/ui/screen/client_screen.dart' as _i203;
import '../module_container/container_module.dart' as _i273;
import '../module_container/manager/container_manager.dart' as _i70;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i71;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i205;
import '../module_container/state_manger/container_state_manager.dart' as _i76;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i204;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i215;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i172;
import '../module_container/ui/screen/container_details_screen.dart' as _i270;
import '../module_container/ui/screen/container_filter_screen.dart' as _i271;
import '../module_container/ui/screen/container_finance_screen.dart' as _i272;
import '../module_container/ui/screen/container_new_screen.dart' as _i178;
import '../module_container/ui/screen/container_screen.dart' as _i206;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i236;
import '../module_container_specification/container_specification_module.dart'
    as _i207;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i72;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i73;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i74;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i171;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i179;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i75;
import '../module_countries/country_module.dart' as _i209;
import '../module_countries/manager/country_manager.dart' as _i77;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i78;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i79;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i173;
import '../module_countries/ui/screen/countries_screen.dart' as _i208;
import '../module_countries/ui/screen/country_new_screen.dart' as _i180;
import '../module_distributors/distributors_module.dart' as _i210;
import '../module_distributors/manager/distributors_manager.dart' as _i80;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i81;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i82;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i174;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i181;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i83;
import '../module_edit_shipment/edit_shipment_module.dart' as _i274;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i84;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i85;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i211;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i212;
import '../module_employees/employe_module.dart' as _i213;
import '../module_employees/manager/employees_manager.dart' as _i86;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i87;
import '../module_employees/state_manger/employees_state_manager.dart' as _i88;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i175;
import '../module_employees/ui/screen/employees_screen.dart' as _i89;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i182;
import '../module_gunny/manager/gunny_manager.dart' as _i94;
import '../module_gunny/repository/gunny_repo.dart' as _i36;
import '../module_gunny/service/gunny_service.dart' as _i95;
import '../module_harbor/harbor_module.dart' as _i275;
import '../module_harbor/manager/harbor_manager.dart' as _i96;
import '../module_harbor/repository/harbor_repository.dart' as _i37;
import '../module_harbor/service/harbor_service.dart' as _i97;
import '../module_harbor/state_manger/harbors_state_manager.dart' as _i98;
import '../module_harbor/state_manger/new_harbor_state_manger.dart' as _i176;
import '../module_harbor/ui/screen/harbor_update_screen.dart' as _i237;
import '../module_harbor/ui/screen/harbors_new_screen.dart' as _i183;
import '../module_harbor/ui/screen/harbors_screen.dart' as _i99;
import '../module_home/home_module.dart' as _i276;
import '../module_home/manager/home_manager.dart' as _i100;
import '../module_home/repository/home_repository.dart' as _i38;
import '../module_home/service/home_service.dart' as _i101;
import '../module_home/state_manager/state_manager_home.dart' as _i102;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i104;
import '../module_mark/mark_module.dart' as _i277;
import '../module_mark/repository/mark_repository.dart' as _i41;
import '../module_mark/service/mark_service.dart' as _i105;
import '../module_mark/state_manager/mark_state_manager.dart' as _i106;
import '../module_mark/ui/mark_screen.dart' as _i217;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i107;
import '../module_my_shipment/my_shipment_module.dart' as _i278;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i42;
import '../module_my_shipment/service/my_shipment_service.dart' as _i108;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i109;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i218;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i43;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i91;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_price/manager/price_manager.dart' as _i110;
import '../module_price/price_module.dart' as _i281;
import '../module_price/repository/price_repository.dart' as _i44;
import '../module_price/service/price_service.dart' as _i111;
import '../module_price/state_manager/price_state_manager.dart' as _i112;
import '../module_price/ui/price_screen.dart' as _i219;
import '../module_product_category/manager/product_category_manager.dart'
    as _i113;
import '../module_product_category/product_module.dart' as _i282;
import '../module_product_category/repository/product_category_repository.dart'
    as _i45;
import '../module_product_category/service/product_service.dart' as _i114;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i184;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i115;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i254;
import '../module_product_category/ui/screen/products_screen.dart' as _i220;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i136;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i53;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i137;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i188;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i138;
import '../module_product_sub_category/sub_product_module.dart' as _i288;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i258;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i239;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i229;
import '../module_profile/manager/profile_manager.dart' as _i116;
import '../module_profile/profile_module.dart' as _i283;
import '../module_profile/repository/profile_repository.dart' as _i46;
import '../module_profile/service/profile_service.dart' as _i117;
import '../module_profile/state_manager/profile_state_manager.dart' as _i118;
import '../module_profile/ui/profile_screen.dart' as _i221;
import '../module_proxies/manager/proxies_manager.dart' as _i119;
import '../module_proxies/proxies_module.dart' as _i284;
import '../module_proxies/repository/proxies_repository.dart' as _i47;
import '../module_proxies/service/proixes_service.dart' as _i120;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i185;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i121;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i222;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i255;
import '../module_receiver/manager/receiver_manager.dart' as _i122;
import '../module_receiver/recevier_module.dart' as _i285;
import '../module_receiver/repository/recevier_repository.dart' as _i48;
import '../module_receiver/service/receiver_service.dart' as _i123;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i124;
import '../module_receiver/ui/receiver_screen.dart' as _i223;
import '../module_report/manager/report_manager.dart' as _i125;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i49;
import '../module_report/service/report_service.dart' as _i126;
import '../module_settings/settings_module.dart' as _i226;
import '../module_settings/ui/settings_page/settings_page.dart' as _i128;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i92;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i35;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i93;
import '../module_shipment_request/shipment_request_module.dart' as _i280;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i225;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i127;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i279;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i224;
import '../module_shipment_track/manager/tracking_manager.dart' as _i146;
import '../module_shipment_track/repository/tracking_repository.dart' as _i56;
import '../module_shipment_track/service/tracking_service.dart' as _i147;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i148;
import '../module_shipment_track/tracking_module.dart' as _i291;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i231;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i305;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i165;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i61;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i166;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i167;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i168;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i169;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i249;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i90;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i242;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i246;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i247;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i248;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i301;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i164;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i297;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i156;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i59;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i157;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i158;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i159;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i160;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i243;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i298;
import '../module_shipper/manager/shipper_manager.dart' as _i129;
import '../module_shipper/repository/shipper_repository.dart' as _i50;
import '../module_shipper/service/shipper_service.dart' as _i130;
import '../module_shipper/shipper_module.dart' as _i286;
import '../module_shipper/state_manger/new_shipper_state_manger.dart' as _i186;
import '../module_shipper/state_manger/shipper_state_manager.dart' as _i131;
import '../module_shipper/ui/screen/shipper_new_screen.dart' as _i256;
import '../module_shipper/ui/screen/shipper_screen.dart' as _i227;
import '../module_splash/splash_module.dart' as _i132;
import '../module_splash/ui/screen/splash_screen.dart' as _i51;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i139;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i54;
import '../module_sub_contract/service/subcontract_service.dart' as _i140;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i189;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i141;
import '../module_sub_contract/subcontract_module.dart' as _i289;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i259;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i238;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i230;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i133;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i52;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i134;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i187;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i135;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i287;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i257;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i228;
import '../module_suppliers/manager/suppliers_manager.dart' as _i142;
import '../module_suppliers/repository/suppliers_repository.dart' as _i55;
import '../module_suppliers/service/suppliers_service.dart' as _i143;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i190;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i144;
import '../module_suppliers/supplier_module.dart' as _i290;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i260;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i145;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i149;
import '../module_travel/repository/travel_repository.dart' as _i57;
import '../module_travel/service/travel_service.dart' as _i150;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i232;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i216;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i191;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i234;
import '../module_travel/state_manger/travels_state_manager.dart' as _i151;
import '../module_travel/travel_module.dart' as _i294;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i292;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i233;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i293;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i261;
import '../module_travel/ui/screen/travel_screen.dart' as _i235;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i240;
import '../module_unit/manager/unit_manager.dart' as _i152;
import '../module_unit/repository/unit_repository.dart' as _i58;
import '../module_unit/service/unit_service.dart' as _i153;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i192;
import '../module_unit/state_manger/units_state_manager.dart' as _i154;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i262;
import '../module_unit/ui/screen/units_screen.dart' as _i155;
import '../module_unit/unit_module.dart' as _i295;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i39;
import '../module_warehouses/manager/warehouses_manager.dart' as _i161;
import '../module_warehouses/repository/warehouse_repository.dart' as _i60;
import '../module_warehouses/service/warehouse_service.dart' as _i162;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i193;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i244;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i163;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i299;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i263;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i245;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i241;
import '../module_warehouses/warehouse_module.dart' as _i300;
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
  gh.factory<_i44.PriceRepository>(() =>
      _i44.PriceRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i45.ProductRepository>(() =>
      _i45.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i46.ProfileRepository>(() =>
      _i46.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i47.ProxyRepository>(() =>
      _i47.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i48.ReceiverRepository>(() =>
      _i48.ReceiverRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i49.ReportRepository>(() => _i49.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i50.ShipperRepository>(() =>
      _i50.ShipperRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.SplashScreen>(
      () => _i51.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i52.SubContractServiceRepository>(() =>
      _i52.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.SubProductRepository>(() => _i53.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.SubcontractRepository>(() => _i54.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.SupplierRepository>(() =>
      _i55.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.TrackingRepository>(() =>
      _i56.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.TravelRepository>(() =>
      _i57.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.UnitRepository>(() =>
      _i58.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.WaitingShipmentRepository>(() =>
      _i59.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.WarehousesRepository>(() => _i60.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.AcceptedShipmentRepository>(() =>
      _i61.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i62.AirwaybillRepository>(() => _i62.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i63.AirwaybillSpecificationRepository>(() =>
      _i63.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i64.ChatManager>(
      () => _i64.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i65.ChatModule>(() => _i65.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i66.ChatService>(() => _i66.ChatService(get<_i64.ChatManager>()));
  gh.factory<_i67.ClientManager>(
      () => _i67.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i68.ClientService>(
      () => _i68.ClientService(get<_i67.ClientManager>()));
  gh.factory<_i69.ClientsStateManager>(
      () => _i69.ClientsStateManager(get<_i68.ClientService>()));
  gh.factory<_i70.ContainerManager>(
      () => _i70.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i71.ContainerService>(
      () => _i71.ContainerService(get<_i70.ContainerManager>()));
  gh.factory<_i72.ContainerSpecificationManager>(() =>
      _i72.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i73.ContainerSpecificationService>(() =>
      _i73.ContainerSpecificationService(
          get<_i72.ContainerSpecificationManager>()));
  gh.factory<_i74.ContainerSpecificationStateManager>(() =>
      _i74.ContainerSpecificationStateManager(
          get<_i73.ContainerSpecificationService>()));
  gh.factory<_i75.ContainerSpecificationsScreen>(() =>
      _i75.ContainerSpecificationsScreen(
          get<_i74.ContainerSpecificationStateManager>()));
  gh.factory<_i76.ContainerStateManager>(
      () => _i76.ContainerStateManager(get<_i71.ContainerService>()));
  gh.factory<_i77.CountryManager>(
      () => _i77.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i78.CountryService>(
      () => _i78.CountryService(get<_i77.CountryManager>()));
  gh.factory<_i79.CountryStateManager>(
      () => _i79.CountryStateManager(get<_i78.CountryService>()));
  gh.factory<_i80.DistributorManager>(
      () => _i80.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i81.DistributorService>(
      () => _i81.DistributorService(get<_i80.DistributorManager>()));
  gh.factory<_i82.DistributorStateManager>(
      () => _i82.DistributorStateManager(get<_i81.DistributorService>()));
  gh.factory<_i83.DistributorsScreen>(
      () => _i83.DistributorsScreen(get<_i82.DistributorStateManager>()));
  gh.factory<_i84.EditShipmentManager>(
      () => _i84.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i85.EditShipmentService>(
      () => _i85.EditShipmentService(get<_i84.EditShipmentManager>()));
  gh.factory<_i86.EmployeeManager>(
      () => _i86.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i87.EmployeeService>(
      () => _i87.EmployeeService(get<_i86.EmployeeManager>()));
  gh.factory<_i88.EmployeeStateManager>(
      () => _i88.EmployeeStateManager(get<_i87.EmployeeService>()));
  gh.factory<_i89.EmployeesScreen>(
      () => _i89.EmployeesScreen(get<_i88.EmployeeStateManager>()));
  gh.factory<_i90.FilterAcceptedShipmentStateManager>(() =>
      _i90.FilterAcceptedShipmentStateManager(
          get<_i78.CountryService>(), get<_i68.ClientService>()));
  gh.factory<_i91.FireNotificationService>(() => _i91.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i43.NotificationRepo>()));
  gh.factory<_i92.FirstOptionManager>(
      () => _i92.FirstOptionManager(get<_i35.FirstOptionRepository>()));
  gh.factory<_i93.FirstOptionService>(
      () => _i93.FirstOptionService(get<_i92.FirstOptionManager>()));
  gh.factory<_i94.GunnyManager>(
      () => _i94.GunnyManager(get<_i36.GunnyRepository>()));
  gh.factory<_i95.GunnyService>(
      () => _i95.GunnyService(get<_i94.GunnyManager>()));
  gh.factory<_i96.HarborManager>(
      () => _i96.HarborManager(get<_i37.HarborRepository>()));
  gh.factory<_i97.HarborService>(
      () => _i97.HarborService(get<_i96.HarborManager>()));
  gh.factory<_i98.HarborStateManager>(
      () => _i98.HarborStateManager(get<_i97.HarborService>()));
  gh.factory<_i99.HarborsScreen>(
      () => _i99.HarborsScreen(get<_i98.HarborStateManager>()));
  gh.factory<_i100.HomeManager>(
      () => _i100.HomeManager(get<_i38.HomeRepository>()));
  gh.factory<_i101.HomeService>(
      () => _i101.HomeService(get<_i100.HomeManager>()));
  gh.factory<_i102.HomeStateManager>(() => _i102.HomeStateManager(
      get<_i101.HomeService>(), get<_i87.EmployeeService>()));
  gh.factory<_i103.LoginScreen>(
      () => _i103.LoginScreen(get<_i40.LoginStateManager>()));
  gh.factory<_i104.MarkManager>(
      () => _i104.MarkManager(get<_i41.MarkRepository>()));
  gh.factory<_i105.MarkService>(
      () => _i105.MarkService(get<_i104.MarkManager>()));
  gh.factory<_i106.MarkStateManager>(() => _i106.MarkStateManager(
      get<_i105.MarkService>(), get<_i68.ClientService>()));
  gh.factory<_i107.MyShipmentManager>(
      () => _i107.MyShipmentManager(get<_i42.MyShipmentRepository>()));
  gh.factory<_i108.MyShipmentService>(
      () => _i108.MyShipmentService(get<_i107.MyShipmentManager>()));
  gh.factory<_i109.MyShipmentStateManger>(
      () => _i109.MyShipmentStateManger(get<_i108.MyShipmentService>()));
  gh.factory<_i110.PriceManager>(
      () => _i110.PriceManager(get<_i44.PriceRepository>()));
  gh.factory<_i111.PriceService>(
      () => _i111.PriceService(get<_i110.PriceManager>()));
  gh.factory<_i112.PriceStateManager>(
      () => _i112.PriceStateManager(get<_i111.PriceService>()));
  gh.factory<_i113.ProductManager>(
      () => _i113.ProductManager(get<_i45.ProductRepository>()));
  gh.factory<_i114.ProductService>(
      () => _i114.ProductService(get<_i113.ProductManager>()));
  gh.factory<_i115.ProductStateManager>(
      () => _i115.ProductStateManager(get<_i114.ProductService>()));
  gh.factory<_i116.ProfileManager>(
      () => _i116.ProfileManager(get<_i46.ProfileRepository>()));
  gh.factory<_i117.ProfileService>(
      () => _i117.ProfileService(get<_i116.ProfileManager>()));
  gh.factory<_i118.ProfileStateManager>(
      () => _i118.ProfileStateManager(get<_i117.ProfileService>()));
  gh.factory<_i119.ProxyManager>(
      () => _i119.ProxyManager(get<_i47.ProxyRepository>()));
  gh.factory<_i120.ProxyService>(
      () => _i120.ProxyService(get<_i119.ProxyManager>()));
  gh.factory<_i121.ProxyStateManager>(
      () => _i121.ProxyStateManager(get<_i120.ProxyService>()));
  gh.factory<_i122.ReceiverManager>(
      () => _i122.ReceiverManager(get<_i48.ReceiverRepository>()));
  gh.factory<_i123.ReceiverService>(
      () => _i123.ReceiverService(get<_i122.ReceiverManager>()));
  gh.factory<_i124.ReceiverStateManager>(() => _i124.ReceiverStateManager(
      get<_i123.ReceiverService>(), get<_i68.ClientService>()));
  gh.factory<_i125.ReportManager>(
      () => _i125.ReportManager(get<_i49.ReportRepository>()));
  gh.factory<_i126.ReportService>(
      () => _i126.ReportService(get<_i125.ReportManager>()));
  gh.factory<_i127.ReviewShipmentStateManger>(() =>
      _i127.ReviewShipmentStateManger(
          get<_i93.FirstOptionService>(), get<_i39.ImageUploadService>()));
  gh.factory<_i128.SettingsScreen>(() => _i128.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i91.FireNotificationService>()));
  gh.factory<_i129.ShipperManager>(
      () => _i129.ShipperManager(get<_i50.ShipperRepository>()));
  gh.factory<_i130.ShipperService>(
      () => _i130.ShipperService(get<_i129.ShipperManager>()));
  gh.factory<_i131.ShipperStateManager>(
      () => _i131.ShipperStateManager(get<_i130.ShipperService>()));
  gh.factory<_i132.SplashModule>(
      () => _i132.SplashModule(get<_i51.SplashScreen>()));
  gh.factory<_i133.SubContractServiceManager>(() =>
      _i133.SubContractServiceManager(
          get<_i52.SubContractServiceRepository>()));
  gh.factory<_i134.SubContractServiceService>(() =>
      _i134.SubContractServiceService(get<_i133.SubContractServiceManager>()));
  gh.factory<_i135.SubContractServiceStateManager>(() =>
      _i135.SubContractServiceStateManager(
          get<_i134.SubContractServiceService>()));
  gh.factory<_i136.SubProductManager>(
      () => _i136.SubProductManager(get<_i53.SubProductRepository>()));
  gh.factory<_i137.SubProductService>(
      () => _i137.SubProductService(get<_i136.SubProductManager>()));
  gh.factory<_i138.SubProductStateManager>(
      () => _i138.SubProductStateManager(get<_i137.SubProductService>()));
  gh.factory<_i139.SubcontractManager>(
      () => _i139.SubcontractManager(get<_i54.SubcontractRepository>()));
  gh.factory<_i140.SubcontractService>(
      () => _i140.SubcontractService(get<_i139.SubcontractManager>()));
  gh.factory<_i141.SubcontractStateManager>(
      () => _i141.SubcontractStateManager(get<_i140.SubcontractService>()));
  gh.factory<_i142.SupplierManager>(
      () => _i142.SupplierManager(get<_i55.SupplierRepository>()));
  gh.factory<_i143.SupplierService>(
      () => _i143.SupplierService(get<_i142.SupplierManager>()));
  gh.factory<_i144.SupplierStateManager>(
      () => _i144.SupplierStateManager(get<_i143.SupplierService>()));
  gh.factory<_i145.SuppliersScreen>(
      () => _i145.SuppliersScreen(get<_i144.SupplierStateManager>()));
  gh.factory<_i146.TrackingManager>(
      () => _i146.TrackingManager(get<_i56.TrackingRepository>()));
  gh.factory<_i147.TrackingService>(
      () => _i147.TrackingService(get<_i146.TrackingManager>()));
  gh.factory<_i148.TrackingStateManager>(
      () => _i148.TrackingStateManager(get<_i147.TrackingService>()));
  gh.factory<_i149.TravelManager>(
      () => _i149.TravelManager(get<_i57.TravelRepository>()));
  gh.factory<_i150.TravelService>(
      () => _i150.TravelService(get<_i149.TravelManager>()));
  gh.factory<_i151.TravelStateManager>(
      () => _i151.TravelStateManager(get<_i150.TravelService>()));
  gh.factory<_i152.UnitManager>(
      () => _i152.UnitManager(get<_i58.UnitRepository>()));
  gh.factory<_i153.UnitService>(
      () => _i153.UnitService(get<_i152.UnitManager>()));
  gh.factory<_i154.UnitStateManager>(
      () => _i154.UnitStateManager(get<_i153.UnitService>()));
  gh.factory<_i155.UnitsScreen>(
      () => _i155.UnitsScreen(get<_i154.UnitStateManager>()));
  gh.factory<_i156.WaitingShipmentManager>(() =>
      _i156.WaitingShipmentManager(get<_i59.WaitingShipmentRepository>()));
  gh.factory<_i157.WaitingShipmentService>(
      () => _i157.WaitingShipmentService(get<_i156.WaitingShipmentManager>()));
  gh.factory<_i158.WaitingShipmentsDetailsStateManager>(() =>
      _i158.WaitingShipmentsDetailsStateManager(
          get<_i157.WaitingShipmentService>()));
  gh.factory<_i159.WaitingShipmentsStateManager>(() =>
      _i159.WaitingShipmentsStateManager(get<_i157.WaitingShipmentService>()));
  gh.factory<_i160.WantingShipmentDetailsScreen>(() =>
      _i160.WantingShipmentDetailsScreen(
          get<_i158.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i161.WarehouseManager>(
      () => _i161.WarehouseManager(get<_i60.WarehousesRepository>()));
  gh.factory<_i162.WarehouseService>(
      () => _i162.WarehouseService(get<_i161.WarehouseManager>()));
  gh.factory<_i163.WarehouseStateManager>(
      () => _i163.WarehouseStateManager(get<_i162.WarehouseService>()));
  gh.factory<_i164.AcceptedShipmentFilterScreen>(() =>
      _i164.AcceptedShipmentFilterScreen(
          get<_i90.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i165.AcceptedShipmentManager>(() =>
      _i165.AcceptedShipmentManager(get<_i61.AcceptedShipmentRepository>()));
  gh.factory<_i166.AcceptedShipmentService>(() =>
      _i166.AcceptedShipmentService(get<_i165.AcceptedShipmentManager>()));
  gh.factory<_i167.AcceptedShipmentsDetailsStateManager>(() =>
      _i167.AcceptedShipmentsDetailsStateManager(
          get<_i166.AcceptedShipmentService>(), get<_i71.ContainerService>()));
  gh.factory<_i168.AcceptedShipmentsFinanceStateManager>(() =>
      _i168.AcceptedShipmentsFinanceStateManager(
          get<_i166.AcceptedShipmentService>()));
  gh.factory<_i169.AcceptedShipmentsStateManager>(() =>
      _i169.AcceptedShipmentsStateManager(
          get<_i166.AcceptedShipmentService>()));
  gh.factory<_i170.AddClientStateManager>(
      () => _i170.AddClientStateManager(get<_i68.ClientService>()));
  gh.factory<_i171.AddContainerSpecificationStateManager>(() =>
      _i171.AddContainerSpecificationStateManager(
          get<_i73.ContainerSpecificationService>()));
  gh.factory<_i172.AddContainerStateManager>(() =>
      _i172.AddContainerStateManager(
          get<_i71.ContainerService>(),
          get<_i140.SubcontractService>(),
          get<_i73.ContainerSpecificationService>(),
          get<_i68.ClientService>(),
          get<_i97.HarborService>(),
          get<_i130.ShipperService>()));
  gh.factory<_i173.AddCountryStateManager>(
      () => _i173.AddCountryStateManager(get<_i78.CountryService>()));
  gh.factory<_i174.AddDistributorStateManager>(
      () => _i174.AddDistributorStateManager(get<_i81.DistributorService>()));
  gh.factory<_i175.AddEmployeeStateManager>(
      () => _i175.AddEmployeeStateManager(get<_i87.EmployeeService>()));
  gh.factory<_i176.AddHarborStateManager>(() => _i176.AddHarborStateManager(
      get<_i97.HarborService>(), get<_i78.CountryService>()));
  gh.factory<_i177.AddNewClient>(
      () => _i177.AddNewClient(get<_i170.AddClientStateManager>()));
  gh.factory<_i178.AddNewContainer>(
      () => _i178.AddNewContainer(get<_i172.AddContainerStateManager>()));
  gh.factory<_i179.AddNewContainerSpecification>(() =>
      _i179.AddNewContainerSpecification(
          get<_i171.AddContainerSpecificationStateManager>()));
  gh.factory<_i180.AddNewCountry>(
      () => _i180.AddNewCountry(get<_i173.AddCountryStateManager>()));
  gh.factory<_i181.AddNewDistributor>(
      () => _i181.AddNewDistributor(get<_i174.AddDistributorStateManager>()));
  gh.factory<_i182.AddNewEmployee>(
      () => _i182.AddNewEmployee(get<_i175.AddEmployeeStateManager>()));
  gh.factory<_i183.AddNewHarbor>(
      () => _i183.AddNewHarbor(get<_i176.AddHarborStateManager>()));
  gh.factory<_i184.AddProductStateManager>(
      () => _i184.AddProductStateManager(get<_i114.ProductService>()));
  gh.factory<_i185.AddProxyStateManager>(
      () => _i185.AddProxyStateManager(get<_i120.ProxyService>()));
  gh.factory<_i186.AddShipperStateManager>(
      () => _i186.AddShipperStateManager(get<_i130.ShipperService>()));
  gh.factory<_i187.AddSubContractServiceStateManager>(() =>
      _i187.AddSubContractServiceStateManager(
          get<_i134.SubContractServiceService>()));
  gh.factory<_i188.AddSubProductStateManager>(() =>
      _i188.AddSubProductStateManager(
          get<_i137.SubProductService>(), get<_i114.ProductService>()));
  gh.factory<_i189.AddSubcontractStateManager>(() =>
      _i189.AddSubcontractStateManager(get<_i134.SubContractServiceService>(),
          get<_i140.SubcontractService>()));
  gh.factory<_i190.AddSupplierStateManager>(
      () => _i190.AddSupplierStateManager(get<_i143.SupplierService>()));
  gh.factory<_i191.AddTravelStateManager>(() => _i191.AddTravelStateManager(
      get<_i150.TravelService>(),
      get<_i78.CountryService>(),
      get<_i140.SubcontractService>()));
  gh.factory<_i192.AddUnitStateManager>(
      () => _i192.AddUnitStateManager(get<_i153.UnitService>()));
  gh.factory<_i193.AddWarehouseStateManager>(() =>
      _i193.AddWarehouseStateManager(
          get<_i162.WarehouseService>(),
          get<_i140.SubcontractService>(),
          get<_i120.ProxyService>(),
          get<_i78.CountryService>()));
  gh.factory<_i194.AirwaybillManager>(
      () => _i194.AirwaybillManager(get<_i62.AirwaybillRepository>()));
  gh.factory<_i195.AirwaybillService>(
      () => _i195.AirwaybillService(get<_i194.AirwaybillManager>()));
  gh.factory<_i196.AirwaybillSpecificationManager>(() =>
      _i196.AirwaybillSpecificationManager(
          get<_i63.AirwaybillSpecificationRepository>()));
  gh.factory<_i197.AirwaybillSpecificationService>(() =>
      _i197.AirwaybillSpecificationService(
          get<_i196.AirwaybillSpecificationManager>()));
  gh.factory<_i198.AirwaybillSpecificationStateManager>(() =>
      _i198.AirwaybillSpecificationStateManager(
          get<_i197.AirwaybillSpecificationService>()));
  gh.factory<_i199.AirwaybillSpecificationsScreen>(() =>
      _i199.AirwaybillSpecificationsScreen(
          get<_i198.AirwaybillSpecificationStateManager>()));
  gh.factory<_i200.AirwaybillStateManager>(
      () => _i200.AirwaybillStateManager(get<_i195.AirwaybillService>()));
  gh.factory<_i201.AuthorizationModule>(
      () => _i201.AuthorizationModule(get<_i103.LoginScreen>()));
  gh.factory<_i202.ChatPageBloc>(
      () => _i202.ChatPageBloc(get<_i66.ChatService>()));
  gh.factory<_i203.ClientsScreen>(
      () => _i203.ClientsScreen(get<_i69.ClientsStateManager>()));
  gh.factory<_i204.ContainerDetailsStateManager>(() =>
      _i204.ContainerDetailsStateManager(
          get<_i71.ContainerService>(), get<_i150.TravelService>()));
  gh.factory<_i205.ContainerFinanceStateManager>(
      () => _i205.ContainerFinanceStateManager(get<_i71.ContainerService>()));
  gh.factory<_i206.ContainerScreen>(
      () => _i206.ContainerScreen(get<_i76.ContainerStateManager>()));
  gh.factory<_i207.ContainerSpecificationModule>(() =>
      _i207.ContainerSpecificationModule(
          get<_i75.ContainerSpecificationsScreen>(),
          get<_i179.AddNewContainerSpecification>()));
  gh.factory<_i208.CountriesScreen>(
      () => _i208.CountriesScreen(get<_i79.CountryStateManager>()));
  gh.factory<_i209.CountryModule>(() => _i209.CountryModule(
      get<_i208.CountriesScreen>(), get<_i180.AddNewCountry>()));
  gh.factory<_i210.DistributorsModule>(() => _i210.DistributorsModule(
      get<_i83.DistributorsScreen>(), get<_i181.AddNewDistributor>()));
  gh.factory<_i211.EditShipmentStateManager>(() =>
      _i211.EditShipmentStateManager(
          get<_i85.EditShipmentService>(),
          get<_i39.ImageUploadService>(),
          get<_i123.ReceiverService>(),
          get<_i105.MarkService>(),
          get<_i114.ProductService>(),
          get<_i81.DistributorService>(),
          get<_i153.UnitService>()));
  gh.factory<_i212.EditedShipmentScreen>(
      () => _i212.EditedShipmentScreen(get<_i211.EditShipmentStateManager>()));
  gh.factory<_i213.EmployeeModule>(() => _i213.EmployeeModule(
      get<_i89.EmployeesScreen>(), get<_i182.AddNewEmployee>()));
  gh.factory<_i214.FilterAirwaybillStateManager>(() =>
      _i214.FilterAirwaybillStateManager(get<_i140.SubcontractService>()));
  gh.factory<_i215.FilterContainerStateManager>(() =>
      _i215.FilterContainerStateManager(get<_i140.SubcontractService>(),
          get<_i73.ContainerSpecificationService>()));
  gh.factory<_i216.FilterTravelStateManager>(() =>
      _i216.FilterTravelStateManager(get<_i150.TravelService>(),
          get<_i78.CountryService>(), get<_i140.SubcontractService>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i102.HomeStateManager>()));
  gh.factory<_i217.MarkScreen>(
      () => _i217.MarkScreen(get<_i106.MarkStateManager>()));
  gh.factory<_i218.MyShipmentScreen>(
      () => _i218.MyShipmentScreen(get<_i109.MyShipmentStateManger>()));
  gh.factory<_i219.PriceScreen>(
      () => _i219.PriceScreen(get<_i112.PriceStateManager>()));
  gh.factory<_i220.ProductScreen>(
      () => _i220.ProductScreen(get<_i115.ProductStateManager>()));
  gh.factory<_i221.ProfileScreen>(
      () => _i221.ProfileScreen(get<_i118.ProfileStateManager>()));
  gh.factory<_i222.ProxiesScreen>(
      () => _i222.ProxiesScreen(get<_i121.ProxyStateManager>()));
  gh.factory<_i223.ReceiverScreen>(
      () => _i223.ReceiverScreen(get<_i124.ReceiverStateManager>()));
  gh.factory<_i224.RequestShipmentReview>(() =>
      _i224.RequestShipmentReview(get<_i127.ReviewShipmentStateManger>()));
  gh.factory<_i225.RequestShipmentStateManger>(() =>
      _i225.RequestShipmentStateManger(
          get<_i93.FirstOptionService>(),
          get<_i105.MarkService>(),
          get<_i68.ClientService>(),
          get<_i81.DistributorService>(),
          get<_i123.ReceiverService>(),
          get<_i153.UnitService>(),
          get<_i73.ContainerSpecificationService>(),
          get<_i97.HarborService>(),
          get<_i140.SubcontractService>()));
  gh.factory<_i226.SettingsModule>(
      () => _i226.SettingsModule(get<_i128.SettingsScreen>()));
  gh.factory<_i227.ShipperScreen>(
      () => _i227.ShipperScreen(get<_i131.ShipperStateManager>()));
  gh.factory<_i228.SubContractServiceScreen>(() =>
      _i228.SubContractServiceScreen(
          get<_i135.SubContractServiceStateManager>()));
  gh.factory<_i229.SubProductScreen>(
      () => _i229.SubProductScreen(get<_i138.SubProductStateManager>()));
  gh.factory<_i230.SubcontractScreen>(
      () => _i230.SubcontractScreen(get<_i141.SubcontractStateManager>()));
  gh.factory<_i231.TrackingScreen>(
      () => _i231.TrackingScreen(get<_i148.TrackingStateManager>()));
  gh.factory<_i232.TravelDetailsStateManager>(
      () => _i232.TravelDetailsStateManager(get<_i150.TravelService>()));
  gh.factory<_i233.TravelFilterScreen>(
      () => _i233.TravelFilterScreen(get<_i216.FilterTravelStateManager>()));
  gh.factory<_i234.TravelFinanceStateManager>(
      () => _i234.TravelFinanceStateManager(get<_i150.TravelService>()));
  gh.factory<_i235.TravelScreen>(
      () => _i235.TravelScreen(get<_i151.TravelStateManager>()));
  gh.factory<_i236.UpdateContainer>(
      () => _i236.UpdateContainer(get<_i172.AddContainerStateManager>()));
  gh.factory<_i237.UpdateHarbor>(
      () => _i237.UpdateHarbor(get<_i176.AddHarborStateManager>()));
  gh.factory<_i238.UpdateSubContract>(
      () => _i238.UpdateSubContract(get<_i189.AddSubcontractStateManager>()));
  gh.factory<_i239.UpdateSubProduct>(
      () => _i239.UpdateSubProduct(get<_i188.AddSubProductStateManager>()));
  gh.factory<_i240.UpdateTravel>(
      () => _i240.UpdateTravel(get<_i191.AddTravelStateManager>()));
  gh.factory<_i241.UpdateWarehouse>(
      () => _i241.UpdateWarehouse(get<_i193.AddWarehouseStateManager>()));
  gh.factory<_i242.ViewWarehousesStateManager>(
      () => _i242.ViewWarehousesStateManager(get<_i162.WarehouseService>()));
  gh.factory<_i243.WaitingShipmentScreen>(() =>
      _i243.WaitingShipmentScreen(get<_i159.WaitingShipmentsStateManager>()));
  gh.factory<_i244.WarehouseFinanceStateManager>(
      () => _i244.WarehouseFinanceStateManager(get<_i162.WarehouseService>()));
  gh.factory<_i245.WarehouseScreen>(
      () => _i245.WarehouseScreen(get<_i163.WarehouseStateManager>()));
  gh.factory<_i246.AcceptedShipmentDetailsScreen>(() =>
      _i246.AcceptedShipmentDetailsScreen(
          get<_i167.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i247.AcceptedShipmentFinanceScreen>(() =>
      _i247.AcceptedShipmentFinanceScreen(
          get<_i168.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i248.AcceptedShipmentScreen>(() =>
      _i248.AcceptedShipmentScreen(get<_i169.AcceptedShipmentsStateManager>()));
  gh.factory<_i249.AcceptedShipmentsStatusStateManager>(() =>
      _i249.AcceptedShipmentsStatusStateManager(
          get<_i166.AcceptedShipmentService>(),
          get<_i140.SubcontractService>(),
          get<_i71.ContainerService>(),
          get<_i150.TravelService>(),
          get<_i162.WarehouseService>(),
          get<_i195.AirwaybillService>(),
          get<_i95.GunnyService>()));
  gh.factory<_i250.AddAirwaybillSpecificationStateManager>(() =>
      _i250.AddAirwaybillSpecificationStateManager(
          get<_i197.AirwaybillSpecificationService>()));
  gh.factory<_i251.AddAirwaybillStateManager>(() =>
      _i251.AddAirwaybillStateManager(
          get<_i195.AirwaybillService>(),
          get<_i140.SubcontractService>(),
          get<_i68.ClientService>(),
          get<_i97.HarborService>(),
          get<_i130.ShipperService>()));
  gh.factory<_i252.AddNewAirwaybill>(
      () => _i252.AddNewAirwaybill(get<_i251.AddAirwaybillStateManager>()));
  gh.factory<_i253.AddNewAirwaybillSpecification>(() =>
      _i253.AddNewAirwaybillSpecification(
          get<_i250.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i254.AddNewProduct>(
      () => _i254.AddNewProduct(get<_i184.AddProductStateManager>()));
  gh.factory<_i255.AddNewProxy>(
      () => _i255.AddNewProxy(get<_i185.AddProxyStateManager>()));
  gh.factory<_i256.AddNewShipper>(
      () => _i256.AddNewShipper(get<_i186.AddShipperStateManager>()));
  gh.factory<_i257.AddNewSubContractService>(() =>
      _i257.AddNewSubContractService(
          get<_i187.AddSubContractServiceStateManager>()));
  gh.factory<_i258.AddNewSubProduct>(
      () => _i258.AddNewSubProduct(get<_i188.AddSubProductStateManager>()));
  gh.factory<_i259.AddNewSubcontract>(
      () => _i259.AddNewSubcontract(get<_i189.AddSubcontractStateManager>()));
  gh.factory<_i260.AddNewSupplier>(
      () => _i260.AddNewSupplier(get<_i190.AddSupplierStateManager>()));
  gh.factory<_i261.AddNewTravel>(
      () => _i261.AddNewTravel(get<_i191.AddTravelStateManager>()));
  gh.factory<_i262.AddNewUnit>(
      () => _i262.AddNewUnit(get<_i192.AddUnitStateManager>()));
  gh.factory<_i263.AddNewWarehouse>(
      () => _i263.AddNewWarehouse(get<_i193.AddWarehouseStateManager>()));
  gh.factory<_i264.AirwaybillDetailsStateManager>(() =>
      _i264.AirwaybillDetailsStateManager(
          get<_i195.AirwaybillService>(), get<_i150.TravelService>()));
  gh.factory<_i265.AirwaybillFilterScreen>(() =>
      _i265.AirwaybillFilterScreen(get<_i214.FilterAirwaybillStateManager>()));
  gh.factory<_i266.AirwaybillFinanceStateManager>(() =>
      _i266.AirwaybillFinanceStateManager(get<_i195.AirwaybillService>()));
  gh.factory<_i267.AirwaybillScreen>(
      () => _i267.AirwaybillScreen(get<_i200.AirwaybillStateManager>()));
  gh.factory<_i268.AirwaybillSpecificationModule>(() =>
      _i268.AirwaybillSpecificationModule(
          get<_i199.AirwaybillSpecificationsScreen>(),
          get<_i253.AddNewAirwaybillSpecification>()));
  gh.factory<_i269.ClientModule>(() => _i269.ClientModule(
      get<_i203.ClientsScreen>(), get<_i177.AddNewClient>()));
  gh.factory<_i270.ContainerDetailsScreen>(() =>
      _i270.ContainerDetailsScreen(get<_i204.ContainerDetailsStateManager>()));
  gh.factory<_i271.ContainerFilterScreen>(() =>
      _i271.ContainerFilterScreen(get<_i215.FilterContainerStateManager>()));
  gh.factory<_i272.ContainerFinanceScreen>(() =>
      _i272.ContainerFinanceScreen(get<_i205.ContainerFinanceStateManager>()));
  gh.factory<_i273.ContainerModule>(() => _i273.ContainerModule(
      get<_i206.ContainerScreen>(),
      get<_i178.AddNewContainer>(),
      get<_i271.ContainerFilterScreen>(),
      get<_i270.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i272.ContainerFinanceScreen>(),
      get<_i236.UpdateContainer>()));
  gh.factory<_i274.EditShipmentModule>(
      () => _i274.EditShipmentModule(get<_i212.EditedShipmentScreen>()));
  gh.factory<_i275.HarborModule>(() => _i275.HarborModule(
      get<_i99.HarborsScreen>(),
      get<_i183.AddNewHarbor>(),
      get<_i237.UpdateHarbor>()));
  gh.factory<_i276.HomeModule>(
      () => _i276.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i277.MarkModule>(() => _i277.MarkModule(get<_i217.MarkScreen>()));
  gh.factory<_i278.MyShipmentModule>(() => _i278.MyShipmentModule(
      get<_i218.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i279.NewShipment>(
      () => _i279.NewShipment(get<_i225.RequestShipmentStateManger>()));
  gh.factory<_i280.NewShipmentsModule>(() => _i280.NewShipmentsModule(
      get<_i279.NewShipment>(), get<_i224.RequestShipmentReview>()));
  gh.factory<_i281.PriceModule>(
      () => _i281.PriceModule(get<_i219.PriceScreen>()));
  gh.factory<_i282.ProductModule>(() => _i282.ProductModule(
      get<_i220.ProductScreen>(), get<_i254.AddNewProduct>()));
  gh.factory<_i283.ProfileModule>(
      () => _i283.ProfileModule(get<_i221.ProfileScreen>()));
  gh.factory<_i284.ProxiesModule>(() => _i284.ProxiesModule(
      get<_i222.ProxiesScreen>(), get<_i255.AddNewProxy>()));
  gh.factory<_i285.ReceiverModule>(
      () => _i285.ReceiverModule(get<_i223.ReceiverScreen>()));
  gh.factory<_i286.ShipperModule>(() => _i286.ShipperModule(
      get<_i227.ShipperScreen>(), get<_i256.AddNewShipper>()));
  gh.factory<_i287.SubContractServiceModule>(() =>
      _i287.SubContractServiceModule(get<_i228.SubContractServiceScreen>(),
          get<_i257.AddNewSubContractService>()));
  gh.factory<_i288.SubProductModule>(() => _i288.SubProductModule(
      get<_i229.SubProductScreen>(),
      get<_i258.AddNewSubProduct>(),
      get<_i239.UpdateSubProduct>()));
  gh.factory<_i289.SubcontractModule>(() => _i289.SubcontractModule(
      get<_i230.SubcontractScreen>(),
      get<_i259.AddNewSubcontract>(),
      get<_i238.UpdateSubContract>()));
  gh.factory<_i290.SupplierModule>(() => _i290.SupplierModule(
      get<_i145.SuppliersScreen>(), get<_i260.AddNewSupplier>()));
  gh.factory<_i291.TrackingModule>(
      () => _i291.TrackingModule(get<_i231.TrackingScreen>()));
  gh.factory<_i292.TravelDetailsScreen>(
      () => _i292.TravelDetailsScreen(get<_i232.TravelDetailsStateManager>()));
  gh.factory<_i293.TravelFinanceScreen>(
      () => _i293.TravelFinanceScreen(get<_i234.TravelFinanceStateManager>()));
  gh.factory<_i294.TravelModule>(() => _i294.TravelModule(
      get<_i235.TravelScreen>(),
      get<_i261.AddNewTravel>(),
      get<_i233.TravelFilterScreen>(),
      get<_i292.TravelDetailsScreen>(),
      get<_i293.TravelFinanceScreen>(),
      get<_i240.UpdateTravel>()));
  gh.factory<_i295.UnitModule>(() =>
      _i295.UnitModule(get<_i155.UnitsScreen>(), get<_i262.AddNewUnit>()));
  gh.factory<_i296.UpdateAirwaybill>(
      () => _i296.UpdateAirwaybill(get<_i251.AddAirwaybillStateManager>()));
  gh.factory<_i297.ViewWarehouseScreen>(
      () => _i297.ViewWarehouseScreen(get<_i242.ViewWarehousesStateManager>()));
  gh.factory<_i298.WaitingShipmentModule>(() => _i298.WaitingShipmentModule(
      get<_i243.WaitingShipmentScreen>(),
      get<_i160.WantingShipmentDetailsScreen>()));
  gh.factory<_i299.WarehouseFinanceScreen>(() =>
      _i299.WarehouseFinanceScreen(get<_i244.WarehouseFinanceStateManager>()));
  gh.factory<_i300.WarehouseModule>(() => _i300.WarehouseModule(
      get<_i245.WarehouseScreen>(),
      get<_i263.AddNewWarehouse>(),
      get<_i299.WarehouseFinanceScreen>(),
      get<_i241.UpdateWarehouse>()));
  gh.factory<_i301.AcceptedShipmentStatusScreen>(() =>
      _i301.AcceptedShipmentStatusScreen(
          get<_i249.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i302.AirwaybillDetailsScreen>(() => _i302.AirwaybillDetailsScreen(
      get<_i264.AirwaybillDetailsStateManager>()));
  gh.factory<_i303.AirwaybillFinanceScreen>(() => _i303.AirwaybillFinanceScreen(
      get<_i266.AirwaybillFinanceStateManager>()));
  gh.factory<_i304.AirwaybillModule>(() => _i304.AirwaybillModule(
      get<_i267.AirwaybillScreen>(),
      get<_i252.AddNewAirwaybill>(),
      get<_i265.AirwaybillFilterScreen>(),
      get<_i302.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i303.AirwaybillFinanceScreen>(),
      get<_i296.UpdateAirwaybill>()));
  gh.factory<_i305.AcceptedShipmentModule>(() => _i305.AcceptedShipmentModule(
      get<_i248.AcceptedShipmentScreen>(),
      get<_i246.AcceptedShipmentDetailsScreen>(),
      get<_i164.AcceptedShipmentFilterScreen>(),
      get<_i301.AcceptedShipmentStatusScreen>(),
      get<_i247.AcceptedShipmentFinanceScreen>(),
      get<_i297.ViewWarehouseScreen>()));
  gh.factory<_i306.MyApp>(() => _i306.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i91.FireNotificationService>(),
      get<_i276.HomeModule>(),
      get<_i132.SplashModule>(),
      get<_i201.AuthorizationModule>(),
      get<_i65.ChatModule>(),
      get<_i226.SettingsModule>(),
      get<_i283.ProfileModule>(),
      get<_i277.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i280.NewShipmentsModule>(),
      get<_i291.TrackingModule>(),
      get<_i274.EditShipmentModule>(),
      get<_i209.CountryModule>(),
      get<_i210.DistributorsModule>(),
      get<_i284.ProxiesModule>(),
      get<_i290.SupplierModule>(),
      get<_i287.SubContractServiceModule>(),
      get<_i289.SubcontractModule>(),
      get<_i295.UnitModule>(),
      get<_i294.TravelModule>(),
      get<_i273.ContainerModule>(),
      get<_i304.AirwaybillModule>(),
      get<_i207.ContainerSpecificationModule>(),
      get<_i268.AirwaybillSpecificationModule>(),
      get<_i298.WaitingShipmentModule>(),
      get<_i305.AcceptedShipmentModule>(),
      get<_i269.ClientModule>(),
      get<_i282.ProductModule>(),
      get<_i288.SubProductModule>(),
      get<_i300.WarehouseModule>(),
      get<_i285.ReceiverModule>(),
      get<_i213.EmployeeModule>(),
      get<_i275.HarborModule>(),
      get<_i286.ShipperModule>(),
      get<_i281.PriceModule>()));
  return get;
}
