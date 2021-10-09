// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i314;
import '../module_airwaybill/airwaybill_module.dart' as _i312;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i198;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i63;
import '../module_airwaybill/service/airwaybill_service.dart' as _i199;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i273;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i204;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i271;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i218;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i257;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i310;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i272;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i311;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i258;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i274;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i304;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i275;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i200;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i64;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i201;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i202;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i256;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i259;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i203;
import '../module_auth/authoriazation_module.dart' as _i205;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i40;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i104;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i206;
import '../module_chat/chat_module.dart' as _i66;
import '../module_chat/manager/chat/chat_manager.dart' as _i65;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i67;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i276;
import '../module_client/manager/client_manager.dart' as _i68;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i69;
import '../module_client/state_manager/client_state_manager.dart' as _i70;
import '../module_client/state_manager/new_client_state_manger.dart' as _i174;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i181;
import '../module_client/ui/screen/client_screen.dart' as _i207;
import '../module_container/container_module.dart' as _i280;
import '../module_container/manager/container_manager.dart' as _i71;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/service/container_service.dart' as _i72;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i209;
import '../module_container/state_manger/container_state_manager.dart' as _i77;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i208;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i219;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i176;
import '../module_container/ui/screen/container_details_screen.dart' as _i277;
import '../module_container/ui/screen/container_filter_screen.dart' as _i278;
import '../module_container/ui/screen/container_finance_screen.dart' as _i279;
import '../module_container/ui/screen/container_new_screen.dart' as _i182;
import '../module_container/ui/screen/container_screen.dart' as _i210;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i242;
import '../module_container_specification/container_specification_module.dart'
    as _i211;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i73;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i74;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i75;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i175;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i183;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i76;
import '../module_countries/country_module.dart' as _i213;
import '../module_countries/manager/country_manager.dart' as _i78;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i79;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i80;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i177;
import '../module_countries/ui/screen/countries_screen.dart' as _i212;
import '../module_countries/ui/screen/country_new_screen.dart' as _i184;
import '../module_distributors/distributors_module.dart' as _i214;
import '../module_distributors/manager/distributors_manager.dart' as _i81;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i82;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i83;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i178;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i185;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i84;
import '../module_edit_shipment/edit_shipment_module.dart' as _i281;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i85;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i86;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i215;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i216;
import '../module_employees/employe_module.dart' as _i217;
import '../module_employees/manager/employees_manager.dart' as _i87;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i88;
import '../module_employees/state_manger/employees_state_manager.dart' as _i89;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i179;
import '../module_employees/ui/screen/employees_screen.dart' as _i90;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i186;
import '../module_gunny/manager/gunny_manager.dart' as _i95;
import '../module_gunny/repository/gunny_repo.dart' as _i36;
import '../module_gunny/service/gunny_service.dart' as _i96;
import '../module_harbor/harbor_module.dart' as _i282;
import '../module_harbor/manager/harbor_manager.dart' as _i97;
import '../module_harbor/repository/harbor_repository.dart' as _i37;
import '../module_harbor/service/harbor_service.dart' as _i98;
import '../module_harbor/state_manger/harbors_state_manager.dart' as _i99;
import '../module_harbor/state_manger/new_harbor_state_manger.dart' as _i180;
import '../module_harbor/ui/screen/harbor_update_screen.dart' as _i243;
import '../module_harbor/ui/screen/harbors_new_screen.dart' as _i187;
import '../module_harbor/ui/screen/harbors_screen.dart' as _i100;
import '../module_home/home_module.dart' as _i283;
import '../module_home/manager/home_manager.dart' as _i101;
import '../module_home/repository/home_repository.dart' as _i38;
import '../module_home/service/home_service.dart' as _i102;
import '../module_home/state_manager/state_manager_home.dart' as _i103;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i105;
import '../module_mark/mark_module.dart' as _i284;
import '../module_mark/repository/mark_repository.dart' as _i41;
import '../module_mark/service/mark_service.dart' as _i106;
import '../module_mark/state_manager/mark_state_manager.dart' as _i107;
import '../module_mark/ui/mark_screen.dart' as _i221;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i108;
import '../module_my_shipment/my_shipment_module.dart' as _i285;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i42;
import '../module_my_shipment/service/my_shipment_service.dart' as _i109;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i110;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i222;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i43;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i92;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_price/manager/price_manager.dart' as _i111;
import '../module_price/price_module.dart' as _i288;
import '../module_price/repository/price_repository.dart' as _i44;
import '../module_price/service/price_service.dart' as _i112;
import '../module_price/state_manager/price_state_manager.dart' as _i113;
import '../module_price/ui/price_screen.dart' as _i224;
import '../module_product_category/manager/product_category_manager.dart'
    as _i114;
import '../module_product_category/product_module.dart' as _i289;
import '../module_product_category/repository/product_category_repository.dart'
    as _i45;
import '../module_product_category/service/product_service.dart' as _i115;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i188;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i116;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i260;
import '../module_product_category/ui/screen/products_screen.dart' as _i225;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i140;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i54;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i141;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i192;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i142;
import '../module_product_sub_category/sub_product_module.dart' as _i296;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i265;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i245;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i235;
import '../module_profile/manager/profile_manager.dart' as _i117;
import '../module_profile/profile_module.dart' as _i290;
import '../module_profile/repository/profile_repository.dart' as _i46;
import '../module_profile/service/profile_service.dart' as _i118;
import '../module_profile/state_manager/profile_state_manager.dart' as _i119;
import '../module_profile/ui/profile_screen.dart' as _i226;
import '../module_proxies/manager/proxies_manager.dart' as _i120;
import '../module_proxies/proxies_module.dart' as _i291;
import '../module_proxies/repository/proxies_repository.dart' as _i47;
import '../module_proxies/service/proixes_service.dart' as _i121;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i189;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i122;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i227;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i261;
import '../module_receiver/manager/receiver_manager.dart' as _i123;
import '../module_receiver/recevier_module.dart' as _i292;
import '../module_receiver/repository/recevier_repository.dart' as _i48;
import '../module_receiver/service/receiver_service.dart' as _i124;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i125;
import '../module_receiver/ui/receiver_screen.dart' as _i228;
import '../module_report/manager/report_manager.dart' as _i126;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i49;
import '../module_report/service/report_service.dart' as _i127;
import '../module_settings/settings_module.dart' as _i231;
import '../module_settings/ui/settings_page/settings_page.dart' as _i129;
import '../module_shifting_shipment/manager/shifting_manager.dart' as _i130;
import '../module_shifting_shipment/repository/shipment_shifting_repo.dart'
    as _i50;
