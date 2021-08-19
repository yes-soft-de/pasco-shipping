import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_airwaybill/widget/airwaybill_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';

class AirwaybillSuccessfully extends StatelessWidget {
  final List<AirwaybillModel> items;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;
  final Function onSearch;

  const AirwaybillSuccessfully({
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.onDetails,
    required this.onSearch
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
              return AirwaybillCard(
                model: items[index],
                onEdit: (re) {
                  onEdit(re);
                },
                onDelete: (id) {
                  onDelete(id);
                },
                onDetails: (id ,isFull) {
                  onDetails(id , isFull);
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
