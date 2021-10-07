// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i322;
import '../module_airwaybill/airwaybill_module.dart' as _i320;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i204;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i65;
import '../module_airwaybill/service/airwaybill_service.dart' as _i205;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i280;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i210;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i278;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i224;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i264;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i318;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i279;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i319;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i265;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i281;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i312;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i282;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i206;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i66;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i207;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i208;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i263;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i266;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i209;
import '../module_auth/authoriazation_module.dart' as _i211;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i42;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i110;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i212;
import '../module_chat/chat_module.dart' as _i68;
import '../module_chat/manager/chat/chat_manager.dart' as _i67;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i69;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i283;
import '../module_client/manager/client_manager.dart' as _i70;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i71;
import '../module_client/state_manager/client_state_manager.dart' as _i72;
import '../module_client/state_manager/new_client_state_manger.dart' as _i180;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i187;
import '../module_client/ui/screen/client_screen.dart' as _i213;
import '../module_container/container_module.dart' as _i287;
import '../module_container/manager/container_manager.dart' as _i73;
import '../module_container/manager/finance_container_manager.dart' as _i94;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/repository/finance_container_repository.dart'
    as _i35;
import '../module_container/service/container_service.dart' as _i74;
import '../module_container/service/finance_container_service.dart' as _i95;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i215;
import '../module_container/state_manger/container_state_manager.dart' as _i79;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i214;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i225;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i182;
import '../module_container/ui/screen/container_details_screen.dart' as _i284;
import '../module_container/ui/screen/container_filter_screen.dart' as _i285;
import '../module_container/ui/screen/container_finance_screen.dart' as _i286;
import '../module_container/ui/screen/container_new_screen.dart' as _i188;
import '../module_container/ui/screen/container_screen.dart' as _i216;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i248;
import '../module_container_specification/container_specification_module.dart'
    as _i217;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i75;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i76;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i77;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i181;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i189;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i78;
import '../module_countries/country_module.dart' as _i219;
import '../module_countries/manager/country_manager.dart' as _i80;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i81;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i82;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i183;
import '../module_countries/ui/screen/countries_screen.dart' as _i218;
import '../module_countries/ui/screen/country_new_screen.dart' as _i190;
import '../module_distributors/distributors_module.dart' as _i220;
import '../module_distributors/manager/distributors_manager.dart' as _i83;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i84;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i85;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i184;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i191;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i86;
import '../module_edit_shipment/edit_shipment_module.dart' as _i288;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i87;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i88;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i221;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i222;
import '../module_employees/employe_module.dart' as _i223;
import '../module_employees/manager/employees_manager.dart' as _i89;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i90;
import '../module_employees/state_manger/employees_state_manager.dart' as _i91;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i185;
import '../module_employees/ui/screen/employees_screen.dart' as _i92;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i192;
import '../module_gunny/manager/gunny_manager.dart' as _i101;
import '../module_gunny/repository/gunny_repo.dart' as _i38;
import '../module_gunny/service/gunny_service.dart' as _i102;
import '../module_harbor/harbor_module.dart' as _i289;
import '../module_harbor/manager/harbor_manager.dart' as _i103;
import '../module_harbor/repository/harbor_repository.dart' as _i39;
import '../module_harbor/service/harbor_service.dart' as _i104;
import '../module_harbor/state_manger/harbors_state_manager.dart' as _i105;
import '../module_harbor/state_manger/new_harbor_state_manger.dart' as _i186;
import '../module_harbor/ui/screen/harbor_update_screen.dart' as _i249;
import '../module_harbor/ui/screen/harbors_new_screen.dart' as _i193;
import '../module_harbor/ui/screen/harbors_screen.dart' as _i106;
import '../module_home/home_module.dart' as _i290;
import '../module_home/manager/home_manager.dart' as _i107;
import '../module_home/repository/home_repository.dart' as _i40;
import '../module_home/service/home_service.dart' as _i108;
import '../module_home/state_manager/state_manager_home.dart' as _i109;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i111;
import '../module_mark/mark_module.dart' as _i291;
import '../module_mark/repository/mark_repository.dart' as _i43;
import '../module_mark/service/mark_service.dart' as _i112;
import '../module_mark/state_manager/mark_state_manager.dart' as _i113;
import '../module_mark/ui/mark_screen.dart' as _i227;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i114;
import '../module_my_shipment/my_shipment_module.dart' as _i292;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i44;
import '../module_my_shipment/service/my_shipment_service.dart' as _i115;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i116;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i228;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i45;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i98;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_price/manager/price_manager.dart' as _i117;
import '../module_price/price_module.dart' as _i295;
import '../module_price/repository/price_repository.dart' as _i46;
import '../module_price/service/price_service.dart' as _i118;
import '../module_price/state_manager/price_state_manager.dart' as _i119;
import '../module_price/ui/price_screen.dart' as _i230;
import '../module_product_category/manager/product_category_manager.dart'
    as _i120;
import '../module_product_category/product_module.dart' as _i296;
import '../module_product_category/repository/product_category_repository.dart'
    as _i47;
import '../module_product_category/service/product_service.dart' as _i121;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i194;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i122;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i267;
import '../module_product_category/ui/screen/products_screen.dart' as _i231;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i146;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i56;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i147;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i198;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i148;
import '../module_product_sub_category/sub_product_module.dart' as _i304;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i272;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i251;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i241;
import '../module_profile/manager/profile_manager.dart' as _i123;
import '../module_profile/profile_module.dart' as _i297;
import '../module_profile/repository/profile_repository.dart' as _i48;
import '../module_profile/service/profile_service.dart' as _i124;
import '../module_profile/state_manager/profile_state_manager.dart' as _i125;
import '../module_profile/ui/profile_screen.dart' as _i232;
import '../module_proxies/manager/proxies_manager.dart' as _i126;
import '../module_proxies/proxies_module.dart' as _i298;
import '../module_proxies/repository/proxies_repository.dart' as _i49;
import '../module_proxies/service/proixes_service.dart' as _i127;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i195;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i128;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i233;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i268;
import '../module_receiver/manager/receiver_manager.dart' as _i129;
import '../module_receiver/recevier_module.dart' as _i299;
import '../module_receiver/repository/recevier_repository.dart' as _i50;
import '../module_receiver/service/receiver_service.dart' as _i130;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i131;
import '../module_receiver/ui/receiver_screen.dart' as _i234;
import '../module_report/manager/report_manager.dart' as _i132;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i51;
import '../module_report/service/report_service.dart' as _i133;
import '../module_settings/settings_module.dart' as _i237;
import '../module_settings/ui/settings_page/settings_page.dart' as _i135;
import '../module_shifting_shipment/manager/shifting_manager.dart' as _i136;
import '../module_shifting_shipment/repository/shipment_shifting_repo.dart'
    as _i52;