import '../module_shifting_shipment/service/shift_service.dart' as _i131;
import '../module_shifting_shipment/shifting_module.dart' as _i293;
import '../module_shifting_shipment/state_manager/new_shifting_state_manager.dart'
    as _i223;
import '../module_shifting_shipment/state_manager/shipments_shifitng_state_manager.dart'
    as _i132;
import '../module_shifting_shipment/ui/screen/new_shift_screen.dart' as _i262;
import '../module_shifting_shipment/ui/screen/shipment_shifting_screen.dart'
    as _i232;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i93;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i35;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i94;
import '../module_shipment_request/shipment_request_module.dart' as _i287;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i230;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i128;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i286;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i229;
import '../module_shipment_track/manager/tracking_manager.dart' as _i150;
import '../module_shipment_track/repository/tracking_repository.dart' as _i57;
import '../module_shipment_track/service/tracking_service.dart' as _i151;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i152;
import '../module_shipment_track/tracking_module.dart' as _i299;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i237;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i313;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i169;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i62;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i170;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i171;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i172;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i173;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i255;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i91;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i248;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i252;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i253;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i254;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i309;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i168;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i305;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i160;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i60;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i161;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i162;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i163;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i164;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i249;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i306;
import '../module_shipper/manager/shipper_manager.dart' as _i133;
import '../module_shipper/repository/shipper_repository.dart' as _i51;
import '../module_shipper/service/shipper_service.dart' as _i134;
import '../module_shipper/shipper_module.dart' as _i294;
import '../module_shipper/state_manger/new_shipper_state_manger.dart' as _i190;
import '../module_shipper/state_manger/shipper_state_manager.dart' as _i135;
import '../module_shipper/ui/screen/shipper_new_screen.dart' as _i263;
import '../module_shipper/ui/screen/shipper_screen.dart' as _i233;
import '../module_splash/splash_module.dart' as _i136;
import '../module_splash/ui/screen/splash_screen.dart' as _i52;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i143;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i55;
import '../module_sub_contract/service/subcontract_service.dart' as _i144;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i193;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i145;
import '../module_sub_contract/subcontract_module.dart' as _i297;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i266;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i244;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i236;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i137;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i53;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i138;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i191;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i139;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i295;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i264;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i234;
import '../module_suppliers/manager/suppliers_manager.dart' as _i146;
import '../module_suppliers/repository/suppliers_repository.dart' as _i56;
import '../module_suppliers/service/suppliers_service.dart' as _i147;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i194;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i148;
import '../module_suppliers/supplier_module.dart' as _i298;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i267;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i149;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i153;
import '../module_travel/repository/travel_repository.dart' as _i58;
import '../module_travel/service/travel_service.dart' as _i154;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i238;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i220;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i195;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i240;
import '../module_travel/state_manger/travels_state_manager.dart' as _i155;
import '../module_travel/travel_module.dart' as _i302;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i300;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i239;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i301;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i268;
import '../module_travel/ui/screen/travel_screen.dart' as _i241;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i246;
import '../module_unit/manager/unit_manager.dart' as _i156;
import '../module_unit/repository/unit_repository.dart' as _i59;
import '../module_unit/service/unit_service.dart' as _i157;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i196;
import '../module_unit/state_manger/units_state_manager.dart' as _i158;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i269;
import '../module_unit/ui/screen/units_screen.dart' as _i159;
import '../module_unit/unit_module.dart' as _i303;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i39;
import '../module_warehouses/manager/warehouses_manager.dart' as _i165;
import '../module_warehouses/repository/warehouse_repository.dart' as _i61;
import '../module_warehouses/service/warehouse_service.dart' as _i166;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i197;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i250;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i167;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i307;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i270;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i251;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i247;
import '../module_warehouses/warehouse_module.dart' as _i308;
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
  gh.factory<_i50.ShiftingRepository>(() =>
      _i50.ShiftingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.ShipperRepository>(() =>
      _i51.ShipperRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.SplashScreen>(
      () => _i52.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i53.SubContractServiceRepository>(() =>
      _i53.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.SubProductRepository>(() => _i54.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.SubcontractRepository>(() => _i55.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.SupplierRepository>(() =>
      _i56.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.TrackingRepository>(() =>
      _i57.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.TravelRepository>(() =>
      _i58.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.UnitRepository>(() =>
      _i59.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.WaitingShipmentRepository>(() =>
      _i60.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.WarehousesRepository>(() => _i61.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i62.AcceptedShipmentRepository>(() =>
      _i62.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i63.AirwaybillRepository>(() => _i63.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i64.AirwaybillSpecificationRepository>(() =>
      _i64.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i65.ChatManager>(
      () => _i65.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i66.ChatModule>(() => _i66.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i67.ChatService>(() => _i67.ChatService(get<_i65.ChatManager>()));
  gh.factory<_i68.ClientManager>(
      () => _i68.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i69.ClientService>(
      () => _i69.ClientService(get<_i68.ClientManager>()));
  gh.factory<_i70.ClientsStateManager>(
      () => _i70.ClientsStateManager(get<_i69.ClientService>()));
  gh.factory<_i71.ContainerManager>(
      () => _i71.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i72.ContainerService>(
      () => _i72.ContainerService(get<_i71.ContainerManager>()));
  gh.factory<_i73.ContainerSpecificationManager>(() =>
      _i73.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i74.ContainerSpecificationService>(() =>
      _i74.ContainerSpecificationService(
          get<_i73.ContainerSpecificationManager>()));
  gh.factory<_i75.ContainerSpecificationStateManager>(() =>
      _i75.ContainerSpecificationStateManager(
          get<_i74.ContainerSpecificationService>()));
  gh.factory<_i76.ContainerSpecificationsScreen>(() =>
      _i76.ContainerSpecificationsScreen(
          get<_i75.ContainerSpecificationStateManager>()));
  gh.factory<_i77.ContainerStateManager>(
      () => _i77.ContainerStateManager(get<_i72.ContainerService>()));
  gh.factory<_i78.CountryManager>(
      () => _i78.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i79.CountryService>(
      () => _i79.CountryService(get<_i78.CountryManager>()));
  gh.factory<_i80.CountryStateManager>(
      () => _i80.CountryStateManager(get<_i79.CountryService>()));
  gh.factory<_i81.DistributorManager>(
      () => _i81.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i82.DistributorService>(
      () => _i82.DistributorService(get<_i81.DistributorManager>()));
  gh.factory<_i83.DistributorStateManager>(
      () => _i83.DistributorStateManager(get<_i82.DistributorService>()));
  gh.factory<_i84.DistributorsScreen>(
      () => _i84.DistributorsScreen(get<_i83.DistributorStateManager>()));
  gh.factory<_i85.EditShipmentManager>(
      () => _i85.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i86.EditShipmentService>(
      () => _i86.EditShipmentService(get<_i85.EditShipmentManager>()));
  gh.factory<_i87.EmployeeManager>(
      () => _i87.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i88.EmployeeService>(
      () => _i88.EmployeeService(get<_i87.EmployeeManager>()));
  gh.factory<_i89.EmployeeStateManager>(
      () => _i89.EmployeeStateManager(get<_i88.EmployeeService>()));
  gh.factory<_i90.EmployeesScreen>(
      () => _i90.EmployeesScreen(get<_i89.EmployeeStateManager>()));
  gh.factory<_i91.FilterAcceptedShipmentStateManager>(() =>
      _i91.FilterAcceptedShipmentStateManager(
          get<_i79.CountryService>(), get<_i69.ClientService>()));
  gh.factory<_i92.FireNotificationService>(() => _i92.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i43.NotificationRepo>()));
  gh.factory<_i93.FirstOptionManager>(
      () => _i93.FirstOptionManager(get<_i35.FirstOptionRepository>()));
  gh.factory<_i94.FirstOptionService>(
      () => _i94.FirstOptionService(get<_i93.FirstOptionManager>()));
  gh.factory<_i95.GunnyManager>(
      () => _i95.GunnyManager(get<_i36.GunnyRepository>()));
  gh.factory<_i96.GunnyService>(
      () => _i96.GunnyService(get<_i95.GunnyManager>()));
  gh.factory<_i97.HarborManager>(
      () => _i97.HarborManager(get<_i37.HarborRepository>()));
  gh.factory<_i98.HarborService>(
      () => _i98.HarborService(get<_i97.HarborManager>()));
  gh.factory<_i99.HarborStateManager>(
      () => _i99.HarborStateManager(get<_i98.HarborService>()));
  gh.factory<_i100.HarborsScreen>(
      () => _i100.HarborsScreen(get<_i99.HarborStateManager>()));
  gh.factory<_i101.HomeManager>(
      () => _i101.HomeManager(get<_i38.HomeRepository>()));
  gh.factory<_i102.HomeService>(
      () => _i102.HomeService(get<_i101.HomeManager>()));
  gh.factory<_i103.HomeStateManager>(() => _i103.HomeStateManager(
      get<_i102.HomeService>(), get<_i88.EmployeeService>()));
  gh.factory<_i104.LoginScreen>(
      () => _i104.LoginScreen(get<_i40.LoginStateManager>()));
  gh.factory<_i105.MarkManager>(
      () => _i105.MarkManager(get<_i41.MarkRepository>()));
  gh.factory<_i106.MarkService>(
      () => _i106.MarkService(get<_i105.MarkManager>()));
  gh.factory<_i107.MarkStateManager>(() => _i107.MarkStateManager(
      get<_i106.MarkService>(), get<_i69.ClientService>()));
  gh.factory<_i108.MyShipmentManager>(
      () => _i108.MyShipmentManager(get<_i42.MyShipmentRepository>()));
  gh.factory<_i109.MyShipmentService>(
      () => _i109.MyShipmentService(get<_i108.MyShipmentManager>()));
  gh.factory<_i110.MyShipmentStateManger>(
      () => _i110.MyShipmentStateManger(get<_i109.MyShipmentService>()));
  gh.factory<_i111.PriceManager>(
      () => _i111.PriceManager(get<_i44.PriceRepository>()));
  gh.factory<_i112.PriceService>(
      () => _i112.PriceService(get<_i111.PriceManager>()));
  gh.factory<_i113.PriceStateManager>(() => _i113.PriceStateManager(
      get<_i112.PriceService>(), get<_i74.ContainerSpecificationService>()));
  gh.factory<_i114.ProductManager>(
      () => _i114.ProductManager(get<_i45.ProductRepository>()));
  gh.factory<_i115.ProductService>(
      () => _i115.ProductService(get<_i114.ProductManager>()));
  gh.factory<_i116.ProductStateManager>(
      () => _i116.ProductStateManager(get<_i115.ProductService>()));
  gh.factory<_i117.ProfileManager>(
      () => _i117.ProfileManager(get<_i46.ProfileRepository>()));
  gh.factory<_i118.ProfileService>(
      () => _i118.ProfileService(get<_i117.ProfileManager>()));
  gh.factory<_i119.ProfileStateManager>(
      () => _i119.ProfileStateManager(get<_i118.ProfileService>()));
  gh.factory<_i120.ProxyManager>(
      () => _i120.ProxyManager(get<_i47.ProxyRepository>()));
  gh.factory<_i121.ProxyService>(
      () => _i121.ProxyService(get<_i120.ProxyManager>()));
  gh.factory<_i122.ProxyStateManager>(
      () => _i122.ProxyStateManager(get<_i121.ProxyService>()));
  gh.factory<_i123.ReceiverManager>(
      () => _i123.ReceiverManager(get<_i48.ReceiverRepository>()));
  gh.factory<_i124.ReceiverService>(
      () => _i124.ReceiverService(get<_i123.ReceiverManager>()));
  gh.factory<_i125.ReceiverStateManager>(() => _i125.ReceiverStateManager(
      get<_i124.ReceiverService>(), get<_i69.ClientService>()));
  gh.factory<_i126.ReportManager>(
      () => _i126.ReportManager(get<_i49.ReportRepository>()));
  gh.factory<_i127.ReportService>(
      () => _i127.ReportService(get<_i126.ReportManager>()));
  gh.factory<_i128.ReviewShipmentStateManger>(() =>
      _i128.ReviewShipmentStateManger(
          get<_i94.FirstOptionService>(), get<_i39.ImageUploadService>()));
  gh.factory<_i129.SettingsScreen>(() => _i129.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i92.FireNotificationService>()));
  gh.factory<_i130.ShiftingManager>(
      () => _i130.ShiftingManager(get<_i50.ShiftingRepository>()));
  gh.factory<_i131.ShiftingService>(
      () => _i131.ShiftingService(get<_i130.ShiftingManager>()));
  gh.factory<_i132.ShipmentsShiftingStateManager>(
      () => _i132.ShipmentsShiftingStateManager(get<_i131.ShiftingService>()));
  gh.factory<_i133.ShipperManager>(
      () => _i133.ShipperManager(get<_i51.ShipperRepository>()));
  gh.factory<_i134.ShipperService>(
      () => _i134.ShipperService(get<_i133.ShipperManager>()));
  gh.factory<_i135.ShipperStateManager>(
      () => _i135.ShipperStateManager(get<_i134.ShipperService>()));
  gh.factory<_i136.SplashModule>(
      () => _i136.SplashModule(get<_i52.SplashScreen>()));
  gh.factory<_i137.SubContractServiceManager>(() =>
      _i137.SubContractServiceManager(
          get<_i53.SubContractServiceRepository>()));
  gh.factory<_i138.SubContractServiceService>(() =>
      _i138.SubContractServiceService(get<_i137.SubContractServiceManager>()));
  gh.factory<_i139.SubContractServiceStateManager>(() =>
      _i139.SubContractServiceStateManager(
          get<_i138.SubContractServiceService>()));
  gh.factory<_i140.SubProductManager>(
      () => _i140.SubProductManager(get<_i54.SubProductRepository>()));
  gh.factory<_i141.SubProductService>(
      () => _i141.SubProductService(get<_i140.SubProductManager>()));
  gh.factory<_i142.SubProductStateManager>(
      () => _i142.SubProductStateManager(get<_i141.SubProductService>()));
  gh.factory<_i143.SubcontractManager>(
      () => _i143.SubcontractManager(get<_i55.SubcontractRepository>()));
  gh.factory<_i144.SubcontractService>(
      () => _i144.SubcontractService(get<_i143.SubcontractManager>()));
  gh.factory<_i145.SubcontractStateManager>(
      () => _i145.SubcontractStateManager(get<_i144.SubcontractService>()));
  gh.factory<_i146.SupplierManager>(
      () => _i146.SupplierManager(get<_i56.SupplierRepository>()));
  gh.factory<_i147.SupplierService>(
      () => _i147.SupplierService(get<_i146.SupplierManager>()));
  gh.factory<_i148.SupplierStateManager>(
      () => _i148.SupplierStateManager(get<_i147.SupplierService>()));
  gh.factory<_i149.SuppliersScreen>(
      () => _i149.SuppliersScreen(get<_i148.SupplierStateManager>()));
  gh.factory<_i150.TrackingManager>(
      () => _i150.TrackingManager(get<_i57.TrackingRepository>()));
  gh.factory<_i151.TrackingService>(
      () => _i151.TrackingService(get<_i150.TrackingManager>()));
  gh.factory<_i152.TrackingStateManager>(
      () => _i152.TrackingStateManager(get<_i151.TrackingService>()));
  gh.factory<_i153.TravelManager>(
      () => _i153.TravelManager(get<_i58.TravelRepository>()));
  gh.factory<_i154.TravelService>(
      () => _i154.TravelService(get<_i153.TravelManager>()));
  gh.factory<_i155.TravelStateManager>(
      () => _i155.TravelStateManager(get<_i154.TravelService>()));
  gh.factory<_i156.UnitManager>(
      () => _i156.UnitManager(get<_i59.UnitRepository>()));
  gh.factory<_i157.UnitService>(
      () => _i157.UnitService(get<_i156.UnitManager>()));
  gh.factory<_i158.UnitStateManager>(
      () => _i158.UnitStateManager(get<_i157.UnitService>()));
  gh.factory<_i159.UnitsScreen>(
      () => _i159.UnitsScreen(get<_i158.UnitStateManager>()));
  gh.factory<_i160.WaitingShipmentManager>(() =>
      _i160.WaitingShipmentManager(get<_i60.WaitingShipmentRepository>()));
  gh.factory<_i161.WaitingShipmentService>(
      () => _i161.WaitingShipmentService(get<_i160.WaitingShipmentManager>()));
  gh.factory<_i162.WaitingShipmentsDetailsStateManager>(() =>
      _i162.WaitingShipmentsDetailsStateManager(
          get<_i161.WaitingShipmentService>()));
  gh.factory<_i163.WaitingShipmentsStateManager>(() =>
      _i163.WaitingShipmentsStateManager(get<_i161.WaitingShipmentService>()));
  gh.factory<_i164.WantingShipmentDetailsScreen>(() =>
      _i164.WantingShipmentDetailsScreen(
          get<_i162.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i165.WarehouseManager>(
      () => _i165.WarehouseManager(get<_i61.WarehousesRepository>()));
  gh.factory<_i166.WarehouseService>(
      () => _i166.WarehouseService(get<_i165.WarehouseManager>()));
  gh.factory<_i167.WarehouseStateManager>(
      () => _i167.WarehouseStateManager(get<_i166.WarehouseService>()));
  gh.factory<_i168.AcceptedShipmentFilterScreen>(() =>
      _i168.AcceptedShipmentFilterScreen(
          get<_i91.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i169.AcceptedShipmentManager>(() =>
      _i169.AcceptedShipmentManager(get<_i62.AcceptedShipmentRepository>()));
  gh.factory<_i170.AcceptedShipmentService>(() =>
      _i170.AcceptedShipmentService(get<_i169.AcceptedShipmentManager>()));
  gh.factory<_i171.AcceptedShipmentsDetailsStateManager>(() =>
      _i171.AcceptedShipmentsDetailsStateManager(
          get<_i170.AcceptedShipmentService>(), get<_i72.ContainerService>()));
  gh.factory<_i172.AcceptedShipmentsFinanceStateManager>(() =>
      _i172.AcceptedShipmentsFinanceStateManager(
          get<_i170.AcceptedShipmentService>()));
  gh.factory<_i173.AcceptedShipmentsStateManager>(() =>
      _i173.AcceptedShipmentsStateManager(
          get<_i170.AcceptedShipmentService>()));
  gh.factory<_i174.AddClientStateManager>(
      () => _i174.AddClientStateManager(get<_i69.ClientService>()));
  gh.factory<_i175.AddContainerSpecificationStateManager>(() =>
      _i175.AddContainerSpecificationStateManager(
          get<_i74.ContainerSpecificationService>()));
  gh.factory<_i176.AddContainerStateManager>(() =>
      _i176.AddContainerStateManager(
          get<_i72.ContainerService>(),
          get<_i144.SubcontractService>(),
          get<_i74.ContainerSpecificationService>(),
          get<_i69.ClientService>(),
          get<_i98.HarborService>(),
          get<_i134.ShipperService>()));
  gh.factory<_i177.AddCountryStateManager>(
      () => _i177.AddCountryStateManager(get<_i79.CountryService>()));
  gh.factory<_i178.AddDistributorStateManager>(
      () => _i178.AddDistributorStateManager(get<_i82.DistributorService>()));
  gh.factory<_i179.AddEmployeeStateManager>(
      () => _i179.AddEmployeeStateManager(get<_i88.EmployeeService>()));
  gh.factory<_i180.AddHarborStateManager>(() => _i180.AddHarborStateManager(
      get<_i98.HarborService>(), get<_i79.CountryService>()));
  gh.factory<_i181.AddNewClient>(
      () => _i181.AddNewClient(get<_i174.AddClientStateManager>()));
  gh.factory<_i182.AddNewContainer>(
      () => _i182.AddNewContainer(get<_i176.AddContainerStateManager>()));
  gh.factory<_i183.AddNewContainerSpecification>(() =>
      _i183.AddNewContainerSpecification(
          get<_i175.AddContainerSpecificationStateManager>()));
  gh.factory<_i184.AddNewCountry>(
      () => _i184.AddNewCountry(get<_i177.AddCountryStateManager>()));
  gh.factory<_i185.AddNewDistributor>(
      () => _i185.AddNewDistributor(get<_i178.AddDistributorStateManager>()));
  gh.factory<_i186.AddNewEmployee>(
      () => _i186.AddNewEmployee(get<_i179.AddEmployeeStateManager>()));
  gh.factory<_i187.AddNewHarbor>(
      () => _i187.AddNewHarbor(get<_i180.AddHarborStateManager>()));
  gh.factory<_i188.AddProductStateManager>(
      () => _i188.AddProductStateManager(get<_i115.ProductService>()));
  gh.factory<_i189.AddProxyStateManager>(
      () => _i189.AddProxyStateManager(get<_i121.ProxyService>()));
  gh.factory<_i190.AddShipperStateManager>(
      () => _i190.AddShipperStateManager(get<_i134.ShipperService>()));
  gh.factory<_i191.AddSubContractServiceStateManager>(() =>
      _i191.AddSubContractServiceStateManager(
          get<_i138.SubContractServiceService>()));
  gh.factory<_i192.AddSubProductStateManager>(() =>
      _i192.AddSubProductStateManager(
          get<_i141.SubProductService>(), get<_i115.ProductService>()));
  gh.factory<_i193.AddSubcontractStateManager>(() =>
      _i193.AddSubcontractStateManager(get<_i138.SubContractServiceService>(),
          get<_i144.SubcontractService>()));
  gh.factory<_i194.AddSupplierStateManager>(
      () => _i194.AddSupplierStateManager(get<_i147.SupplierService>()));
  gh.factory<_i195.AddTravelStateManager>(() => _i195.AddTravelStateManager(
      get<_i154.TravelService>(),
      get<_i79.CountryService>(),
      get<_i144.SubcontractService>()));
  gh.factory<_i196.AddUnitStateManager>(
      () => _i196.AddUnitStateManager(get<_i157.UnitService>()));
  gh.factory<_i197.AddWarehouseStateManager>(() =>
      _i197.AddWarehouseStateManager(
          get<_i166.WarehouseService>(),
          get<_i144.SubcontractService>(),
          get<_i121.ProxyService>(),
          get<_i79.CountryService>()));
  gh.factory<_i198.AirwaybillManager>(
      () => _i198.AirwaybillManager(get<_i63.AirwaybillRepository>()));
  gh.factory<_i199.AirwaybillService>(
      () => _i199.AirwaybillService(get<_i198.AirwaybillManager>()));
  gh.factory<_i200.AirwaybillSpecificationManager>(() =>
      _i200.AirwaybillSpecificationManager(
          get<_i64.AirwaybillSpecificationRepository>()));
  gh.factory<_i201.AirwaybillSpecificationService>(() =>
      _i201.AirwaybillSpecificationService(
          get<_i200.AirwaybillSpecificationManager>()));
  gh.factory<_i202.AirwaybillSpecificationStateManager>(() =>
      _i202.AirwaybillSpecificationStateManager(
          get<_i201.AirwaybillSpecificationService>()));
  gh.factory<_i203.AirwaybillSpecificationsScreen>(() =>
      _i203.AirwaybillSpecificationsScreen(
          get<_i202.AirwaybillSpecificationStateManager>()));
  gh.factory<_i204.AirwaybillStateManager>(
      () => _i204.AirwaybillStateManager(get<_i199.AirwaybillService>()));
  gh.factory<_i205.AuthorizationModule>(
      () => _i205.AuthorizationModule(get<_i104.LoginScreen>()));
  gh.factory<_i206.ChatPageBloc>(
      () => _i206.ChatPageBloc(get<_i67.ChatService>()));
  gh.factory<_i207.ClientsScreen>(
      () => _i207.ClientsScreen(get<_i70.ClientsStateManager>()));
  gh.factory<_i208.ContainerDetailsStateManager>(() =>
      _i208.ContainerDetailsStateManager(
          get<_i72.ContainerService>(), get<_i154.TravelService>()));
  gh.factory<_i209.ContainerFinanceStateManager>(
      () => _i209.ContainerFinanceStateManager(get<_i72.ContainerService>()));
  gh.factory<_i210.ContainerScreen>(
      () => _i210.ContainerScreen(get<_i77.ContainerStateManager>()));
  gh.factory<_i211.ContainerSpecificationModule>(() =>
      _i211.ContainerSpecificationModule(
          get<_i76.ContainerSpecificationsScreen>(),
          get<_i183.AddNewContainerSpecification>()));
  gh.factory<_i212.CountriesScreen>(
      () => _i212.CountriesScreen(get<_i80.CountryStateManager>()));
  gh.factory<_i213.CountryModule>(() => _i213.CountryModule(
      get<_i212.CountriesScreen>(), get<_i184.AddNewCountry>()));
  gh.factory<_i214.DistributorsModule>(() => _i214.DistributorsModule(
      get<_i84.DistributorsScreen>(), get<_i185.AddNewDistributor>()));
  gh.factory<_i215.EditShipmentStateManager>(() =>
      _i215.EditShipmentStateManager(
          get<_i86.EditShipmentService>(),
          get<_i39.ImageUploadService>(),
          get<_i124.ReceiverService>(),
          get<_i106.MarkService>(),
          get<_i115.ProductService>(),
          get<_i82.DistributorService>(),
          get<_i157.UnitService>()));
  gh.factory<_i216.EditedShipmentScreen>(
      () => _i216.EditedShipmentScreen(get<_i215.EditShipmentStateManager>()));
  gh.factory<_i217.EmployeeModule>(() => _i217.EmployeeModule(
      get<_i90.EmployeesScreen>(), get<_i186.AddNewEmployee>()));
  gh.factory<_i218.FilterAirwaybillStateManager>(() =>
      _i218.FilterAirwaybillStateManager(get<_i144.SubcontractService>()));
  gh.factory<_i219.FilterContainerStateManager>(() =>
      _i219.FilterContainerStateManager(get<_i144.SubcontractService>(),
          get<_i74.ContainerSpecificationService>()));
  gh.factory<_i220.FilterTravelStateManager>(() =>
      _i220.FilterTravelStateManager(get<_i154.TravelService>(),
          get<_i79.CountryService>(), get<_i144.SubcontractService>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i103.HomeStateManager>()));
  gh.factory<_i221.MarkScreen>(
      () => _i221.MarkScreen(get<_i107.MarkStateManager>()));
  gh.factory<_i222.MyShipmentScreen>(
      () => _i222.MyShipmentScreen(get<_i110.MyShipmentStateManger>()));
  gh.factory<_i223.NewShiftingStateManager>(() => _i223.NewShiftingStateManager(
      get<_i131.ShiftingService>(), get<_i94.FirstOptionService>()));
  gh.factory<_i224.PriceScreen>(
      () => _i224.PriceScreen(get<_i113.PriceStateManager>()));
  gh.factory<_i225.ProductScreen>(
      () => _i225.ProductScreen(get<_i116.ProductStateManager>()));
  gh.factory<_i226.ProfileScreen>(
      () => _i226.ProfileScreen(get<_i119.ProfileStateManager>()));
  gh.factory<_i227.ProxiesScreen>(
      () => _i227.ProxiesScreen(get<_i122.ProxyStateManager>()));
  gh.factory<_i228.ReceiverScreen>(
      () => _i228.ReceiverScreen(get<_i125.ReceiverStateManager>()));
  gh.factory<_i229.RequestShipmentReview>(() =>
      _i229.RequestShipmentReview(get<_i128.ReviewShipmentStateManger>()));
  gh.factory<_i230.RequestShipmentStateManger>(() =>
      _i230.RequestShipmentStateManger(
          get<_i94.FirstOptionService>(),
          get<_i106.MarkService>(),
          get<_i69.ClientService>(),
          get<_i82.DistributorService>(),
          get<_i124.ReceiverService>(),
          get<_i157.UnitService>(),
          get<_i74.ContainerSpecificationService>(),
          get<_i98.HarborService>(),
          get<_i144.SubcontractService>()));
  gh.factory<_i231.SettingsModule>(
      () => _i231.SettingsModule(get<_i129.SettingsScreen>()));
  gh.factory<_i232.ShipmentShiftingScreen>(() =>
      _i232.ShipmentShiftingScreen(get<_i132.ShipmentsShiftingStateManager>()));
  gh.factory<_i233.ShipperScreen>(
      () => _i233.ShipperScreen(get<_i135.ShipperStateManager>()));
  gh.factory<_i234.SubContractServiceScreen>(() =>
      _i234.SubContractServiceScreen(
          get<_i139.SubContractServiceStateManager>()));
  gh.factory<_i235.SubProductScreen>(
      () => _i235.SubProductScreen(get<_i142.SubProductStateManager>()));
  gh.factory<_i236.SubcontractScreen>(
      () => _i236.SubcontractScreen(get<_i145.SubcontractStateManager>()));
  gh.factory<_i237.TrackingScreen>(
      () => _i237.TrackingScreen(get<_i152.TrackingStateManager>()));
  gh.factory<_i238.TravelDetailsStateManager>(
      () => _i238.TravelDetailsStateManager(get<_i154.TravelService>()));
  gh.factory<_i239.TravelFilterScreen>(
      () => _i239.TravelFilterScreen(get<_i220.FilterTravelStateManager>()));
  gh.factory<_i240.TravelFinanceStateManager>(
      () => _i240.TravelFinanceStateManager(get<_i154.TravelService>()));
  gh.factory<_i241.TravelScreen>(
      () => _i241.TravelScreen(get<_i155.TravelStateManager>()));
  gh.factory<_i242.UpdateContainer>(
      () => _i242.UpdateContainer(get<_i176.AddContainerStateManager>()));
  gh.factory<_i243.UpdateHarbor>(
      () => _i243.UpdateHarbor(get<_i180.AddHarborStateManager>()));
  gh.factory<_i244.UpdateSubContract>(
      () => _i244.UpdateSubContract(get<_i193.AddSubcontractStateManager>()));
  gh.factory<_i245.UpdateSubProduct>(
      () => _i245.UpdateSubProduct(get<_i192.AddSubProductStateManager>()));
  gh.factory<_i246.UpdateTravel>(
      () => _i246.UpdateTravel(get<_i195.AddTravelStateManager>()));
  gh.factory<_i247.UpdateWarehouse>(
      () => _i247.UpdateWarehouse(get<_i197.AddWarehouseStateManager>()));
  gh.factory<_i248.ViewWarehousesStateManager>(
      () => _i248.ViewWarehousesStateManager(get<_i166.WarehouseService>()));
  gh.factory<_i249.WaitingShipmentScreen>(() =>
      _i249.WaitingShipmentScreen(get<_i163.WaitingShipmentsStateManager>()));
  gh.factory<_i250.WarehouseFinanceStateManager>(
      () => _i250.WarehouseFinanceStateManager(get<_i166.WarehouseService>()));
  gh.factory<_i251.WarehouseScreen>(
      () => _i251.WarehouseScreen(get<_i167.WarehouseStateManager>()));
  gh.factory<_i252.AcceptedShipmentDetailsScreen>(() =>
      _i252.AcceptedShipmentDetailsScreen(
          get<_i171.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i253.AcceptedShipmentFinanceScreen>(() =>
      _i253.AcceptedShipmentFinanceScreen(
          get<_i172.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i254.AcceptedShipmentScreen>(() =>
      _i254.AcceptedShipmentScreen(get<_i173.AcceptedShipmentsStateManager>()));
  gh.factory<_i255.AcceptedShipmentsStatusStateManager>(() =>
      _i255.AcceptedShipmentsStatusStateManager(
          get<_i170.AcceptedShipmentService>(),
          get<_i144.SubcontractService>(),
          get<_i72.ContainerService>(),
          get<_i154.TravelService>(),
          get<_i166.WarehouseService>(),
          get<_i199.AirwaybillService>(),
          get<_i96.GunnyService>()));
  gh.factory<_i256.AddAirwaybillSpecificationStateManager>(() =>
      _i256.AddAirwaybillSpecificationStateManager(
          get<_i201.AirwaybillSpecificationService>()));
  gh.factory<_i257.AddAirwaybillStateManager>(() =>
      _i257.AddAirwaybillStateManager(
          get<_i199.AirwaybillService>(),
          get<_i144.SubcontractService>(),
          get<_i69.ClientService>(),
          get<_i98.HarborService>(),
          get<_i134.ShipperService>()));
  gh.factory<_i258.AddNewAirwaybill>(
      () => _i258.AddNewAirwaybill(get<_i257.AddAirwaybillStateManager>()));
  gh.factory<_i259.AddNewAirwaybillSpecification>(() =>
      _i259.AddNewAirwaybillSpecification(
          get<_i256.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i260.AddNewProduct>(
      () => _i260.AddNewProduct(get<_i188.AddProductStateManager>()));
  gh.factory<_i261.AddNewProxy>(
      () => _i261.AddNewProxy(get<_i189.AddProxyStateManager>()));
  gh.factory<_i262.AddNewShift>(
      () => _i262.AddNewShift(get<_i223.NewShiftingStateManager>()));
  gh.factory<_i263.AddNewShipper>(
      () => _i263.AddNewShipper(get<_i190.AddShipperStateManager>()));
  gh.factory<_i264.AddNewSubContractService>(() =>
      _i264.AddNewSubContractService(
          get<_i191.AddSubContractServiceStateManager>()));
  gh.factory<_i265.AddNewSubProduct>(
      () => _i265.AddNewSubProduct(get<_i192.AddSubProductStateManager>()));
  gh.factory<_i266.AddNewSubcontract>(
      () => _i266.AddNewSubcontract(get<_i193.AddSubcontractStateManager>()));
  gh.factory<_i267.AddNewSupplier>(
      () => _i267.AddNewSupplier(get<_i194.AddSupplierStateManager>()));
  gh.factory<_i268.AddNewTravel>(
      () => _i268.AddNewTravel(get<_i195.AddTravelStateManager>()));
  gh.factory<_i269.AddNewUnit>(
      () => _i269.AddNewUnit(get<_i196.AddUnitStateManager>()));
  gh.factory<_i270.AddNewWarehouse>(
      () => _i270.AddNewWarehouse(get<_i197.AddWarehouseStateManager>()));
  gh.factory<_i271.AirwaybillDetailsStateManager>(() =>
      _i271.AirwaybillDetailsStateManager(
          get<_i199.AirwaybillService>(), get<_i154.TravelService>()));
  gh.factory<_i272.AirwaybillFilterScreen>(() =>
      _i272.AirwaybillFilterScreen(get<_i218.FilterAirwaybillStateManager>()));
  gh.factory<_i273.AirwaybillFinanceStateManager>(() =>
      _i273.AirwaybillFinanceStateManager(get<_i199.AirwaybillService>()));
  gh.factory<_i274.AirwaybillScreen>(
      () => _i274.AirwaybillScreen(get<_i204.AirwaybillStateManager>()));
  gh.factory<_i275.AirwaybillSpecificationModule>(() =>
      _i275.AirwaybillSpecificationModule(
          get<_i203.AirwaybillSpecificationsScreen>(),
          get<_i259.AddNewAirwaybillSpecification>()));
  gh.factory<_i276.ClientModule>(() => _i276.ClientModule(
      get<_i207.ClientsScreen>(), get<_i181.AddNewClient>()));
  gh.factory<_i277.ContainerDetailsScreen>(() =>
      _i277.ContainerDetailsScreen(get<_i208.ContainerDetailsStateManager>()));
  gh.factory<_i278.ContainerFilterScreen>(() =>
      _i278.ContainerFilterScreen(get<_i219.FilterContainerStateManager>()));
  gh.factory<_i279.ContainerFinanceScreen>(() =>
      _i279.ContainerFinanceScreen(get<_i209.ContainerFinanceStateManager>()));
  gh.factory<_i280.ContainerModule>(() => _i280.ContainerModule(
      get<_i210.ContainerScreen>(),
      get<_i182.AddNewContainer>(),
      get<_i278.ContainerFilterScreen>(),
      get<_i277.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i279.ContainerFinanceScreen>(),
      get<_i242.UpdateContainer>()));
  gh.factory<_i281.EditShipmentModule>(
      () => _i281.EditShipmentModule(get<_i216.EditedShipmentScreen>()));
  gh.factory<_i282.HarborModule>(() => _i282.HarborModule(
      get<_i100.HarborsScreen>(),
      get<_i187.AddNewHarbor>(),
      get<_i243.UpdateHarbor>()));
  gh.factory<_i283.HomeModule>(
      () => _i283.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i284.MarkModule>(() => _i284.MarkModule(get<_i221.MarkScreen>()));
  gh.factory<_i285.MyShipmentModule>(() => _i285.MyShipmentModule(
      get<_i222.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i286.NewShipment>(
      () => _i286.NewShipment(get<_i230.RequestShipmentStateManger>()));
  gh.factory<_i287.NewShipmentsModule>(() => _i287.NewShipmentsModule(
      get<_i286.NewShipment>(), get<_i229.RequestShipmentReview>()));
  gh.factory<_i288.PriceModule>(
      () => _i288.PriceModule(get<_i224.PriceScreen>()));
  gh.factory<_i289.ProductModule>(() => _i289.ProductModule(
      get<_i225.ProductScreen>(), get<_i260.AddNewProduct>()));
  gh.factory<_i290.ProfileModule>(
      () => _i290.ProfileModule(get<_i226.ProfileScreen>()));
  gh.factory<_i291.ProxiesModule>(() => _i291.ProxiesModule(
      get<_i227.ProxiesScreen>(), get<_i261.AddNewProxy>()));
  gh.factory<_i292.ReceiverModule>(
      () => _i292.ReceiverModule(get<_i228.ReceiverScreen>()));
  gh.factory<_i293.ShiftingModule>(() => _i293.ShiftingModule(
      get<_i232.ShipmentShiftingScreen>(), get<_i262.AddNewShift>()));
  gh.factory<_i294.ShipperModule>(() => _i294.ShipperModule(
      get<_i233.ShipperScreen>(), get<_i263.AddNewShipper>()));
  gh.factory<_i295.SubContractServiceModule>(() =>
      _i295.SubContractServiceModule(get<_i234.SubContractServiceScreen>(),
          get<_i264.AddNewSubContractService>()));
  gh.factory<_i296.SubProductModule>(() => _i296.SubProductModule(
      get<_i235.SubProductScreen>(),
      get<_i265.AddNewSubProduct>(),
      get<_i245.UpdateSubProduct>()));
  gh.factory<_i297.SubcontractModule>(() => _i297.SubcontractModule(
      get<_i236.SubcontractScreen>(),
      get<_i266.AddNewSubcontract>(),
      get<_i244.UpdateSubContract>()));
  gh.factory<_i298.SupplierModule>(() => _i298.SupplierModule(
      get<_i149.SuppliersScreen>(), get<_i267.AddNewSupplier>()));
  gh.factory<_i299.TrackingModule>(
      () => _i299.TrackingModule(get<_i237.TrackingScreen>()));
  gh.factory<_i300.TravelDetailsScreen>(
      () => _i300.TravelDetailsScreen(get<_i238.TravelDetailsStateManager>()));
  gh.factory<_i301.TravelFinanceScreen>(
      () => _i301.TravelFinanceScreen(get<_i240.TravelFinanceStateManager>()));
  gh.factory<_i302.TravelModule>(() => _i302.TravelModule(
      get<_i241.TravelScreen>(),
      get<_i268.AddNewTravel>(),
      get<_i239.TravelFilterScreen>(),
      get<_i300.TravelDetailsScreen>(),
      get<_i301.TravelFinanceScreen>(),
      get<_i246.UpdateTravel>()));
  gh.factory<_i303.UnitModule>(() =>
      _i303.UnitModule(get<_i159.UnitsScreen>(), get<_i269.AddNewUnit>()));
  gh.factory<_i304.UpdateAirwaybill>(
      () => _i304.UpdateAirwaybill(get<_i257.AddAirwaybillStateManager>()));
  gh.factory<_i305.ViewWarehouseScreen>(
      () => _i305.ViewWarehouseScreen(get<_i248.ViewWarehousesStateManager>()));
  gh.factory<_i306.WaitingShipmentModule>(() => _i306.WaitingShipmentModule(
      get<_i249.WaitingShipmentScreen>(),
      get<_i164.WantingShipmentDetailsScreen>()));
  gh.factory<_i307.WarehouseFinanceScreen>(() =>
      _i307.WarehouseFinanceScreen(get<_i250.WarehouseFinanceStateManager>()));
  gh.factory<_i308.WarehouseModule>(() => _i308.WarehouseModule(
      get<_i251.WarehouseScreen>(),
      get<_i270.AddNewWarehouse>(),
      get<_i307.WarehouseFinanceScreen>(),
      get<_i247.UpdateWarehouse>()));
  gh.factory<_i309.AcceptedShipmentStatusScreen>(() =>
      _i309.AcceptedShipmentStatusScreen(
          get<_i255.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i310.AirwaybillDetailsScreen>(() => _i310.AirwaybillDetailsScreen(
      get<_i271.AirwaybillDetailsStateManager>()));
  gh.factory<_i311.AirwaybillFinanceScreen>(() => _i311.AirwaybillFinanceScreen(
      get<_i273.AirwaybillFinanceStateManager>()));
  gh.factory<_i312.AirwaybillModule>(() => _i312.AirwaybillModule(
      get<_i274.AirwaybillScreen>(),
      get<_i258.AddNewAirwaybill>(),
      get<_i272.AirwaybillFilterScreen>(),
      get<_i310.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i311.AirwaybillFinanceScreen>(),
      get<_i304.UpdateAirwaybill>()));
  gh.factory<_i313.AcceptedShipmentModule>(() => _i313.AcceptedShipmentModule(
      get<_i254.AcceptedShipmentScreen>(),
      get<_i252.AcceptedShipmentDetailsScreen>(),
      get<_i168.AcceptedShipmentFilterScreen>(),
      get<_i309.AcceptedShipmentStatusScreen>(),
      get<_i253.AcceptedShipmentFinanceScreen>(),
      get<_i305.ViewWarehouseScreen>()));
  gh.factory<_i314.MyApp>(() => _i314.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i92.FireNotificationService>(),
      get<_i283.HomeModule>(),
      get<_i136.SplashModule>(),
      get<_i205.AuthorizationModule>(),
      get<_i66.ChatModule>(),
      get<_i231.SettingsModule>(),
      get<_i290.ProfileModule>(),
      get<_i284.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i287.NewShipmentsModule>(),
      get<_i299.TrackingModule>(),
      get<_i281.EditShipmentModule>(),
      get<_i213.CountryModule>(),
      get<_i214.DistributorsModule>(),
      get<_i291.ProxiesModule>(),
      get<_i298.SupplierModule>(),
      get<_i295.SubContractServiceModule>(),
      get<_i297.SubcontractModule>(),
      get<_i303.UnitModule>(),
      get<_i302.TravelModule>(),
      get<_i280.ContainerModule>(),
      get<_i312.AirwaybillModule>(),
      get<_i211.ContainerSpecificationModule>(),
      get<_i275.AirwaybillSpecificationModule>(),
      get<_i306.WaitingShipmentModule>(),
      get<_i313.AcceptedShipmentModule>(),
      get<_i276.ClientModule>(),
      get<_i289.ProductModule>(),
      get<_i296.SubProductModule>(),
      get<_i308.WarehouseModule>(),
      get<_i292.ReceiverModule>(),
      get<_i217.EmployeeModule>(),
      get<_i282.HarborModule>(),
      get<_i294.ShipperModule>(),
      get<_i288.PriceModule>(),
      get<_i293.ShiftingModule>()));
  return get;
}
