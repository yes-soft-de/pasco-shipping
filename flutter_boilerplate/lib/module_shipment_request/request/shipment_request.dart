class ShipmentRequest{
 late  String _transportationType;

 late  String _target;
 late   String _supplierName;
 late  int _quantity;
 late  int _productCategoryID;

 late  String _unit;
 late  String _receiverName;
 late  int _receiverPhoneNumber;
 late  String _paymentTime;

 late  int _exportWarehouseID;
 late   int _markId;
 late  String _vehicleIdentificationNumber;
 late  String _extraSpecification;

 Map<String, dynamic> toJson() => {
   "transportationType": transportationType,

   "target": target,
   "supplierName": supplierName,
   "quantity": quantity,
   "productCategoryID": productCategoryID,

   "unit": unit,
   "receiverName": receiverName,
   "receiverPhoneNumber": receiverPhoneNumber,
   "paymentTime": paymentTime,

   "exportWarehouseID": exportWarehouseID,
   "markId": markId,
   "vehicleIdentificationNumber": vehicleIdentificationNumber,
   "extraSpecification": extraSpecification,

 };
 // factory ShipmentRequest.fromJson(Map<String, dynamic> json) => ShipmentRequest(
 //   countryCode: json["country_code"],
 //   latitude: json["latitude"],
 //   longitude: json["longitude"],
 //   comments: json["comments"],
 // );
  ShipmentRequest(
      this._transportationType,
      this._target,
      this._supplierName,
      this._quantity,
      this._productCategoryID,
      this._unit,
      this._receiverName,
      this._receiverPhoneNumber,
      this._paymentTime,
      this._exportWarehouseID,
      this._markId,
      this._extraSpecification,
      this._vehicleIdentificationNumber
      );

 String get extraSpecification => _extraSpecification;

  set extraSpecification(String value) {
    _extraSpecification = value;
  }

  String get vehicleIdentificationNumber => _vehicleIdentificationNumber;

  set vehicleIdentificationNumber(String value) {
    _vehicleIdentificationNumber = value;
  }

  int get markId => _markId;

  set markId(int value) {
    _markId = value;
  }

  int get exportWarehouseID => _exportWarehouseID;

  set exportWarehouseID(int value) {
    _exportWarehouseID = value;
  }

  String get paymentTime => _paymentTime;

  set paymentTime(String value) {
    _paymentTime = value;
  }

  int get receiverPhoneNumber => _receiverPhoneNumber;

  set receiverPhoneNumber(int value) {
    _receiverPhoneNumber = value;
  }

  String get receiverName => _receiverName;

  set receiverName(String value) {
    _receiverName = value;
  }

  String get unit => _unit;

  set unit(String value) {
    _unit = value;
  }

  int get productCategoryID => _productCategoryID;

  set productCategoryID(int value) {
    _productCategoryID = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  String get supplierName => _supplierName;

  set supplierName(String value) {
    _supplierName = value;
  }

  String get target => _target;

  set target(String value) {
    _target = value;
  }

  String get transportationType => _transportationType;

  set transportationType(String value) {
    _transportationType = value;
  }


 @override
  String toString() {
    return 'ShipmentRequest{_transportationType: $_transportationType, _target: $_target, _supplierName: $_supplierName, _quantity: $_quantity, _productCategoryID: $_productCategoryID, _unit: $_unit, _receiverName: $_receiverName, _receiverPhoneNumber: $_receiverPhoneNumber, _paymentTime: $_paymentTime, _exportWarehouseID: $_exportWarehouseID, _markId: $_markId, _vehicleIdentificationNumber: $_vehicleIdentificationNumber, _extraSpecification: $_extraSpecification}';
  }
}