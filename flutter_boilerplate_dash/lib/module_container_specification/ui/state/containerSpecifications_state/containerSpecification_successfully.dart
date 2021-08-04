import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_container_specification/widget/containerSpecifications_card.dart';

class ContainerSpecificationsSuccessfully extends StatelessWidget {
  final List<ContainerSpecificationModel> items;
  final Function onDelete;
  final Function onEdit;
  const ContainerSpecificationsSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return ContainerSpecificationCard(model: items[index],
      onEdit: (re){
        onEdit(re);
      },
        onDelete: (id){
        onDelete(id);
        }, isEdtiable: false,
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}
