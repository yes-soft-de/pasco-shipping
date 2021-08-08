import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_home/response/home_response.dart';
import 'package:pasco_shipping/module_home/ui/widget/chip_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';

class HomeSuccessfully extends StatelessWidget {
  final StatisticModel model;
  const HomeSuccessfully({required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchCard(onSearch: (){},),
          OrderCard(model.orders!),
          TravelCard(model.travels!.flight!,'Flight'),
          TravelCard(model.travels!.cruise!,'Cruise'),
          Row(
            children: [
              UserCard(icon: StaticImage.emp, label: 'Employees', users: model.users!),
              UserCard(icon: StaticImage.customer, label: 'Customers', users: model.users!),
            ],
          )
        ],
      ),
    );
  }
}
