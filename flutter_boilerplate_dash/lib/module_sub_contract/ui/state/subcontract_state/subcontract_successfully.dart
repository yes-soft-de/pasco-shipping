import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_sub_contract/widget/subcontract_card.dart';

class SubcontractSuccessfully extends StatelessWidget {
  final List<SubcontractModel> items;
  final Function onDelete;
  final Function onEdit;
  const SubcontractSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return SubcontractCard(model: items[index],
      onEdit: (model){
        onEdit(model);
      },
        onDelete: (id){
        onDelete(id);
        },
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}
