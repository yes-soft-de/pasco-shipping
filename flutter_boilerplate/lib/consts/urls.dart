class Urls {
  static const String DOMAIN = 'http://165.22.75.62/';
  static const String BASE_API = 'http://165.22.75.62/';
  static const String IMAGES_ROOT = DOMAIN + '/upload/';

  static const SIGN_UP_API = BASE_API + '/user';
  // static const OWNER_PROFILE_API = BASE_API + '/userprofile';
  static const CREATE_TOKEN_API = BASE_API + '/login_check';

//request shipment
  static const PRODUCT_CATEGORY = BASE_API + 'productcategories';
  static const Countries = BASE_API + 'countries';

///mark
  static const MY_MARKS = BASE_API + 'mymarks';
  static const MARK = BASE_API + 'mark';

  //profile
  static const MY_PROFILE=BASE_API+"clientprofile";

  static const TRACK_SHIPMENT=BASE_API+'trackmyshipment';

  static const MY_SHIPMENT=BASE_API+'myshipments';
  static const MY_WAITING_SHIPMENT=BASE_API+'mywaitingshipmentsorders';
  static const ADD_NEW_SHIPMENT=BASE_API+'ordershipment';



  static const REPORT_API = BASE_API + '/report';

  static const UPLOAD_API = BASE_API + 'uploadfile';

  static const NOTIFICATION_API = BASE_API + '/notificationtoken';
  static const NOTIFICATIONNEWCHAT_API = BASE_API + '/notificationnewchat';
  static const NOTIFICATIONTOADMIN_API = BASE_API + '/notificationtoadmin';


  static const token ='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MjU1MTEwNzEsImV4cCI6MTYyNTUxNDY3MSwicm9sZXMiOlsidXNlciJdLCJ1c2VybmFtZSI6InJhbWkxIn0.vl6ZlrG_OaNaNr0y6iHCnt-H_LBajsq32mbrNR1YSuIbhK-wZKGbmN6ZWDtu5y9ToIZensdycj6C-7HtOf2amhmY8F-y90PgEP-9z1kBg7-vIXTKWTaLo53lvtmp1Fyi7rPuVkdpSjkwvYflHLFFkM-vlBcfSEfiJkvdNPUSYRHZmCyWRVsHfK7rkyk1X9HEQN2YtTikRtuKPQF8qhrq5pvz726f8R8_3XLZWdPDl8VYZXFdTxtN93pS9TiVHufImOasAYo_PNvDof6JfUUTus7li1Vs0meHoqq0OVC5BTizRyAl4t7xW_AfPW7DtFyZyHW5Sij0Nw07U4noRDRFXQ';
}
