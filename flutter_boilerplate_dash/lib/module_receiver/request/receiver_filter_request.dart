class ReceiverFilterRequest {
  int clientUserID;
  ReceiverFilterRequest(this.clientUserID);
  Map<String, dynamic> toJson() {
    return {
      'clientUserID':clientUserID
    };
  }
}
