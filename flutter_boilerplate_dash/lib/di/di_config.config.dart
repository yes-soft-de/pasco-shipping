// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i336;
import '../module_airwaybill/airwaybill_module.dart' as _i334;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i215;
import '../module_airwaybill/manager/finance_airwaybill_manager.dart' as _i97;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i68;
import '../module_airwaybill/repository/finance_airwaybill_repository.dart'
    as _i35;
import '../module_airwaybill/service/airwaybill_service.dart' as _i216;
import '../module_airwaybill/service/finance_airwaybill_service.dart' as _i98;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i214;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i221;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i292;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i235;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i278;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i333;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i293;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i294;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i279;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i295;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i327;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i296;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i217;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i69;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i218;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i219;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i277;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i280;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i220;
import '../module_auth/authoriazation_module.dart' as _i222;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i45;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i117;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i223;
import '../module_chat/chat_module.dart' as _i71;
import '../module_chat/manager/chat/chat_manager.dart' as _i70;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i72;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i297;
import '../module_client/manager/client_manager.dart' as _i73;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i74;
import '../module_client/state_manager/client_state_manager.dart' as _i75;
import '../module_client/state_manager/new_client_state_manger.dart' as _i188;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i196;
import '../module_client/ui/screen/client_screen.dart' as _i224;
import '../module_container/container_module.dart' as _i301;
import '../module_container/manager/container_manager.dart' as _i76;
import '../module_container/manager/finance_container_manager.dart' as _i99;
import '../module_container/repository/container_repository.dart' as _i29;
import '../module_container/repository/finance_container_repository.dart'
    as _i36;
import '../module_container/service/container_service.dart' as _i77;
import '../module_container/service/finance_container_service.dart' as _i100;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i226;
import '../module_container/state_manger/container_state_manager.dart' as _i82;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i225;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i236;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i190;
import '../module_container/ui/screen/container_details_screen.dart' as _i298;
import '../module_container/ui/screen/container_filter_screen.dart' as _i299;
import '../module_container/ui/screen/container_finance_screen.dart' as _i300;
import '../module_container/ui/screen/container_new_screen.dart' as _i197;
import '../module_container/ui/screen/container_screen.dart' as _i227;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i260;
import '../module_container_specification/container_specification_module.dart'
    as _i228;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i78;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i30;
import '../module_container_specification/service/container_specification_service.dart'
    as _i79;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i80;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i189;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i198;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i81;
import '../module_countries/country_module.dart' as _i230;
import '../module_countries/manager/country_manager.dart' as _i83;
import '../module_countries/repository/country_repository.dart' as _i31;
import '../module_countries/service/country_service.dart' as _i84;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i85;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i191;
import '../module_countries/ui/screen/countries_screen.dart' as _i229;
import '../module_countries/ui/screen/country_new_screen.dart' as _i199;
import '../module_distributors/distributors_module.dart' as _i231;
import '../module_distributors/manager/distributors_manager.dart' as _i86;
import '../module_distributors/repository/distributors_repository.dart' as _i32;
import '../module_distributors/service/distributors_service.dart' as _i87;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i88;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i192;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i200;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i89;
import '../module_edit_shipment/edit_shipment_module.dart' as _i302;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i90;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i33;
import '../module_edit_shipment/service/editshipment_service.dart' as _i91;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i232;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i233;
import '../module_employees/employe_module.dart' as _i234;
import '../module_employees/manager/employees_manager.dart' as _i92;
import '../module_employees/repository/employees_repository.dart' as _i34;
import '../module_employees/service/employees_service.dart' as _i93;
import '../module_employees/state_manger/employees_state_manager.dart' as _i94;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i193;
import '../module_employees/ui/screen/employees_screen.dart' as _i95;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i201;
import '../module_gunny/manager/gunny_manager.dart' as _i106;
import '../module_gunny/repository/gunny_repo.dart' as _i39;
import '../module_gunny/service/gunny_service.dart' as _i107;
import '../module_harbor/harbor_module.dart' as _i303;
import '../module_harbor/manager/harbor_manager.dart' as _i108;
import '../module_harbor/repository/harbor_repository.dart' as _i40;
import '../module_harbor/service/harbor_service.dart' as _i109;
import '../module_harbor/state_manger/harbors_state_manager.dart' as _i110;
import '../module_harbor/state_manger/new_harbor_state_manger.dart' as _i194;
import '../module_harbor/ui/screen/harbor_update_screen.dart' as _i261;
import '../module_harbor/ui/screen/harbors_new_screen.dart' as _i202;
import '../module_harbor/ui/screen/harbors_screen.dart' as _i111;
import '../module_home/home_module.dart' as _i304;
import '../module_home/manager/home_manager.dart' as _i112;
import '../module_home/repository/home_repository.dart' as _i41;
import '../module_home/service/home_service.dart' as _i113;
import '../module_home/state_manager/state_manager_home.dart' as _i114;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i118;
import '../module_mark/mark_module.dart' as _i306;
import '../module_mark/repository/mark_repository.dart' as _i46;
import '../module_mark/service/mark_service.dart' as _i119;
import '../module_mark/state_manager/mark_state_manager.dart' as _i120;
import '../module_mark/ui/mark_screen.dart' as _i239;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i121;
import '../module_my_shipment/my_shipment_module.dart' as _i307;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i47;
import '../module_my_shipment/service/my_shipment_service.dart' as _i122;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i123;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i240;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i48;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i103;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_price/manager/price_manager.dart' as _i124;
import '../module_price/price_module.dart' as _i310;
import '../module_price/repository/price_repository.dart' as _i49;
import '../module_price/service/price_service.dart' as _i125;
import '../module_price/state_manager/add_new_price_state_manager.dart'
    as _i195;
import '../module_price/state_manager/price_state_manager.dart' as _i126;
import '../module_price/ui/screen/add_new_line_price_screen.dart' as _i203;
import '../module_price/ui/screen/price_screen.dart' as _i242;
import '../module_price/ui/screen/update_line_price_screen.dart' as _i263;
import '../module_product_category/manager/product_category_manager.dart'
    as _i127;
import '../module_product_category/product_module.dart' as _i311;
import '../module_product_category/repository/product_category_repository.dart'
    as _i50;
import '../module_product_category/service/product_service.dart' as _i128;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i204;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i129;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i281;
import '../module_product_category/ui/screen/products_screen.dart' as _i243;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i153;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i59;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i154;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i208;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i155;
import '../module_product_sub_category/sub_product_module.dart' as _i319;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i286;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i265;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i253;
import '../module_profile/manager/profile_manager.dart' as _i130;
import '../module_profile/profile_module.dart' as _i312;
import '../module_profile/repository/profile_repository.dart' as _i51;
import '../module_profile/service/profile_service.dart' as _i131;
import '../module_profile/state_manager/profile_state_manager.dart' as _i132;
import '../module_profile/ui/profile_screen.dart' as _i244;
import '../module_proxies/manager/proxies_manager.dart' as _i133;
import '../module_proxies/proxies_module.dart' as _i313;
import '../module_proxies/repository/proxies_repository.dart' as _i52;
import '../module_proxies/service/proixes_service.dart' as _i134;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i205;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i135;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i245;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i282;
import '../module_receiver/manager/receiver_manager.dart' as _i136;
import '../module_receiver/recevier_module.dart' as _i314;
import '../module_receiver/repository/recevier_repository.dart' as _i53;
import '../module_receiver/service/receiver_service.dart' as _i137;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i138;
import '../module_receiver/ui/receiver_screen.dart' as _i246;
import '../module_report/manager/report_manager.dart' as _i139;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i54;
import '../module_report/service/report_service.dart' as _i140;
import '../module_settings/settings_module.dart' as _i249;
import '../module_settings/ui/settings_page/settings_page.dart' as _i142;
import '../module_shifting_shipment/manager/shifting_manager.dart' as _i143;
import '../module_shifting_shipment/repository/shipment_shifting_repo.dart'
    as _i55;
