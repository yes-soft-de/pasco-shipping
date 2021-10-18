class Urls {
  static const String DOMAIN = 'http://159.89.13.229/';
  static const String BASE_API = 'http://159.89.13.229/';
  static const String IMAGES_ROOT = DOMAIN + '/upload/';

  static const SIGN_UP_API = BASE_API + '/user';
  // static const OWNER_PROFILE_API = BASE_API + '/userprofile';
  static const CREATE_TOKEN_API = BASE_API + 'login_check';

  //home
  static const STATISTIC = BASE_API + 'statistics';

//request shipment
  static const PRODUCT_CATEGORY = BASE_API + 'productcategories';

  static const REQUEST_SHIPMENT_ADMIN = BASE_API + 'ordershipmentbydashboard';
  static const UPDATE_SHIPMENT_ADMIN = BASE_API + 'shipmentorderbydashboard';

  //country
  static const COUNTRIES = BASE_API + 'countries';
  static const COUNTRY = BASE_API + 'country';

  //distributor
  static const DISTRIBUTORS = BASE_API + 'distributors';
  static const DISTRIBUTOR = BASE_API + 'distributor';

  //proxies
  static const PROXIES = BASE_API + 'warehousesagents';
  static const PROXY = BASE_API + 'warehouseagent';

  //suppliers
  static const SUPPLIERS = BASE_API + 'suppliers';
  static const SUPPLIER = BASE_API + 'supplier';

  //suppliers
  static const SHIPPERS = BASE_API + 'shippers';
  static const SHIPPER = BASE_API + 'shipper';


  //employee
  static const EMPLOYEES = BASE_API + 'employees';
  static const EMPLOYEE = BASE_API + 'employee';
  static const ADMIN = BASE_API + 'admin';
  static const EMPLOYEE_PROFILE = BASE_API + 'adminprofile';


  //service
  static const SUB_CONTRACT_SERVICES = BASE_API + 'subcontractservices';
  static const SUB_CONTRACT_SERVICE = BASE_API + 'subcontractservice';

  //subContract
  static const SUB_CONTRACTS = BASE_API + 'subcontracts';
  static const SUB_CONTRACT = BASE_API + 'subcontract';

  //unit
  static const UNITS = BASE_API + 'units';
  static const UNIT = BASE_API + 'unit';

  //travel
  static const TRAVELS = BASE_API + 'travels';
  static const TRAVEL = BASE_API + 'travel';
  static const FILTER_TRAVEL = BASE_API + 'filtertravels';
  static const TRAVEL_STATUS = BASE_API + 'travelstatus';

  //container
  static const CONTAINER = BASE_API + 'container';
  static const CONTAINER_FILTER = BASE_API + 'filtercontainers';
  static const CONTAINER_STATUS = BASE_API + 'containerstatus';
  static const UPLOADED_CONTAINER_TO_TRAVEL = BASE_API + 'trackbyholder';
  static const CLEARED_ARRIVED_CONTAINER = BASE_API + 'containershippingstatus';
  static const UPDATE_CONTAINER_PRICE = BASE_API + 'containerspecificationprice';

  //container finance
  static const ADD_Container_FCL_FINANCE = BASE_API + 'containerfclfinance';
  static const GET_Container_FCL_FINANCE = BASE_API + 'filtercontainerfclfinance';

  static const ADD_Container_LCL_FINANCE = BASE_API + 'containerlclfinance';
  static const GET_Container_LCL_FINANCE = BASE_API + 'filtercontainerlclfinance';

  //airwaybill
  static const AIRWAYBILL = BASE_API + 'airwaybill';
  static const AIRWAYBILL_FILTER = BASE_API + 'filterairwaybills';
  static const AIRWAYBILL_STATUS = BASE_API + 'airwaybillstatus';
  static const CLEARED_ARRIVED_AIRWAYBILL = BASE_API + 'airwaybillshippingstatus';


  //Air waybill finance
  static const ADD_Airwaybill_FCL_FINANCE = BASE_API + 'airwaybillfclfinance';
  static const GET_Airwaybill_FCL_FINANCE = BASE_API + 'filterairwaybillfclfinance';

  static const ADD_Airwaybill_LCL_FINANCE = BASE_API + 'airwaybilllclfinance';
  static const GET_Airwaybill_LCL_FINANCE = BASE_API + 'filterairwaybilllclfinance';


  // specification
  static const CONTAINER_SPECIFICATIONS = BASE_API + 'containerspecifications';
  static const CONTAINER_SPECIFICATION = BASE_API + 'containerspecification';

  static const AIRWABILL_SPECIFICATIONS = BASE_API + 'airwaybillspecifications';
  static const AIRWABILL_SPECIFICATION = BASE_API + 'airwaybillspecification';


  //client
  static const CREATE_CLIENT_ACCOUNT = BASE_API + 'clientbydashboard';
  static const CREATE_CLIENT_MARK = BASE_API + 'markbydashboard';
  static const GET_CLIENT_MARK = BASE_API + 'marks';
  static const GET_CLIENTS = BASE_API + 'clientprofileall';
  static const CLIENT = BASE_API + 'client';
  static const DELETE_CLIENT = BASE_API + 'clientprofilebydashboard';



  ///mark
  static const USER_MARKS = BASE_API + 'marks';
  static const MARK = BASE_API + 'mark';
  static const CREATE_MARK = BASE_API + 'markbydashboard';

  //receiver
  static const USER_RECEIVER = BASE_API + 'filterreceivers';
  static const CREATE_RECEIVER = BASE_API + 'receiverbydashboard';



  //product
  static const PRODUCT_CATEGORIES=BASE_API+"productcategories";
  static const ADD_PRODUCT_CATEGORY=BASE_API+"productcategory";

  // sub product
  static const SUB_PRODUCT_CATEGORIES=BASE_API+"subproductcategories";
  static const ADD_SUB_PRODUCT_CATEGORY=BASE_API+"subproductcategory";

  //profile
  static const MY_PROFILE=BASE_API+"clientprofile";

  static const TRACK_SHIPMENT=BASE_API+'trackmyshipment';

  static const MY_SHIPMENT=BASE_API+'myshipments';
  static const MY_WAITING_SHIPMENT=BASE_API+'mywaitingshipmentsorders';
  static const ADD_NEW_SHIPMENT=BASE_API+'ordershipment';

  //waitingShipment
  // static const WAITING_SHIPMENTS=BASE_API+'waitingshipmentsorders';
  static const WAITING_SHIPMENTS_FILTER=BASE_API+'filterwaitingshipments';
  static const ACCEPTED_REJECTED_SHIPMENT=BASE_API+'shipmentorderstatus';

  //acceptedShipment
  static const ACCEPTED_SHIPMENTS=BASE_API+'filteracceptedshipments';
  static const ACCEPTED_SHIPMENTS_DETAILS=BASE_API+'shipmentorder';
  static const ACCEPTED_SHIPMENTS_STATUS=BASE_API+'allshipmentlogs';
  static const CHANGE_SHIPMENTS_STATUS_RECEIVED=BASE_API+'shipmentstatus';
  static const WAREHOUSES=BASE_API+'warehouses';
  static const STORED_SHIPMENT=BASE_API+'track';
  static const RECEIVED_SHIPMENT=BASE_API+'receivedshipment';


  static const CHECK_HOLDER=BASE_API+'checkholder';



  //warehouses
  static const GET_WAREHOUSES=BASE_API+'warehouses';
  static const WAREHOUSE=BASE_API+'warehouse';
  static const GET_FILTER_WAREHOUSES=BASE_API+'filterwarehouses';


  // warehouse finance
  static const GET_WAREHOUSES_FINANCE=BASE_API+'filterwarehousefinance';
  static const ADD_WAREHOUSE_FINANCE=BASE_API+'warehousefinance';

  //shipmentfinance
  static const GET_SHIPMENT_LCL_FINANCE = BASE_API + 'filtershipmentlclfinance';
  static const ADD_SHIPMENT_FINANCE = BASE_API + 'shipmentlclfinance';

//travel finance
  static const GET_Travel_FINANCE = BASE_API + 'filtertravelfinance';
  static const ADD_Travel_FINANCE = BASE_API + 'travelfinance';

  //shipment invoices
  static const ADD_SHIPMENT_INVOICES = BASE_API + 'shipmentinvoice';
  static const GET_SHIPMENT_INVOICES = BASE_API + 'filtershipmentinvoices';
  static const UPDATE_SHIPMENT_INVOICES = BASE_API + 'shipmentinvoicepaymentinfo';




  //gunny
  static const CREATE_GUNNY = BASE_API + 'gunny';
  static const GUNNY_SHIPMENT = BASE_API + 'gunnyshipment';
  static const GET_GUNNY = BASE_API + 'filtergunnies';

  //Harbors
  static const GET_HARBOR = BASE_API + 'filterharbors';
  static const HARBOR = BASE_API + 'harbor';

  //price
  static const PRICE = BASE_API + 'price';

  //shift
  static const SHIFTING_SHIPMENT = BASE_API + 'filtershiftingshipmentorders';
  static const ORDER_SHIFTING = BASE_API + 'ordershiftingshipment';
  static const DELETE_ORDER_SHIFTING = BASE_API + 'shiftingshipmentorder';


  static const REPORT_API = BASE_API + '/report';

  static const UPLOAD_API = BASE_API + 'uploadfile';

  static const NOTIFICATION_API = BASE_API + '/notificationtoken';
  static const NOTIFICATIONNEWCHAT_API = BASE_API + '/notificationnewchat';
  static const NOTIFICATIONTOADMIN_API = BASE_API + '/notificationtoadmin';


  // static const token ='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2Mjk0MDMxOTYsImV4cCI6MTYyOTQyMTE5Niwicm9sZXMiOlsiUk9MRV9FTVBMT1lFRSIsInVzZXIiXSwidXNlcm5hbWUiOiJlbTIifQ.qVKcPoexsumHbbWIQEeBZEOTN_bb_mOzLJopt5yR6PT6MUiByRAPodWP075WsJXChfcu-WNt_csBPn4dUOt-_QZOq0jaNNfyyJvbEPOBQWwb00Bk7TDfB3S4Hyr7KHUnB8LASsEPSxyEriFMm2cckb0ad1scxEaECkzJPFk_yXNC2zijnhD2SqvbyHWkgminBSfLYuGxWhi1JxjISvKadEI6qcIZTECji00P4ycBL2j6ybgVO5CGsHkY4aiDmhu7gpzE4mpqdRROampopuW7Eq1GSLdXTh8jG6zo1pkHdeNX9nYpeli5NvRMEO1TPkpjqRnVmMALlWdgmh6xrZhwfg';
}
