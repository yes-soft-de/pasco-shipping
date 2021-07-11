class MarkRequest {
  String markNumber;
  MarkRequest(this.markNumber);
  Map<String, dynamic> toJson() {
    return {
      'markNumber': markNumber,
    };
  }
}
