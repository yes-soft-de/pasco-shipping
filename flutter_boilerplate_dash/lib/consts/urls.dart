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
  static const CREATE_MARK = BASE_API + 'markbydashboard';



  //product
  static const PRODUCT_CATEGORIES=BASE_API+"productcategories";
  static const ADD_PRODUCT_CATEGORY=BASE_API+"productcategory";

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

  static const REPORT_API = BASE_API + '/report';

  static const UPLOAD_API = BASE_API + 'uploadfile';

  static const NOTIFICATION_API = BASE_API + '/notificationtoken';
  static const NOTIFICATIONNEWCHAT_API = BASE_API + '/notificationnewchat';
  static const NOTIFICATIONTOADMIN_API = BASE_API + '/notificationtoadmin';


  static const token ='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2Mjg0NDkwMzksImV4cCI6MTYyODQ2NzAzOSwicm9sZXMiOlsiUk9MRV9FTVBMT1lFRSIsInVzZXIiXSwidXNlcm5hbWUiOiJlbTEifQ.C_qsVIptW7M-h3xCisXu7CcDC4PNiiPJZSEg9t92hCbxkIchFXUyfz8Xbcy4C24IgQ3xDb_LikuW0DRWUkV3yRxuqJb9RWGdqytUbJMfkk5klcTduHsN-yL0WQ9JkFb2cIbheCKsxhOIV_XR2UVsJ4IIecvxffArSD0ptr_j6EeFwjr5MUNVpglEZntUBbsrF0eKrDtcUotFMU-u8TwWa3jlRYiIf56Ho6YqXUsYTGG7n5_nEtQV9EuQIbsVbH30FQxize30GWJL8vxP63J6Q61_wHeCn0NLOqNtXlI1DvptAGF56YRN3uK3Xklwyht9-OuXnaECfasdaqg9fRp2oQ';
}
