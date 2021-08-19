class WarehouseFilterFinanceRequest {
  int id;
  WarehouseFilterFinanceRequest(
      {
        required this.id,
      });
  Map<String, dynamic> toJson() {
    return {
      'warehouseID': id,
    };
  }
}