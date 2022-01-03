// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i347;
import '../module_airwaybill/airwaybill_module.dart' as _i345;
import '../module_airwaybill/manager/airwaybill_manager.dart' as _i221;
import '../module_airwaybill/manager/finance_airwaybill_manager.dart' as _i101;
import '../module_airwaybill/repository/airwaybill_repository.dart' as _i69;
import '../module_airwaybill/repository/finance_airwaybill_repository.dart'
    as _i36;
import '../module_airwaybill/service/airwaybill_service.dart' as _i222;
import '../module_airwaybill/service/finance_airwaybill_service.dart' as _i102;
import '../module_airwaybill/state_manger/airwaybill_finance_state_manager.dart'
    as _i220;
import '../module_airwaybill/state_manger/airwaybill_state_manager.dart'
    as _i227;
import '../module_airwaybill/state_manger/details_airwaybill_state_manager.dart'
    as _i302;
import '../module_airwaybill/state_manger/filter_airwaybill_state_manger.dart'
    as _i241;
import '../module_airwaybill/state_manger/new_airwaybill_state_manger.dart'
    as _i288;
import '../module_airwaybill/ui/screen/airwaybill_details_screen.dart' as _i344;
import '../module_airwaybill/ui/screen/airwaybill_filter_screen.dart' as _i303;
import '../module_airwaybill/ui/screen/airwaybill_finance_screen.dart' as _i304;
import '../module_airwaybill/ui/screen/airwaybill_new_screen.dart' as _i289;
import '../module_airwaybill/ui/screen/airwaybill_screen.dart' as _i305;
import '../module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart'
    as _i3;
import '../module_airwaybill/ui/screen/airwaybill_update_screen.dart' as _i338;
import '../module_airwaybill_specification/airwaybill_specification_module.dart'
    as _i306;
import '../module_airwaybill_specification/manager/airwaybill_specification_manager.dart'
    as _i223;
import '../module_airwaybill_specification/repository/airwaybill_specification_repository.dart'
    as _i70;
import '../module_airwaybill_specification/service/airwaybill_specification_service.dart'
    as _i224;
import '../module_airwaybill_specification/state_manger/airwaybill_specification_state_manager.dart'
    as _i225;
import '../module_airwaybill_specification/state_manger/new_airwaybill_specification_state_manger.dart'
    as _i287;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart'
    as _i290;
import '../module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart'
    as _i226;
import '../module_auth/authoriazation_module.dart' as _i228;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i24;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i25;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i46;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i121;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i229;
import '../module_chat/chat_module.dart' as _i72;
import '../module_chat/manager/chat/chat_manager.dart' as _i71;
import '../module_chat/repository/chat/chat_repository.dart' as _i26;
import '../module_chat/service/chat/char_service.dart' as _i73;
import '../module_chat/ui/screen/chat_page/chat_page_screen.dart' as _i5;
import '../module_chat/ui/screen/chats_list/chats_list_screen.dart' as _i27;
import '../module_client/client_module.dart' as _i307;
import '../module_client/manager/client_manager.dart' as _i74;
import '../module_client/repository/client_repository.dart' as _i28;
import '../module_client/service/client_service.dart' as _i75;
import '../module_client/state_manager/client_state_manager.dart' as _i76;
import '../module_client/state_manager/new_client_state_manger.dart' as _i192;
import '../module_client/ui/screen/add_new_client_screen.dart' as _i201;
import '../module_client/ui/screen/client_screen.dart' as _i230;
import '../module_client/ui/screen/update_client_pass_screen.dart' as _i266;
import '../module_client/ui/screen/update_client_screen.dart' as _i267;
import '../module_container/container_module.dart' as _i311;
import '../module_container/manager/container_manager.dart' as _i77;
import '../module_container/manager/finance_container_manager.dart' as _i103;
import '../module_container/repository/container_repository.dart' as _i30;
import '../module_container/repository/finance_container_repository.dart'
    as _i37;
import '../module_container/service/container_service.dart' as _i81;
import '../module_container/service/finance_container_service.dart' as _i104;
import '../module_container/state_manger/conatiner_finance_state_manager.dart'
    as _i232;
import '../module_container/state_manger/container_state_manager.dart' as _i86;
import '../module_container/state_manger/details_container_state_manager.dart'
    as _i231;
import '../module_container/state_manger/filter_container_state_manger.dart'
    as _i242;
import '../module_container/state_manger/new_container_state_manger.dart'
    as _i195;
import '../module_container/ui/screen/container_details_screen.dart' as _i308;
import '../module_container/ui/screen/container_filter_screen.dart' as _i309;
import '../module_container/ui/screen/container_finance_screen.dart' as _i310;
import '../module_container/ui/screen/container_new_screen.dart' as _i202;
import '../module_container/ui/screen/container_screen.dart' as _i234;
import '../module_container/ui/screen/container_shipment_review_screen.dart'
    as _i6;
import '../module_container/ui/screen/containerl_update_screen.dart' as _i268;
import '../module_container_specification/container_specification_module.dart'
    as _i235;
import '../module_container_specification/manager/container_specification_manager.dart'
    as _i82;
import '../module_container_specification/repository/container_specification_repository.dart'
    as _i31;
import '../module_container_specification/service/container_specification_service.dart'
    as _i83;
import '../module_container_specification/state_manger/container_specification_state_manager.dart'
    as _i84;
import '../module_container_specification/state_manger/new_container_specification_state_manger.dart'
    as _i194;
import '../module_container_specification/ui/screen/containerSpecification_new_screen.dart'
    as _i204;
import '../module_container_specification/ui/screen/containerSpecification_screen.dart'
    as _i85;
import '../module_countries/country_module.dart' as _i237;
import '../module_countries/manager/country_manager.dart' as _i87;
import '../module_countries/repository/country_repository.dart' as _i32;
import '../module_countries/service/country_service.dart' as _i88;
import '../module_countries/state_manger/coutries_state_manager.dart' as _i89;
import '../module_countries/state_manger/new_country_state_manger.dart'
    as _i196;
import '../module_countries/ui/screen/countries_screen.dart' as _i236;
import '../module_countries/ui/screen/country_new_screen.dart' as _i205;
import '../module_distributors/distributors_module.dart' as _i238;
import '../module_distributors/manager/distributors_manager.dart' as _i90;
import '../module_distributors/repository/distributors_repository.dart' as _i33;
import '../module_distributors/service/distributors_service.dart' as _i91;
import '../module_distributors/state_manger/distributors_state_manager.dart'
    as _i92;
import '../module_distributors/state_manger/new_distributors_state_manger.dart'
    as _i197;
import '../module_distributors/ui/screen/distributors_new_screen.dart' as _i206;
import '../module_distributors/ui/screen/distributors_screen.dart' as _i93;
import '../module_edit_shipment/edit_shipment_module.dart' as _i312;
import '../module_edit_shipment/manager/edit_shipment_manager.dart' as _i94;
import '../module_edit_shipment/repository/edit_shipment_repository.dart'
    as _i34;
import '../module_edit_shipment/service/editshipment_service.dart' as _i95;
import '../module_edit_shipment/state_manager/edite_shipment_state_manager.dart'
    as _i239;
import '../module_edit_shipment/ui/screen/edited_shipment_screen.dart' as _i240;
import '../module_employees/employe_module.dart' as _i313;
import '../module_employees/manager/employees_manager.dart' as _i96;
import '../module_employees/repository/employees_repository.dart' as _i35;
import '../module_employees/service/employees_service.dart' as _i97;
import '../module_employees/state_manger/employees_state_manager.dart' as _i98;
import '../module_employees/state_manger/new_employees_state_manger.dart'
    as _i198;
import '../module_employees/ui/screen/employee_update_role_screen.dart'
    as _i270;
import '../module_employees/ui/screen/employees_screen.dart' as _i99;
import '../module_employees/ui/screen/emplyee_new_screen.dart' as _i207;
import '../module_gunny/manager/gunny_manager.dart' as _i110;
import '../module_gunny/repository/gunny_repo.dart' as _i40;
import '../module_gunny/service/gunny_service.dart' as _i111;
import '../module_harbor/harbor_module.dart' as _i314;
import '../module_harbor/manager/harbor_manager.dart' as _i112;
import '../module_harbor/repository/harbor_repository.dart' as _i41;
import '../module_harbor/service/harbor_service.dart' as _i113;
import '../module_harbor/state_manger/harbors_state_manager.dart' as _i114;
import '../module_harbor/state_manger/new_harbor_state_manger.dart' as _i199;
import '../module_harbor/ui/screen/harbor_update_screen.dart' as _i271;
import '../module_harbor/ui/screen/harbors_new_screen.dart' as _i208;
import '../module_harbor/ui/screen/harbors_screen.dart' as _i115;
import '../module_home/home_module.dart' as _i315;
import '../module_home/manager/home_manager.dart' as _i116;
import '../module_home/repository/home_repository.dart' as _i42;
import '../module_home/service/home_service.dart' as _i117;
import '../module_home/state_manager/state_manager_home.dart' as _i118;
import '../module_home/ui/screen/home_screen.dart' as _i11;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_mark/manager/mark_manager.dart' as _i122;
import '../module_mark/mark_module.dart' as _i317;
import '../module_mark/repository/mark_repository.dart' as _i47;
import '../module_mark/service/mark_service.dart' as _i123;
import '../module_mark/state_manager/mark_state_manager.dart' as _i124;
import '../module_mark/ui/mark_screen.dart' as _i245;
import '../module_my_shipment/manager/my_shipment_manager.dart' as _i125;
import '../module_my_shipment/my_shipment_module.dart' as _i318;
import '../module_my_shipment/repository/my_shipment_repository.dart' as _i48;
import '../module_my_shipment/service/my_shipment_service.dart' as _i126;
import '../module_my_shipment/state_manager/my_shipment_state_manger.dart'
    as _i127;
