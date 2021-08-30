import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_home/response/home_response.dart';
import 'package:pasco_shipping/module_home/ui/widget/chip_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';

class HomeSuccessfully extends StatelessWidget {
  final StatisticModel model;
  final  Function onSearch;
  const HomeSuccessfully({required this.model , required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchCard(onSearch: (trackNumber){
            onSearch(trackNumber);
          },),
          OrderCard(model.orders!),
          TravelCard(model.travels!.flight!,S.of(context).flight),
          TravelCard(model.travels!.cruise!,S.of(context).cruise),
          Row(
            children: [
              UserCard(icon: StaticImage.emp, label: S.of(context).employees, users: model.users!),
              UserCard(icon: StaticImage.customer, label: S.of(context).clients, users: model.users!),
            ],
          )
        ],
      ),
    );
  }
}
