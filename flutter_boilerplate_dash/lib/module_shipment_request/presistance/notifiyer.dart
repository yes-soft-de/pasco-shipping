import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_request/response/specefication/specefication.dart';
class SingleNotifier extends ChangeNotifier {
  final List<SpecificationsModel> countries;
  SpecificationsModel? currentValue;
  SingleNotifier(this.countries , this.currentValue);

  SpecificationsModel? get currentCountry => currentValue;
  updateSpec(SpecificationsModel value) {
    if (value != currentCountry) {
      currentValue = value;
      notifyListeners();
    }
  }


}