import '../module_my_shipment/ui/screen/my_shipment_review.dart' as _i16;
import '../module_my_shipment/ui/screen/my_shipment_screen.dart' as _i246;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/notification_module.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i49;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i107;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_notifications/ui/notification_screen.dart' as _i12;
import '../module_price/manager/container_price_manager.dart' as _i78;
import '../module_price/manager/price_manager.dart' as _i128;
import '../module_price/price_module.dart' as _i321;
import '../module_price/repository/container_price_repository.dart' as _i29;
import '../module_price/repository/price_repository.dart' as _i50;
import '../module_price/service/container_price_service.dart' as _i79;
import '../module_price/service/price_service.dart' as _i129;
import '../module_price/state_manager/container_price_state_manager/add_container_price_state_manager.dart'
    as _i193;
import '../module_price/state_manager/container_price_state_manager/container_price_state_manager.dart'
    as _i80;
import '../module_price/state_manager/shipping_line_state_manager/add_new_price_state_manager.dart'
    as _i200;
import '../module_price/state_manager/shipping_line_state_manager/price_state_manager.dart'
    as _i130;
import '../module_price/ui/screen/container_price/add_container_price_screen.dart'
    as _i203;
import '../module_price/ui/screen/container_price/container_price_screen.dart'
    as _i233;
import '../module_price/ui/screen/container_price/update_container_price_screen.dart'
    as _i269;
import '../module_price/ui/screen/shipline-price/add_new_line_price_screen.dart'
    as _i209;
import '../module_price/ui/screen/shipline-price/price_screen.dart' as _i248;
import '../module_price/ui/screen/shipline-price/update_line_price_screen.dart'
    as _i273;
import '../module_product_category/manager/product_category_manager.dart'
    as _i131;
import '../module_product_category/product_module.dart' as _i322;
import '../module_product_category/repository/product_category_repository.dart'
    as _i51;
import '../module_product_category/service/product_service.dart' as _i132;
import '../module_product_category/state_manger/new_product_state_manger.dart'
    as _i210;
import '../module_product_category/state_manger/products_state_manager.dart'
    as _i133;
import '../module_product_category/ui/screen/product_new_screen.dart' as _i291;
import '../module_product_category/ui/screen/products_screen.dart' as _i249;
import '../module_product_sub_category/manager/product_sub_category_manager.dart'
    as _i157;
import '../module_product_sub_category/repository/product_sub_category_repository.dart'
    as _i60;
import '../module_product_sub_category/service/sub_product_service.dart'
    as _i158;
import '../module_product_sub_category/state_manger/new_sub_product_state_manger.dart'
    as _i214;
import '../module_product_sub_category/state_manger/subs_products_state_manager.dart'
    as _i159;
import '../module_product_sub_category/sub_product_module.dart' as _i330;
import '../module_product_sub_category/ui/screen/sub_product_new_screen.dart'
    as _i296;
import '../module_product_sub_category/ui/screen/sub_product_update_screen.dart'
    as _i275;
import '../module_product_sub_category/ui/screen/sub_products_screen.dart'
    as _i259;
import '../module_profile/manager/profile_manager.dart' as _i134;
import '../module_profile/profile_module.dart' as _i323;
import '../module_profile/repository/profile_repository.dart' as _i52;
import '../module_profile/service/profile_service.dart' as _i135;
import '../module_profile/state_manager/profile_state_manager.dart' as _i136;
import '../module_profile/ui/profile_screen.dart' as _i250;
import '../module_proxies/manager/proxies_manager.dart' as _i137;
import '../module_proxies/proxies_module.dart' as _i324;
import '../module_proxies/repository/proxies_repository.dart' as _i53;
import '../module_proxies/service/proixes_service.dart' as _i138;
import '../module_proxies/state_manger/new_proxies_state_manger.dart' as _i211;
import '../module_proxies/state_manger/proxies_state_manager.dart' as _i139;
import '../module_proxies/ui/screen/proxies_screen.dart' as _i251;
import '../module_proxies/ui/screen/proxy_new_screen.dart' as _i292;
import '../module_receiver/manager/receiver_manager.dart' as _i140;
import '../module_receiver/recevier_module.dart' as _i325;
import '../module_receiver/repository/recevier_repository.dart' as _i54;
import '../module_receiver/service/receiver_service.dart' as _i141;
import '../module_receiver/state_manager/mark_state_manager.dart' as _i142;
import '../module_receiver/ui/receiver_screen.dart' as _i252;
import '../module_report/manager/report_manager.dart' as _i143;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i55;
import '../module_report/service/report_service.dart' as _i144;
import '../module_settings/settings_module.dart' as _i255;
import '../module_settings/ui/settings_page/settings_page.dart' as _i146;
import '../module_shifting_shipment/manager/shifting_manager.dart' as _i147;
import '../module_shifting_shipment/repository/shipment_shifting_repo.dart'
    as _i56;
import '../module_shifting_shipment/service/shift_service.dart' as _i148;
import '../module_shifting_shipment/shifting_module.dart' as _i327;
import '../module_shifting_shipment/state_manager/new_shifting_state_manager.dart'
    as _i247;
import '../module_shifting_shipment/state_manager/shipments_shifitng_state_manager.dart'
    as _i149;
import '../module_shifting_shipment/state_manager/view_warehouse_state_manager.dart'
    as _i279;
import '../module_shifting_shipment/ui/screen/new_shift_screen.dart' as _i293;
import '../module_shifting_shipment/ui/screen/shift_warehouse_screen.dart'
    as _i326;
import '../module_shifting_shipment/ui/screen/shipment_shifting_screen.dart'
    as _i256;
import '../module_shipment_invoices/invoice_shipment_module.dart' as _i316;
import '../module_shipment_invoices/manager/invoice_manager.dart' as _i45;
import '../module_shipment_invoices/repository/invoice_repository.dart' as _i44;
import '../module_shipment_invoices/service/invoice_service.dart' as _i119;
import '../module_shipment_invoices/state_manager/invoice_state_manger.dart'
    as _i120;
import '../module_shipment_invoices/state_manager/invoice_update_state_manager.dart'
    as _i177;
import '../module_shipment_invoices/ui/screen/invoices_screen.dart' as _i244;
import '../module_shipment_invoices/ui/screen/update_invoice_screen.dart'
    as _i272;
import '../module_shipment_previous/shipment_previous_module.dart' as _i14;
import '../module_shipment_request/manager/product_category_manager/product_category_manager.dart'
    as _i108;
import '../module_shipment_request/repository/product_category_repository/product_category_repository.dart'
    as _i39;
import '../module_shipment_request/service/shipment_request_service/first_option_service.dart'
    as _i109;
import '../module_shipment_request/shipment_request_module.dart' as _i320;
import '../module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart'
    as _i254;
import '../module_shipment_request/state_manager/review_shipment_state_manager.dart'
    as _i145;
import '../module_shipment_request/ui/screen/new_shipment_request.dart'
    as _i319;
import '../module_shipment_request/ui/screen/review_shipment_screen.dart'
    as _i253;
import '../module_shipment_track/manager/tracking_manager.dart' as _i167;
import '../module_shipment_track/repository/tracking_repository.dart' as _i63;
import '../module_shipment_track/service/tracking_service.dart' as _i168;
import '../module_shipment_track/state_manager/tracking_state_manager.dart'
    as _i169;
import '../module_shipment_track/tracking_module.dart' as _i333;
import '../module_shipment_track/ui/tarcing_screen.dart' as _i261;
import '../module_shipments_orders_accepted/accepted_shipment_module.dart'
    as _i346;
import '../module_shipments_orders_accepted/manager/accepted_shipment_manager.dart'
    as _i187;
import '../module_shipments_orders_accepted/manager/finance_shipment_manager.dart'
    as _i105;
import '../module_shipments_orders_accepted/repository/accepted_shipment_repository.dart'
    as _i68;
import '../module_shipments_orders_accepted/repository/finance_shipment_repository.dart'
    as _i38;
import '../module_shipments_orders_accepted/service/accepted_shipment_service.dart'
    as _i188;
import '../module_shipments_orders_accepted/service/finance_shipment_service.dart'
    as _i106;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_details_state_manager.dart'
    as _i189;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_finance_state_manager.dart'
    as _i190;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_state_manager.dart'
    as _i191;
import '../module_shipments_orders_accepted/state_manager/accepted_shipment_status_state_manager.dart'
    as _i286;
import '../module_shipments_orders_accepted/state_manager/filter_shipment_state_manager.dart'
    as _i100;
import '../module_shipments_orders_accepted/state_manager/view_warehouse_state_manager.dart'
    as _i278;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart'
    as _i283;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_finance_screen.dart'
    as _i284;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart'
    as _i285;
import '../module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart'
    as _i343;
import '../module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart'
    as _i186;
import '../module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart'
    as _i339;
import '../module_shipments_orders_waiting/manager/waiting_shipment_manager.dart'
    as _i178;
