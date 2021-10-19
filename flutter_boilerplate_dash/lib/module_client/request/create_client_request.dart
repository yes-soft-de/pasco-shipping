class CreateClientRequest{
  int? id;
  String? userID;
  String? password;
  String? userName;
  String? email;
  String? city;
  String? country;
  String? location;

  CreateClientRequest({
    this.id,
     this.userID
    , this.password
    , this.userName
    ,this.email,
    this.city,
    this.country,
    this.location

  });

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'userID': userID,
      'password':password,
      'userName':userName,
      'email':email,
      'city':city,
      'country':country,
      'location':location
    };
  }
}