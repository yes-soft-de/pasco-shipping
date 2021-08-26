  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/widget/accepted_shipment_card.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class AcceptedShipmentSuccessfully extends StatelessWidget {
  final Data items;
  final Function onDetails;
  final Function onSearch;

  const AcceptedShipmentSuccessfully({
    required this.items,
    required this.onDetails,
   required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchCard(onSearch: (number){
            onSearch(number);
          }),
          Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Shipments received in warehouse'+': ' ,style: AppTextStyle.mediumBlackBold,),
                    Text(items.statistics!.received.toString() ,style: AppTextStyle.mediumRedBold,),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Ready to measure'+': ' ,style: AppTextStyle.mediumBlackBold,),
                        Text(items.statistics!.notDelivered.toString() ,style: AppTextStyle.mediumRedBold,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Delivered shipments to receiver'+': ' ,style: AppTextStyle.mediumBlackBold,),
                        Text(items.statistics!.delivered.toString() ,style: AppTextStyle.mediumRedBold,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return AcceptedShipmentCard(
                shipmentModel: items.data![index],
                onDetails: (model) {
                  onDetails(model);
                },
              );
            },
            itemCount: items.data!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