import '../module_shipments_orders_waiting/repository/waiting_shipment_repository.dart'
    as _i66;
import '../module_shipments_orders_waiting/service/waiting_shipment_service.dart'
    as _i179;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_details_state_manager.dart'
    as _i180;
import '../module_shipments_orders_waiting/state_manager/waiting_shipment_state_manager.dart'
    as _i181;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart'
    as _i182;
import '../module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart'
    as _i280;
import '../module_shipments_orders_waiting/waiting_shipment_module.dart'
    as _i340;
import '../module_shipper/manager/shipper_manager.dart' as _i150;
import '../module_shipper/repository/shipper_repository.dart' as _i57;
import '../module_shipper/service/shipper_service.dart' as _i151;
import '../module_shipper/shipper_module.dart' as _i328;
import '../module_shipper/state_manger/new_shipper_state_manger.dart' as _i212;
import '../module_shipper/state_manger/shipper_state_manager.dart' as _i152;
import '../module_shipper/ui/screen/shipper_new_screen.dart' as _i294;
import '../module_shipper/ui/screen/shipper_screen.dart' as _i257;
import '../module_splash/splash_module.dart' as _i153;
import '../module_splash/ui/screen/splash_screen.dart' as _i58;
import '../module_sub_contract/manager/subcontract_manager.dart' as _i160;
import '../module_sub_contract/repository/subcontract_repository.dart' as _i61;
import '../module_sub_contract/service/subcontract_service.dart' as _i161;
import '../module_sub_contract/state_manger/new_subcontract_state_manger.dart'
    as _i215;
import '../module_sub_contract/state_manger/subcontracts_state_manager.dart'
    as _i162;
import '../module_sub_contract/subcontract_module.dart' as _i331;
import '../module_sub_contract/ui/screen/subcontract_new_screen.dart' as _i297;
import '../module_sub_contract/ui/screen/subcontract_update_screen.dart'
    as _i274;
import '../module_sub_contract/ui/screen/subcontracts_screen.dart' as _i260;
import '../module_subcontract_services/manager/sub_contract_service_manager.dart'
    as _i154;
import '../module_subcontract_services/repository/sub_contract_service_repository.dart'
    as _i59;
import '../module_subcontract_services/service/sub_contract_service.dart'
    as _i155;
import '../module_subcontract_services/state_manger/new_contract_service_state_manger.dart'
    as _i213;
import '../module_subcontract_services/state_manger/sub_contract_services_state_manager.dart'
    as _i156;
import '../module_subcontract_services/sub_contract_service_module.dart'
    as _i329;
import '../module_subcontract_services/ui/screen/sub_contract_service_new_screen.dart'
    as _i295;
import '../module_subcontract_services/ui/screen/sub_contract_service_screen.dart'
    as _i258;
import '../module_suppliers/manager/suppliers_manager.dart' as _i163;
import '../module_suppliers/repository/suppliers_repository.dart' as _i62;
import '../module_suppliers/service/suppliers_service.dart' as _i164;
import '../module_suppliers/state_manger/new_suppliers_state_manger.dart'
    as _i216;
import '../module_suppliers/state_manger/suppliers_state_manager.dart' as _i165;
import '../module_suppliers/supplier_module.dart' as _i332;
import '../module_suppliers/ui/screen/suppliers_new_screen.dart' as _i298;
import '../module_suppliers/ui/screen/suppliers_screen.dart' as _i166;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_travel/manager/travel_manager.dart' as _i170;
import '../module_travel/repository/travel_repository.dart' as _i64;
import '../module_travel/service/travel_service.dart' as _i171;
import '../module_travel/state_manger/details_travel_state_manager.dart'
    as _i262;
import '../module_travel/state_manger/filter_travel_state_manger.dart' as _i243;
import '../module_travel/state_manger/new_travel_state_manger.dart' as _i217;
import '../module_travel/state_manger/travel_finance_state_manager.dart'
    as _i264;
import '../module_travel/state_manger/travels_state_manager.dart' as _i172;
import '../module_travel/travel_module.dart' as _i336;
import '../module_travel/ui/screen/travel_details_screen.dart' as _i334;
import '../module_travel/ui/screen/travel_filter_screen.dart' as _i263;
import '../module_travel/ui/screen/travel_finance_screen.dart' as _i335;
import '../module_travel/ui/screen/travel_new_screen.dart' as _i299;
import '../module_travel/ui/screen/travel_screen.dart' as _i265;
import '../module_travel/ui/screen/travel_update_screen.dart' as _i276;
import '../module_unit/manager/unit_manager.dart' as _i173;
import '../module_unit/repository/unit_repository.dart' as _i65;
import '../module_unit/service/unit_service.dart' as _i174;
import '../module_unit/state_manger/new_unit_state_manger.dart' as _i218;
import '../module_unit/state_manger/units_state_manager.dart' as _i175;
import '../module_unit/ui/screen/unit_new_screen.dart' as _i300;
import '../module_unit/ui/screen/units_screen.dart' as _i176;
import '../module_unit/unit_module.dart' as _i337;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i23;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i43;
import '../module_warehouses/manager/warehouses_manager.dart' as _i183;
import '../module_warehouses/repository/warehouse_repository.dart' as _i67;
import '../module_warehouses/service/warehouse_service.dart' as _i184;
import '../module_warehouses/state_manger/new_warehouse_state_manger.dart'
    as _i219;
import '../module_warehouses/state_manger/warehouse_finance_state_manager.dart'
    as _i281;
import '../module_warehouses/state_manger/warehouse_state_manager.dart'
    as _i185;
