import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/module_travel/widget/travel_card.dart';

class TravelSuccessfully extends StatelessWidget {
  final List<TravelModel> items;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;

  const TravelSuccessfully({
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TravelsCard(
          model: items[index],
          onEdit: (model) {
            onEdit(model);
          },
          onDelete: (id) {
            onDelete(id);
          },
          onDetails: (id) {
            onDetails(id);
          },
        );
      },
      itemCount: items.length,
      shrinkWrap: true,
    );
  }
}
