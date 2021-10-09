class CreateInvoiceRequest {
  int shipmentID;
  int? discount;
  String? notes;

  CreateInvoiceRequest(
      {
       required this.shipmentID,
        this.discount,
        this.notes
      });

  Map<String, dynamic> toJson() {
    return {
      'shipmentID': shipmentID,
      'discount': discount,
      'notes':notes
    };
  }
}