import '../module_warehouses/ui/screen/warehouse_finance_screen.dart' as _i341;
import '../module_warehouses/ui/screen/warehouse_new_screen.dart' as _i301;
import '../module_warehouses/ui/screen/warehouse_screen.dart' as _i282;
import '../module_warehouses/ui/screen/warehouse_update_screen.dart' as _i277;
import '../module_warehouses/warehouse_module.dart' as _i342;
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
  gh.factory<_i29.ContainerPriceRepository>(() => _i29.ContainerPriceRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i30.ContainerRepository>(() =>
      _i30.ContainerRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i31.ContainerSpecificationRepository>(() =>
      _i31.ContainerSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i32.CountryRepository>(() =>
      _i32.CountryRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i33.DistributorRepository>(() => _i33.DistributorRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i34.EditShipmentRepository>(() => _i34.EditShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i35.EmployeeRepository>(() =>
      _i35.EmployeeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i36.FinanceAirwaybillRepository>(() =>
      _i36.FinanceAirwaybillRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i37.FinanceContainerRepository>(() =>
      _i37.FinanceContainerRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i38.FinanceShipmentRepository>(() =>
      _i38.FinanceShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i39.FirstOptionRepository>(() => _i39.FirstOptionRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i40.GunnyRepository>(() =>
      _i40.GunnyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i41.HarborRepository>(() =>
      _i41.HarborRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i42.HomeRepository>(() =>
      _i42.HomeRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i43.ImageUploadService>(
      () => _i43.ImageUploadService(get<_i23.UploadManager>()));
  gh.factory<_i44.InvoiceRepository>(() =>
      _i44.InvoiceRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i45.InvoiceShipmentManager>(
      () => _i45.InvoiceShipmentManager(get<_i44.InvoiceRepository>()));
  gh.factory<_i46.LoginStateManager>(
      () => _i46.LoginStateManager(get<_i25.AuthService>()));
  gh.factory<_i47.MarkRepository>(() =>
      _i47.MarkRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i48.MyShipmentRepository>(() => _i48.MyShipmentRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i49.NotificationRepo>(() =>
      _i49.NotificationRepo(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i50.PriceRepository>(() =>
      _i50.PriceRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i51.ProductRepository>(() =>
      _i51.ProductRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i52.ProfileRepository>(() =>
      _i52.ProfileRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i53.ProxyRepository>(() =>
      _i53.ProxyRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i54.ReceiverRepository>(() =>
      _i54.ReceiverRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i55.ReportRepository>(() => _i55.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i25.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i56.ShiftingRepository>(() =>
      _i56.ShiftingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i57.ShipperRepository>(() =>
      _i57.ShipperRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i58.SplashScreen>(
      () => _i58.SplashScreen(get<_i25.AuthService>()));
  gh.factory<_i59.SubContractServiceRepository>(() =>
      _i59.SubContractServiceRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i60.SubProductRepository>(() => _i60.SubProductRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i61.SubcontractRepository>(() => _i61.SubcontractRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i62.SupplierRepository>(() =>
      _i62.SupplierRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i63.TrackingRepository>(() =>
      _i63.TrackingRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i64.TravelRepository>(() =>
      _i64.TravelRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i65.UnitRepository>(() =>
      _i65.UnitRepository(get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i66.WaitingShipmentRepository>(() =>
      _i66.WaitingShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i67.WarehousesRepository>(() => _i67.WarehousesRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i68.AcceptedShipmentRepository>(() =>
      _i68.AcceptedShipmentRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i69.AirwaybillRepository>(() => _i69.AirwaybillRepository(
      get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i70.AirwaybillSpecificationRepository>(() =>
      _i70.AirwaybillSpecificationRepository(
          get<_i19.ApiClient>(), get<_i25.AuthService>()));
  gh.factory<_i71.ChatManager>(
      () => _i71.ChatManager(get<_i26.ChatRepository>()));
  gh.factory<_i72.ChatModule>(() => _i72.ChatModule(get<_i27.ChatsListScreen>(),
      get<_i25.AuthService>(), get<_i5.ChatScreen>()));
  gh.factory<_i73.ChatService>(() => _i73.ChatService(get<_i71.ChatManager>()));
  gh.factory<_i74.ClientManager>(
      () => _i74.ClientManager(get<_i28.ClientRepository>()));
  gh.factory<_i75.ClientService>(
      () => _i75.ClientService(get<_i74.ClientManager>()));
  gh.factory<_i76.ClientsStateManager>(
      () => _i76.ClientsStateManager(get<_i75.ClientService>()));
  gh.factory<_i77.ContainerManager>(
      () => _i77.ContainerManager(get<_i30.ContainerRepository>()));
  gh.factory<_i78.ContainerPriceManager>(
      () => _i78.ContainerPriceManager(get<_i29.ContainerPriceRepository>()));
  gh.factory<_i79.ContainerPriceService>(
      () => _i79.ContainerPriceService(get<_i78.ContainerPriceManager>()));
  gh.factory<_i80.ContainerPriceStateManager>(
      () => _i80.ContainerPriceStateManager(get<_i79.ContainerPriceService>()));
  gh.factory<_i81.ContainerService>(
      () => _i81.ContainerService(get<_i77.ContainerManager>()));
  gh.factory<_i82.ContainerSpecificationManager>(() =>
      _i82.ContainerSpecificationManager(
          get<_i31.ContainerSpecificationRepository>()));
  gh.factory<_i83.ContainerSpecificationService>(() =>
      _i83.ContainerSpecificationService(
          get<_i82.ContainerSpecificationManager>()));
  gh.factory<_i84.ContainerSpecificationStateManager>(() =>
      _i84.ContainerSpecificationStateManager(
          get<_i83.ContainerSpecificationService>()));
  gh.factory<_i85.ContainerSpecificationsScreen>(() =>
      _i85.ContainerSpecificationsScreen(
          get<_i84.ContainerSpecificationStateManager>()));
  gh.factory<_i86.ContainerStateManager>(
      () => _i86.ContainerStateManager(get<_i81.ContainerService>()));
  gh.factory<_i87.CountryManager>(
      () => _i87.CountryManager(get<_i32.CountryRepository>()));
  gh.factory<_i88.CountryService>(
      () => _i88.CountryService(get<_i87.CountryManager>()));
  gh.factory<_i89.CountryStateManager>(
      () => _i89.CountryStateManager(get<_i88.CountryService>()));
  gh.factory<_i90.DistributorManager>(
      () => _i90.DistributorManager(get<_i33.DistributorRepository>()));
  gh.factory<_i91.DistributorService>(
      () => _i91.DistributorService(get<_i90.DistributorManager>()));
  gh.factory<_i92.DistributorStateManager>(
      () => _i92.DistributorStateManager(get<_i91.DistributorService>()));
  gh.factory<_i93.DistributorsScreen>(
      () => _i93.DistributorsScreen(get<_i92.DistributorStateManager>()));
  gh.factory<_i94.EditShipmentManager>(
      () => _i94.EditShipmentManager(get<_i34.EditShipmentRepository>()));
  gh.factory<_i95.EditShipmentService>(
      () => _i95.EditShipmentService(get<_i94.EditShipmentManager>()));
  gh.factory<_i96.EmployeeManager>(
      () => _i96.EmployeeManager(get<_i35.EmployeeRepository>()));
  gh.factory<_i97.EmployeeService>(
      () => _i97.EmployeeService(get<_i96.EmployeeManager>()));
  gh.factory<_i98.EmployeeStateManager>(
      () => _i98.EmployeeStateManager(get<_i97.EmployeeService>()));
  gh.factory<_i99.EmployeesScreen>(
      () => _i99.EmployeesScreen(get<_i98.EmployeeStateManager>()));
  gh.factory<_i100.FilterAcceptedShipmentStateManager>(() =>
      _i100.FilterAcceptedShipmentStateManager(
          get<_i88.CountryService>(), get<_i75.ClientService>()));
  gh.factory<_i101.FinanceAirwaybillManager>(() =>
      _i101.FinanceAirwaybillManager(get<_i36.FinanceAirwaybillRepository>()));
  gh.factory<_i102.FinanceAirwaybillService>(() =>
      _i102.FinanceAirwaybillService(get<_i101.FinanceAirwaybillManager>()));
  gh.factory<_i103.FinanceContainerManager>(() =>
      _i103.FinanceContainerManager(get<_i37.FinanceContainerRepository>()));
  gh.factory<_i104.FinanceContainerService>(() =>
      _i104.FinanceContainerService(get<_i103.FinanceContainerManager>()));
  gh.factory<_i105.FinanceShipmentManager>(() =>
      _i105.FinanceShipmentManager(get<_i38.FinanceShipmentRepository>()));
  gh.factory<_i106.FinanceShipmentService>(
      () => _i106.FinanceShipmentService(get<_i105.FinanceShipmentManager>()));
  gh.factory<_i107.FireNotificationService>(() => _i107.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i49.NotificationRepo>()));
  gh.factory<_i108.FirstOptionManager>(
      () => _i108.FirstOptionManager(get<_i39.FirstOptionRepository>()));
  gh.factory<_i109.FirstOptionService>(
      () => _i109.FirstOptionService(get<_i108.FirstOptionManager>()));
  gh.factory<_i110.GunnyManager>(
      () => _i110.GunnyManager(get<_i40.GunnyRepository>()));
  gh.factory<_i111.GunnyService>(
      () => _i111.GunnyService(get<_i110.GunnyManager>()));
  gh.factory<_i112.HarborManager>(
      () => _i112.HarborManager(get<_i41.HarborRepository>()));
  gh.factory<_i113.HarborService>(
      () => _i113.HarborService(get<_i112.HarborManager>()));
  gh.factory<_i114.HarborStateManager>(
      () => _i114.HarborStateManager(get<_i113.HarborService>()));
  gh.factory<_i115.HarborsScreen>(
      () => _i115.HarborsScreen(get<_i114.HarborStateManager>()));
  gh.factory<_i116.HomeManager>(
      () => _i116.HomeManager(get<_i42.HomeRepository>()));
  gh.factory<_i117.HomeService>(
      () => _i117.HomeService(get<_i116.HomeManager>()));
  gh.factory<_i118.HomeStateManager>(() => _i118.HomeStateManager(
      get<_i117.HomeService>(), get<_i97.EmployeeService>()));
  gh.factory<_i119.InvoiceService>(
      () => _i119.InvoiceService(get<_i45.InvoiceShipmentManager>()));
  gh.factory<_i120.InvoicesStateManager>(
      () => _i120.InvoicesStateManager(get<_i119.InvoiceService>()));
  gh.factory<_i121.LoginScreen>(() => _i121.LoginScreen(
      get<_i46.LoginStateManager>(), get<_i97.EmployeeService>()));
  gh.factory<_i122.MarkManager>(
      () => _i122.MarkManager(get<_i47.MarkRepository>()));
  gh.factory<_i123.MarkService>(
      () => _i123.MarkService(get<_i122.MarkManager>()));
  gh.factory<_i124.MarkStateManager>(() => _i124.MarkStateManager(
      get<_i123.MarkService>(), get<_i75.ClientService>()));
  gh.factory<_i125.MyShipmentManager>(
      () => _i125.MyShipmentManager(get<_i48.MyShipmentRepository>()));
  gh.factory<_i126.MyShipmentService>(
      () => _i126.MyShipmentService(get<_i125.MyShipmentManager>()));
  gh.factory<_i127.MyShipmentStateManger>(
      () => _i127.MyShipmentStateManger(get<_i126.MyShipmentService>()));
  gh.factory<_i128.PriceManager>(
      () => _i128.PriceManager(get<_i50.PriceRepository>()));
  gh.factory<_i129.PriceService>(
      () => _i129.PriceService(get<_i128.PriceManager>()));
  gh.factory<_i130.PriceStateManager>(() => _i130.PriceStateManager(
      get<_i129.PriceService>(), get<_i83.ContainerSpecificationService>()));
  gh.factory<_i131.ProductManager>(
      () => _i131.ProductManager(get<_i51.ProductRepository>()));
  gh.factory<_i132.ProductService>(
      () => _i132.ProductService(get<_i131.ProductManager>()));
  gh.factory<_i133.ProductStateManager>(
      () => _i133.ProductStateManager(get<_i132.ProductService>()));
  gh.factory<_i134.ProfileManager>(
      () => _i134.ProfileManager(get<_i52.ProfileRepository>()));
  gh.factory<_i135.ProfileService>(
      () => _i135.ProfileService(get<_i134.ProfileManager>()));
  gh.factory<_i136.ProfileStateManager>(
      () => _i136.ProfileStateManager(get<_i135.ProfileService>()));
  gh.factory<_i137.ProxyManager>(
      () => _i137.ProxyManager(get<_i53.ProxyRepository>()));
  gh.factory<_i138.ProxyService>(
      () => _i138.ProxyService(get<_i137.ProxyManager>()));
  gh.factory<_i139.ProxyStateManager>(
      () => _i139.ProxyStateManager(get<_i138.ProxyService>()));
  gh.factory<_i140.ReceiverManager>(
      () => _i140.ReceiverManager(get<_i54.ReceiverRepository>()));
  gh.factory<_i141.ReceiverService>(
      () => _i141.ReceiverService(get<_i140.ReceiverManager>()));
  gh.factory<_i142.ReceiverStateManager>(() => _i142.ReceiverStateManager(
      get<_i141.ReceiverService>(), get<_i75.ClientService>()));
  gh.factory<_i143.ReportManager>(
      () => _i143.ReportManager(get<_i55.ReportRepository>()));
  gh.factory<_i144.ReportService>(
      () => _i144.ReportService(get<_i143.ReportManager>()));
  gh.factory<_i145.ReviewShipmentStateManger>(() =>
      _i145.ReviewShipmentStateManger(
          get<_i109.FirstOptionService>(), get<_i43.ImageUploadService>()));
  gh.factory<_i146.SettingsScreen>(() => _i146.SettingsScreen(
      get<_i25.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i107.FireNotificationService>()));
  gh.factory<_i147.ShiftingManager>(
      () => _i147.ShiftingManager(get<_i56.ShiftingRepository>()));
  gh.factory<_i148.ShiftingService>(
      () => _i148.ShiftingService(get<_i147.ShiftingManager>()));
  gh.factory<_i149.ShipmentsShiftingStateManager>(
      () => _i149.ShipmentsShiftingStateManager(get<_i148.ShiftingService>()));
  gh.factory<_i150.ShipperManager>(
      () => _i150.ShipperManager(get<_i57.ShipperRepository>()));
  gh.factory<_i151.ShipperService>(
      () => _i151.ShipperService(get<_i150.ShipperManager>()));
  gh.factory<_i152.ShipperStateManager>(
      () => _i152.ShipperStateManager(get<_i151.ShipperService>()));
  gh.factory<_i153.SplashModule>(
      () => _i153.SplashModule(get<_i58.SplashScreen>()));
  gh.factory<_i154.SubContractServiceManager>(() =>
      _i154.SubContractServiceManager(
          get<_i59.SubContractServiceRepository>()));
  gh.factory<_i155.SubContractServiceService>(() =>
      _i155.SubContractServiceService(get<_i154.SubContractServiceManager>()));
  gh.factory<_i156.SubContractServiceStateManager>(() =>
      _i156.SubContractServiceStateManager(
          get<_i155.SubContractServiceService>()));
  gh.factory<_i157.SubProductManager>(
      () => _i157.SubProductManager(get<_i60.SubProductRepository>()));
  gh.factory<_i158.SubProductService>(
      () => _i158.SubProductService(get<_i157.SubProductManager>()));
  gh.factory<_i159.SubProductStateManager>(
      () => _i159.SubProductStateManager(get<_i158.SubProductService>()));
  gh.factory<_i160.SubcontractManager>(
      () => _i160.SubcontractManager(get<_i61.SubcontractRepository>()));
  gh.factory<_i161.SubcontractService>(
      () => _i161.SubcontractService(get<_i160.SubcontractManager>()));
  gh.factory<_i162.SubcontractStateManager>(
      () => _i162.SubcontractStateManager(get<_i161.SubcontractService>()));
  gh.factory<_i163.SupplierManager>(
      () => _i163.SupplierManager(get<_i62.SupplierRepository>()));
  gh.factory<_i164.SupplierService>(
      () => _i164.SupplierService(get<_i163.SupplierManager>()));
  gh.factory<_i165.SupplierStateManager>(
      () => _i165.SupplierStateManager(get<_i164.SupplierService>()));
  gh.factory<_i166.SuppliersScreen>(
      () => _i166.SuppliersScreen(get<_i165.SupplierStateManager>()));
  gh.factory<_i167.TrackingManager>(
      () => _i167.TrackingManager(get<_i63.TrackingRepository>()));
  gh.factory<_i168.TrackingService>(
      () => _i168.TrackingService(get<_i167.TrackingManager>()));
  gh.factory<_i169.TrackingStateManager>(
      () => _i169.TrackingStateManager(get<_i168.TrackingService>()));
  gh.factory<_i170.TravelManager>(
      () => _i170.TravelManager(get<_i64.TravelRepository>()));
  gh.factory<_i171.TravelService>(
      () => _i171.TravelService(get<_i170.TravelManager>()));
  gh.factory<_i172.TravelStateManager>(
      () => _i172.TravelStateManager(get<_i171.TravelService>()));
  gh.factory<_i173.UnitManager>(
      () => _i173.UnitManager(get<_i65.UnitRepository>()));
  gh.factory<_i174.UnitService>(
      () => _i174.UnitService(get<_i173.UnitManager>()));
  gh.factory<_i175.UnitStateManager>(
      () => _i175.UnitStateManager(get<_i174.UnitService>()));
  gh.factory<_i176.UnitsScreen>(
      () => _i176.UnitsScreen(get<_i175.UnitStateManager>()));
  gh.factory<_i177.UpdateInvoicesStateManager>(() =>
      _i177.UpdateInvoicesStateManager(
          get<_i119.InvoiceService>(), get<_i43.ImageUploadService>()));
  gh.factory<_i178.WaitingShipmentManager>(() =>
      _i178.WaitingShipmentManager(get<_i66.WaitingShipmentRepository>()));
  gh.factory<_i179.WaitingShipmentService>(
      () => _i179.WaitingShipmentService(get<_i178.WaitingShipmentManager>()));
  gh.factory<_i180.WaitingShipmentsDetailsStateManager>(() =>
      _i180.WaitingShipmentsDetailsStateManager(
          get<_i179.WaitingShipmentService>()));
  gh.factory<_i181.WaitingShipmentsStateManager>(() =>
      _i181.WaitingShipmentsStateManager(get<_i179.WaitingShipmentService>()));
  gh.factory<_i182.WantingShipmentDetailsScreen>(() =>
      _i182.WantingShipmentDetailsScreen(
          get<_i180.WaitingShipmentsDetailsStateManager>()));
  gh.factory<_i183.WarehouseManager>(
      () => _i183.WarehouseManager(get<_i67.WarehousesRepository>()));
  gh.factory<_i184.WarehouseService>(
      () => _i184.WarehouseService(get<_i183.WarehouseManager>()));
  gh.factory<_i185.WarehouseStateManager>(
      () => _i185.WarehouseStateManager(get<_i184.WarehouseService>()));
  gh.factory<_i186.AcceptedShipmentFilterScreen>(() =>
      _i186.AcceptedShipmentFilterScreen(
          get<_i100.FilterAcceptedShipmentStateManager>()));
  gh.factory<_i187.AcceptedShipmentManager>(() =>
      _i187.AcceptedShipmentManager(get<_i68.AcceptedShipmentRepository>()));
  gh.factory<_i188.AcceptedShipmentService>(() =>
      _i188.AcceptedShipmentService(get<_i187.AcceptedShipmentManager>()));
  gh.factory<_i189.AcceptedShipmentsDetailsStateManager>(() =>
      _i189.AcceptedShipmentsDetailsStateManager(
          get<_i188.AcceptedShipmentService>(), get<_i119.InvoiceService>()));
  gh.factory<_i190.AcceptedShipmentsFinanceStateManager>(() =>
      _i190.AcceptedShipmentsFinanceStateManager(
          get<_i106.FinanceShipmentService>(),
          get<_i161.SubcontractService>(),
          get<_i138.ProxyService>()));
  gh.factory<_i191.AcceptedShipmentsStateManager>(() =>
      _i191.AcceptedShipmentsStateManager(
          get<_i188.AcceptedShipmentService>()));
  gh.factory<_i192.AddClientStateManager>(
      () => _i192.AddClientStateManager(get<_i75.ClientService>()));
  gh.factory<_i193.AddContainerPriceStateManager>(() =>
      _i193.AddContainerPriceStateManager(
          get<_i79.ContainerPriceService>(),
          get<_i109.FirstOptionService>(),
          get<_i113.HarborService>(),
          get<_i83.ContainerSpecificationService>()));
  gh.factory<_i194.AddContainerSpecificationStateManager>(() =>
      _i194.AddContainerSpecificationStateManager(
          get<_i83.ContainerSpecificationService>()));
  gh.factory<_i195.AddContainerStateManager>(() =>
      _i195.AddContainerStateManager(
          get<_i81.ContainerService>(),
          get<_i161.SubcontractService>(),
          get<_i83.ContainerSpecificationService>(),
          get<_i75.ClientService>(),
          get<_i113.HarborService>(),
          get<_i151.ShipperService>(),
          get<_i109.FirstOptionService>()));
  gh.factory<_i196.AddCountryStateManager>(
      () => _i196.AddCountryStateManager(get<_i88.CountryService>()));
  gh.factory<_i197.AddDistributorStateManager>(
      () => _i197.AddDistributorStateManager(get<_i91.DistributorService>()));
  gh.factory<_i198.AddEmployeeStateManager>(
      () => _i198.AddEmployeeStateManager(get<_i97.EmployeeService>()));
  gh.factory<_i199.AddHarborStateManager>(() => _i199.AddHarborStateManager(
      get<_i113.HarborService>(), get<_i88.CountryService>()));
  gh.factory<_i200.AddLinePriceStateManager>(() =>
      _i200.AddLinePriceStateManager(
          get<_i129.PriceService>(), get<_i109.FirstOptionService>()));
  gh.factory<_i201.AddNewClient>(
      () => _i201.AddNewClient(get<_i192.AddClientStateManager>()));
  gh.factory<_i202.AddNewContainer>(
      () => _i202.AddNewContainer(get<_i195.AddContainerStateManager>()));
  gh.factory<_i203.AddNewContainerPrice>(() =>
      _i203.AddNewContainerPrice(get<_i193.AddContainerPriceStateManager>()));
  gh.factory<_i204.AddNewContainerSpecification>(() =>
      _i204.AddNewContainerSpecification(
          get<_i194.AddContainerSpecificationStateManager>()));
  gh.factory<_i205.AddNewCountry>(
      () => _i205.AddNewCountry(get<_i196.AddCountryStateManager>()));
  gh.factory<_i206.AddNewDistributor>(
      () => _i206.AddNewDistributor(get<_i197.AddDistributorStateManager>()));
  gh.factory<_i207.AddNewEmployee>(
      () => _i207.AddNewEmployee(get<_i198.AddEmployeeStateManager>()));
  gh.factory<_i208.AddNewHarbor>(
      () => _i208.AddNewHarbor(get<_i199.AddHarborStateManager>()));
  gh.factory<_i209.AddNewLinesPrice>(
      () => _i209.AddNewLinesPrice(get<_i200.AddLinePriceStateManager>()));
  gh.factory<_i210.AddProductStateManager>(
      () => _i210.AddProductStateManager(get<_i132.ProductService>()));
  gh.factory<_i211.AddProxyStateManager>(
      () => _i211.AddProxyStateManager(get<_i138.ProxyService>()));
  gh.factory<_i212.AddShipperStateManager>(
      () => _i212.AddShipperStateManager(get<_i151.ShipperService>()));
  gh.factory<_i213.AddSubContractServiceStateManager>(() =>
      _i213.AddSubContractServiceStateManager(
          get<_i155.SubContractServiceService>()));
  gh.factory<_i214.AddSubProductStateManager>(() =>
      _i214.AddSubProductStateManager(
          get<_i158.SubProductService>(), get<_i132.ProductService>()));
  gh.factory<_i215.AddSubcontractStateManager>(() =>
      _i215.AddSubcontractStateManager(get<_i155.SubContractServiceService>(),
          get<_i161.SubcontractService>()));
  gh.factory<_i216.AddSupplierStateManager>(
      () => _i216.AddSupplierStateManager(get<_i164.SupplierService>()));
  gh.factory<_i217.AddTravelStateManager>(() => _i217.AddTravelStateManager(
      get<_i171.TravelService>(),
      get<_i88.CountryService>(),
      get<_i161.SubcontractService>()));
  gh.factory<_i218.AddUnitStateManager>(
      () => _i218.AddUnitStateManager(get<_i174.UnitService>()));
  gh.factory<_i219.AddWarehouseStateManager>(() =>
      _i219.AddWarehouseStateManager(
          get<_i184.WarehouseService>(),
          get<_i161.SubcontractService>(),
          get<_i138.ProxyService>(),
          get<_i88.CountryService>()));
  gh.factory<_i220.AirwaybillFinanceStateManager>(() =>
      _i220.AirwaybillFinanceStateManager(get<_i102.FinanceAirwaybillService>(),
          get<_i161.SubcontractService>(), get<_i138.ProxyService>()));
  gh.factory<_i221.AirwaybillManager>(
      () => _i221.AirwaybillManager(get<_i69.AirwaybillRepository>()));
  gh.factory<_i222.AirwaybillService>(
      () => _i222.AirwaybillService(get<_i221.AirwaybillManager>()));
  gh.factory<_i223.AirwaybillSpecificationManager>(() =>
      _i223.AirwaybillSpecificationManager(
          get<_i70.AirwaybillSpecificationRepository>()));
  gh.factory<_i224.AirwaybillSpecificationService>(() =>
      _i224.AirwaybillSpecificationService(
          get<_i223.AirwaybillSpecificationManager>()));
  gh.factory<_i225.AirwaybillSpecificationStateManager>(() =>
      _i225.AirwaybillSpecificationStateManager(
          get<_i224.AirwaybillSpecificationService>()));
  gh.factory<_i226.AirwaybillSpecificationsScreen>(() =>
      _i226.AirwaybillSpecificationsScreen(
          get<_i225.AirwaybillSpecificationStateManager>()));
  gh.factory<_i227.AirwaybillStateManager>(
      () => _i227.AirwaybillStateManager(get<_i222.AirwaybillService>()));
  gh.factory<_i228.AuthorizationModule>(
      () => _i228.AuthorizationModule(get<_i121.LoginScreen>()));
  gh.factory<_i229.ChatPageBloc>(
      () => _i229.ChatPageBloc(get<_i73.ChatService>()));
  gh.factory<_i230.ClientsScreen>(
      () => _i230.ClientsScreen(get<_i76.ClientsStateManager>()));
  gh.factory<_i231.ContainerDetailsStateManager>(() =>
      _i231.ContainerDetailsStateManager(
          get<_i81.ContainerService>(), get<_i171.TravelService>()));
  gh.factory<_i232.ContainerFinanceStateManager>(() =>
      _i232.ContainerFinanceStateManager(get<_i104.FinanceContainerService>(),
          get<_i161.SubcontractService>(), get<_i138.ProxyService>()));
  gh.factory<_i233.ContainerPriceScreen>(
      () => _i233.ContainerPriceScreen(get<_i80.ContainerPriceStateManager>()));
  gh.factory<_i234.ContainerScreen>(
      () => _i234.ContainerScreen(get<_i86.ContainerStateManager>()));
  gh.factory<_i235.ContainerSpecificationModule>(() =>
      _i235.ContainerSpecificationModule(
          get<_i85.ContainerSpecificationsScreen>(),
          get<_i204.AddNewContainerSpecification>()));
  gh.factory<_i236.CountriesScreen>(
      () => _i236.CountriesScreen(get<_i89.CountryStateManager>()));
  gh.factory<_i237.CountryModule>(() => _i237.CountryModule(
      get<_i236.CountriesScreen>(), get<_i205.AddNewCountry>()));
  gh.factory<_i238.DistributorsModule>(() => _i238.DistributorsModule(
      get<_i93.DistributorsScreen>(), get<_i206.AddNewDistributor>()));
  gh.factory<_i239.EditShipmentStateManager>(() =>
      _i239.EditShipmentStateManager(
          get<_i95.EditShipmentService>(),
          get<_i43.ImageUploadService>(),
          get<_i141.ReceiverService>(),
          get<_i123.MarkService>(),
          get<_i132.ProductService>(),
          get<_i91.DistributorService>(),
          get<_i174.UnitService>()));
  gh.factory<_i240.EditedShipmentScreen>(
      () => _i240.EditedShipmentScreen(get<_i239.EditShipmentStateManager>()));
  gh.factory<_i241.FilterAirwaybillStateManager>(() =>
      _i241.FilterAirwaybillStateManager(get<_i161.SubcontractService>()));
  gh.factory<_i242.FilterContainerStateManager>(() =>
      _i242.FilterContainerStateManager(get<_i161.SubcontractService>(),
          get<_i83.ContainerSpecificationService>()));
  gh.factory<_i243.FilterTravelStateManager>(() =>
      _i243.FilterTravelStateManager(get<_i171.TravelService>(),
          get<_i88.CountryService>(), get<_i161.SubcontractService>()));
  gh.factory<_i11.HomeScreen>(
      () => _i11.HomeScreen(get<_i118.HomeStateManager>()));
  gh.factory<_i244.InvoicesScreen>(
      () => _i244.InvoicesScreen(get<_i120.InvoicesStateManager>()));
  gh.factory<_i245.MarkScreen>(
      () => _i245.MarkScreen(get<_i124.MarkStateManager>()));
  gh.factory<_i246.MyShipmentScreen>(
      () => _i246.MyShipmentScreen(get<_i127.MyShipmentStateManger>()));
  gh.factory<_i247.NewShiftingStateManager>(() => _i247.NewShiftingStateManager(
      get<_i148.ShiftingService>(), get<_i109.FirstOptionService>()));
  gh.factory<_i248.PriceScreen>(
      () => _i248.PriceScreen(get<_i130.PriceStateManager>()));
  gh.factory<_i249.ProductScreen>(
      () => _i249.ProductScreen(get<_i133.ProductStateManager>()));
  gh.factory<_i250.ProfileScreen>(
      () => _i250.ProfileScreen(get<_i136.ProfileStateManager>()));
  gh.factory<_i251.ProxiesScreen>(
      () => _i251.ProxiesScreen(get<_i139.ProxyStateManager>()));
  gh.factory<_i252.ReceiverScreen>(
      () => _i252.ReceiverScreen(get<_i142.ReceiverStateManager>()));
  gh.factory<_i253.RequestShipmentReview>(() =>
      _i253.RequestShipmentReview(get<_i145.ReviewShipmentStateManger>()));
  gh.factory<_i254.RequestShipmentStateManger>(() =>
      _i254.RequestShipmentStateManger(
          get<_i109.FirstOptionService>(),
          get<_i123.MarkService>(),
          get<_i75.ClientService>(),
          get<_i91.DistributorService>(),
          get<_i141.ReceiverService>(),
          get<_i174.UnitService>(),
          get<_i83.ContainerSpecificationService>(),
          get<_i113.HarborService>(),
          get<_i161.SubcontractService>()));
  gh.factory<_i255.SettingsModule>(
      () => _i255.SettingsModule(get<_i146.SettingsScreen>()));
  gh.factory<_i256.ShipmentShiftingScreen>(() =>
      _i256.ShipmentShiftingScreen(get<_i149.ShipmentsShiftingStateManager>()));
  gh.factory<_i257.ShipperScreen>(
      () => _i257.ShipperScreen(get<_i152.ShipperStateManager>()));
  gh.factory<_i258.SubContractServiceScreen>(() =>
      _i258.SubContractServiceScreen(
          get<_i156.SubContractServiceStateManager>()));
  gh.factory<_i259.SubProductScreen>(
      () => _i259.SubProductScreen(get<_i159.SubProductStateManager>()));
  gh.factory<_i260.SubcontractScreen>(
      () => _i260.SubcontractScreen(get<_i162.SubcontractStateManager>()));
  gh.factory<_i261.TrackingScreen>(
      () => _i261.TrackingScreen(get<_i169.TrackingStateManager>()));
  gh.factory<_i262.TravelDetailsStateManager>(
      () => _i262.TravelDetailsStateManager(get<_i171.TravelService>()));
  gh.factory<_i263.TravelFilterScreen>(
      () => _i263.TravelFilterScreen(get<_i243.FilterTravelStateManager>()));
  gh.factory<_i264.TravelFinanceStateManager>(
      () => _i264.TravelFinanceStateManager(get<_i171.TravelService>()));
  gh.factory<_i265.TravelScreen>(
      () => _i265.TravelScreen(get<_i172.TravelStateManager>()));
  gh.factory<_i266.UpdateClientPassScreen>(
      () => _i266.UpdateClientPassScreen(get<_i192.AddClientStateManager>()));
  gh.factory<_i267.UpdateClientScreen>(
      () => _i267.UpdateClientScreen(get<_i192.AddClientStateManager>()));
  gh.factory<_i268.UpdateContainer>(
      () => _i268.UpdateContainer(get<_i195.AddContainerStateManager>()));
  gh.factory<_i269.UpdateContainerPrice>(() =>
      _i269.UpdateContainerPrice(get<_i193.AddContainerPriceStateManager>()));
  gh.factory<_i270.UpdateEmployeeRole>(
      () => _i270.UpdateEmployeeRole(get<_i198.AddEmployeeStateManager>()));
  gh.factory<_i271.UpdateHarbor>(
      () => _i271.UpdateHarbor(get<_i199.AddHarborStateManager>()));
  gh.factory<_i272.UpdateInvoiceAttached>(() =>
      _i272.UpdateInvoiceAttached(get<_i177.UpdateInvoicesStateManager>()));
  gh.factory<_i273.UpdateLinesPrice>(
      () => _i273.UpdateLinesPrice(get<_i200.AddLinePriceStateManager>()));
  gh.factory<_i274.UpdateSubContract>(
      () => _i274.UpdateSubContract(get<_i215.AddSubcontractStateManager>()));
  gh.factory<_i275.UpdateSubProduct>(
      () => _i275.UpdateSubProduct(get<_i214.AddSubProductStateManager>()));
  gh.factory<_i276.UpdateTravel>(
      () => _i276.UpdateTravel(get<_i217.AddTravelStateManager>()));
  gh.factory<_i277.UpdateWarehouse>(
      () => _i277.UpdateWarehouse(get<_i219.AddWarehouseStateManager>()));
  gh.factory<_i278.ViewWarehousesStateManager>(
      () => _i278.ViewWarehousesStateManager(get<_i184.WarehouseService>()));
  gh.factory<_i279.ViewWarehousesStateManager>(
      () => _i279.ViewWarehousesStateManager(get<_i184.WarehouseService>()));
  gh.factory<_i280.WaitingShipmentScreen>(() =>
      _i280.WaitingShipmentScreen(get<_i181.WaitingShipmentsStateManager>()));
  gh.factory<_i281.WarehouseFinanceStateManager>(
      () => _i281.WarehouseFinanceStateManager(get<_i184.WarehouseService>()));
  gh.factory<_i282.WarehouseScreen>(
      () => _i282.WarehouseScreen(get<_i185.WarehouseStateManager>()));
  gh.factory<_i283.AcceptedShipmentDetailsScreen>(() =>
      _i283.AcceptedShipmentDetailsScreen(
          get<_i189.AcceptedShipmentsDetailsStateManager>()));
  gh.factory<_i284.AcceptedShipmentFinanceScreen>(() =>
      _i284.AcceptedShipmentFinanceScreen(
          get<_i190.AcceptedShipmentsFinanceStateManager>()));
  gh.factory<_i285.AcceptedShipmentScreen>(() =>
      _i285.AcceptedShipmentScreen(get<_i191.AcceptedShipmentsStateManager>()));
  gh.factory<_i286.AcceptedShipmentsStatusStateManager>(() =>
      _i286.AcceptedShipmentsStatusStateManager(
          get<_i188.AcceptedShipmentService>(),
          get<_i161.SubcontractService>(),
          get<_i81.ContainerService>(),
          get<_i171.TravelService>(),
          get<_i184.WarehouseService>(),
          get<_i222.AirwaybillService>(),
          get<_i111.GunnyService>()));
  gh.factory<_i287.AddAirwaybillSpecificationStateManager>(() =>
      _i287.AddAirwaybillSpecificationStateManager(
          get<_i224.AirwaybillSpecificationService>()));
  gh.factory<_i288.AddAirwaybillStateManager>(() =>
      _i288.AddAirwaybillStateManager(
          get<_i222.AirwaybillService>(),
          get<_i161.SubcontractService>(),
          get<_i75.ClientService>(),
          get<_i113.HarborService>(),
          get<_i151.ShipperService>(),
          get<_i109.FirstOptionService>()));
  gh.factory<_i289.AddNewAirwaybill>(
      () => _i289.AddNewAirwaybill(get<_i288.AddAirwaybillStateManager>()));
  gh.factory<_i290.AddNewAirwaybillSpecification>(() =>
      _i290.AddNewAirwaybillSpecification(
          get<_i287.AddAirwaybillSpecificationStateManager>()));
  gh.factory<_i291.AddNewProduct>(
      () => _i291.AddNewProduct(get<_i210.AddProductStateManager>()));
  gh.factory<_i292.AddNewProxy>(
      () => _i292.AddNewProxy(get<_i211.AddProxyStateManager>()));
  gh.factory<_i293.AddNewShift>(
      () => _i293.AddNewShift(get<_i247.NewShiftingStateManager>()));
  gh.factory<_i294.AddNewShipper>(
      () => _i294.AddNewShipper(get<_i212.AddShipperStateManager>()));
  gh.factory<_i295.AddNewSubContractService>(() =>
      _i295.AddNewSubContractService(
          get<_i213.AddSubContractServiceStateManager>()));
  gh.factory<_i296.AddNewSubProduct>(
      () => _i296.AddNewSubProduct(get<_i214.AddSubProductStateManager>()));
  gh.factory<_i297.AddNewSubcontract>(
      () => _i297.AddNewSubcontract(get<_i215.AddSubcontractStateManager>()));
  gh.factory<_i298.AddNewSupplier>(
      () => _i298.AddNewSupplier(get<_i216.AddSupplierStateManager>()));
  gh.factory<_i299.AddNewTravel>(
      () => _i299.AddNewTravel(get<_i217.AddTravelStateManager>()));
  gh.factory<_i300.AddNewUnit>(
      () => _i300.AddNewUnit(get<_i218.AddUnitStateManager>()));
  gh.factory<_i301.AddNewWarehouse>(
      () => _i301.AddNewWarehouse(get<_i219.AddWarehouseStateManager>()));
  gh.factory<_i302.AirwaybillDetailsStateManager>(() =>
      _i302.AirwaybillDetailsStateManager(
          get<_i222.AirwaybillService>(), get<_i171.TravelService>()));
  gh.factory<_i303.AirwaybillFilterScreen>(() =>
      _i303.AirwaybillFilterScreen(get<_i241.FilterAirwaybillStateManager>()));
  gh.factory<_i304.AirwaybillFinanceScreen>(() => _i304.AirwaybillFinanceScreen(
      get<_i220.AirwaybillFinanceStateManager>()));
  gh.factory<_i305.AirwaybillScreen>(
      () => _i305.AirwaybillScreen(get<_i227.AirwaybillStateManager>()));
  gh.factory<_i306.AirwaybillSpecificationModule>(() =>
      _i306.AirwaybillSpecificationModule(
          get<_i226.AirwaybillSpecificationsScreen>(),
          get<_i290.AddNewAirwaybillSpecification>()));
  gh.factory<_i307.ClientModule>(() => _i307.ClientModule(
      get<_i230.ClientsScreen>(),
      get<_i201.AddNewClient>(),
      get<_i267.UpdateClientScreen>(),
      get<_i266.UpdateClientPassScreen>()));
  gh.factory<_i308.ContainerDetailsScreen>(() =>
      _i308.ContainerDetailsScreen(get<_i231.ContainerDetailsStateManager>()));
  gh.factory<_i309.ContainerFilterScreen>(() =>
      _i309.ContainerFilterScreen(get<_i242.FilterContainerStateManager>()));
  gh.factory<_i310.ContainerFinanceScreen>(() =>
      _i310.ContainerFinanceScreen(get<_i232.ContainerFinanceStateManager>()));
  gh.factory<_i311.ContainerModule>(() => _i311.ContainerModule(
      get<_i234.ContainerScreen>(),
      get<_i202.AddNewContainer>(),
      get<_i309.ContainerFilterScreen>(),
      get<_i308.ContainerDetailsScreen>(),
      get<_i6.ContainerShipmentReview>(),
      get<_i310.ContainerFinanceScreen>(),
      get<_i268.UpdateContainer>()));
  gh.factory<_i312.EditShipmentModule>(
      () => _i312.EditShipmentModule(get<_i240.EditedShipmentScreen>()));
  gh.factory<_i313.EmployeeModule>(() => _i313.EmployeeModule(
      get<_i99.EmployeesScreen>(),
      get<_i207.AddNewEmployee>(),
      get<_i270.UpdateEmployeeRole>()));
  gh.factory<_i314.HarborModule>(() => _i314.HarborModule(
      get<_i115.HarborsScreen>(),
      get<_i208.AddNewHarbor>(),
      get<_i271.UpdateHarbor>()));
  gh.factory<_i315.HomeModule>(
      () => _i315.HomeModule(get<_i11.HomeScreen>(), get<_i11.MyFirstApp>()));
  gh.factory<_i316.InvoiceShipmentModule>(() => _i316.InvoiceShipmentModule(
      get<_i244.InvoicesScreen>(), get<_i272.UpdateInvoiceAttached>()));
  gh.factory<_i317.MarkModule>(() => _i317.MarkModule(get<_i245.MarkScreen>()));
  gh.factory<_i318.MyShipmentModule>(() => _i318.MyShipmentModule(
      get<_i246.MyShipmentScreen>(), get<_i16.ReviewShipmentScreen>()));
  gh.factory<_i319.NewShipment>(
      () => _i319.NewShipment(get<_i254.RequestShipmentStateManger>()));
  gh.factory<_i320.NewShipmentsModule>(() => _i320.NewShipmentsModule(
      get<_i319.NewShipment>(), get<_i253.RequestShipmentReview>()));
  gh.factory<_i321.PriceModule>(() => _i321.PriceModule(
      get<_i248.PriceScreen>(),
      get<_i209.AddNewLinesPrice>(),
      get<_i273.UpdateLinesPrice>(),
      get<_i233.ContainerPriceScreen>(),
      get<_i203.AddNewContainerPrice>(),
      get<_i269.UpdateContainerPrice>()));
  gh.factory<_i322.ProductModule>(() => _i322.ProductModule(
      get<_i249.ProductScreen>(), get<_i291.AddNewProduct>()));
  gh.factory<_i323.ProfileModule>(
      () => _i323.ProfileModule(get<_i250.ProfileScreen>()));
  gh.factory<_i324.ProxiesModule>(() => _i324.ProxiesModule(
      get<_i251.ProxiesScreen>(), get<_i292.AddNewProxy>()));
  gh.factory<_i325.ReceiverModule>(
      () => _i325.ReceiverModule(get<_i252.ReceiverScreen>()));
  gh.factory<_i326.ShiftWarehouseScreen>(() =>
      _i326.ShiftWarehouseScreen(get<_i279.ViewWarehousesStateManager>()));
  gh.factory<_i327.ShiftingModule>(() => _i327.ShiftingModule(
      get<_i256.ShipmentShiftingScreen>(),
      get<_i293.AddNewShift>(),
      get<_i326.ShiftWarehouseScreen>()));
  gh.factory<_i328.ShipperModule>(() => _i328.ShipperModule(
      get<_i257.ShipperScreen>(), get<_i294.AddNewShipper>()));
  gh.factory<_i329.SubContractServiceModule>(() =>
      _i329.SubContractServiceModule(get<_i258.SubContractServiceScreen>(),
          get<_i295.AddNewSubContractService>()));
  gh.factory<_i330.SubProductModule>(() => _i330.SubProductModule(
      get<_i259.SubProductScreen>(),
      get<_i296.AddNewSubProduct>(),
      get<_i275.UpdateSubProduct>()));
  gh.factory<_i331.SubcontractModule>(() => _i331.SubcontractModule(
      get<_i260.SubcontractScreen>(),
      get<_i297.AddNewSubcontract>(),
      get<_i274.UpdateSubContract>()));
  gh.factory<_i332.SupplierModule>(() => _i332.SupplierModule(
      get<_i166.SuppliersScreen>(), get<_i298.AddNewSupplier>()));
  gh.factory<_i333.TrackingModule>(
      () => _i333.TrackingModule(get<_i261.TrackingScreen>()));
  gh.factory<_i334.TravelDetailsScreen>(
      () => _i334.TravelDetailsScreen(get<_i262.TravelDetailsStateManager>()));
  gh.factory<_i335.TravelFinanceScreen>(
      () => _i335.TravelFinanceScreen(get<_i264.TravelFinanceStateManager>()));
  gh.factory<_i336.TravelModule>(() => _i336.TravelModule(
      get<_i265.TravelScreen>(),
      get<_i299.AddNewTravel>(),
      get<_i263.TravelFilterScreen>(),
      get<_i334.TravelDetailsScreen>(),
      get<_i335.TravelFinanceScreen>(),
      get<_i276.UpdateTravel>()));
  gh.factory<_i337.UnitModule>(() =>
      _i337.UnitModule(get<_i176.UnitsScreen>(), get<_i300.AddNewUnit>()));
  gh.factory<_i338.UpdateAirwaybill>(
      () => _i338.UpdateAirwaybill(get<_i288.AddAirwaybillStateManager>()));
  gh.factory<_i339.ViewWarehouseScreen>(
      () => _i339.ViewWarehouseScreen(get<_i278.ViewWarehousesStateManager>()));
  gh.factory<_i340.WaitingShipmentModule>(() => _i340.WaitingShipmentModule(
      get<_i280.WaitingShipmentScreen>(),
      get<_i182.WantingShipmentDetailsScreen>()));
  gh.factory<_i341.WarehouseFinanceScreen>(() =>
      _i341.WarehouseFinanceScreen(get<_i281.WarehouseFinanceStateManager>()));
  gh.factory<_i342.WarehouseModule>(() => _i342.WarehouseModule(
      get<_i282.WarehouseScreen>(),
      get<_i301.AddNewWarehouse>(),
      get<_i341.WarehouseFinanceScreen>(),
      get<_i277.UpdateWarehouse>()));
  gh.factory<_i343.AcceptedShipmentStatusScreen>(() =>
      _i343.AcceptedShipmentStatusScreen(
          get<_i286.AcceptedShipmentsStatusStateManager>()));
  gh.factory<_i344.AirwaybillDetailsScreen>(() => _i344.AirwaybillDetailsScreen(
      get<_i302.AirwaybillDetailsStateManager>()));
  gh.factory<_i345.AirwaybillModule>(() => _i345.AirwaybillModule(
      get<_i305.AirwaybillScreen>(),
      get<_i289.AddNewAirwaybill>(),
      get<_i303.AirwaybillFilterScreen>(),
      get<_i344.AirwaybillDetailsScreen>(),
      get<_i3.AirwaybillShipmentReview>(),
      get<_i304.AirwaybillFinanceScreen>(),
      get<_i338.UpdateAirwaybill>()));
  gh.factory<_i346.AcceptedShipmentModule>(() => _i346.AcceptedShipmentModule(
      get<_i285.AcceptedShipmentScreen>(),
      get<_i283.AcceptedShipmentDetailsScreen>(),
      get<_i186.AcceptedShipmentFilterScreen>(),
      get<_i343.AcceptedShipmentStatusScreen>(),
      get<_i284.AcceptedShipmentFinanceScreen>(),
      get<_i339.ViewWarehouseScreen>()));
  gh.factory<_i347.MyApp>(() => _i347.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i107.FireNotificationService>(),
      get<_i315.HomeModule>(),
      get<_i153.SplashModule>(),
      get<_i228.AuthorizationModule>(),
      get<_i72.ChatModule>(),
      get<_i255.SettingsModule>(),
      get<_i323.ProfileModule>(),
      get<_i317.MarkModule>(),
      get<_i22.NotificationModule>(),
      get<_i320.NewShipmentsModule>(),
      get<_i333.TrackingModule>(),
      get<_i312.EditShipmentModule>(),
      get<_i237.CountryModule>(),
      get<_i238.DistributorsModule>(),
      get<_i324.ProxiesModule>(),
      get<_i332.SupplierModule>(),
      get<_i329.SubContractServiceModule>(),
      get<_i331.SubcontractModule>(),
      get<_i337.UnitModule>(),
      get<_i336.TravelModule>(),
      get<_i311.ContainerModule>(),
      get<_i345.AirwaybillModule>(),
      get<_i235.ContainerSpecificationModule>(),
      get<_i306.AirwaybillSpecificationModule>(),
      get<_i340.WaitingShipmentModule>(),
      get<_i346.AcceptedShipmentModule>(),
      get<_i307.ClientModule>(),
      get<_i322.ProductModule>(),
      get<_i330.SubProductModule>(),
      get<_i342.WarehouseModule>(),
      get<_i325.ReceiverModule>(),
      get<_i313.EmployeeModule>(),
      get<_i314.HarborModule>(),
      get<_i328.ShipperModule>(),
      get<_i321.PriceModule>(),
      get<_i327.ShiftingModule>(),
      get<_i316.InvoiceShipmentModule>()));
  return get;
}