import '../module_shifting_shipment/service/shift_service.dart' as _i137;
import '../module_shifting_shipment/shifting_module.dart' as _i301;
import '../module_shifting_shipment/state_manager/new_shifting_state_manager.dart'
    as _i229;
import '../module_shifting_shipment/state_manager/shipments_shifitng_state_manager.dart'
    as _i138;
import '../module_shifting_shipment/state_manager/view_warehouse_state_manager.dart'
    as _i255;
import '../module_shifting_shipment/ui/screen/new_shift_screen.dart' as _i269;
import '../module_shifting_shipment/ui/screen/shift_warehouse_screen.dart'
    as _i300;
import '../module_shifting_shipment/ui/screen/shipment_shifting_screen.dart'
    as _i238;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i99;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i37;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i100;
import '../module_shipment_request/shipment_request_module.dart' as _i294;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i236;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i134;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i293;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i235;
import '../module_shipment_track/manager/tracking_manager.dart' as _i156;
import '../module_shipment_track/repository/tracking_repository.dart' as _i59;
import '../module_shipment_track/service/tracking_service.dart' as _i157;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i158;
import '../module_shipment_track/tracking_module.dart' as _i307;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i243;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i321;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i175;
import '../module_shipments_orders_accepted/manager/finance_shipment_manager.dart'
    as _i96;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i64;
import '../module_shipments_orders_accepted/repository/finance_shipment_repository.dart'
    as _i36;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i176;
import '../module_shipments_orders_accepted/service/finance_shipment_service.dart'
    as _i97;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i177;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i178;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i179;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i262;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i93;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i254;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i259;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i260;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i261;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i317;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i174;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i313;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i166;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i62;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i167;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i168;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i169;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i170;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i256;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i314;
