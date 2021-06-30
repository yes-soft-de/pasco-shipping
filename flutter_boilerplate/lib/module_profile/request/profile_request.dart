class ProfileRequest{
  String userName;
  String city;
  String country;
  String image;
  String location;
  String phone;

  ProfileRequest({required this.userName,required this.city,required this.country,required this.image,
    required this.location,required this.phone});

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "city": city,
    "country": country,
    "image": image,
    "location": location,
    "phone":phone
};
}