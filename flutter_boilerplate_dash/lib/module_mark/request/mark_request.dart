class MarkRequest {
  String markNumber;
  int clientUserID;
  MarkRequest(this.markNumber , this.clientUserID);
  Map<String, dynamic> toJson() {
    return {
      'markNumber': markNumber,
      'clientUserID':clientUserID
    };
  }
}
