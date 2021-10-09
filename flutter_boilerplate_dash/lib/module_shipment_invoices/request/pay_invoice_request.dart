class PayBillRequest {
  int id;
  String? paymentStatus;
  String? paymentDate;
  String paidOnBehalfBy;
  int? paidBy;

  PayBillRequest(
      {
        required this.id,
        this.paymentDate,
        this.paymentStatus,
       required this.paidOnBehalfBy,
        this.paidBy
      });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'paymentDate': paymentDate,
      'paidBy':paidBy,
      'paidOnBehalfBy':paidOnBehalfBy,
      'paymentStatus':paymentStatus,
    };
  }
}