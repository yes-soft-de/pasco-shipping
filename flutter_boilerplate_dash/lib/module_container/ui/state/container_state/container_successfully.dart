import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/widget/container_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';

class ContainerSuccessfully extends StatelessWidget {
  final List<ContainerModel> items;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;
  final Function onSearch;

  const ContainerSuccessfully({
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
              return ContainerCard(
                model: items[index],
                onEdit: (model) {
                  onEdit(model);
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