import '../module_shifting_shipment/service/shift_service.dart' as _i144;
import '../module_shifting_shipment/shifting_module.dart' as _i316;
import '../module_shifting_shipment/state_manager/new_shifting_state_manager.dart'
    as _i241;
import '../module_shifting_shipment/state_manager/shipments_shifitng_state_manager.dart'
    as _i145;
import '../module_shifting_shipment/state_manager/view_warehouse_state_manager.dart'
    as _i269;
import '../module_shifting_shipment/ui/screen/new_shift_screen.dart' as _i283;
import '../module_shifting_shipment/ui/screen/shift_warehouse_screen.dart'
    as _i315;
import '../module_shifting_shipment/ui/screen/shipment_shifting_screen.dart'
    as _i250;
import '../module_shipment_invoices/invoice_shipment_module.dart' as _i305;
import '../module_shipment_invoices/manager/invoice_manager.dart' as _i44;
import '../module_shipment_invoices/repository/invoice_repository.dart' as _i43;
import '../module_shipment_invoices/service/invoice_service.dart' as _i115;
import '../module_shipment_invoices/state_manager/invoice_state_manger.dart'
    as _i116;
import '../module_shipment_invoices/state_manager/invoice_update_state_manager.dart'
    as _i173;
import '../module_shipment_invoices/ui/screen/invoices_screen.dart' as _i238;
import '../module_shipment_invoices/ui/screen/update_invoice_screen.dart'
    as _i262;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i104;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i38;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i105;
import '../module_shipment_request/shipment_request_module.dart' as _i309;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i248;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i141;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i308;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i247;
import '../module_shipment_track/manager/tracking_manager.dart' as _i163;
import '../module_shipment_track/repository/tracking_repository.dart' as _i62;
import '../module_shipment_track/service/tracking_service.dart' as _i164;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i165;
import '../module_shipment_track/tracking_module.dart' as _i322;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i255;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i335;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i183;
import '../module_shipments_orders_accepted/manager/finance_shipment_manager.dart'
    as _i101;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i67;
import '../module_shipments_orders_accepted/repository/finance_shipment_repository.dart'
    as _i37;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i184;
import '../module_shipments_orders_accepted/service/finance_shipment_service.dart'
    as _i102;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i185;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i186;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i187;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i276;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i96;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i268;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i273;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i274;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i275;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i332;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i182;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i328;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i174;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i65;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i175;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i176;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i177;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i178;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i270;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i329;
