import 'dart:io';

import 'dart:convert';
class ShipmentRequest {
  late String _transportationType;

  late int _exportWarehouseID;
  late String _exportWarehouseName;
  late String _target;

  late int _productCategoryID;
  late String _productCategoryName;
  late int _quantity;

  late String _supplierName;

  late int _receiverID;
  late String _receiverName;
  late String _receiverPhoneNumber;

  late String _unit;

  late int _markId;
  late String _markName;

  late String _paymentTime;

  late String _vehicleIdentificationNumber;
  late String _extraSpecification;

  late String _holderType;
  late int _holderCount;
  late List<String>? imageFilePath;

  late int userID;
  late String  userName;

  late int distributorID;
  late String  distributorName;

  late bool isExternalWarehouse;
  late String externalWarehouseInfo;


  Map<String, dynamic> toJson() => {
        "transportationType": transportationType,
        "target": target,
        "supplierName": supplierName,
        "quantity": quantity,
        "productCategoryID": productCategoryID,
        'productCategoryName': productCategoryName,
        "unit": unit,
        'receiverID':receiverID,
        "receiverName": receiverName,
        "receiverPhoneNumber": receiverPhoneNumber,
        "paymentTime": paymentTime,
        "exportWarehouseID": exportWarehouseID,
        "markID": markId,
        "vehicleIdentificationNumber": vehicleIdentificationNumber,
        "extraSpecification": extraSpecification,
        'images':imageFilePath ?? [],
    'exportWarehouseName':exportWarehouseName,
    'markName':markName,
    'holderType':holderType,
    'holderCount':holderCount,
    'clientUserID':userID,
    'userName':userName,
    'distributorID':distributorID,
    'distributorName':distributorName,
    'isExternalWarehouse':isExternalWarehouse,
    'externalWarehouseInfo':externalWarehouseInfo,
      };


  ShipmentRequest(
      this._transportationType,

      this._exportWarehouseID,
      this._exportWarehouseName,
      this._target,

      this._productCategoryID,
      this._productCategoryName,
      this._quantity,

      this._supplierName,

      this._receiverID,
      this._receiverName,
      this._receiverPhoneNumber,

      this._unit,

      this._markId,
      this._markName,

      this._paymentTime,
      this._extraSpecification,
      this._vehicleIdentificationNumber,
      this._holderType,
      this._holderCount,
      this.imageFilePath,

      this.externalWarehouseInfo,
      this.isExternalWarehouse,
      this.distributorName,
      this.distributorID,
      this.userName,
      this.userID
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

  String get receiverPhoneNumber => _receiverPhoneNumber;

  set receiverPhoneNumber(String value) {
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

  String get productCategoryName => _productCategoryName;

  set productCategoryName(String value) {
    _productCategoryName = value;
  }


  String get markName => _markName;

  set markName(String value) {
    _markName = value;
  }

  String get exportWarehouseName => _exportWarehouseName;

  set exportWarehouseName(String value) {
    _exportWarehouseName = value;
  }

  String get holderType => _holderType;

  set holderType(String value) {
    _holderType = value;
  }

  int get receiverID => _receiverID;

  set receiverID(int value) {
    _receiverID = value;
  }

  int get holderCount => _holderCount;

  set holderCount(int value) {
    _holderCount = value;
  }

  @override
  String toString() {
    return 'ShipmentRequest{_transportationType: $_transportationType, _exportWarehouseID: $_exportWarehouseID, _exportWarehouseName: $_exportWarehouseName, _target: $_target, _productCategoryID: $_productCategoryID, _productCategoryName: $_productCategoryName, _quantity: $_quantity, _supplierName: $_supplierName, _receiverName: $_receiverName, _receiverPhoneNumber: $_receiverPhoneNumber, _unit: $_unit, _markId: $_markId, _markName: $_markName, _paymentTime: $_paymentTime, _vehicleIdentificationNumber: $_vehicleIdentificationNumber, _extraSpecification: $_extraSpecification, imageFile: $imageFilePath}';
  }



}
