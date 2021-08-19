class WarehouseAddFinanceRequest {
  int? warehouseID;
  String stageDescription;
  int stageCost;
  String currency;

  WarehouseAddFinanceRequest(
      {required this.warehouseID,
        required this.stageDescription,
        required this.stageCost,
        required this.currency});
  Map<String, dynamic> toJson() {
    if (warehouseID == null) {
      return {
        'description': stageDescription,
        'cost': stageCost,
        'currency': currency
      };
    } else {
      return {
        'warehouseID': warehouseID,
        'description': stageDescription,
        'cost': stageCost,
        'currency': currency
      };
    }
  }
}