import '../module_shipper/manager/shipper_manager.dart' as _i139;
import '../module_shipper/repository/shipper_repository.dart' as _i53;
import '../module_shipper/service/shipper_service.dart' as _i140;
import '../module_shipper/shipper_module.dart' as _i302;
import '../module_shipper/state_manger/new_shipper_state_manger.dart' as _i196;
import '../module_shipper/state_manger/shipper_state_manager.dart' as _i141;
import '../module_shipper/ui/screen/shipper_new_screen.dart' as _i270;
import '../module_shipper/ui/screen/shipper_screen.dart' as _i239;
import '../module_splash/splash_module.dart' as _i142;
import '../module_splash/ui/screen/splash_screen.dart' as _i54;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i149;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i57;
import '../module_sub_contract/service/subcontract_service.dart' as _i150;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i199;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i151;
import '../module_sub_contract/subcontract_module.dart' as _i305;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i273;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i250;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i242;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i143;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i55;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i144;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i197;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i145;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i303;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i271;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i240;
import '../module_suppliers/manager/suppliers_manager.dart' as _i152;
import '../module_suppliers/repository/suppliers_repository.dart' as _i58;
import '../module_suppliers/service/suppliers_service.dart' as _i153;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i200;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i154;
import '../module_suppliers/supplier_module.dart' as _i306;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i274;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i155;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i159;
import '../module_travel/repository/travel_repository.dart' as _i60;
import '../module_travel/service/travel_service.dart' as _i160;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i244;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i226;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i201;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i246;
import '../module_travel/state_manger/travels_state_manager.dart' as _i161;
import '../module_travel/travel_module.dart' as _i310;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i308;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i245;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i309;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i275;
import '../module_travel/ui/screen/travel_screen.dart' as _i247;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i252;
import '../module_unit/manager/unit_manager.dart' as _i162;
import '../module_unit/repository/unit_repository.dart' as _i61;
import '../module_unit/service/unit_service.dart' as _i163;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i202;
import '../module_unit/state_manger/units_state_manager.dart' as _i164;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i276;
import '../module_unit/ui/screen/units_screen.dart' as _i165;
import '../module_unit/unit_module.dart' as _i311;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i41;
import '../module_warehouses/manager/warehouses_manager.dart' as _i171;
import '../module_warehouses/repository/warehouse_repository.dart' as _i63;
import '../module_warehouses/service/warehouse_service.dart' as _i172;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i203;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i257;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i173;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i315;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i277;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i258;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i253;
import '../module_warehouses/warehouse_module.dart' as _i316;
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
  gh.factory<_i35.FinanceContainerRepository>(() =>
      _i35.FinanceContainerRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i36.FinanceShipmentRepository>(() =>
      _i36.FinanceShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i37.FirstOptionRepository>(() => _i37.FirstOptionRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i38.GunnyRepository>(() =>
      _i38.GunnyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i39.HarborRepository>(() =>
      _i39.HarborRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i40.HomeRepository>(() =>
      _i40.HomeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i41.ImageUploadService>(
      () => _i41.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i42.LoginStateManager>(
      () => _i42.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i43.MarkRepository>(() =>
      _i43.MarkRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i44.MyShipmentRepository>(() => _i44.MyShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i45.NotificationRepo>(() =>
      _i45.NotificationRepo(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i46.PriceRepository>(() =>
      _i46.PriceRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i47.ProductRepository>(() =>
      _i47.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i48.ProfileRepository>(() =>
      _i48.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i49.ProxyRepository>(() =>
      _i49.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i50.ReceiverRepository>(() =>
      _i50.ReceiverRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.ReportRepository>(() => _i51.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i52.ShiftingRepository>(() =>
      _i52.ShiftingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.ShipperRepository>(() =>
      _i53.ShipperRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.SplashScreen>(
      () => _i54.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i55.SubContractServiceRepository>(() =>
      _i55.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.SubProductRepository>(() => _i56.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.SubcontractRepository>(() => _i57.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.SupplierRepository>(() =>
      _i58.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.TrackingRepository>(() =>
      _i59.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.TravelRepository>(() =>
      _i60.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.UnitRepository>(() =>
      _i61.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i62.WaitingShipmentRepository>(() =>
      _i62.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i63.WarehousesRepository>(() => _i63.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i64.AcceptedShipmentRepository>(() =>
      _i64.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i65.AirwaybillRepository>(() => _i65.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i66.AirwaybillSpecificationRepository>(() =>
      _i66.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i67.ChatManager>(
      () => _i67.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i68.ChatModule>(() => _i68.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i69.ChatService>(() => _i69.ChatService(get<_i67.ChatManager>()));
  gh.factory<_i70.ClientManager>(
      () => _i70.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i71.ClientService>(
      () => _i71.ClientService(get<_i70.ClientManager>()));
  gh.factory<_i72.ClientsStateManager>(
      () => _i72.ClientsStateManager(get<_i71.ClientService>()));
  gh.factory<_i73.ContainerManager>(
      () => _i73.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i74.ContainerService>(
      () => _i74.ContainerService(get<_i73.ContainerManager>()));
  gh.factory<_i75.ContainerSpecificationManager>(() =>
      _i75.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i76.ContainerSpecificationService>(() =>
      _i76.ContainerSpecificationService(
          get<_i75.ContainerSpecificationManager>()));
  gh.factory<_i77.ContainerSpecificationStateManager>(() =>
      _i77.ContainerSpecificationStateManager(
          get<_i76.ContainerSpecificationService>()));
  gh.factory<_i78.ContainerSpecificationsScreen>(() =>
      _i78.ContainerSpecificationsScreen(
          get<_i77.ContainerSpecificationStateManager>()));
  gh.factory<_i79.ContainerStateManager>(
      () => _i79.ContainerStateManager(get<_i74.ContainerService>()));
  gh.factory<_i80.CountryManager>(
      () => _i80.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i81.CountryService>(
      () => _i81.CountryService(get<_i80.CountryManager>()));
  gh.factory<_i82.CountryStateManager>(
      () => _i82.CountryStateManager(get<_i81.CountryService>()));
  gh.factory<_i83.DistributorManager>(
      () => _i83.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i84.DistributorService>(
      () => _i84.DistributorService(get<_i83.DistributorManager>()));
  gh.factory<_i85.DistributorStateManager>(
      () => _i85.DistributorStateManager(get<_i84.DistributorService>()));
  gh.factory<_i86.DistributorsScreen>(
      () => _i86.DistributorsScreen(get<_i85.DistributorStateManager>()));
  gh.factory<_i87.EditShipmentManager>(
      () => _i87.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i88.EditShipmentService>(
      () => _i88.EditShipmentService(get<_i87.EditShipmentManager>()));
  gh.factory<_i89.EmployeeManager>(
      () => _i89.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i90.EmployeeService>(
      () => _i90.EmployeeService(get<_i89.EmployeeManager>()));
  gh.factory<_i91.EmployeeStateManager>(
      () => _i91.EmployeeStateManager(get<_i90.EmployeeService>()));
  gh.factory<_i92.EmployeesScreen>(
      () => _i92.EmployeesScreen(get<_i91.EmployeeStateManager>()));
  gh.factory<_i93.FilterAcceptedShipmentStateManager>(() =>
      _i93.FilterAcceptedShipmentStateManager(
          get<_i81.CountryService>(), get<_i71.ClientService>()));
  gh.factory<_i94.FinanceContainerManager>(() =>
      _i94.FinanceContainerManager(get<_i35.FinanceContainerRepository>()));
  gh.factory<_i95.FinanceContainerService>(
      () => _i95.FinanceContainerService(get<_i94.FinanceContainerManager>()));
  gh.factory<_i96.FinanceShipmentManager>(
      () => _i96.FinanceShipmentManager(get<_i36.FinanceShipmentRepository>()));
  gh.factory<_i97.FinanceShipmentService>(
      () => _i97.FinanceShipmentService(get<_i96.FinanceShipmentManager>()));
  gh.factory<_i98.FireNotificationService>(() => _i98.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i45.NotificationRepo>()));
  gh.factory<_i99.FirstOptionManager>(
      () => _i99.FirstOptionManager(get<_i37.FirstOptionRepository>()));
  gh.factory<_i100.FirstOptionService>(
      () => _i100.FirstOptionService(get<_i99.FirstOptionManager>()));
  gh.factory<_i101.GunnyManager>(
      () => _i101.GunnyManager(get<_i38.GunnyRepository>()));
  gh.factory<_i102.GunnyService>(
      () => _i102.GunnyService(get<_i101.GunnyManager>()));
  gh.factory<_i103.HarborManager>(
      () => _i103.HarborManager(get<_i39.HarborRepository>()));
  gh.factory<_i104.HarborService>(
      () => _i104.HarborService(get<_i103.HarborManager>()));
  gh.factory<_i105.HarborStateManager>(
      () => _i105.HarborStateManager(get<_i104.HarborService>()));
  gh.factory<_i106.HarborsScreen>(
      () => _i106.HarborsScreen(get<_i105.HarborStateManager>()));
  gh.factory<_i107.HomeManager>(
      () => _i107.HomeManager(get<_i40.HomeRepository>()));
  gh.factory<_i108.HomeService>(
      () => _i108.HomeService(get<_i107.HomeManager>()));
  gh.factory<_i109.HomeStateManager>(() => _i109.HomeStateManager(
      get<_i108.HomeService>(), get<_i90.EmployeeService>()));
  gh.factory<_i110.LoginScreen>(
      () => _i110.LoginScreen(get<_i42.LoginStateManager>()));
  gh.factory<_i111.MarkManager>(
      () => _i111.MarkManager(get<_i43.MarkRepository>()));
  gh.factory<_i112.MarkService>(
      () => _i112.MarkService(get<_i111.MarkManager>()));
  gh.factory<_i113.MarkStateManager>(() => _i113.MarkStateManager(
      get<_i112.MarkService>(), get<_i71.ClientService>()));
  gh.factory<_i114.MyShipmentManager>(
      () => _i114.MyShipmentManager(get<_i44.MyShipmentRepository>()));
  gh.factory<_i115.MyShipmentService>(
      () => _i115.MyShipmentService(get<_i114.MyShipmentManager>()));
  gh.factory<_i116.MyShipmentStateManger>(
      () => _i116.MyShipmentStateManger(get<_i115.MyShipmentService>()));
  gh.factory<_i117.PriceManager>(
      () => _i117.PriceManager(get<_i46.PriceRepository>()));
  gh.factory<_i118.PriceService>(
      () => _i118.PriceService(get<_i117.PriceManager>()));
  gh.factory<_i119.PriceStateManager>(() => _i119.PriceStateManager(
      get<_i118.PriceService>(), get<_i76.ContainerSpecificationService>()));
  gh.factory<_i120.ProductManager>(
      () => _i120.ProductManager(get<_i47.ProductRepository>()));
  gh.factory<_i121.ProductService>(
      () => _i121.ProductService(get<_i120.ProductManager>()));
  gh.factory<_i122.ProductStateManager>(
      () => _i122.ProductStateManager(get<_i121.ProductService>()));
  gh.factory<_i123.ProfileManager>(
      () => _i123.ProfileManager(get<_i48.ProfileRepository>()));
  gh.factory<_i124.ProfileService>(
      () => _i124.ProfileService(get<_i123.ProfileManager>()));
  gh.factory<_i125.ProfileStateManager>(
      () => _i125.ProfileStateManager(get<_i124.ProfileService>()));
  gh.factory<_i126.ProxyManager>(
      () => _i126.ProxyManager(get<_i49.ProxyRepository>()));
  gh.factory<_i127.ProxyService>(
      () => _i127.ProxyService(get<_i126.ProxyManager>()));
  gh.factory<_i128.ProxyStateManager>(
      () => _i128.ProxyStateManager(get<_i127.ProxyService>()));
  gh.factory<_i129.ReceiverManager>(
      () => _i129.ReceiverManager(get<_i50.ReceiverRepository>()));
  gh.factory<_i130.ReceiverService>(
      () => _i130.ReceiverService(get<_i129.ReceiverManager>()));
  gh.factory<_i131.ReceiverStateManager>(() => _i131.ReceiverStateManager(
      get<_i130.ReceiverService>(), get<_i71.ClientService>()));
  gh.factory<_i132.ReportManager>(
      () => _i132.ReportManager(get<_i51.ReportRepository>()));
  gh.factory<_i133.ReportService>(
      () => _i133.ReportService(get<_i132.ReportManager>()));
  gh.factory<_i134.ReviewShipmentStateManger>(() =>
      _i134.ReviewShipmentStateManger(
          get<_i100.FirstOptionService>(), get<_i41.ImageUploadService>()));
  gh.factory<_i135.SettingsScreen>(() => _i135.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i98.FireNotificationService>()));
  gh.factory<_i136.ShiftingManager>(
      () => _i136.ShiftingManager(get<_i52.ShiftingRepository>()));
  gh.factory<_i137.ShiftingService>(
      () => _i137.ShiftingService(get<_i136.ShiftingManager>()));
  gh.factory<_i138.ShipmentsShiftingStateManager>(
      () => _i138.ShipmentsShiftingStateManager(get<_i137.ShiftingService>()));
  gh.factory<_i139.ShipperManager>(
      () => _i139.ShipperManager(get<_i53.ShipperRepository>()));
  gh.factory<_i140.ShipperService>(
      () => _i140.ShipperService(get<_i139.ShipperManager>()));
  gh.factory<_i141.ShipperStateManager>(
      () => _i141.ShipperStateManager(get<_i140.ShipperService>()));
  gh.factory<_i142.SplashModule>(
      () => _i142.SplashModule(get<_i54.SplashScreen>()));
  gh.factory<_i143.SubContractServiceManager>(() =>
      _i143.SubContractServiceManager(
          get<_i55.SubContractServiceRepository>()));
  gh.factory<_i144.SubContractServiceService>(() =>
      _i144.SubContractServiceService(get<_i143.SubContractServiceManager>()));
  gh.factory<_i145.SubContractServiceStateManager>(() =>
      _i145.SubContractServiceStateManager(
          get<_i144.SubContractServiceService>()));
  gh.factory<_i146.SubProductManager>(
      () => _i146.SubProductManager(get<_i56.SubProductRepository>()));
  gh.factory<_i147.SubProductService>(
      () => _i147.SubProductService(get<_i146.SubProductManager>()));
  gh.factory<_i148.SubProductStateManager>(
      () => _i148.SubProductStateManager(get<_i147.SubProductService>()));
  gh.factory<_i149.SubcontractManager>(
      () => _i149.SubcontractManager(get<_i57.SubcontractRepository>()));
  gh.factory<_i150.SubcontractService>(
      () => _i150.SubcontractService(get<_i149.SubcontractManager>()));
  gh.factory<_i151.SubcontractStateManager>(
      () => _i151.SubcontractStateManager(get<_i150.SubcontractService>()));
  gh.factory<_i152.SupplierManager>(
      () => _i152.SupplierManager(get<_i58.SupplierRepository>()));
  gh.factory<_i153.SupplierService>(
      () => _i153.SupplierService(get<_i152.SupplierManager>()));
  gh.factory<_i154.SupplierStateManager>(
      () => _i154.SupplierStateManager(get<_i153.SupplierService>()));
  gh.factory<_i155.SuppliersScreen>(
      () => _i155.SuppliersScreen(get<_i154.SupplierStateManager>()));
  gh.factory<_i156.TrackingManager>(
      () => _i156.TrackingManager(get<_i59.TrackingRepository>()));
  gh.factory<_i157.TrackingService>(
      () => _i157.TrackingService(get<_i156.TrackingManager>()));
  gh.factory<_i158.TrackingStateManager>(
      () => _i158.TrackingStateManager(get<_i157.TrackingService>()));
  gh.factory<_i159.TravelManager>(
      () => _i159.TravelManager(get<_i60.TravelRepository>()));
  gh.factory<_i160.TravelService>(
      () => _i160.TravelService(get<_i159.TravelManager>()));
  gh.factory<_i161.TravelStateManager>(
      () => _i161.TravelStateManager(get<_i160.TravelService>()));
  gh.factory<_i162.UnitManager>(
      () => _i162.UnitManager(get<_i61.UnitRepository>()));
  gh.factory<_i163.UnitService>(
      () => _i163.UnitService(get<_i162.UnitManager>()));
  gh.factory<_i164.UnitStateManager>(
      () => _i164.UnitStateManager(get<_i163.UnitService>()));
  gh.factory<_i165.UnitsScreen>(
      () => _i165.UnitsScreen(get<_i164.UnitStateManager>()));
  gh.factory<_i166.WaitingShipmentManager>(() =>
      _i166.WaitingShipmentManager(get<_i62.WaitingShipmentRepository>()));
  gh.factory<_i167.WaitingShipmentService>(
      () => _i167.WaitingShipmentService(get<_i166.WaitingShipmentManager>()));
  gh.factory<_i168.WaitingShipmentsDetailsStateManager>(() =>
      _i168.WaitingShipmentsDetailsStateManager(
          get<_i167.WaitingShipmentService>()));
  gh.factory<_i169.WaitingShipmentsStateManager>(() =>
      _i169.WaitingShipmentsStateManager(get<_i167.WaitingShipmentService>()));
  gh.factory<_i170.WantingShipmentDetailsScreen>(() =>
      _i170.WantingShipmentDetailsScreen(
          get<_i168.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i171.WarehouseManager>(
      () => _i171.WarehouseManager(get<_i63.WarehousesRepository>()));
  gh.factory<_i172.WarehouseService>(
      () => _i172.WarehouseService(get<_i171.WarehouseManager>()));
  gh.factory<_i173.WarehouseStateManager>(
      () => _i173.WarehouseStateManager(get<_i172.WarehouseService>()));
  gh.factory<_i174.AcceptedShipmentFilterScreen>(() =>
      _i174.AcceptedShipmentFilterScreen(
          get<_i93.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i175.AcceptedShipmentManager>(() =>
      _i175.AcceptedShipmentManager(get<_i64.AcceptedShipmentRepository>()));
  gh.factory<_i176.AcceptedShipmentService>(() =>
      _i176.AcceptedShipmentService(get<_i175.AcceptedShipmentManager>()));
  gh.factory<_i177.AcceptedShipmentsDetailsStateManager>(() =>
      _i177.AcceptedShipmentsDetailsStateManager(
          get<_i176.AcceptedShipmentService>(), get<_i74.ContainerService>()));
  gh.factory<_i178.AcceptedShipmentsFinanceStateManager>(() =>
      _i178.AcceptedShipmentsFinanceStateManager(
          get<_i97.FinanceShipmentService>(), get<_i150.SubcontractService>()));
  gh.factory<_i179.AcceptedShipmentsStateManager>(() =>
      _i179.AcceptedShipmentsStateManager(
          get<_i176.AcceptedShipmentService>()));
  gh.factory<_i180.AddClientStateManager>(
      () => _i180.AddClientStateManager(get<_i71.ClientService>()));
  gh.factory<_i181.AddContainerSpecificationStateManager>(() =>
      _i181.AddContainerSpecificationStateManager(
          get<_i76.ContainerSpecificationService>()));
  gh.factory<_i182.AddContainerStateManager>(() =>
      _i182.AddContainerStateManager(
          get<_i74.ContainerService>(),
          get<_i150.SubcontractService>(),
          get<_i76.ContainerSpecificationService>(),
          get<_i71.ClientService>(),
          get<_i104.HarborService>(),
          get<_i140.ShipperService>()));
  gh.factory<_i183.AddCountryStateManager>(
      () => _i183.AddCountryStateManager(get<_i81.CountryService>()));
  gh.factory<_i184.AddDistributorStateManager>(
      () => _i184.AddDistributorStateManager(get<_i84.DistributorService>()));
  gh.factory<_i185.AddEmployeeStateManager>(
      () => _i185.AddEmployeeStateManager(get<_i90.EmployeeService>()));
  gh.factory<_i186.AddHarborStateManager>(() => _i186.AddHarborStateManager(
      get<_i104.HarborService>(), get<_i81.CountryService>()));
  gh.factory<_i187.AddNewClient>(
      () => _i187.AddNewClient(get<_i180.AddClientStateManager>()));
  gh.factory<_i188.AddNewContainer>(
      () => _i188.AddNewContainer(get<_i182.AddContainerStateManager>()));
  gh.factory<_i189.AddNewContainerSpecification>(() =>
      _i189.AddNewContainerSpecification(
          get<_i181.AddContainerSpecificationStateManager>()));
  gh.factory<_i190.AddNewCountry>(
      () => _i190.AddNewCountry(get<_i183.AddCountryStateManager>()));
  gh.factory<_i191.AddNewDistributor>(
      () => _i191.AddNewDistributor(get<_i184.AddDistributorStateManager>()));
  gh.factory<_i192.AddNewEmployee>(
      () => _i192.AddNewEmployee(get<_i185.AddEmployeeStateManager>()));
  gh.factory<_i193.AddNewHarbor>(
      () => _i193.AddNewHarbor(get<_i186.AddHarborStateManager>()));
  gh.factory<_i194.AddProductStateManager>(
      () => _i194.AddProductStateManager(get<_i121.ProductService>()));
  gh.factory<_i195.AddProxyStateManager>(
      () => _i195.AddProxyStateManager(get<_i127.ProxyService>()));
  gh.factory<_i196.AddShipperStateManager>(
      () => _i196.AddShipperStateManager(get<_i140.ShipperService>()));
  gh.factory<_i197.AddSubContractServiceStateManager>(() =>
      _i197.AddSubContractServiceStateManager(
          get<_i144.SubContractServiceService>()));
  gh.factory<_i198.AddSubProductStateManager>(() =>
      _i198.AddSubProductStateManager(
          get<_i147.SubProductService>(), get<_i121.ProductService>()));
  gh.factory<_i199.AddSubcontractStateManager>(() =>
      _i199.AddSubcontractStateManager(get<_i144.SubContractServiceService>(),
          get<_i150.SubcontractService>()));
  gh.factory<_i200.AddSupplierStateManager>(
      () => _i200.AddSupplierStateManager(get<_i153.SupplierService>()));
  gh.factory<_i201.AddTravelStateManager>(() => _i201.AddTravelStateManager(
      get<_i160.TravelService>(),
      get<_i81.CountryService>(),
      get<_i150.SubcontractService>()));
  gh.factory<_i202.AddUnitStateManager>(
      () => _i202.AddUnitStateManager(get<_i163.UnitService>()));
  gh.factory<_i203.AddWarehouseStateManager>(() =>
      _i203.AddWarehouseStateManager(
          get<_i172.WarehouseService>(),
          get<_i150.SubcontractService>(),
          get<_i127.ProxyService>(),
          get<_i81.CountryService>()));
  gh.factory<_i204.AirwaybillManager>(
      () => _i204.AirwaybillManager(get<_i65.AirwaybillRepository>()));
  gh.factory<_i205.AirwaybillService>(
      () => _i205.AirwaybillService(get<_i204.AirwaybillManager>()));
  gh.factory<_i206.AirwaybillSpecificationManager>(() =>
      _i206.AirwaybillSpecificationManager(
          get<_i66.AirwaybillSpecificationRepository>()));
  gh.factory<_i207.AirwaybillSpecificationService>(() =>
      _i207.AirwaybillSpecificationService(
          get<_i206.AirwaybillSpecificationManager>()));
  gh.factory<_i208.AirwaybillSpecificationStateManager>(() =>
      _i208.AirwaybillSpecificationStateManager(
          get<_i207.AirwaybillSpecificationService>()));
  gh.factory<_i209.AirwaybillSpecificationsScreen>(() =>
      _i209.AirwaybillSpecificationsScreen(
          get<_i208.AirwaybillSpecificationStateManager>()));
  gh.factory<_i210.AirwaybillStateManager>(
      () => _i210.AirwaybillStateManager(get<_i205.AirwaybillService>()));
  gh.factory<_i211.AuthorizationModule>(
      () => _i211.AuthorizationModule(get<_i110.LoginScreen>()));
  gh.factory<_i212.ChatPageBloc>(
      () => _i212.ChatPageBloc(get<_i69.ChatService>()));
  gh.factory<_i213.ClientsScreen>(
      () => _i213.ClientsScreen(get<_i72.ClientsStateManager>()));
  gh.factory<_i214.ContainerDetailsStateManager>(() =>
      _i214.ContainerDetailsStateManager(
          get<_i74.ContainerService>(), get<_i160.TravelService>()));
  gh.factory<_i215.ContainerFinanceStateManager>(() =>
      _i215.ContainerFinanceStateManager(get<_i95.FinanceContainerService>(),
          get<_i150.SubcontractService>()));
  gh.factory<_i216.ContainerScreen>(
      () => _i216.ContainerScreen(get<_i79.ContainerStateManager>()));
  gh.factory<_i217.ContainerSpecificationModule>(() =>
      _i217.ContainerSpecificationModule(
          get<_i78.ContainerSpecificationsScreen>(),
          get<_i189.AddNewContainerSpecification>()));
  gh.factory<_i218.CountriesScreen>(
      () => _i218.CountriesScreen(get<_i82.CountryStateManager>()));
  gh.factory<_i219.CountryModule>(() => _i219.CountryModule(
      get<_i218.CountriesScreen>(), get<_i190.AddNewCountry>()));
  gh.factory<_i220.DistributorsModule>(() => _i220.DistributorsModule(
      get<_i86.DistributorsScreen>(), get<_i191.AddNewDistributor>()));
  gh.factory<_i221.EditShipmentStateManager>(() =>
      _i221.EditShipmentStateManager(
          get<_i88.EditShipmentService>(),
          get<_i41.ImageUploadService>(),
          get<_i130.ReceiverService>(),
          get<_i112.MarkService>(),
          get<_i121.ProductService>(),
          get<_i84.DistributorService>(),
          get<_i163.UnitService>()));
  gh.factory<_i222.EditedShipmentScreen>(
      () => _i222.EditedShipmentScreen(get<_i221.EditShipmentStateManager>()));
  gh.factory<_i223.EmployeeModule>(() => _i223.EmployeeModule(
      get<_i92.EmployeesScreen>(), get<_i192.AddNewEmployee>()));
  gh.factory<_i224.FilterAirwaybillStateManager>(() =>
      _i224.FilterAirwaybillStateManager(get<_i150.SubcontractService>()));
  gh.factory<_i225.FilterContainerStateManager>(() =>
      _i225.FilterContainerStateManager(get<_i150.SubcontractService>(),
          get<_i76.ContainerSpecificationService>()));
  gh.factory<_i226.FilterTravelStateManager>(() =>
      _i226.FilterTravelStateManager(get<_i160.TravelService>(),
          get<_i81.CountryService>(), get<_i150.SubcontractService>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i109.HomeStateManager>()));
  gh.factory<_i227.MarkScreen>(
      () => _i227.MarkScreen(get<_i113.MarkStateManager>()));
  gh.factory<_i228.MyShipmentScreen>(
      () => _i228.MyShipmentScreen(get<_i116.MyShipmentStateManger>()));
  gh.factory<_i229.NewShiftingStateManager>(() => _i229.NewShiftingStateManager(
      get<_i137.ShiftingService>(), get<_i100.FirstOptionService>()));
  gh.factory<_i230.PriceScreen>(
      () => _i230.PriceScreen(get<_i119.PriceStateManager>()));
  gh.factory<_i231.ProductScreen>(
      () => _i231.ProductScreen(get<_i122.ProductStateManager>()));
  gh.factory<_i232.ProfileScreen>(
      () => _i232.ProfileScreen(get<_i125.ProfileStateManager>()));
  gh.factory<_i233.ProxiesScreen>(
      () => _i233.ProxiesScreen(get<_i128.ProxyStateManager>()));
  gh.factory<_i234.ReceiverScreen>(
      () => _i234.ReceiverScreen(get<_i131.ReceiverStateManager>()));
  gh.factory<_i235.RequestShipmentReview>(() =>
      _i235.RequestShipmentReview(get<_i134.ReviewShipmentStateManger>()));
  gh.factory<_i236.RequestShipmentStateManger>(() =>
      _i236.RequestShipmentStateManger(
          get<_i100.FirstOptionService>(),
          get<_i112.MarkService>(),
          get<_i71.ClientService>(),
          get<_i84.DistributorService>(),
          get<_i130.ReceiverService>(),
          get<_i163.UnitService>(),
          get<_i76.ContainerSpecificationService>(),
          get<_i104.HarborService>(),
          get<_i150.SubcontractService>()));
  gh.factory<_i237.SettingsModule>(
      () => _i237.SettingsModule(get<_i135.SettingsScreen>()));
  gh.factory<_i238.ShipmentShiftingScreen>(() =>
      _i238.ShipmentShiftingScreen(get<_i138.ShipmentsShiftingStateManager>()));
  gh.factory<_i239.ShipperScreen>(
      () => _i239.ShipperScreen(get<_i141.ShipperStateManager>()));
  gh.factory<_i240.SubContractServiceScreen>(() =>
      _i240.SubContractServiceScreen(
          get<_i145.SubContractServiceStateManager>()));
  gh.factory<_i241.SubProductScreen>(
      () => _i241.SubProductScreen(get<_i148.SubProductStateManager>()));
  gh.factory<_i242.SubcontractScreen>(
      () => _i242.SubcontractScreen(get<_i151.SubcontractStateManager>()));
  gh.factory<_i243.TrackingScreen>(
      () => _i243.TrackingScreen(get<_i158.TrackingStateManager>()));
  gh.factory<_i244.TravelDetailsStateManager>(
      () => _i244.TravelDetailsStateManager(get<_i160.TravelService>()));
  gh.factory<_i245.TravelFilterScreen>(
      () => _i245.TravelFilterScreen(get<_i226.FilterTravelStateManager>()));
  gh.factory<_i246.TravelFinanceStateManager>(
      () => _i246.TravelFinanceStateManager(get<_i160.TravelService>()));
  gh.factory<_i247.TravelScreen>(
      () => _i247.TravelScreen(get<_i161.TravelStateManager>()));
  gh.factory<_i248.UpdateContainer>(
      () => _i248.UpdateContainer(get<_i182.AddContainerStateManager>()));
  gh.factory<_i249.UpdateHarbor>(
      () => _i249.UpdateHarbor(get<_i186.AddHarborStateManager>()));
  gh.factory<_i250.UpdateSubContract>(
      () => _i250.UpdateSubContract(get<_i199.AddSubcontractStateManager>()));
  gh.factory<_i251.UpdateSubProduct>(
      () => _i251.UpdateSubProduct(get<_i198.AddSubProductStateManager>()));
  gh.factory<_i252.UpdateTravel>(
      () => _i252.UpdateTravel(get<_i201.AddTravelStateManager>()));
  gh.factory<_i253.UpdateWarehouse>(
      () => _i253.UpdateWarehouse(get<_i203.AddWarehouseStateManager>()));
  gh.factory<_i254.ViewWarehousesStateManager>(
      () => _i254.ViewWarehousesStateManager(get<_i172.WarehouseService>()));
  gh.factory<_i255.ViewWarehousesStateManager>(
      () => _i255.ViewWarehousesStateManager(get<_i172.WarehouseService>()));
  gh.factory<_i256.WaitingShipmentScreen>(() =>
      _i256.WaitingShipmentScreen(get<_i169.WaitingShipmentsStateManager>()));
  gh.factory<_i257.WarehouseFinanceStateManager>(
      () => _i257.WarehouseFinanceStateManager(get<_i172.WarehouseService>()));
  gh.factory<_i258.WarehouseScreen>(
      () => _i258.WarehouseScreen(get<_i173.WarehouseStateManager>()));
  gh.factory<_i259.AcceptedShipmentDetailsScreen>(() =>
      _i259.AcceptedShipmentDetailsScreen(
          get<_i177.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i260.AcceptedShipmentFinanceScreen>(() =>
      _i260.AcceptedShipmentFinanceScreen(
          get<_i178.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i261.AcceptedShipmentScreen>(() =>
      _i261.AcceptedShipmentScreen(get<_i179.AcceptedShipmentsStateManager>()));
  gh.factory<_i262.AcceptedShipmentsStatusStateManager>(() =>
      _i262.AcceptedShipmentsStatusStateManager(
          get<_i176.AcceptedShipmentService>(),
          get<_i150.SubcontractService>(),
          get<_i74.ContainerService>(),
          get<_i160.TravelService>(),
          get<_i172.WarehouseService>(),
          get<_i205.AirwaybillService>(),
          get<_i102.GunnyService>()));
  gh.factory<_i263.AddAirwaybillSpecificationStateManager>(() =>
      _i263.AddAirwaybillSpecificationStateManager(
          get<_i207.AirwaybillSpecificationService>()));
  gh.factory<_i264.AddAirwaybillStateManager>(() =>
      _i264.AddAirwaybillStateManager(
          get<_i205.AirwaybillService>(),
          get<_i150.SubcontractService>(),
          get<_i71.ClientService>(),
          get<_i104.HarborService>(),
          get<_i140.ShipperService>()));
  gh.factory<_i265.AddNewAirwaybill>(
      () => _i265.AddNewAirwaybill(get<_i264.AddAirwaybillStateManager>()));
  gh.factory<_i266.AddNewAirwaybillSpecification>(() =>
      _i266.AddNewAirwaybillSpecification(
          get<_i263.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i267.AddNewProduct>(
      () => _i267.AddNewProduct(get<_i194.AddProductStateManager>()));
  gh.factory<_i268.AddNewProxy>(
      () => _i268.AddNewProxy(get<_i195.AddProxyStateManager>()));
  gh.factory<_i269.AddNewShift>(
      () => _i269.AddNewShift(get<_i229.NewShiftingStateManager>()));
  gh.factory<_i270.AddNewShipper>(
      () => _i270.AddNewShipper(get<_i196.AddShipperStateManager>()));
  gh.factory<_i271.AddNewSubContractService>(() =>
      _i271.AddNewSubContractService(
          get<_i197.AddSubContractServiceStateManager>()));
  gh.factory<_i272.AddNewSubProduct>(
      () => _i272.AddNewSubProduct(get<_i198.AddSubProductStateManager>()));
  gh.factory<_i273.AddNewSubcontract>(
      () => _i273.AddNewSubcontract(get<_i199.AddSubcontractStateManager>()));
  gh.factory<_i274.AddNewSupplier>(
      () => _i274.AddNewSupplier(get<_i200.AddSupplierStateManager>()));
  gh.factory<_i275.AddNewTravel>(
      () => _i275.AddNewTravel(get<_i201.AddTravelStateManager>()));
  gh.factory<_i276.AddNewUnit>(
      () => _i276.AddNewUnit(get<_i202.AddUnitStateManager>()));
  gh.factory<_i277.AddNewWarehouse>(
      () => _i277.AddNewWarehouse(get<_i203.AddWarehouseStateManager>()));
  gh.factory<_i278.AirwaybillDetailsStateManager>(() =>
      _i278.AirwaybillDetailsStateManager(
          get<_i205.AirwaybillService>(), get<_i160.TravelService>()));
  gh.factory<_i279.AirwaybillFilterScreen>(() =>
      _i279.AirwaybillFilterScreen(get<_i224.FilterAirwaybillStateManager>()));
  gh.factory<_i280.AirwaybillFinanceStateManager>(() =>
      _i280.AirwaybillFinanceStateManager(get<_i205.AirwaybillService>()));
  gh.factory<_i281.AirwaybillScreen>(
      () => _i281.AirwaybillScreen(get<_i210.AirwaybillStateManager>()));
  gh.factory<_i282.AirwaybillSpecificationModule>(() =>
      _i282.AirwaybillSpecificationModule(
          get<_i209.AirwaybillSpecificationsScreen>(),
          get<_i266.AddNewAirwaybillSpecification>()));
  gh.factory<_i283.ClientModule>(() => _i283.ClientModule(
      get<_i213.ClientsScreen>(), get<_i187.AddNewClient>()));
  gh.factory<_i284.ContainerDetailsScreen>(() =>
      _i284.ContainerDetailsScreen(get<_i214.ContainerDetailsStateManager>()));
  gh.factory<_i285.ContainerFilterScreen>(() =>
      _i285.ContainerFilterScreen(get<_i225.FilterContainerStateManager>()));
  gh.factory<_i286.ContainerFinanceScreen>(() =>
      _i286.ContainerFinanceScreen(get<_i215.ContainerFinanceStateManager>()));
  gh.factory<_i287.ContainerModule>(() => _i287.ContainerModule(
      get<_i216.ContainerScreen>(),
      get<_i188.AddNewContainer>(),
      get<_i285.ContainerFilterScreen>(),
      get<_i284.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i286.ContainerFinanceScreen>(),
      get<_i248.UpdateContainer>()));
  gh.factory<_i288.EditShipmentModule>(
      () => _i288.EditShipmentModule(get<_i222.EditedShipmentScreen>()));
  gh.factory<_i289.HarborModule>(() => _i289.HarborModule(
      get<_i106.HarborsScreen>(),
      get<_i193.AddNewHarbor>(),
      get<_i249.UpdateHarbor>()));
  gh.factory<_i290.HomeModule>(
      () => _i290.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i291.MarkModule>(() => _i291.MarkModule(get<_i227.MarkScreen>()));
  gh.factory<_i292.MyShipmentModule>(() => _i292.MyShipmentModule(
      get<_i228.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i293.NewShipment>(
      () => _i293.NewShipment(get<_i236.RequestShipmentStateManger>()));
  gh.factory<_i294.NewShipmentsModule>(() => _i294.NewShipmentsModule(
      get<_i293.NewShipment>(), get<_i235.RequestShipmentReview>()));
  gh.factory<_i295.PriceModule>(
      () => _i295.PriceModule(get<_i230.PriceScreen>()));
  gh.factory<_i296.ProductModule>(() => _i296.ProductModule(
      get<_i231.ProductScreen>(), get<_i267.AddNewProduct>()));
  gh.factory<_i297.ProfileModule>(
      () => _i297.ProfileModule(get<_i232.ProfileScreen>()));
  gh.factory<_i298.ProxiesModule>(() => _i298.ProxiesModule(
      get<_i233.ProxiesScreen>(), get<_i268.AddNewProxy>()));
  gh.factory<_i299.ReceiverModule>(
      () => _i299.ReceiverModule(get<_i234.ReceiverScreen>()));
  gh.factory<_i300.ShiftWarehouseScreen>(() =>
      _i300.ShiftWarehouseScreen(get<_i255.ViewWarehousesStateManager>()));
  gh.factory<_i301.ShiftingModule>(() => _i301.ShiftingModule(
      get<_i238.ShipmentShiftingScreen>(),
      get<_i269.AddNewShift>(),
      get<_i300.ShiftWarehouseScreen>()));
  gh.factory<_i302.ShipperModule>(() => _i302.ShipperModule(
      get<_i239.ShipperScreen>(), get<_i270.AddNewShipper>()));
  gh.factory<_i303.SubContractServiceModule>(() =>
      _i303.SubContractServiceModule(get<_i240.SubContractServiceScreen>(),
          get<_i271.AddNewSubContractService>()));
  gh.factory<_i304.SubProductModule>(() => _i304.SubProductModule(
      get<_i241.SubProductScreen>(),
      get<_i272.AddNewSubProduct>(),
      get<_i251.UpdateSubProduct>()));
  gh.factory<_i305.SubcontractModule>(() => _i305.SubcontractModule(
      get<_i242.SubcontractScreen>(),
      get<_i273.AddNewSubcontract>(),
      get<_i250.UpdateSubContract>()));
  gh.factory<_i306.SupplierModule>(() => _i306.SupplierModule(
      get<_i155.SuppliersScreen>(), get<_i274.AddNewSupplier>()));
  gh.factory<_i307.TrackingModule>(
      () => _i307.TrackingModule(get<_i243.TrackingScreen>()));
  gh.factory<_i308.TravelDetailsScreen>(
      () => _i308.TravelDetailsScreen(get<_i244.TravelDetailsStateManager>()));
  gh.factory<_i309.TravelFinanceScreen>(
      () => _i309.TravelFinanceScreen(get<_i246.TravelFinanceStateManager>()));
  gh.factory<_i310.TravelModule>(() => _i310.TravelModule(
      get<_i247.TravelScreen>(),
      get<_i275.AddNewTravel>(),
      get<_i245.TravelFilterScreen>(),
      get<_i308.TravelDetailsScreen>(),
      get<_i309.TravelFinanceScreen>(),
      get<_i252.UpdateTravel>()));
  gh.factory<_i311.UnitModule>(() =>
      _i311.UnitModule(get<_i165.UnitsScreen>(), get<_i276.AddNewUnit>()));
  gh.factory<_i312.UpdateAirwaybill>(
      () => _i312.UpdateAirwaybill(get<_i264.AddAirwaybillStateManager>()));
  gh.factory<_i313.ViewWarehouseScreen>(
      () => _i313.ViewWarehouseScreen(get<_i254.ViewWarehousesStateManager>()));
  gh.factory<_i314.WaitingShipmentModule>(() => _i314.WaitingShipmentModule(
      get<_i256.WaitingShipmentScreen>(),
      get<_i170.WantingShipmentDetailsScreen>()));
  gh.factory<_i315.WarehouseFinanceScreen>(() =>
      _i315.WarehouseFinanceScreen(get<_i257.WarehouseFinanceStateManager>()));
  gh.factory<_i316.WarehouseModule>(() => _i316.WarehouseModule(
      get<_i258.WarehouseScreen>(),
      get<_i277.AddNewWarehouse>(),
      get<_i315.WarehouseFinanceScreen>(),
      get<_i253.UpdateWarehouse>()));
  gh.factory<_i317.AcceptedShipmentStatusScreen>(() =>
      _i317.AcceptedShipmentStatusScreen(
          get<_i262.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i318.AirwaybillDetailsScreen>(() => _i318.AirwaybillDetailsScreen(
      get<_i278.AirwaybillDetailsStateManager>()));
  gh.factory<_i319.AirwaybillFinanceScreen>(() => _i319.AirwaybillFinanceScreen(
      get<_i280.AirwaybillFinanceStateManager>()));
  gh.factory<_i320.AirwaybillModule>(() => _i320.AirwaybillModule(
      get<_i281.AirwaybillScreen>(),
      get<_i265.AddNewAirwaybill>(),
      get<_i279.AirwaybillFilterScreen>(),
      get<_i318.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i319.AirwaybillFinanceScreen>(),
      get<_i312.UpdateAirwaybill>()));
  gh.factory<_i321.AcceptedShipmentModule>(() => _i321.AcceptedShipmentModule(
      get<_i261.AcceptedShipmentScreen>(),
      get<_i259.AcceptedShipmentDetailsScreen>(),
      get<_i174.AcceptedShipmentFilterScreen>(),
      get<_i317.AcceptedShipmentStatusScreen>(),
      get<_i260.AcceptedShipmentFinanceScreen>(),
      get<_i313.ViewWarehouseScreen>()));
  gh.factory<_i322.MyApp>(() => _i322.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i98.FireNotificationService>(),
      get<_i290.HomeModule>(),
      get<_i142.SplashModule>(),
      get<_i211.AuthorizationModule>(),
      get<_i68.ChatModule>(),
      get<_i237.SettingsModule>(),
      get<_i297.ProfileModule>(),
      get<_i291.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i294.NewShipmentsModule>(),
      get<_i307.TrackingModule>(),
      get<_i288.EditShipmentModule>(),
      get<_i219.CountryModule>(),
      get<_i220.DistributorsModule>(),
      get<_i298.ProxiesModule>(),
      get<_i306.SupplierModule>(),
      get<_i303.SubContractServiceModule>(),
      get<_i305.SubcontractModule>(),
      get<_i311.UnitModule>(),
      get<_i310.TravelModule>(),
      get<_i287.ContainerModule>(),
      get<_i320.AirwaybillModule>(),
      get<_i217.ContainerSpecificationModule>(),
      get<_i282.AirwaybillSpecificationModule>(),
      get<_i314.WaitingShipmentModule>(),
      get<_i321.AcceptedShipmentModule>(),
      get<_i283.ClientModule>(),
      get<_i296.ProductModule>(),
      get<_i304.SubProductModule>(),
      get<_i316.WarehouseModule>(),
      get<_i299.ReceiverModule>(),
      get<_i223.EmployeeModule>(),
      get<_i289.HarborModule>(),
      get<_i302.ShipperModule>(),
      get<_i295.PriceModule>(),
      get<_i301.ShiftingModule>()));
  return get;
}
