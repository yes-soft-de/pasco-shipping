class AttachedDocInvoiceRequest {
  int id;
  String invoiceImage;
  String? notes;
  String receiptImage;
  int? discount;

  AttachedDocInvoiceRequest(
      {
        required this.id,
        this.discount,
        this.notes,
      required  this.invoiceImage,
       required this.receiptImage
      });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'discount': discount,
      'notes':notes,
      'invoiceImage':invoiceImage,
      'receiptImage':receiptImage,
    };
  }
}