import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_airwaybill_specification/widget/containerSpecifications_card.dart';

class AirwaybillSpecificationsSuccessfully extends StatelessWidget {
  final List<AirwaybillSpecificationModel> items;
  final Function onDelete;
  final Function onEdit;
  const AirwaybillSpecificationsSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return AirwaybillSpecificationCard(model: items[index],
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
