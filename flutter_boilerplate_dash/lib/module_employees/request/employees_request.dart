class EmployeeRequest {
  int? id;
  String UserID;
  String userName;
  String email;
  String password;
  String phone;
  List<String> roles;

  EmployeeRequest(
      {this.id,
      required this.userName,
      required this.UserID,
      required this.email ,
        required this.phone,
        required this.password,
        required this.roles

      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'userID': UserID, 'password': password, 'userName': userName ,'email':email,'roles':roles,'phone':phone};
    } else {
      return {
        'id': id,
        'userID': UserID, 'password': password, 'userName': userName ,'email':email,'roles':roles ,'phone':phone
      };
    }
  }
}
