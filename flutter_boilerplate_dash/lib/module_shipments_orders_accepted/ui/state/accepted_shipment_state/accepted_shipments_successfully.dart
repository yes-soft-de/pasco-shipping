import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/accepted_shipment_card.dart';

class AcceptedShipmentSuccessfully extends StatelessWidget {
  final List<AcceptedShipmentModel> items;
  final Function onDetails;
  final Function onSearch;

  const AcceptedShipmentSuccessfully({
    required this.items,
    required this.onDetails,
   required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchCard(onSearch: (number){
          onSearch(number);
        }),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return AcceptedShipmentCard(
                shipmentModel: items[index],
                onDetails: (model) {
                  onDetails(model);
                },
              );
            },
            itemCount: items.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
