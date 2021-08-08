class CreateClientRequest{
  String userID;
  String password;
  String userName;
  String? email;
  String? city;
  String? country;
  String? location;

  CreateClientRequest({
    required this.userID
    ,required this.password
    ,required this.userName
    ,this.email,
    this.city,
    this.country,
    this.location

  });

  Map<String, dynamic> toJson() {
    return {
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