import '../module_shipper/manager/shipper_manager.dart' as _i146;
import '../module_shipper/repository/shipper_repository.dart' as _i56;
import '../module_shipper/service/shipper_service.dart' as _i147;
import '../module_shipper/shipper_module.dart' as _i317;
import '../module_shipper/state_manger/new_shipper_state_manger.dart' as _i206;
import '../module_shipper/state_manger/shipper_state_manager.dart' as _i148;
import '../module_shipper/ui/screen/shipper_new_screen.dart' as _i284;
import '../module_shipper/ui/screen/shipper_screen.dart' as _i251;
import '../module_splash/splash_module.dart' as _i149;
import '../module_splash/ui/screen/splash_screen.dart' as _i57;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i156;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i60;
import '../module_sub_contract/service/subcontract_service.dart' as _i157;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i209;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i158;
import '../module_sub_contract/subcontract_module.dart' as _i320;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i287;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i264;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i254;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i150;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i58;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i151;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i207;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i152;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i318;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i285;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i252;
import '../module_suppliers/manager/suppliers_manager.dart' as _i159;
import '../module_suppliers/repository/suppliers_repository.dart' as _i61;
import '../module_suppliers/service/suppliers_service.dart' as _i160;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i210;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i161;
import '../module_suppliers/supplier_module.dart' as _i321;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i288;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i162;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i166;
import '../module_travel/repository/travel_repository.dart' as _i63;
import '../module_travel/service/travel_service.dart' as _i167;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i256;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i237;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i211;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i258;
import '../module_travel/state_manger/travels_state_manager.dart' as _i168;
import '../module_travel/travel_module.dart' as _i325;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i323;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i257;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i324;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i289;
import '../module_travel/ui/screen/travel_screen.dart' as _i259;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i266;
import '../module_unit/manager/unit_manager.dart' as _i169;
import '../module_unit/repository/unit_repository.dart' as _i64;
import '../module_unit/service/unit_service.dart' as _i170;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i212;
import '../module_unit/state_manger/units_state_manager.dart' as _i171;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i290;
import '../module_unit/ui/screen/units_screen.dart' as _i172;
import '../module_unit/unit_module.dart' as _i326;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i42;
import '../module_warehouses/manager/warehouses_manager.dart' as _i179;
import '../module_warehouses/repository/warehouse_repository.dart' as _i66;
import '../module_warehouses/service/warehouse_service.dart' as _i180;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i213;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i271;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i181;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i330;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i291;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i272;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i267;
import '../module_warehouses/warehouse_module.dart' as _i331;
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
  gh.factory<_i35.FinanceAirwaybillRepository>(() =>
      _i35.FinanceAirwaybillRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i36.FinanceContainerRepository>(() =>
      _i36.FinanceContainerRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i37.FinanceShipmentRepository>(() =>
      _i37.FinanceShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i38.FirstOptionRepository>(() => _i38.FirstOptionRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i39.GunnyRepository>(() =>
      _i39.GunnyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i40.HarborRepository>(() =>
      _i40.HarborRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i41.HomeRepository>(() =>
      _i41.HomeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i42.ImageUploadService>(
      () => _i42.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i43.InvoiceRepository>(() =>
      _i43.InvoiceRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i44.InvoiceShipmentManager>(
      () => _i44.InvoiceShipmentManager(get<_i43.InvoiceRepository>()));
  gh.factory<_i45.LoginStateManager>(
      () => _i45.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i46.MarkRepository>(() =>
      _i46.MarkRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i47.MyShipmentRepository>(() => _i47.MyShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i48.NotificationRepo>(() =>
      _i48.NotificationRepo(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i49.PriceRepository>(() =>
      _i49.PriceRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i50.ProductRepository>(() =>
      _i50.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.ProfileRepository>(() =>
      _i51.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.ProxyRepository>(() =>
      _i52.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.ReceiverRepository>(() =>
      _i53.ReceiverRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.ReportRepository>(() => _i54.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i55.ShiftingRepository>(() =>
      _i55.ShiftingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i56.ShipperRepository>(() =>
      _i56.ShipperRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.SplashScreen>(
      () => _i57.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i58.SubContractServiceRepository>(() =>
      _i58.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i59.SubProductRepository>(() => _i59.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.SubcontractRepository>(() => _i60.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.SupplierRepository>(() =>
      _i61.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i62.TrackingRepository>(() =>
      _i62.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i63.TravelRepository>(() =>
      _i63.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i64.UnitRepository>(() =>
      _i64.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i65.WaitingShipmentRepository>(() =>
      _i65.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i66.WarehousesRepository>(() => _i66.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i67.AcceptedShipmentRepository>(() =>
      _i67.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i68.AirwaybillRepository>(() => _i68.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i69.AirwaybillSpecificationRepository>(() =>
      _i69.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i70.ChatManager>(
      () => _i70.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i71.ChatModule>(() => _i71.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i72.ChatService>(() => _i72.ChatService(get<_i70.ChatManager>()));
  gh.factory<_i73.ClientManager>(
      () => _i73.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i74.ClientService>(
      () => _i74.ClientService(get<_i73.ClientManager>()));
  gh.factory<_i75.ClientsStateManager>(
      () => _i75.ClientsStateManager(get<_i74.ClientService>()));
  gh.factory<_i76.ContainerManager>(
      () => _i76.ContainerManager(get<_i29.ContainerRepository>()));
  gh.factory<_i77.ContainerService>(
      () => _i77.ContainerService(get<_i76.ContainerManager>()));
  gh.factory<_i78.ContainerSpecificationManager>(() =>
      _i78.ContainerSpecificationManager(
          get<_i30.ContainerSpecificationRepository>()));
  gh.factory<_i79.ContainerSpecificationService>(() =>
      _i79.ContainerSpecificationService(
          get<_i78.ContainerSpecificationManager>()));
  gh.factory<_i80.ContainerSpecificationStateManager>(() =>
      _i80.ContainerSpecificationStateManager(
          get<_i79.ContainerSpecificationService>()));
  gh.factory<_i81.ContainerSpecificationsScreen>(() =>
      _i81.ContainerSpecificationsScreen(
          get<_i80.ContainerSpecificationStateManager>()));
  gh.factory<_i82.ContainerStateManager>(
      () => _i82.ContainerStateManager(get<_i77.ContainerService>()));
  gh.factory<_i83.CountryManager>(
      () => _i83.CountryManager(get<_i31.CountryRepository>()));
  gh.factory<_i84.CountryService>(
      () => _i84.CountryService(get<_i83.CountryManager>()));
  gh.factory<_i85.CountryStateManager>(
      () => _i85.CountryStateManager(get<_i84.CountryService>()));
  gh.factory<_i86.DistributorManager>(
      () => _i86.DistributorManager(get<_i32.DistributorRepository>()));
  gh.factory<_i87.DistributorService>(
      () => _i87.DistributorService(get<_i86.DistributorManager>()));
  gh.factory<_i88.DistributorStateManager>(
      () => _i88.DistributorStateManager(get<_i87.DistributorService>()));
  gh.factory<_i89.DistributorsScreen>(
      () => _i89.DistributorsScreen(get<_i88.DistributorStateManager>()));
  gh.factory<_i90.EditShipmentManager>(
      () => _i90.EditShipmentManager(get<_i33.EditShipmentRepository>()));
  gh.factory<_i91.EditShipmentService>(
      () => _i91.EditShipmentService(get<_i90.EditShipmentManager>()));
  gh.factory<_i92.EmployeeManager>(
      () => _i92.EmployeeManager(get<_i34.EmployeeRepository>()));
  gh.factory<_i93.EmployeeService>(
      () => _i93.EmployeeService(get<_i92.EmployeeManager>()));
  gh.factory<_i94.EmployeeStateManager>(
      () => _i94.EmployeeStateManager(get<_i93.EmployeeService>()));
  gh.factory<_i95.EmployeesScreen>(
      () => _i95.EmployeesScreen(get<_i94.EmployeeStateManager>()));
  gh.factory<_i96.FilterAcceptedShipmentStateManager>(() =>
      _i96.FilterAcceptedShipmentStateManager(
          get<_i84.CountryService>(), get<_i74.ClientService>()));
  gh.factory<_i97.FinanceAirwaybillManager>(() =>
      _i97.FinanceAirwaybillManager(get<_i35.FinanceAirwaybillRepository>()));
  gh.factory<_i98.FinanceAirwaybillService>(() =>
      _i98.FinanceAirwaybillService(get<_i97.FinanceAirwaybillManager>()));
  gh.factory<_i99.FinanceContainerManager>(() =>
      _i99.FinanceContainerManager(get<_i36.FinanceContainerRepository>()));
  gh.factory<_i100.FinanceContainerService>(
      () => _i100.FinanceContainerService(get<_i99.FinanceContainerManager>()));
  gh.factory<_i101.FinanceShipmentManager>(() =>
      _i101.FinanceShipmentManager(get<_i37.FinanceShipmentRepository>()));
  gh.factory<_i102.FinanceShipmentService>(
      () => _i102.FinanceShipmentService(get<_i101.FinanceShipmentManager>()));
  gh.factory<_i103.FireNotificationService>(() => _i103.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i48.NotificationRepo>()));
  gh.factory<_i104.FirstOptionManager>(
      () => _i104.FirstOptionManager(get<_i38.FirstOptionRepository>()));
  gh.factory<_i105.FirstOptionService>(
      () => _i105.FirstOptionService(get<_i104.FirstOptionManager>()));
  gh.factory<_i106.GunnyManager>(
      () => _i106.GunnyManager(get<_i39.GunnyRepository>()));
  gh.factory<_i107.GunnyService>(
      () => _i107.GunnyService(get<_i106.GunnyManager>()));
  gh.factory<_i108.HarborManager>(
      () => _i108.HarborManager(get<_i40.HarborRepository>()));
  gh.factory<_i109.HarborService>(
      () => _i109.HarborService(get<_i108.HarborManager>()));
  gh.factory<_i110.HarborStateManager>(
      () => _i110.HarborStateManager(get<_i109.HarborService>()));
  gh.factory<_i111.HarborsScreen>(
      () => _i111.HarborsScreen(get<_i110.HarborStateManager>()));
  gh.factory<_i112.HomeManager>(
      () => _i112.HomeManager(get<_i41.HomeRepository>()));
  gh.factory<_i113.HomeService>(
      () => _i113.HomeService(get<_i112.HomeManager>()));
  gh.factory<_i114.HomeStateManager>(() => _i114.HomeStateManager(
      get<_i113.HomeService>(), get<_i93.EmployeeService>()));
  gh.factory<_i115.InvoiceService>(
      () => _i115.InvoiceService(get<_i44.InvoiceShipmentManager>()));
  gh.factory<_i116.InvoicesStateManager>(
      () => _i116.InvoicesStateManager(get<_i115.InvoiceService>()));
  gh.factory<_i117.LoginScreen>(
      () => _i117.LoginScreen(get<_i45.LoginStateManager>()));
  gh.factory<_i118.MarkManager>(
      () => _i118.MarkManager(get<_i46.MarkRepository>()));
  gh.factory<_i119.MarkService>(
      () => _i119.MarkService(get<_i118.MarkManager>()));
  gh.factory<_i120.MarkStateManager>(() => _i120.MarkStateManager(
      get<_i119.MarkService>(), get<_i74.ClientService>()));
  gh.factory<_i121.MyShipmentManager>(
      () => _i121.MyShipmentManager(get<_i47.MyShipmentRepository>()));
  gh.factory<_i122.MyShipmentService>(
      () => _i122.MyShipmentService(get<_i121.MyShipmentManager>()));
  gh.factory<_i123.MyShipmentStateManger>(
      () => _i123.MyShipmentStateManger(get<_i122.MyShipmentService>()));
  gh.factory<_i124.PriceManager>(
      () => _i124.PriceManager(get<_i49.PriceRepository>()));
  gh.factory<_i125.PriceService>(
      () => _i125.PriceService(get<_i124.PriceManager>()));
  gh.factory<_i126.PriceStateManager>(() => _i126.PriceStateManager(
      get<_i125.PriceService>(), get<_i79.ContainerSpecificationService>()));
  gh.factory<_i127.ProductManager>(
      () => _i127.ProductManager(get<_i50.ProductRepository>()));
  gh.factory<_i128.ProductService>(
      () => _i128.ProductService(get<_i127.ProductManager>()));
  gh.factory<_i129.ProductStateManager>(
      () => _i129.ProductStateManager(get<_i128.ProductService>()));
  gh.factory<_i130.ProfileManager>(
      () => _i130.ProfileManager(get<_i51.ProfileRepository>()));
  gh.factory<_i131.ProfileService>(
      () => _i131.ProfileService(get<_i130.ProfileManager>()));
  gh.factory<_i132.ProfileStateManager>(
      () => _i132.ProfileStateManager(get<_i131.ProfileService>()));
  gh.factory<_i133.ProxyManager>(
      () => _i133.ProxyManager(get<_i52.ProxyRepository>()));
  gh.factory<_i134.ProxyService>(
      () => _i134.ProxyService(get<_i133.ProxyManager>()));
  gh.factory<_i135.ProxyStateManager>(
      () => _i135.ProxyStateManager(get<_i134.ProxyService>()));
  gh.factory<_i136.ReceiverManager>(
      () => _i136.ReceiverManager(get<_i53.ReceiverRepository>()));
  gh.factory<_i137.ReceiverService>(
      () => _i137.ReceiverService(get<_i136.ReceiverManager>()));
  gh.factory<_i138.ReceiverStateManager>(() => _i138.ReceiverStateManager(
      get<_i137.ReceiverService>(), get<_i74.ClientService>()));
  gh.factory<_i139.ReportManager>(
      () => _i139.ReportManager(get<_i54.ReportRepository>()));
  gh.factory<_i140.ReportService>(
      () => _i140.ReportService(get<_i139.ReportManager>()));
  gh.factory<_i141.ReviewShipmentStateManger>(() =>
      _i141.ReviewShipmentStateManger(
          get<_i105.FirstOptionService>(), get<_i42.ImageUploadService>()));
  gh.factory<_i142.SettingsScreen>(() => _i142.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i103.FireNotificationService>()));
  gh.factory<_i143.ShiftingManager>(
      () => _i143.ShiftingManager(get<_i55.ShiftingRepository>()));
  gh.factory<_i144.ShiftingService>(
      () => _i144.ShiftingService(get<_i143.ShiftingManager>()));
  gh.factory<_i145.ShipmentsShiftingStateManager>(
      () => _i145.ShipmentsShiftingStateManager(get<_i144.ShiftingService>()));
  gh.factory<_i146.ShipperManager>(
      () => _i146.ShipperManager(get<_i56.ShipperRepository>()));
  gh.factory<_i147.ShipperService>(
      () => _i147.ShipperService(get<_i146.ShipperManager>()));
  gh.factory<_i148.ShipperStateManager>(
      () => _i148.ShipperStateManager(get<_i147.ShipperService>()));
  gh.factory<_i149.SplashModule>(
      () => _i149.SplashModule(get<_i57.SplashScreen>()));
  gh.factory<_i150.SubContractServiceManager>(() =>
      _i150.SubContractServiceManager(
          get<_i58.SubContractServiceRepository>()));
  gh.factory<_i151.SubContractServiceService>(() =>
      _i151.SubContractServiceService(get<_i150.SubContractServiceManager>()));
  gh.factory<_i152.SubContractServiceStateManager>(() =>
      _i152.SubContractServiceStateManager(
          get<_i151.SubContractServiceService>()));
  gh.factory<_i153.SubProductManager>(
      () => _i153.SubProductManager(get<_i59.SubProductRepository>()));
  gh.factory<_i154.SubProductService>(
      () => _i154.SubProductService(get<_i153.SubProductManager>()));
  gh.factory<_i155.SubProductStateManager>(
      () => _i155.SubProductStateManager(get<_i154.SubProductService>()));
  gh.factory<_i156.SubcontractManager>(
      () => _i156.SubcontractManager(get<_i60.SubcontractRepository>()));
  gh.factory<_i157.SubcontractService>(
      () => _i157.SubcontractService(get<_i156.SubcontractManager>()));
  gh.factory<_i158.SubcontractStateManager>(
      () => _i158.SubcontractStateManager(get<_i157.SubcontractService>()));
  gh.factory<_i159.SupplierManager>(
      () => _i159.SupplierManager(get<_i61.SupplierRepository>()));
  gh.factory<_i160.SupplierService>(
      () => _i160.SupplierService(get<_i159.SupplierManager>()));
  gh.factory<_i161.SupplierStateManager>(
      () => _i161.SupplierStateManager(get<_i160.SupplierService>()));
  gh.factory<_i162.SuppliersScreen>(
      () => _i162.SuppliersScreen(get<_i161.SupplierStateManager>()));
  gh.factory<_i163.TrackingManager>(
      () => _i163.TrackingManager(get<_i62.TrackingRepository>()));
  gh.factory<_i164.TrackingService>(
      () => _i164.TrackingService(get<_i163.TrackingManager>()));
  gh.factory<_i165.TrackingStateManager>(
      () => _i165.TrackingStateManager(get<_i164.TrackingService>()));
  gh.factory<_i166.TravelManager>(
      () => _i166.TravelManager(get<_i63.TravelRepository>()));
  gh.factory<_i167.TravelService>(
      () => _i167.TravelService(get<_i166.TravelManager>()));
  gh.factory<_i168.TravelStateManager>(
      () => _i168.TravelStateManager(get<_i167.TravelService>()));
  gh.factory<_i169.UnitManager>(
      () => _i169.UnitManager(get<_i64.UnitRepository>()));
  gh.factory<_i170.UnitService>(
      () => _i170.UnitService(get<_i169.UnitManager>()));
  gh.factory<_i171.UnitStateManager>(
      () => _i171.UnitStateManager(get<_i170.UnitService>()));
  gh.factory<_i172.UnitsScreen>(
      () => _i172.UnitsScreen(get<_i171.UnitStateManager>()));
  gh.factory<_i173.UpdateInvoicesStateManager>(() =>
      _i173.UpdateInvoicesStateManager(
          get<_i115.InvoiceService>(), get<_i42.ImageUploadService>()));
  gh.factory<_i174.WaitingShipmentManager>(() =>
      _i174.WaitingShipmentManager(get<_i65.WaitingShipmentRepository>()));
  gh.factory<_i175.WaitingShipmentService>(
      () => _i175.WaitingShipmentService(get<_i174.WaitingShipmentManager>()));
  gh.factory<_i176.WaitingShipmentsDetailsStateManager>(() =>
      _i176.WaitingShipmentsDetailsStateManager(
          get<_i175.WaitingShipmentService>()));
  gh.factory<_i177.WaitingShipmentsStateManager>(() =>
      _i177.WaitingShipmentsStateManager(get<_i175.WaitingShipmentService>()));
  gh.factory<_i178.WantingShipmentDetailsScreen>(() =>
      _i178.WantingShipmentDetailsScreen(
          get<_i176.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i179.WarehouseManager>(
      () => _i179.WarehouseManager(get<_i66.WarehousesRepository>()));
  gh.factory<_i180.WarehouseService>(
      () => _i180.WarehouseService(get<_i179.WarehouseManager>()));
  gh.factory<_i181.WarehouseStateManager>(
      () => _i181.WarehouseStateManager(get<_i180.WarehouseService>()));
  gh.factory<_i182.AcceptedShipmentFilterScreen>(() =>
      _i182.AcceptedShipmentFilterScreen(
          get<_i96.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i183.AcceptedShipmentManager>(() =>
      _i183.AcceptedShipmentManager(get<_i67.AcceptedShipmentRepository>()));
  gh.factory<_i184.AcceptedShipmentService>(() =>
      _i184.AcceptedShipmentService(get<_i183.AcceptedShipmentManager>()));
  gh.factory<_i185.AcceptedShipmentsDetailsStateManager>(() =>
      _i185.AcceptedShipmentsDetailsStateManager(
          get<_i184.AcceptedShipmentService>(), get<_i115.InvoiceService>()));
  gh.factory<_i186.AcceptedShipmentsFinanceStateManager>(() =>
      _i186.AcceptedShipmentsFinanceStateManager(
          get<_i102.FinanceShipmentService>(),
          get<_i157.SubcontractService>()));
  gh.factory<_i187.AcceptedShipmentsStateManager>(() =>
      _i187.AcceptedShipmentsStateManager(
          get<_i184.AcceptedShipmentService>()));
  gh.factory<_i188.AddClientStateManager>(
      () => _i188.AddClientStateManager(get<_i74.ClientService>()));
  gh.factory<_i189.AddContainerSpecificationStateManager>(() =>
      _i189.AddContainerSpecificationStateManager(
          get<_i79.ContainerSpecificationService>()));
  gh.factory<_i190.AddContainerStateManager>(() =>
      _i190.AddContainerStateManager(
          get<_i77.ContainerService>(),
          get<_i157.SubcontractService>(),
          get<_i79.ContainerSpecificationService>(),
          get<_i74.ClientService>(),
          get<_i109.HarborService>(),
          get<_i147.ShipperService>()));
  gh.factory<_i191.AddCountryStateManager>(
      () => _i191.AddCountryStateManager(get<_i84.CountryService>()));
  gh.factory<_i192.AddDistributorStateManager>(
      () => _i192.AddDistributorStateManager(get<_i87.DistributorService>()));
  gh.factory<_i193.AddEmployeeStateManager>(
      () => _i193.AddEmployeeStateManager(get<_i93.EmployeeService>()));
  gh.factory<_i194.AddHarborStateManager>(() => _i194.AddHarborStateManager(
      get<_i109.HarborService>(), get<_i84.CountryService>()));
  gh.factory<_i195.AddLinePriceStateManager>(() =>
      _i195.AddLinePriceStateManager(
          get<_i125.PriceService>(), get<_i105.FirstOptionService>()));
  gh.factory<_i196.AddNewClient>(
      () => _i196.AddNewClient(get<_i188.AddClientStateManager>()));
  gh.factory<_i197.AddNewContainer>(
      () => _i197.AddNewContainer(get<_i190.AddContainerStateManager>()));
  gh.factory<_i198.AddNewContainerSpecification>(() =>
      _i198.AddNewContainerSpecification(
          get<_i189.AddContainerSpecificationStateManager>()));
  gh.factory<_i199.AddNewCountry>(
      () => _i199.AddNewCountry(get<_i191.AddCountryStateManager>()));
  gh.factory<_i200.AddNewDistributor>(
      () => _i200.AddNewDistributor(get<_i192.AddDistributorStateManager>()));
  gh.factory<_i201.AddNewEmployee>(
      () => _i201.AddNewEmployee(get<_i193.AddEmployeeStateManager>()));
  gh.factory<_i202.AddNewHarbor>(
      () => _i202.AddNewHarbor(get<_i194.AddHarborStateManager>()));
  gh.factory<_i203.AddNewLinesPrice>(
      () => _i203.AddNewLinesPrice(get<_i195.AddLinePriceStateManager>()));
  gh.factory<_i204.AddProductStateManager>(
      () => _i204.AddProductStateManager(get<_i128.ProductService>()));
  gh.factory<_i205.AddProxyStateManager>(
      () => _i205.AddProxyStateManager(get<_i134.ProxyService>()));
  gh.factory<_i206.AddShipperStateManager>(
      () => _i206.AddShipperStateManager(get<_i147.ShipperService>()));
  gh.factory<_i207.AddSubContractServiceStateManager>(() =>
      _i207.AddSubContractServiceStateManager(
          get<_i151.SubContractServiceService>()));
  gh.factory<_i208.AddSubProductStateManager>(() =>
      _i208.AddSubProductStateManager(
          get<_i154.SubProductService>(), get<_i128.ProductService>()));
  gh.factory<_i209.AddSubcontractStateManager>(() =>
      _i209.AddSubcontractStateManager(get<_i151.SubContractServiceService>(),
          get<_i157.SubcontractService>()));
  gh.factory<_i210.AddSupplierStateManager>(
      () => _i210.AddSupplierStateManager(get<_i160.SupplierService>()));
  gh.factory<_i211.AddTravelStateManager>(() => _i211.AddTravelStateManager(
      get<_i167.TravelService>(),
      get<_i84.CountryService>(),
      get<_i157.SubcontractService>()));
  gh.factory<_i212.AddUnitStateManager>(
      () => _i212.AddUnitStateManager(get<_i170.UnitService>()));
  gh.factory<_i213.AddWarehouseStateManager>(() =>
      _i213.AddWarehouseStateManager(
          get<_i180.WarehouseService>(),
          get<_i157.SubcontractService>(),
          get<_i134.ProxyService>(),
          get<_i84.CountryService>()));
  gh.factory<_i214.AirwaybillFinanceStateManager>(() =>
      _i214.AirwaybillFinanceStateManager(get<_i98.FinanceAirwaybillService>(),
          get<_i157.SubcontractService>()));
  gh.factory<_i215.AirwaybillManager>(
      () => _i215.AirwaybillManager(get<_i68.AirwaybillRepository>()));
  gh.factory<_i216.AirwaybillService>(
      () => _i216.AirwaybillService(get<_i215.AirwaybillManager>()));
  gh.factory<_i217.AirwaybillSpecificationManager>(() =>
      _i217.AirwaybillSpecificationManager(
          get<_i69.AirwaybillSpecificationRepository>()));
  gh.factory<_i218.AirwaybillSpecificationService>(() =>
      _i218.AirwaybillSpecificationService(
          get<_i217.AirwaybillSpecificationManager>()));
  gh.factory<_i219.AirwaybillSpecificationStateManager>(() =>
      _i219.AirwaybillSpecificationStateManager(
          get<_i218.AirwaybillSpecificationService>()));
  gh.factory<_i220.AirwaybillSpecificationsScreen>(() =>
      _i220.AirwaybillSpecificationsScreen(
          get<_i219.AirwaybillSpecificationStateManager>()));
  gh.factory<_i221.AirwaybillStateManager>(
      () => _i221.AirwaybillStateManager(get<_i216.AirwaybillService>()));
  gh.factory<_i222.AuthorizationModule>(
      () => _i222.AuthorizationModule(get<_i117.LoginScreen>()));
  gh.factory<_i223.ChatPageBloc>(
      () => _i223.ChatPageBloc(get<_i72.ChatService>()));
  gh.factory<_i224.ClientsScreen>(
      () => _i224.ClientsScreen(get<_i75.ClientsStateManager>()));
  gh.factory<_i225.ContainerDetailsStateManager>(() =>
      _i225.ContainerDetailsStateManager(
          get<_i77.ContainerService>(), get<_i167.TravelService>()));
  gh.factory<_i226.ContainerFinanceStateManager>(() =>
      _i226.ContainerFinanceStateManager(get<_i100.FinanceContainerService>(),
          get<_i157.SubcontractService>()));
  gh.factory<_i227.ContainerScreen>(
      () => _i227.ContainerScreen(get<_i82.ContainerStateManager>()));
  gh.factory<_i228.ContainerSpecificationModule>(() =>
      _i228.ContainerSpecificationModule(
          get<_i81.ContainerSpecificationsScreen>(),
          get<_i198.AddNewContainerSpecification>()));
  gh.factory<_i229.CountriesScreen>(
      () => _i229.CountriesScreen(get<_i85.CountryStateManager>()));
  gh.factory<_i230.CountryModule>(() => _i230.CountryModule(
      get<_i229.CountriesScreen>(), get<_i199.AddNewCountry>()));
  gh.factory<_i231.DistributorsModule>(() => _i231.DistributorsModule(
      get<_i89.DistributorsScreen>(), get<_i200.AddNewDistributor>()));
  gh.factory<_i232.EditShipmentStateManager>(() =>
      _i232.EditShipmentStateManager(
          get<_i91.EditShipmentService>(),
          get<_i42.ImageUploadService>(),
          get<_i137.ReceiverService>(),
          get<_i119.MarkService>(),
          get<_i128.ProductService>(),
          get<_i87.DistributorService>(),
          get<_i170.UnitService>()));
  gh.factory<_i233.EditedShipmentScreen>(
      () => _i233.EditedShipmentScreen(get<_i232.EditShipmentStateManager>()));
  gh.factory<_i234.EmployeeModule>(() => _i234.EmployeeModule(
      get<_i95.EmployeesScreen>(), get<_i201.AddNewEmployee>()));
  gh.factory<_i235.FilterAirwaybillStateManager>(() =>
      _i235.FilterAirwaybillStateManager(get<_i157.SubcontractService>()));
  gh.factory<_i236.FilterContainerStateManager>(() =>
      _i236.FilterContainerStateManager(get<_i157.SubcontractService>(),
          get<_i79.ContainerSpecificationService>()));
  gh.factory<_i237.FilterTravelStateManager>(() =>
      _i237.FilterTravelStateManager(get<_i167.TravelService>(),
          get<_i84.CountryService>(), get<_i157.SubcontractService>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i114.HomeStateManager>()));
  gh.factory<_i238.InvoicesScreen>(
      () => _i238.InvoicesScreen(get<_i116.InvoicesStateManager>()));
  gh.factory<_i239.MarkScreen>(
      () => _i239.MarkScreen(get<_i120.MarkStateManager>()));
  gh.factory<_i240.MyShipmentScreen>(
      () => _i240.MyShipmentScreen(get<_i123.MyShipmentStateManger>()));
  gh.factory<_i241.NewShiftingStateManager>(() => _i241.NewShiftingStateManager(
      get<_i144.ShiftingService>(), get<_i105.FirstOptionService>()));
  gh.factory<_i242.PriceScreen>(
      () => _i242.PriceScreen(get<_i126.PriceStateManager>()));
  gh.factory<_i243.ProductScreen>(
      () => _i243.ProductScreen(get<_i129.ProductStateManager>()));
  gh.factory<_i244.ProfileScreen>(
      () => _i244.ProfileScreen(get<_i132.ProfileStateManager>()));
  gh.factory<_i245.ProxiesScreen>(
      () => _i245.ProxiesScreen(get<_i135.ProxyStateManager>()));
  gh.factory<_i246.ReceiverScreen>(
      () => _i246.ReceiverScreen(get<_i138.ReceiverStateManager>()));
  gh.factory<_i247.RequestShipmentReview>(() =>
      _i247.RequestShipmentReview(get<_i141.ReviewShipmentStateManger>()));
  gh.factory<_i248.RequestShipmentStateManger>(() =>
      _i248.RequestShipmentStateManger(
          get<_i105.FirstOptionService>(),
          get<_i119.MarkService>(),
          get<_i74.ClientService>(),
          get<_i87.DistributorService>(),
          get<_i137.ReceiverService>(),
          get<_i170.UnitService>(),
          get<_i79.ContainerSpecificationService>(),
          get<_i109.HarborService>(),
          get<_i157.SubcontractService>()));
  gh.factory<_i249.SettingsModule>(
      () => _i249.SettingsModule(get<_i142.SettingsScreen>()));
  gh.factory<_i250.ShipmentShiftingScreen>(() =>
      _i250.ShipmentShiftingScreen(get<_i145.ShipmentsShiftingStateManager>()));
  gh.factory<_i251.ShipperScreen>(
      () => _i251.ShipperScreen(get<_i148.ShipperStateManager>()));
  gh.factory<_i252.SubContractServiceScreen>(() =>
      _i252.SubContractServiceScreen(
          get<_i152.SubContractServiceStateManager>()));
  gh.factory<_i253.SubProductScreen>(
      () => _i253.SubProductScreen(get<_i155.SubProductStateManager>()));
  gh.factory<_i254.SubcontractScreen>(
      () => _i254.SubcontractScreen(get<_i158.SubcontractStateManager>()));
  gh.factory<_i255.TrackingScreen>(
      () => _i255.TrackingScreen(get<_i165.TrackingStateManager>()));
  gh.factory<_i256.TravelDetailsStateManager>(
      () => _i256.TravelDetailsStateManager(get<_i167.TravelService>()));
  gh.factory<_i257.TravelFilterScreen>(
      () => _i257.TravelFilterScreen(get<_i237.FilterTravelStateManager>()));
  gh.factory<_i258.TravelFinanceStateManager>(
      () => _i258.TravelFinanceStateManager(get<_i167.TravelService>()));
  gh.factory<_i259.TravelScreen>(
      () => _i259.TravelScreen(get<_i168.TravelStateManager>()));
  gh.factory<_i260.UpdateContainer>(
      () => _i260.UpdateContainer(get<_i190.AddContainerStateManager>()));
  gh.factory<_i261.UpdateHarbor>(
      () => _i261.UpdateHarbor(get<_i194.AddHarborStateManager>()));
  gh.factory<_i262.UpdateInvoiceAttached>(() =>
      _i262.UpdateInvoiceAttached(get<_i173.UpdateInvoicesStateManager>()));
  gh.factory<_i263.UpdateLinesPrice>(
      () => _i263.UpdateLinesPrice(get<_i195.AddLinePriceStateManager>()));
  gh.factory<_i264.UpdateSubContract>(
      () => _i264.UpdateSubContract(get<_i209.AddSubcontractStateManager>()));
  gh.factory<_i265.UpdateSubProduct>(
      () => _i265.UpdateSubProduct(get<_i208.AddSubProductStateManager>()));
  gh.factory<_i266.UpdateTravel>(
      () => _i266.UpdateTravel(get<_i211.AddTravelStateManager>()));
  gh.factory<_i267.UpdateWarehouse>(
      () => _i267.UpdateWarehouse(get<_i213.AddWarehouseStateManager>()));
  gh.factory<_i268.ViewWarehousesStateManager>(
      () => _i268.ViewWarehousesStateManager(get<_i180.WarehouseService>()));
  gh.factory<_i269.ViewWarehousesStateManager>(
      () => _i269.ViewWarehousesStateManager(get<_i180.WarehouseService>()));
  gh.factory<_i270.WaitingShipmentScreen>(() =>
      _i270.WaitingShipmentScreen(get<_i177.WaitingShipmentsStateManager>()));
  gh.factory<_i271.WarehouseFinanceStateManager>(
      () => _i271.WarehouseFinanceStateManager(get<_i180.WarehouseService>()));
  gh.factory<_i272.WarehouseScreen>(
      () => _i272.WarehouseScreen(get<_i181.WarehouseStateManager>()));
  gh.factory<_i273.AcceptedShipmentDetailsScreen>(() =>
      _i273.AcceptedShipmentDetailsScreen(
          get<_i185.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i274.AcceptedShipmentFinanceScreen>(() =>
      _i274.AcceptedShipmentFinanceScreen(
          get<_i186.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i275.AcceptedShipmentScreen>(() =>
      _i275.AcceptedShipmentScreen(get<_i187.AcceptedShipmentsStateManager>()));
  gh.factory<_i276.AcceptedShipmentsStatusStateManager>(() =>
      _i276.AcceptedShipmentsStatusStateManager(
          get<_i184.AcceptedShipmentService>(),
          get<_i157.SubcontractService>(),
          get<_i77.ContainerService>(),
          get<_i167.TravelService>(),
          get<_i180.WarehouseService>(),
          get<_i216.AirwaybillService>(),
          get<_i107.GunnyService>()));
  gh.factory<_i277.AddAirwaybillSpecificationStateManager>(() =>
      _i277.AddAirwaybillSpecificationStateManager(
          get<_i218.AirwaybillSpecificationService>()));
  gh.factory<_i278.AddAirwaybillStateManager>(() =>
      _i278.AddAirwaybillStateManager(
          get<_i216.AirwaybillService>(),
          get<_i157.SubcontractService>(),
          get<_i74.ClientService>(),
          get<_i109.HarborService>(),
          get<_i147.ShipperService>()));
  gh.factory<_i279.AddNewAirwaybill>(
      () => _i279.AddNewAirwaybill(get<_i278.AddAirwaybillStateManager>()));
  gh.factory<_i280.AddNewAirwaybillSpecification>(() =>
      _i280.AddNewAirwaybillSpecification(
          get<_i277.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i281.AddNewProduct>(
      () => _i281.AddNewProduct(get<_i204.AddProductStateManager>()));
  gh.factory<_i282.AddNewProxy>(
      () => _i282.AddNewProxy(get<_i205.AddProxyStateManager>()));
  gh.factory<_i283.AddNewShift>(
      () => _i283.AddNewShift(get<_i241.NewShiftingStateManager>()));
  gh.factory<_i284.AddNewShipper>(
      () => _i284.AddNewShipper(get<_i206.AddShipperStateManager>()));
  gh.factory<_i285.AddNewSubContractService>(() =>
      _i285.AddNewSubContractService(
          get<_i207.AddSubContractServiceStateManager>()));
  gh.factory<_i286.AddNewSubProduct>(
      () => _i286.AddNewSubProduct(get<_i208.AddSubProductStateManager>()));
  gh.factory<_i287.AddNewSubcontract>(
      () => _i287.AddNewSubcontract(get<_i209.AddSubcontractStateManager>()));
  gh.factory<_i288.AddNewSupplier>(
      () => _i288.AddNewSupplier(get<_i210.AddSupplierStateManager>()));
  gh.factory<_i289.AddNewTravel>(
      () => _i289.AddNewTravel(get<_i211.AddTravelStateManager>()));
  gh.factory<_i290.AddNewUnit>(
      () => _i290.AddNewUnit(get<_i212.AddUnitStateManager>()));
  gh.factory<_i291.AddNewWarehouse>(
      () => _i291.AddNewWarehouse(get<_i213.AddWarehouseStateManager>()));
  gh.factory<_i292.AirwaybillDetailsStateManager>(() =>
      _i292.AirwaybillDetailsStateManager(
          get<_i216.AirwaybillService>(), get<_i167.TravelService>()));
  gh.factory<_i293.AirwaybillFilterScreen>(() =>
      _i293.AirwaybillFilterScreen(get<_i235.FilterAirwaybillStateManager>()));
  gh.factory<_i294.AirwaybillFinanceScreen>(() => _i294.AirwaybillFinanceScreen(
      get<_i214.AirwaybillFinanceStateManager>()));
  gh.factory<_i295.AirwaybillScreen>(
      () => _i295.AirwaybillScreen(get<_i221.AirwaybillStateManager>()));
  gh.factory<_i296.AirwaybillSpecificationModule>(() =>
      _i296.AirwaybillSpecificationModule(
          get<_i220.AirwaybillSpecificationsScreen>(),
          get<_i280.AddNewAirwaybillSpecification>()));
  gh.factory<_i297.ClientModule>(() => _i297.ClientModule(
      get<_i224.ClientsScreen>(), get<_i196.AddNewClient>()));
  gh.factory<_i298.ContainerDetailsScreen>(() =>
      _i298.ContainerDetailsScreen(get<_i225.ContainerDetailsStateManager>()));
  gh.factory<_i299.ContainerFilterScreen>(() =>
      _i299.ContainerFilterScreen(get<_i236.FilterContainerStateManager>()));
  gh.factory<_i300.ContainerFinanceScreen>(() =>
      _i300.ContainerFinanceScreen(get<_i226.ContainerFinanceStateManager>()));
  gh.factory<_i301.ContainerModule>(() => _i301.ContainerModule(
      get<_i227.ContainerScreen>(),
      get<_i197.AddNewContainer>(),
      get<_i299.ContainerFilterScreen>(),
      get<_i298.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i300.ContainerFinanceScreen>(),
      get<_i260.UpdateContainer>()));
  gh.factory<_i302.EditShipmentModule>(
      () => _i302.EditShipmentModule(get<_i233.EditedShipmentScreen>()));
  gh.factory<_i303.HarborModule>(() => _i303.HarborModule(
      get<_i111.HarborsScreen>(),
      get<_i202.AddNewHarbor>(),
      get<_i261.UpdateHarbor>()));
  gh.factory<_i304.HomeModule>(
      () => _i304.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i305.InvoiceShipmentModule>(() => _i305.InvoiceShipmentModule(
      get<_i238.InvoicesScreen>(), get<_i262.UpdateInvoiceAttached>()));
  gh.factory<_i306.MarkModule>(() => _i306.MarkModule(get<_i239.MarkScreen>()));
  gh.factory<_i307.MyShipmentModule>(() => _i307.MyShipmentModule(
      get<_i240.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i308.NewShipment>(
      () => _i308.NewShipment(get<_i248.RequestShipmentStateManger>()));
  gh.factory<_i309.NewShipmentsModule>(() => _i309.NewShipmentsModule(
      get<_i308.NewShipment>(), get<_i247.RequestShipmentReview>()));
  gh.factory<_i310.PriceModule>(() => _i310.PriceModule(
      get<_i242.PriceScreen>(),
      get<_i203.AddNewLinesPrice>(),
      get<_i263.UpdateLinesPrice>()));
  gh.factory<_i311.ProductModule>(() => _i311.ProductModule(
      get<_i243.ProductScreen>(), get<_i281.AddNewProduct>()));
  gh.factory<_i312.ProfileModule>(
      () => _i312.ProfileModule(get<_i244.ProfileScreen>()));
  gh.factory<_i313.ProxiesModule>(() => _i313.ProxiesModule(
      get<_i245.ProxiesScreen>(), get<_i282.AddNewProxy>()));
  gh.factory<_i314.ReceiverModule>(
      () => _i314.ReceiverModule(get<_i246.ReceiverScreen>()));
  gh.factory<_i315.ShiftWarehouseScreen>(() =>
      _i315.ShiftWarehouseScreen(get<_i269.ViewWarehousesStateManager>()));
  gh.factory<_i316.ShiftingModule>(() => _i316.ShiftingModule(
      get<_i250.ShipmentShiftingScreen>(),
      get<_i283.AddNewShift>(),
      get<_i315.ShiftWarehouseScreen>()));
  gh.factory<_i317.ShipperModule>(() => _i317.ShipperModule(
      get<_i251.ShipperScreen>(), get<_i284.AddNewShipper>()));
  gh.factory<_i318.SubContractServiceModule>(() =>
      _i318.SubContractServiceModule(get<_i252.SubContractServiceScreen>(),
          get<_i285.AddNewSubContractService>()));
  gh.factory<_i319.SubProductModule>(() => _i319.SubProductModule(
      get<_i253.SubProductScreen>(),
      get<_i286.AddNewSubProduct>(),
      get<_i265.UpdateSubProduct>()));
  gh.factory<_i320.SubcontractModule>(() => _i320.SubcontractModule(
      get<_i254.SubcontractScreen>(),
      get<_i287.AddNewSubcontract>(),
      get<_i264.UpdateSubContract>()));
  gh.factory<_i321.SupplierModule>(() => _i321.SupplierModule(
      get<_i162.SuppliersScreen>(), get<_i288.AddNewSupplier>()));
  gh.factory<_i322.TrackingModule>(
      () => _i322.TrackingModule(get<_i255.TrackingScreen>()));
  gh.factory<_i323.TravelDetailsScreen>(
      () => _i323.TravelDetailsScreen(get<_i256.TravelDetailsStateManager>()));
  gh.factory<_i324.TravelFinanceScreen>(
      () => _i324.TravelFinanceScreen(get<_i258.TravelFinanceStateManager>()));
  gh.factory<_i325.TravelModule>(() => _i325.TravelModule(
      get<_i259.TravelScreen>(),
      get<_i289.AddNewTravel>(),
      get<_i257.TravelFilterScreen>(),
      get<_i323.TravelDetailsScreen>(),
      get<_i324.TravelFinanceScreen>(),
      get<_i266.UpdateTravel>()));
  gh.factory<_i326.UnitModule>(() =>
      _i326.UnitModule(get<_i172.UnitsScreen>(), get<_i290.AddNewUnit>()));
  gh.factory<_i327.UpdateAirwaybill>(
      () => _i327.UpdateAirwaybill(get<_i278.AddAirwaybillStateManager>()));
  gh.factory<_i328.ViewWarehouseScreen>(
      () => _i328.ViewWarehouseScreen(get<_i268.ViewWarehousesStateManager>()));
  gh.factory<_i329.WaitingShipmentModule>(() => _i329.WaitingShipmentModule(
      get<_i270.WaitingShipmentScreen>(),
      get<_i178.WantingShipmentDetailsScreen>()));
  gh.factory<_i330.WarehouseFinanceScreen>(() =>
      _i330.WarehouseFinanceScreen(get<_i271.WarehouseFinanceStateManager>()));
  gh.factory<_i331.WarehouseModule>(() => _i331.WarehouseModule(
      get<_i272.WarehouseScreen>(),
      get<_i291.AddNewWarehouse>(),
      get<_i330.WarehouseFinanceScreen>(),
      get<_i267.UpdateWarehouse>()));
  gh.factory<_i332.AcceptedShipmentStatusScreen>(() =>
      _i332.AcceptedShipmentStatusScreen(
          get<_i276.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i333.AirwaybillDetailsScreen>(() => _i333.AirwaybillDetailsScreen(
      get<_i292.AirwaybillDetailsStateManager>()));
  gh.factory<_i334.AirwaybillModule>(() => _i334.AirwaybillModule(
      get<_i295.AirwaybillScreen>(),
      get<_i279.AddNewAirwaybill>(),
      get<_i293.AirwaybillFilterScreen>(),
      get<_i333.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i294.AirwaybillFinanceScreen>(),
      get<_i327.UpdateAirwaybill>()));
  gh.factory<_i335.AcceptedShipmentModule>(() => _i335.AcceptedShipmentModule(
      get<_i275.AcceptedShipmentScreen>(),
      get<_i273.AcceptedShipmentDetailsScreen>(),
      get<_i182.AcceptedShipmentFilterScreen>(),
      get<_i332.AcceptedShipmentStatusScreen>(),
      get<_i274.AcceptedShipmentFinanceScreen>(),
      get<_i328.ViewWarehouseScreen>()));
  gh.factory<_i336.MyApp>(() => _i336.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i103.FireNotificationService>(),
      get<_i304.HomeModule>(),
      get<_i149.SplashModule>(),
      get<_i222.AuthorizationModule>(),
      get<_i71.ChatModule>(),
      get<_i249.SettingsModule>(),
      get<_i312.ProfileModule>(),
      get<_i306.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i309.NewShipmentsModule>(),
      get<_i322.TrackingModule>(),
      get<_i302.EditShipmentModule>(),
      get<_i230.CountryModule>(),
      get<_i231.DistributorsModule>(),
      get<_i313.ProxiesModule>(),
      get<_i321.SupplierModule>(),
      get<_i318.SubContractServiceModule>(),
      get<_i320.SubcontractModule>(),
      get<_i326.UnitModule>(),
      get<_i325.TravelModule>(),
      get<_i301.ContainerModule>(),
      get<_i334.AirwaybillModule>(),
      get<_i228.ContainerSpecificationModule>(),
      get<_i296.AirwaybillSpecificationModule>(),
      get<_i329.WaitingShipmentModule>(),
      get<_i335.AcceptedShipmentModule>(),
      get<_i297.ClientModule>(),
      get<_i311.ProductModule>(),
      get<_i319.SubProductModule>(),
      get<_i331.WarehouseModule>(),
      get<_i314.ReceiverModule>(),
      get<_i234.EmployeeModule>(),
      get<_i303.HarborModule>(),
      get<_i317.ShipperModule>(),
      get<_i310.PriceModule>(),
      get<_i316.ShiftingModule>(),
      get<_i305.InvoiceShipmentModule>()));
  return get;
}
