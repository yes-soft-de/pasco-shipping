class Urls {
  static const String DOMAIN = 'http://159.89.13.229/';
  static const String BASE_API = 'http://159.89.13.229/';
  static const String IMAGES_ROOT = DOMAIN + '/upload/';

  static const SIGN_UP_API = BASE_API + '/user';
  // static const OWNER_PROFILE_API = BASE_API + '/userprofile';
  static const CREATE_TOKEN_API = BASE_API + '/login_check';

  //home
  static const STATISTIC = BASE_API + 'statistics';

//request shipment
  static const PRODUCT_CATEGORY = BASE_API + 'productcategories';

  static const REQUEST_SHIPMENT_ADMIN = BASE_API + 'ordershipmentbydashboard';

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


  // specification
  static const CONTAINER_SPECIFICATIONS = BASE_API + 'containerspecifications';
  static const CONTAINER_SPECIFICATION = BASE_API + 'containerspecification';

  //client
  static const CREATE_CLIENT_ACCOUNT = BASE_API + 'clientbydashboard';
  static const CREATE_CLIENT_MARK = BASE_API + 'markbydashboard';
  static const GET_CLIENT_MARK = BASE_API + 'marks';
  static const GET_CLIENTS = BASE_API + 'clientprofileall';



  ///mark
  static const USER_MARKS = BASE_API + 'marks';
  static const MARK = BASE_API + 'mark';
  static const CREATE_MARK = BASE_API + 'markbydashboard';



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
  static const WAITING_SHIPMENTS=BASE_API+'waitingshipmentsorders';
  static const ACCEPTED_REJECTED_SHIPMENT=BASE_API+'shipmentorderstatus';

  //acceptedShipment
  static const ACCEPTED_SHIPMENTS=BASE_API+'filteracceptedshipments';
  static const ACCEPTED_SHIPMENTS_DETAILS=BASE_API+'shipmentorder';
  static const ACCEPTED_SHIPMENTS_STATUS=BASE_API+'allshipmentlogs';
  static const CHANGE_SHIPMENTS_STATUS_RECEIVED=BASE_API+'shipmentstatus';
  static const WAREHOUSES=BASE_API+'warehouses';
  static const STORED_SHIPMENT=BASE_API+'track';


  static const CHECK_HOLDER=BASE_API+'checkholder';



  //warehouses
  static const GET_WAREHOUSES=BASE_API+'warehouses';
  static const WAREHOUSE=BASE_API+'warehouse';


  //shipmentfinance
  static const SHIPMENT_FINANCE = BASE_API + 'shipmentfinance';


  static const REPORT_API = BASE_API + '/report';

  static const UPLOAD_API = BASE_API + 'uploadfile';

  static const NOTIFICATION_API = BASE_API + '/notificationtoken';
  static const NOTIFICATIONNEWCHAT_API = BASE_API + '/notificationnewchat';
  static const NOTIFICATIONTOADMIN_API = BASE_API + '/notificationtoadmin';


  static const token ='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2Mjg5ODAwOTcsImV4cCI6MTYyODk5ODA5Nywicm9sZXMiOlsiUk9MRV9FTVBMT1lFRSIsInVzZXIiXSwidXNlcm5hbWUiOiJlbTIifQ.K11rWh-dgJRQo7cyEA6BrLqPQQPbtrEUv_qC_jOVjM5n6AB4c0IpfxSopOwSGzrGk3B63OlohAVrRC9pj3jxIS_ScTmYXhPHfZLUbI1xWSDuGVPaF4kJCwLL9P8DbpNapOe_426nd0BDhE2mBTaWvii0ir93sNzsd_gw-d3Zbgy-030QDMM_IVhdI58HbF3Q7mqlSxq39jsxxcCxHflDbcziI0QGBjTuF3CAUeeutyFqZKBJjDpcm36guVR9SYxHqIpauZs9UTPE9UJqorn44KFgU2juVphWvBfnQR0-eYnMKY3RbAVUDiQzEW4womFxo9oOC1j86ZcapaH0tOt-HA';
}
