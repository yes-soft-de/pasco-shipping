import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_harbor/widget/harbor_card.dart';
import 'package:pasco_shipping/module_suppliers/response/suppliers_response.dart';
import 'package:pasco_shipping/module_suppliers/widget/supplier_card.dart';

class HarborsSuccessfully extends StatelessWidget {
  final List<HarborModel> items;
  final Function onDelete;
  final Function onEdit;
  const HarborsSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return HarborCard(model: items[index],
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
