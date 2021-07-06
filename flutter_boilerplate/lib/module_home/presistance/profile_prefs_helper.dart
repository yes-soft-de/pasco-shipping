import 'dart:convert';

import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class shipmentPrefsHelper{
// }
Future<bool?> setProfile(ProfileRequest value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('profile', json.encode(value.toJson()));
}
Future<ProfileModel?> getProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.get('profile') == null){
    return null;
  }
  return ProfileModel.fromJson(json.decode(prefs.getString('profile')??''));

}
Future<void> deleteProfile() async {
  SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
  await preferencesHelper.remove('profile');
}