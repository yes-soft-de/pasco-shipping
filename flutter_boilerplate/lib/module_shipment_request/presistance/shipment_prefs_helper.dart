import 'dart:convert';

import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shipmentPrefsHelper{
  Future<bool?> setShipment(ShipmentRequest value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // _user = value;
    return prefs.setString('waitingShip', json.encode(value.toJson()));
  }

  // Future<ShipmentRequest> getShipment() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // if (prefs.getString('waitingShip') == null || prefs.getString('waitingShip') == 'null')
  //   //   _user = null;
  //   // else
  //     return ShipmentRequest.fromJson(json?.decode(prefs.getString('waitingShip')));
  //
  // }
}
