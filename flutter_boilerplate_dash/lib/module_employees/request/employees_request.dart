class EmployeeRequest {
  int? id;
  String UserID;
  String userName;
  String? password;
  String phone;
  List<String>? roles;

  EmployeeRequest(
      {this.id,
      required this.userName,
      required this.UserID,
        required this.phone,
         this.password,
         this.roles

      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'userID': UserID, 'password': password, 'userName': userName ,'roles':roles,'phone':phone};
    } else {
      return {
        'id': id,
        'userID': UserID,  'userName': userName ,'phone':phone
      };
    }
  }
}


class EmployeeRequestRole {
  int? id;
  List<String>? roles;

  EmployeeRequestRole(
      {this.id,
        this.roles

      });

  Map<String, dynamic> toJson() {
    return {
        'id': id,
        'roles':roles,
      };

}}