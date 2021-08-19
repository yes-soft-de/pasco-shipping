class WaitingShipmentFilterRequest {
  bool isExternalWarehouse;
  String transportationType;

  WaitingShipmentFilterRequest({
   required   this.isExternalWarehouse,
   required this.transportationType,
  });

  Map<String, dynamic> toJson() {
    return {
      'transportationType': transportationType,
      'isExternalWarehouse': isExternalWarehouse ,
    };
  }
}