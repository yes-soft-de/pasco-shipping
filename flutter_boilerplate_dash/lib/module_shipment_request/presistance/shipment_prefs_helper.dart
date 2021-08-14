import 'dart:convert';

import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class shipmentPrefsHelper{
// }
Future<bool?> setShipment(ShipmentRequest? value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('waitingShip', json.encode(value!.toJson()));
}
// Future<ShipmentRequest?> getShipment() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   if(prefs.get('waitingShip') == null){
//     return null;
//   }
//   return ShipmentRequest.fromJson(json.decode(prefs.getString('waitingShip')??''));
//
// }
Future<void> deleteShipment() async {
  SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
  await preferencesHelper.remove('waitingShip');
}