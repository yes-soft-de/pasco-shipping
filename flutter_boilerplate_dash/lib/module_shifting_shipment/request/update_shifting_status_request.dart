class UpdateShiftingStatusRequest {
  int id;
  String status;

  UpdateShiftingStatusRequest(this.id, this.status);
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'status':status
    };
  }
}