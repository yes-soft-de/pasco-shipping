class InvoiceFilterRequest {
  int? shipmentID;
  String? paymentStatus;

  InvoiceFilterRequest(
      {
         this.shipmentID,
        this.paymentStatus,
      });

  Map<String, dynamic> toJson() {
    return {
      'shipmentID': shipmentID,
      'paymentStatus': paymentStatus
    };
  }
}